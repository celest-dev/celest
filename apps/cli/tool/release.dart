import 'dart:convert';
import 'dart:ffi';
import 'dart:io' show ProcessException, stderr, stdout;

import 'package:archive/archive_io.dart';
import 'package:args/args.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/releases/celest_release_info.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/version.dart';
import 'package:chunked_stream/chunked_stream.dart';
import 'package:file/file.dart';
import 'package:gcloud/storage.dart';
import 'package:googleapis/cloudkms/v1.dart';
import 'package:googleapis/storage/v1.dart' show DetailedApiRequestError;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:mustache_template/mustache.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';

/// The directory containing this script and build assets.
final Directory toolDir = fileSystem.file(platform.script).parent;

/// The directory with the built CLI.
final String buildPath = platform.environment['BUILD_DIR'] ?? 'build';
final Directory buildDir = fileSystem.directory(
  platform.script.resolve('../$buildPath'),
);

/// The directory to use for temporary (non-bundled) files.
final Directory tempDir =
    fileSystem.systemTempDirectory.createTempSync('celest_build_');

/// The HTTP client to use for downloading files.
final http.Client httpClient = http.Client();

/// The current ABI which identifies the OS and architecture.
final Abi osArch = Abi.current();

/// The current version of the CLI.
final String version = packageVersion;

/// The bundler to use for the current platform.
final Bundler bundler = Bundler();

/// The path to the output file, dependent on the OS/arch.
final String outputFilepath = p.canonicalize(
  p.join(
    platform.script.toFilePath(),
    '..',
    'celest-$version-$osArch.${bundler.extension}',
  ),
);

/// Access token for GCP.
final String? accessToken = platform.environment['GCP_ACCESS_TOKEN'];

/// The current SHA of the branch being built.
final String? currentSha = platform.environment.containsKey('CI')
    ? (processManager.runSync(
        // <String>['git', 'log', '-1', '--format=format:%H'], ?
        <String>['git', 'rev-parse', 'HEAD'],
        stdoutEncoding: utf8,
      ).stdout as String)
        .trim()
    : null;

/// Whether we're running in CI.
final isCI = platform.environment['CI'] == 'true';

/// Builds and bundles the CLI for the current platform.
///
/// This script is used by the GitHub workflow `apps_cli_release.yaml` to create
/// a zip of the CLI and its dependencies for the current platform.
Future<void> main(List<String> args) async {
  final argParser = ArgParser()
    ..addFlag('build', negatable: false)
    ..addFlag('release', negatable: false);
  final argResult = argParser.parse(args);

  var needsBuild = argResult['build'] as bool?;
  var needsRelease = argResult['release'] as bool?;
  if (isCI) {
    if (needsBuild == null && needsRelease == null) {
      throw StateError('Either --build or --release must be specified');
    }
    needsBuild ??= false;
    needsRelease ??= false;
  } else {
    needsBuild ??= true;
    needsRelease ??= false;
  }

  if (needsBuild) {
    await _build();
    if (platform.environment['GITHUB_OUTPUT'] case final ciOutput?) {
      fileSystem.file(ciOutput).writeAsStringSync(
            'installer=$outputFilepath',
            mode: FileMode.append,
          );
    }
  }
  if (needsRelease) {
    await _release();
  }
}

Future<void> _build() async {
  print('Bundling CLI version $version for $osArch...');

  await _runProcess(
    'dart',
    [
      '--enable-experiment=native-assets',
      if (currentSha case final currentSha?) '--define=gitSha=$currentSha',
      '--define=version=$version',
      'build',
      '--output=$buildPath',
      'bin/celest.dart',
    ],
    workingDirectory: platform.script.resolve('..').toFilePath(),
  );
  if (!buildDir.existsSync()) {
    throw StateError('Build directory does not exist');
  }

  if (!platform.isWindows) {
    final exeUri = platform.script.resolve('../celest/celest.exe');
    final exe = fileSystem.file(exeUri);
    final destExe = p.withoutExtension(p.absolute(exeUri.path));
    if (!exe.existsSync() && !fileSystem.file(destExe).existsSync()) {
      throw StateError('Executable does not exist: $exe');
    }
    exe.renameSync(destExe);
  }

  await bundler.bundle();

  print('Successfully wrote $outputFilepath');
}

Future<void> _release() async {
  if (!isCI) {
    return;
  }

  final project = platform.environment['GCP_BUILD_PROJECT'];
  final bucketName = platform.environment['GCP_BUILD_ARTIFACTS'];
  if (project == null || bucketName == null || accessToken == null) {
    throw StateError(
      'GCP_BUILD_PROJECT or GCP_BUILD_ARTIFACTS or GCP_ACCESS_TOKEN '
      'is not set',
    );
  }
  final client = authenticatedClient(
    httpClient,
    AccessCredentials(
      AccessToken(
        'Bearer',
        accessToken!,
        DateTime.timestamp().add(const Duration(hours: 1)),
      ),
      null,
      [],
    ),
  );
  final storage = Storage(client, project);
  final bucket = storage.bucket(bucketName);
  // Don't cache artifacts when returned from the bucket since they're
  // cached at the CDN layer.
  final objectMetadata = ObjectMetadata(
    cacheControl: 'no-cache, no-store, max-age=0',
  );

  final currentReleasesInfoKey = '$osArch/releases.json';
  CelestReleasesInfo? currentReleasesInfo;
  try {
    await bucket.info(currentReleasesInfoKey);
    final currentReleasesInfoBytes = await readByteStream(
      bucket.read(currentReleasesInfoKey),
    );
    currentReleasesInfo = CelestReleasesInfo.fromJson(
      jsonDecode(utf8.decode(currentReleasesInfoBytes)) as Map<String, Object?>,
    );
  } on DetailedApiRequestError catch (e) {
    if (e.status != 404) {
      rethrow;
    }
  }

  // Upload the build artifacts to GCS.
  final withoutExt = p.withoutExtension(p.basename(outputFilepath));
  final debFilepath = '${p.withoutExtension(outputFilepath)}.deb';
  assert(!p.equals(outputFilepath, debFilepath));
  final setLatest = !Version.parse(version).isPreRelease;
  final storagePaths = [
    (
      localPath: outputFilepath,
      storagePath: '$osArch/$version/${p.basename(outputFilepath)}',
    ),
    if (setLatest)
      (
        localPath: outputFilepath,
        storagePath:
            '$osArch/latest/${p.basename(outputFilepath).replaceFirst(version, 'latest')}'
      ),
    if (platform.isLinux) ...[
      (
        localPath: debFilepath,
        storagePath: '$osArch/$version/$withoutExt.deb',
      ),
      if (setLatest)
        (
          localPath: debFilepath,
          storagePath:
              '$osArch/latest/${withoutExt.replaceFirst(version, 'latest')}.deb'
        ),
    ],
    if (platform.isWindows) ...[
      for (final dll in fileSystem
          .directory(buildPath)
          .listSync()
          .whereType<File>()
          .where((f) => p.extension(f.path) == '.dll'))
        (
          localPath: dll.path,
          storagePath: '$osArch/$version/${p.basename(dll.path)}',
        ),
    ],
  ];
  print('Uploading storage paths: $storagePaths');
  for (final (:localPath, :storagePath) in storagePaths) {
    final bucketSink = bucket.write(
      storagePath,
      metadata: objectMetadata,
      contentType: switch (platform.operatingSystem) {
        'windows' => switch (p.extension(storagePath)) {
            '.appx' => 'application/appx',
            '.dll' => 'application/octet-stream',
            _ => unreachable(),
          },
        'macos' => 'application/octet-stream',
        'linux' => switch (p.extension(storagePath)) {
            '.deb' => 'application/vnd.debian.binary-package',
            '.zip' => 'application/zip',
            _ => unreachable(),
          },
        _ => unreachable(),
      },
    );
    await fileSystem.file(localPath).openRead().pipe(bucketSink);
  }

  final latestRelease = CelestReleaseInfo(
    version: Version.parse(version),
    installer: switch (platform.operatingSystem) {
      'windows' || 'macos' => storagePaths.first.storagePath,
      'linux' => storagePaths[setLatest ? 2 : 1].storagePath,
      _ => unreachable(),
    },
    zip: switch (platform.operatingSystem) {
      'windows' || 'macos' => null,
      'linux' => storagePaths.first.storagePath,
      _ => unreachable(),
    },
  );
  CelestReleaseInfo? latestDev;
  if (setLatest) {
    if (currentReleasesInfo!.latestDev case final currentLatestDev?) {
      if (Version.parse(version) < currentLatestDev.version) {
        latestDev = currentLatestDev;
      }
    }
  } else {
    latestDev = latestRelease;
  }
  final updatedReleasesInfo = CelestReleasesInfo(
    latest: setLatest ? latestRelease : currentReleasesInfo!.latest,
    latestDev: latestDev,
    releases: {
      ...?currentReleasesInfo?.releases,
      version: latestRelease,
    },
  );
  final updatedReleasesInfoJson = updatedReleasesInfo.toJson();
  print('Updated releases info: ${prettyPrintJson(updatedReleasesInfoJson)}');

  await bucket.writeBytes(
    currentReleasesInfoKey,
    JsonUtf8Encoder().convert(updatedReleasesInfoJson),
    metadata: objectMetadata,
    contentType: 'application/json',
  );

  print('Successfully updated build artifacts');
}

abstract class Bundler {
  factory Bundler() {
    return switch (osArch) {
      Abi.macosArm64 || Abi.macosX64 => MacOSBundler(),
      Abi.windowsArm64 || Abi.windowsX64 => WindowsBundler(),
      Abi.linuxArm64 || Abi.linuxX64 => LinuxBundler(),
      final unsupported =>
        throw UnsupportedError('Unsupported ABI: $unsupported'),
    };
  }

  String get extension;

  /// Bundles the CLI and its dependencies into a single file, performing
  /// code signing and notarization as needed.
  Future<void> bundle();
}

final class MacOSBundler implements Bundler {
  static final String? keychainName = () {
    final isCI = platform.environment['CI'] == 'true';
    if (isCI) {
      final keychainName = platform.environment['KEYCHAIN_NAME'];
      if (keychainName.isNullOrEmpty) {
        throw StateError('KEYCHAIN_NAME environment variable is not set');
      }
      return keychainName;
    }
    return null;
  }();

  /// The Apple ID to use for notarization.
  static final String appleId = platform.environment['APPLE_ID']!;

  /// The app-specific password for the Apple ID to use for notarization.
  static final String appleIdPass = platform.environment['APPLE_ID_PASS']!;

  /// The Apple Team ID to use for notarization.
  static final String appleTeamId = platform.environment['APPLE_TEAM_ID']!;

  /// Codesigning identities for macOS.
  static final String developerApplicationIdentity =
      'Developer ID Application: Teo, Inc. ($appleTeamId)';
  static final String developerInstallerIdentity =
      'Developer ID Installer: Teo, Inc. ($appleTeamId)';

  /// The directory containing the built CLI, bundled as a dummy .app so that
  /// we can embedded the provisioning profile which is needed for Keychain
  /// entitlements.
  ///
  /// See:
  /// - https://developer.apple.com/documentation/Xcode/signing-a-daemon-with-a-restricted-entitlement
  /// - https://developer.apple.com/documentation/technotes/tn3125-inside-code-signing-provisioning-profiles#Entitlements-on-macOS
  final appDir = fileSystem.directory(tempDir.path).childDirectory('celest.app')
    ..createSync();

  @override
  String get extension => 'pkg';

  @override
  Future<void> bundle() async {
    await _codesign();
    await _createPkg();
  }

  /// Uses `codesign` to codesign the CLI binaries.
  ///
  /// References:
  /// - https://stackoverflow.com/questions/64652704/how-to-notarize-an-macos-command-line-tool-created-outside-of-xcode
  /// - https://scriptingosx.com/2021/07/notarize-a-command-line-tool-with-notarytool/
  /// - https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution/customizing_the_notarization_workflow
  Future<void> _codesign() async {
    final exeDir = appDir.childDirectory('Contents').childDirectory('MacOS')
      ..createSync(recursive: true);
    appDir
        .childDirectory('Contents')
        .childDirectory('Frameworks')
        .childDirectory('celest')
        .createSync(recursive: true);
    final exe = p.join(appDir.path, 'Contents', 'MacOS', 'celest');
    final toSign = <String>[];

    buildDir.childFile('celest').copySync(exe);

    // Updates the LC_RPATH of `celest` to match .app directory structure.
    // https://developer.apple.com/documentation/xcode/embedding-nonstandard-code-structures-in-a-bundle#Adopt-rpath-relative-references
    await _runProcess(
      'install_name_tool',
      ['-add_rpath', '@executable_path/../Frameworks', exe],
    );

    for (final dylib in buildDir
        .listSync()
        .whereType<File>()
        .where((f) => p.extension(f.path) == '.dylib')) {
      final dylibFilename = p.basename(dylib.path);
      // Even though rpath is Frameworks/ in the binary, the runtime searches
      // at Frameworks/celest/<dylib>.
      final appDylibPath = p.join(
        appDir.path,
        'Contents',
        'Frameworks',
        'celest',
        dylibFilename,
      );
      dylib.copySync(appDylibPath);
      await _runProcess('install_name_tool', [
        '-id',
        '@rpath/celest/$dylibFilename',
        appDylibPath,
      ]);
      // Symlink next to exe since native assets are hard-coded this way.
      fileSystem
          .link(exeDir.childFile(dylibFilename).path)
          .createSync('../Frameworks/celest/$dylibFilename');
      toSign.add(appDylibPath);
    }

    toSign.add(appDir.path);

    // Print directory structure
    _printFs(appDir);

    // Matches the entitlements needed by `dartaotruntime`:
    // https://github.com/dart-lang/sdk/blob/7e5ce1f688e036dbe4b417f7fd92bbced67b5ec5/runtime/tools/entitlements/dart_precompiled_runtime_product.plist
    final entitlementsPlistPath = p.join(tempDir.path, 'entitlements.xml');
    final entitlementsPlist = Template(
      toolDir
          .childDirectory('macos')
          .childFile('entitlements.xml')
          .readAsStringSync(),
    ).renderString({
      'teamId': appleTeamId,
    });
    print('Rendered entitlements.xml:\n\n$entitlementsPlist\n');
    fileSystem.file(entitlementsPlistPath)
      ..createSync()
      ..writeAsStringSync(entitlementsPlist);

    final infoPlist = Template(
      toolDir
          .childDirectory('macos')
          .childFile('Info.plist')
          .readAsStringSync(),
    ).renderString({
      'version': version,
      'teamId': appleTeamId,
    });
    print('Rendered Info.plist:\n\n$infoPlist\n');
    appDir.childDirectory('Contents').childFile('Info.plist')
      ..createSync()
      ..writeAsStringSync(infoPlist);

    toolDir
        .childDirectory('macos')
        .childFile('embedded.provisionprofile')
        .copySync(
          p.join(appDir.path, 'Contents', 'embedded.provisionprofile'),
        );

    // Sign executable last (working upwards). This was historically done
    // with `--deep` but Apple has since deprecated this option.
    toSign.add(exe);

    // Codesign all files in the build directory.
    // TODO(dnys1): Currently we must sign everything in the app directory
    /// individually because Dart's native-assets support requires the wrong
    /// structure, e.g. searching `Frameworks/celest/<dylib>` instead of
    /// `Frameworks/<dylib>` as expected.
    ///
    /// We must also sign the app directory itself because the provisioning
    /// profile is embedded in the app directory.
    for (final pathToSign in toSign) {
      print('Codesigning $pathToSign...');
      await _runProcess(
        'codesign',
        [
          '--sign',
          developerApplicationIdentity,
          if (keychainName case final keychain?) ...[
            '--keychain',
            keychain,
          ],
          if (p.extension(pathToSign) != '.dylib') ...[
            '--generate-entitlement-der',
            '--entitlements',
            entitlementsPlistPath,
            '--identifier',
            'dev.celest.cli',
            '--options=runtime',
          ],
          '--force',
          '--timestamp',
          '--file-list',
          '-',
          '--verbose',
          pathToSign,
        ],
      );

      Future<void> dumpCodesignResults() async {
        await _runProcess('codesign', [
          '--display',
          '--verbose=4',
          pathToSign,
        ]);
        print('Entitlement results:');
        await _runProcess('codesign', [
          '--display',
          '--entitlements=-',
          pathToSign,
        ]);
      }

      print('Verifying code signature for $pathToSign...');
      await _runProcess(
        'codesign',
        ['--verify', '--verbose', pathToSign],
        onError: (_) async {
          print('Could not verify code signature. Code-signing results:');
          await dumpCodesignResults();
        },
      );
      await dumpCodesignResults();
    }

    print('Codesigning complete.');
  }

  /// Uses `pkgbuild`, `productbuild` and `notarytool` to package and notarize
  /// the CLI as a macOS installer package.
  Future<void> _createPkg() async {
    final scriptsPath = p.join(toolDir.path, 'macos', 'scripts');

    // Create a temp, unsigned PKG installer using pkgbuild
    final tmpPkgPath = p.join(tempDir.path, p.basename(outputFilepath));
    print('Creating component package...');
    await _runProcess(
      'pkgbuild',
      [
        '--root',
        appDir.path,
        '--identifier',
        'dev.celest.cli',
        '--version',
        version,
        // https://www.pathname.com/fhs/pub/fhs-2.3.html#OPTADDONAPPLICATIONSOFTWAREPACKAGES
        // TODO(dnys1): /usr/local/lib + /usr/local/bin?
        '--install-location',
        '/opt/celest/celest.app',
        '--scripts',
        scriptsPath,
        // Dart minimum OS version is 12.0
        // https://dart.dev/get-dart#macos
        '--min-os-version',
        '12.0',
        tmpPkgPath,
      ],
    );

    // Create distribution XML file
    // See: https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/DistributionDefinitionRef/Chapters/Distribution_XML_Ref.html
    // TODO(dnys1): enable_currentUserHome="true"? https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/DistributionDefinitionRef/Chapters/Distribution_XML_Ref.html#//apple_ref/doc/uid/TP40005370-CH100-SW35
    final distributionTmpl = toolDir
        .childDirectory('macos')
        .childFile('distribution.xml')
        .readAsStringSync();
    final distributionFile = tempDir.childFile('distribution.xml');
    final distributionXml = Template(distributionTmpl).renderString({
      'filename': p.basename(tmpPkgPath),
      'hostArchitectures': osArch == Abi.macosArm64 ? 'arm64' : 'x86_64',
    });
    print('Writing distribution.xml contents:\n\n$distributionXml\n');
    await distributionFile.writeAsString(
      distributionXml,
      flush: true,
    );

    // Create a product archive using productbuild
    print('Creating signed product archive...');
    await _runProcess(
      'productbuild',
      [
        '--distribution',
        distributionFile.path,
        '--package-path',
        tempDir.path,
        '--resources',
        p.join(toolDir.path, 'macos', 'resources'),
        '--sign',
        developerInstallerIdentity,
        if (keychainName case final keychain?) ...[
          '--keychain',
          keychain,
        ],
        '--timestamp',
        outputFilepath,
      ],
    );

    // Notarize the installer package
    print('Notarizing package...');
    Future<void> onNotarizationFailed(String logs) async {
      print('Notarization failed. Detailed logs:');
      final uuid =
          RegExp(r'Submission with ID ([\w\d-]+)').firstMatch(logs)?.group(1);
      if (uuid == null) {
        print('ERR: Could not find UUID in logs');
        return;
      }
      await _runProcess(
        'xcrun',
        [
          'notarytool',
          'log',
          '--apple-id',
          appleId,
          '--password',
          appleIdPass,
          '--team-id',
          appleTeamId,
          uuid,
        ],
      );
    }

    final notaryLogs = await _runProcess(
      'xcrun',
      [
        'notarytool',
        'submit',
        '--apple-id',
        appleId,
        '--password',
        appleIdPass,
        '--team-id',
        appleTeamId,
        '--wait',
        '--verbose',
        outputFilepath,
      ],
      onError: onNotarizationFailed,
    );
    final status = LineSplitter.split(notaryLogs)
        .map(RegExp(r'status: (\w+)').firstMatch)
        .nonNulls
        .toList()
        .last
        .group(1);
    if (status != 'Accepted') {
      await onNotarizationFailed(notaryLogs);
      throw StateError('Notarization failed: $status');
    }

    // Staple the notarization ticket to the installer package
    print('Stapling notarization ticket...');
    await _runProcess(
      'xcrun',
      [
        'stapler',
        'staple',
        outputFilepath,
      ],
    );

    // Verify the notarization ticket
    print('Verifying notarization ticket...');
    await _runProcess(
      'xcrun',
      [
        'spctl',
        '--assess',
        '--type',
        'install',
        '-vv',
        outputFilepath,
      ],
    );

    print('Packaging and notarization complete.');
  }
}

final class WindowsBundler implements Bundler {
  static final String _windowsSdkBinDir = () {
    const binDir = r'C:\Program Files (x86)\Windows Kits\10\bin';
    final allSdks = fileSystem
        .directory(binDir)
        .listSync()
        .whereType<Directory>()
        .map((e) => p.basename(e.path))
        .where((path) => path.startsWith('10.'))
        .toList();
    allSdks.sort();
    final latestSdk = allSdks.last;
    return switch (Abi.current()) {
      Abi.windowsArm64 => p.join(binDir, latestSdk, 'arm64'),
      Abi.windowsX64 => p.join(binDir, latestSdk, 'x64'),
      final unsupported =>
        throw UnsupportedError('Unsupported ABI: $unsupported'),
    };
  }();

  @override
  String get extension => 'appx';

  @override
  Future<void> bundle() async {
    final appxPackage = await _createAppx();
    if (isCI) {
      await _evCodesign(appxPackage);
    } else {
      await fileSystem.file(appxPackage).copy(outputFilepath);
    }
  }

  /// Creates an APPX installer package for the CLI.
  Future<String> _createAppx() async {
    // Mostly copied from winget: https://github.com/microsoft/winget-cli/blob/master/src/AppInstallerCLIPackage/Package.appxmanifest
    // Schema: https://learn.microsoft.com/en-us/uwp/schemas/appxpackage/uapmanifestschema/element-application
    // Fix for firewall rules: https://learn.microsoft.com/en-us/windows/apps/desktop/modernize/desktop-to-uwp-extensions#create-firewall-exception-for-your-app
    final appxManifestPath = p.join(buildDir.path, 'AppxManifest.xml');
    final appxManifest = Template(
      toolDir
          .childDirectory('windows')
          .childFile('AppxManifest.xml')
          .readAsStringSync(),
    ).renderString({
      'arch': osArch == Abi.windowsArm64 ? 'arm64' : 'x64',
      // Expects format major.minor.build.revision
      'version': switch (Version.parse(version)) {
        Version(
          isPreRelease: true,
          :final major,
          :final minor,
          :final patch,
          :final preRelease
        ) =>
          // Use the first number in the pre-release as the build number
          // e.g. `1.2.0-dev.1` -> `1.2.0.1`
          '${Version(major, minor, patch)}.${preRelease.whereType<int>().firstOrNull ?? 0}',
        _ => '$version.0',
      },
    });
    print('Rendered AppxManifest.xml:\n\n$appxManifest\n');
    fileSystem.file(appxManifestPath)
      ..createSync()
      ..writeAsStringSync(appxManifest, flush: true);

    // Copy logo files to buildDir.
    //
    // These are generated using VS Studio 2022's built-in Asset Generator.
    final sourceDir = p.join(
      p.dirname(p.fromUri(platform.script)),
      'windows',
      'Assets',
    );
    final assetsDir = buildDir.childDirectory('Assets')
      ..createSync(recursive: true);
    for (final logoFile
        in fileSystem.directory(sourceDir).listSync().whereType<File>()) {
      logoFile.copySync(p.join(assetsDir.path, p.basename(logoFile.path)));
    }

    // Create Package Resource Index (PRI) using unplated files. This resolves
    // the transparency issues when using PNGs.
    //
    // See:
    // - https://learn.microsoft.com/en-us/windows/msix/desktop/desktop-to-uwp-manual-conversion#optional-add-target-based-unplated-assets
    // - https://learn.microsoft.com/en-us/windows/apps/design/style/iconography/app-icon-construction
    // - https://learn.microsoft.com/en-us/windows/uwp/app-resources/tailor-resources-lang-scale-contrast#shell-light-theme-and-unplated-resources

    print('Creating PRI...');
    await _runProcess(
      p.join(_windowsSdkBinDir, 'makepri.exe'),
      [
        'createconfig',
        '/cf',
        'priconfig.xml',
        '/dq',
        'en-US',
      ],
      workingDirectory: buildDir.path,
    );
    await _runProcess(
      p.join(_windowsSdkBinDir, 'makepri.exe'),
      [
        'new',
        '/pr',
        '.',
        '/cf',
        'priconfig.xml',
        '/v',
      ],
      workingDirectory: buildDir.path,
    );

    // Output to temporary APPX since jsign gets confused when the filename
    // contains the version (periods).
    final tempOutputFilepath = p.join(tempDir.path, 'celest.appx');

    await _runProcess(
      p.join(_windowsSdkBinDir, 'makeappx.exe'),
      [
        'pack',
        '/d',
        buildDir.path,
        '/p',
        tempOutputFilepath,
        '/v',
      ],
    );

    return tempOutputFilepath;
  }

  Future<void> _evCodesign(String appxPackage) async {
    final evKeyRing = platform.environment['EV_KEY_RING'];
    final evKeyName = platform.environment['EV_KEY_NAME'];
    final certData = platform.environment['WINDOWS_CERTS_DATA'];

    if (evKeyRing.isNullOrEmpty ||
        evKeyName.isNullOrEmpty ||
        certData.isNullOrEmpty) {
      throw StateError(
        'EV_KEY_RING or EV_KEY_NAME or WINDOWS_CERTS_DATA is empty',
      );
    }
    if (!evKeyRing!.startsWith('projects/')) {
      throw StateError(
        r'EV_KEY_RING must be of the form "projects/$projectId/locations/$location/keyRings/$keyRingName"',
      );
    }

    final windowsCertsFile = tempDir.childFile('windows-certs.p7b');
    await windowsCertsFile.create();
    await windowsCertsFile.writeAsBytes(base64Decode(certData!), flush: true);

    print('Downloading jsign tool...');
    // TODO(dnys1): Replace with GH release once 5.1 is released.
    const jsignUrl = 'https://releases.celest.dev/_build/jsign.jar';
    final jsignJarReq = await httpClient.get(Uri.parse(jsignUrl));
    if (jsignJarReq.statusCode != 200) {
      throw StateError(
        'Could not download jsign (${jsignJarReq.statusCode}): '
        '${jsignJarReq.body}',
      );
    }
    final jsignJar = tempDir.childFile('jsign.jar');
    await jsignJar.create();
    await jsignJar.writeAsBytes(jsignJarReq.bodyBytes, flush: true);

    if (accessToken == null) {
      throw StateError('GCP_ACCESS_TOKEN is not set');
    }

    final jsignArgs = <String>[
      '-jar',
      jsignJar.path,
      '--storetype',
      'GOOGLECLOUD',
      '--storepass',
      accessToken!,
      '--keystore',
      evKeyRing,
      '--alias',
      evKeyName!,
      '--certfile',
      windowsCertsFile.path,
      '--tsmode',
      'RFC3161',
      '--tsaurl',
      'http://timestamp.globalsign.com/tsa/r6advanced1',
      appxPackage,
    ];

    print('Running jsign tool...');
    final jsignRes = await processManager.run(
      <String>['java', ...jsignArgs],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (jsignRes.exitCode != 0) {
      throw ProcessException(
        'java',
        jsignArgs,
        jsignRes.stderr as String,
        jsignRes.exitCode,
      );
    }

    print('Verifying EV code signature...');
    await _runProcess(
      p.join(_windowsSdkBinDir, 'signtool.exe'),
      [
        'verify',
        '/pa',
        '/v',
        appxPackage,
      ],
    );

    // Copy the temp appx package to its final output path.
    await fileSystem.file(appxPackage).copy(outputFilepath);

    print('Successfully codesigned $appxPackage');
  }
}

final class LinuxBundler implements Bundler {
  @override
  String get extension => 'deb';

  @override
  Future<void> bundle() async {
    // Copy launcher to buildDir
    toolDir
        .childDirectory('linux')
        .childFile('launcher.sh')
        .copySync(p.join(buildDir.path, 'launcher.sh'));

    // Create the ZIP file.
    await _createZip(
      fromDir: buildDir,
      outputPath: p.setExtension(outputFilepath, '.zip'),
    );

    // Create the DEB installer.
    await _createDeb();
  }

  /// Creates the DEB file structure.
  ///
  /// DEBIAN/
  ///  control
  ///  postinst
  ///  postrm
  /// opt/
  ///  celest/
  ///   celest
  ///   launcher.sh
  ///   libdart_sqlite.so
  Future<void> _createDeb() async {
    print('Creating Debian archive...');

    final debDir = tempDir.childDirectory('deb')..createSync();
    final debControlDir = debDir.childDirectory('DEBIAN')..createSync();
    final debInstallDir = debDir.childDirectory('opt').childDirectory('celest')
      ..createSync(recursive: true);

    final toolDebianDir = toolDir.childDirectory('linux').childDirectory('deb');

    for (final controlFile
        in toolDebianDir.childDirectory('DEBIAN').listSync().cast<File>()) {
      if (p.basename(controlFile.path) == 'control') {
        final outputControlFile = debControlDir.childFile('control');
        final outputControl =
            Template(controlFile.readAsStringSync()).renderString({
          'arch': switch (osArch) {
            Abi.linuxArm64 => 'arm64',
            Abi.linuxX64 => 'amd64',
            _ => unreachable(),
          },
          'version': version,
        });
        print('Writing control contents:\n\n$outputControl\n');
        await outputControlFile.writeAsString(outputControl);
      } else {
        controlFile.copySync(
          p.join(debControlDir.path, p.basename(controlFile.path)),
        );
      }
    }

    for (final installFile in buildDir.listSync().cast<File>()) {
      installFile.copySync(
        p.join(debInstallDir.path, p.basename(installFile.path)),
      );
    }

    // Print directory structure
    _printFs(debDir);

    await _runProcess(
      'dpkg-deb',
      ['--build', debDir.path, p.setExtension(outputFilepath, '.deb')],
      workingDirectory: tempDir.path,
    );
  }
}

Future<String> _runProcess(
  String executable,
  List<String> args, {
  String? workingDirectory,
  Future<void> Function(String logs)? onError,
}) async {
  print('Running process "$executable ${args.join(' ')}"...');
  final proc = await processManager.start(
    <String>[executable, ...args],
    workingDirectory: workingDirectory,
  );

  // For logging
  executable = executable == 'xcrun' ? args.first : executable;
  args = executable == 'xcrun' ? args.skip(1).toList() : args;

  final logsBuf = StringBuffer();
  proc.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((event) {
    logsBuf.writeln(event);
    stdout.writeln('$executable: $event');
  });
  proc.stderr
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((event) {
    stderr.writeln('$executable: $event');
  });
  final exitCode = await proc.exitCode;
  final logs = logsBuf.toString();
  if (exitCode != 0) {
    await onError?.call(logs);
    throw ProcessException(executable, args, 'Process failed', exitCode);
  }
  return logs;
}

Future<void> _createZip({
  required Directory fromDir,
  required String outputPath,
}) async {
  final zipStream = OutputFileStream(outputPath);
  final archive = ZipEncoder()
    ..startEncode(
      zipStream,
      level: Deflate.BEST_COMPRESSION,
    );
  for (final file in fromDir.listSync(recursive: false).whereType<File>()) {
    final relativePath = p.relative(file.path, from: fromDir.parent.path);
    final archiveFile = ArchiveFile(
      relativePath,
      file.lengthSync(),
      InputFileStream(file.path),
    );
    archive.addFile(archiveFile);
  }
  archive.endEncode();
  await zipStream.close();
}

extension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

void _printFs(Directory dir) {
  print('${dir.path} file structure:');
  print('---------------------');
  for (final entity in dir.listSync(recursive: true)) {
    final type = switch (fileSystem.typeSync(entity.path)) {
      FileSystemEntityType.directory => 'D',
      FileSystemEntityType.file => 'F',
      FileSystemEntityType.link => 'L',
      _ => '?',
    };
    final relativePath = p.relative(entity.path, from: dir.path);
    print('$type $relativePath');
  }
  print('---------------------');
}

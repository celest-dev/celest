import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:http/http.dart' as http;
import 'package:mustache_template/mustache.dart';
import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';

/// The directory containing this script and build assets.
final Directory toolDir = Directory.fromUri(Platform.script.resolve('.'));

/// The directory with the built CLI.
final String buildPath = Platform.environment['BUILD_DIR'] ?? 'celest';
final Directory buildDir = Directory.fromUri(
  Platform.script.resolve('../$buildPath'),
);

/// The directory to use for temporary (non-bundled) files.
final Directory tempDir = Directory.systemTemp.createTempSync('celest_build_');

/// The HTTP client to use for downloading files.
final http.Client httpClient = http.Client();

/// The current ABI which identifies the OS and architecture.
final Abi osArch = Abi.current();

/// The current version of the CLI.
final String version = Pubspec.parse(
  File.fromUri(Platform.script.resolve('../pubspec.yaml')).readAsStringSync(),
).version!.toString();

/// The bundler to use for the current platform.
final Bundler bundler = Bundler();

/// The path to the output file, dependent on the OS/arch.
final String outputFilepath = p.canonicalize(
  p.join(
    Platform.script.toFilePath(),
    '..',
    'celest-$version-$osArch.${bundler.extension}',
  ),
);

/// Builds and bundles the CLI for the current platform.
///
/// This script is used by the GitHub workflow `apps_cli_release.yaml` to create
/// a zip of the CLI and its dependencies for the current platform.
Future<void> main() async {
  print('Bundling CLI version $version for $osArch...');

  await _runProcess(
    'dart',
    [
      '--enable-experiment=native-assets',
      'build',
      '--output=$buildPath',
      'bin/celest.dart',
    ],
    workingDirectory: Platform.script.resolve('..').toFilePath(),
  );
  if (!buildDir.existsSync()) {
    throw StateError('Build directory does not exist');
  }

  if (!Platform.isWindows) {
    final exeUri = Platform.script.resolve('../celest/celest.exe');
    final exe = File.fromUri(exeUri);
    final destExe = p.withoutExtension(p.absolute(exeUri.path));
    if (!exe.existsSync() && !File(destExe).existsSync()) {
      throw StateError('Executable does not exist: $exe');
    }
    exe.renameSync(destExe);
  }

  await bundler.bundle();

  print('Successfully wrote $outputFilepath');

  final isCI = Platform.environment['CI'] == 'true';
  if (!isCI) {
    return;
  }

  final latestFilename = outputFilepath.replaceAll(version, 'latest');
  File(outputFilepath).copySync(latestFilename);
  print('Successfully wrote $latestFilename');

  final ghOutputPath = Platform.environment['GITHUB_OUTPUT'];
  if (ghOutputPath == null) {
    throw StateError('GITHUB_OUTPUT environment variable is not set');
  }
  final ghOutput = File(ghOutputPath);
  if (!ghOutput.existsSync()) {
    throw StateError('GitHub output file does not exist: $ghOutput');
  }
  ghOutput.writeAsStringSync(
    'version=$version${Platform.lineTerminator}'
    'filepath=$outputFilepath${Platform.lineTerminator}'
    'filepath-latest=$latestFilename${Platform.lineTerminator}'
    'filename=${p.basename(outputFilepath)}${Platform.lineTerminator}',
    mode: FileMode.append,
    flush: true,
  );
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
    final isCI = Platform.environment['CI'] == 'true';
    if (isCI) {
      final keychainName = Platform.environment['KEYCHAIN_NAME'];
      if (keychainName.isNullOrEmpty) {
        throw StateError('KEYCHAIN_NAME environment variable is not set');
      }
      return keychainName;
    }
    return null;
  }();

  /// The Apple ID to use for notarization.
  static final String appleId = Platform.environment['APPLE_ID']!;

  /// The app-specific password for the Apple ID to use for notarization.
  static final String appleIdPass = Platform.environment['APPLE_ID_PASS']!;

  /// The Apple Team ID to use for notarization.
  static final String appleTeamId = Platform.environment['APPLE_TEAM_ID']!;

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
  final appDir = Directory(p.join(tempDir.path, 'celest.app'))..createSync();

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
    Directory(p.join(appDir.path, 'Contents', 'MacOS'))
        .createSync(recursive: true);
    Directory(p.join(appDir.path, 'Contents', 'Frameworks', 'celest'))
        .createSync(recursive: true);
    final exe = File(p.join(buildDir.path, 'celest'));
    final toSign = [exe.path];

    // Updates the LC_RPATH of `celest` to match .app directory structure.
    // https://developer.apple.com/documentation/xcode/embedding-nonstandard-code-structures-in-a-bundle#Adopt-rpath-relative-references
    // TODO(dnys1): File a bug with Dart to fix this. They include @executable_path/Frameworks which is wrong.
    await _runProcess(
      'install_name_tool',
      ['-add_rpath', '@executable_path/../Frameworks', exe.path],
    );

    exe.copySync(
      p.join(appDir.path, 'Contents', 'MacOS', 'celest'),
    );

    for (final dylib in buildDir
        .listSync()
        .whereType<File>()
        .where((f) => p.extension(f.path) == '.dylib')) {
      // Even though rpath is Frameworks/ in the binary, the runtime searches
      // at Frameworks/celest/<dylib>.
      final appDylibPath = p.join(
        appDir.path,
        'Contents',
        'Frameworks',
        'celest',
        p.basename(dylib.path),
      );
      dylib.copySync(appDylibPath);
      toSign.add(appDylibPath);
    }

    toSign.add(appDir.path);

    // Matches the entitlements needed by `dartaotruntime`:
    // https://github.com/dart-lang/sdk/blob/7e5ce1f688e036dbe4b417f7fd92bbced67b5ec5/runtime/tools/entitlements/dart_precompiled_runtime_product.plist
    final entitlementsPlistPath = p.join(tempDir.path, 'entitlements.xml');
    final entitlementsPlist = Template(
      File(p.join(toolDir.path, 'macos', 'entitlements.xml'))
          .readAsStringSync(),
    ).renderString({
      'teamId': appleTeamId,
    });
    print('Rendered entitlements.xml:\n\n$entitlementsPlist\n');
    File(entitlementsPlistPath)
      ..createSync()
      ..writeAsStringSync(
        entitlementsPlist,
        flush: true,
      );

    final infoPlist = Template(
      File(p.join(toolDir.path, 'macos', 'Info.plist')).readAsStringSync(),
    ).renderString({
      'version': version,
      'teamId': appleTeamId,
    });
    print('Rendered Info.plist:\n\n$infoPlist\n');
    File(p.join(appDir.path, 'Contents', 'Info.plist'))
      ..createSync()
      ..writeAsStringSync(infoPlist);

    File(p.join(toolDir.path, 'macos', 'embedded.provisionprofile')).copySync(
      p.join(appDir.path, 'Contents', 'embedded.provisionprofile'),
    );

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
    // `TODO`: enable_currentUserHome="true"? https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/DistributionDefinitionRef/Chapters/Distribution_XML_Ref.html#//apple_ref/doc/uid/TP40005370-CH100-SW35
    final distributionTmpl =
        File(p.join(toolDir.path, 'macos', 'distribution.xml'))
            .readAsStringSync();
    final distributionFile = File(p.join(tempDir.path, 'distribution.xml'));
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
    final allSdks = Directory(binDir)
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
    await _evCodesign(appxPackage);
  }

  /// Creates an APPX installer package for the CLI.
  Future<String> _createAppx() async {
    // Mostly copied from winget: https://github.com/microsoft/winget-cli/blob/master/src/AppInstallerCLIPackage/Package.appxmanifest
    // Schema: https://learn.microsoft.com/en-us/uwp/schemas/appxpackage/uapmanifestschema/element-application
    final appxManifestPath = p.join(buildDir.path, 'AppxManifest.xml');
    final appxManifest = Template(
      File(p.join(toolDir.path, 'windows', 'AppxManifest.xml'))
          .readAsStringSync(),
    ).renderString({
      'arch': osArch == Abi.windowsArm64 ? 'arm64' : 'x64',
      'version': version,
    });
    print('Rendered AppxManifest.xml:\n\n$appxManifest\n');
    File(appxManifestPath)
      ..createSync()
      ..writeAsStringSync(appxManifest, flush: true);

    // Copy logo files to buildDir.
    // TODO(dnys1): Update logos to be cleaner.
    final sourceDir = p.dirname(p.fromUri(Platform.script));
    for (final logo in [
      'logo-full.png',
      'logo-150x150.png',
      'logo-44x44.png',
    ]) {
      File(p.join(sourceDir, logo)).copySync(p.join(buildDir.path, logo));
    }

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
    final evKeyRing = Platform.environment['EV_KEY_RING'];
    final evKeyName = Platform.environment['EV_KEY_NAME'];
    final certData = Platform.environment['WINDOWS_CERTS_DATA'];

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

    final windowsCertsFile = File(p.join(tempDir.path, 'windows-certs.p7b'));
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
    final jsignJar = File(p.join(tempDir.path, 'jsign.jar'));
    await jsignJar.create();
    await jsignJar.writeAsBytes(jsignJarReq.bodyBytes, flush: true);

    print('Loading GCP credentials...');
    final gcloudPassProc = await Process.run(
      'gcloud',
      ['auth', 'application-default', 'print-access-token'],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
      runInShell: true,
    );
    if (gcloudPassProc.exitCode != 0) {
      throw ProcessException(
        'gcloud',
        ['auth', 'application-default', 'print-access-token'],
        gcloudPassProc.stderr as String,
        gcloudPassProc.exitCode,
      );
    }
    final gcloudPass =
        LineSplitter.split(gcloudPassProc.stdout as String).first.trim();

    final jsignArgs = <String>[
      '-jar',
      jsignJar.path,
      '--storetype',
      'GOOGLECLOUD',
      '--storepass',
      gcloudPass,
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
    final jsignRes = await Process.run(
      'java',
      jsignArgs,
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
    await File(appxPackage).copy(outputFilepath);

    print('Successfully codesigned $appxPackage');
  }
}

final class LinuxBundler implements Bundler {
  @override
  String get extension => 'zip';

  @override
  Future<void> bundle() async {
    await _createZip(fromDir: buildDir, outputPath: outputFilepath);
  }
}

Future<String> _runProcess(
  String executable,
  List<String> args, {
  String? workingDirectory,
  Future<void> Function(String logs)? onError,
}) async {
  print('Running process "$executable ${args.join(' ')}"...');
  final proc = await Process.start(
    executable,
    args,
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

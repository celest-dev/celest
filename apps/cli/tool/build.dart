import 'dart:ffi';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';

/// Matches the entitlements needed by `dartaotruntime`:
/// https://github.com/dart-lang/sdk/blob/7e5ce1f688e036dbe4b417f7fd92bbced67b5ec5/runtime/tools/entitlements/dart_precompiled_runtime_product.plist
const entitlements = '''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>com.apple.security.cs.allow-unsigned-executable-memory</key>
  <true/>
  <key>com.apple.security.cs.disable-library-validation</key>
  <true/>
</dict>
</plist>
''';

/// Builds and bundles the CLI for the current platform.
///
/// This script is used by the GitHub workflow `apps_cli_release.yaml` to create
/// a zip of the CLI and its dependencies for the current platform.
Future<void> main() async {
  final osArch = Abi.current().toString();
  final version = Pubspec.parse(
    File.fromUri(Platform.script.resolve('../pubspec.yaml')).readAsStringSync(),
  ).version!.toString();

  if (!Platform.isWindows) {
    final exeUri = Platform.script.resolve('../celest/celest.exe');
    final exe = File.fromUri(exeUri);
    if (!exe.existsSync()) {
      throw StateError('Executable does not exist: $exe');
    }
    exe.renameSync(p.withoutExtension(p.absolute(exeUri.path)));
  }

  print('Bundling CLI version $version for $osArch...');

  final filename = p.canonicalize(
    p.join(
      Platform.script.toFilePath(),
      '..',
      'celest-$version-$osArch.zip',
    ),
  );
  final buildDir = Directory.fromUri(Platform.script.resolve('../celest'));
  if (!buildDir.existsSync()) {
    throw StateError('Build directory does not exist: $buildDir');
  }

  if (Platform.isMacOS) {
    await _codesignAndNotarize(buildDir);
  }
  await _createZip(fromDir: buildDir, outputPath: filename);

  print('Successfully wrote $filename');

  final isCI = Platform.environment['CI'] == 'true';
  if (!isCI) {
    return;
  }
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
    'filepath=$filename${Platform.lineTerminator}'
    'filename=${p.basename(filename)}${Platform.lineTerminator}',
    mode: FileMode.append,
    flush: true,
  );
}

/// Uses `codesign` and `notarytool` to codesign and notarize the CLI.
///
/// References:
/// - https://stackoverflow.com/questions/64652704/how-to-notarize-an-macos-command-line-tool-created-outside-of-xcode
/// - https://scriptingosx.com/2021/07/notarize-a-command-line-tool-with-notarytool/
/// - https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution/customizing_the_notarization_workflow
Future<void> _codesignAndNotarize(Directory buildDir) async {
  final tempDir = await Directory.systemTemp.createTemp('celest_build_');
  final entitlementsPlist = File(p.join(tempDir.path, 'entitlements.plist'));
  await entitlementsPlist.writeAsString(entitlements);

  // Codesign all files in the build directory.
  String? keychain;
  if (Platform.environment['CI'] == 'true') {
    keychain = Platform.environment['KEYCHAIN_NAME'];

    if (keychain.isNullOrEmpty) {
      throw StateError('Keychain or keychain password is empty');
    }
  }
  const developerApplicationIdentity =
      'Developer ID Application: HumbleMe, Inc. (6NFV336UD2)';
  for (final file in buildDir.listSync(recursive: true).whereType<File>()) {
    await _runProcess(
      'codesign',
      [
        '--force',
        '--options=runtime',
        '--sign',
        developerApplicationIdentity,
        if (keychain != null) ...[
          '--keychain',
          keychain,
        ],
        '--prefix',
        'com.humbleme.',
        '--entitlements',
        entitlementsPlist.path,
        '--timestamp',
        '--verbose',
        file.path,
      ],
    );
    await _runProcess(
      'codesign',
      ['--verify', '--verbose', file.path],
      onError: () async {
        print('Could not verify code signature. Code-signing results:');
        await _runProcess('codesign', ['--display', '--verbose=4']);
        print('Entitlement results:');
        await _runProcess('codesign', ['--display', '--entitlements=-']);
      },
    );
  }

  // TODO(dnys1): Notarize
  // xcrun notarytool submit --apple-id=$APPLE_ID --password=$APPLE_ID_PASSWORD --team-id=$TEAM_ID --wait --verbose celest.zip
  // xcrun stapler staple celest
  // spctl --assess --type exec -vv celest
}

Future<void> _runProcess(
  String executable,
  List<String> args, {
  Future<void> Function()? onError,
}) async {
  final proc = await Process.start(
    executable,
    args,
    mode: ProcessStartMode.inheritStdio,
  );
  final exitCode = await proc.exitCode;
  if (exitCode != 0) {
    await onError?.call();
    throw ProcessException(executable, args, 'Process failed', exitCode);
  }
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

import 'dart:convert';
import 'dart:ffi';
import 'dart:io' show ProcessException, stderr, stdout;

import 'package:archive/archive_io.dart';
import 'package:args/args.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/version.dart';
import 'package:file/file.dart';
import 'package:mustache_template/mustache.dart';
import 'package:path/path.dart' as p;

/// The directory containing this script and build assets.
final Directory toolDir = fileSystem.file(platform.script).parent;

/// The directory with the built CLI.
final String buildPath = platform.environment['BUILD_DIR'] ?? 'build';
final Directory buildDir = fileSystem.directory(
  platform.script.resolve('../$buildPath'),
);

/// The directory to use for bundled files.
final Directory outputsDir = toolDir.parent.childDirectory('releases')
  ..createSync();

/// The current ABI which identifies the OS and architecture.
final Abi osArch = Abi.current();
final String hostOs = switch (osArch) {
  Abi.linuxArm64 || Abi.linuxX64 => 'linux',
  _ => throw UnsupportedError('Unsupported ABI: $osArch'),
};
final String hostArch = switch (osArch) {
  Abi.linuxArm64 => 'arm64',
  Abi.linuxX64 => 'x64',
  _ => throw UnsupportedError('Unsupported ABI: $osArch'),
};

/// The current version of the CLI.
final String version = packageVersion;

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
    ..addOption('target-os', allowed: ['linux'], defaultsTo: hostOs)
    ..addMultiOption('target-arch',
        allowed: ['arm64', 'x64'], defaultsTo: [hostArch]);
  final argResults = argParser.parse(args);

  final targetOs = argResults.option('target-os')!;
  final targetArchs = argResults.multiOption('target-arch');

  final artifacts = <String>[];
  for (final targetArch in targetArchs) {
    final artifact = await _build(
      targetOs: targetOs,
      targetArch: targetArch,
    );
    artifacts.add(artifact);
  }

  if (platform.environment['GITHUB_OUTPUT'] case final ciOutput?) {
    fileSystem.file(ciOutput).writeAsStringSync(
          [
            'version=$version',
            'artifacts<<EOF',
            ...artifacts,
            'EOF',
          ].join('\n'),
          mode: FileMode.append,
          flush: true,
        );
  }
}

Future<String> _build({
  required String targetOs,
  required String targetArch,
}) async {
  print('Bundling CLI version $version for $targetOs-$targetArch...');

  if (buildDir.existsSync()) {
    buildDir.deleteSync(recursive: true);
  }
  await buildDir.create(recursive: true);
  await _runProcess(
    'dart',
    [
      if (currentSha case final currentSha?) '--define=gitSha=$currentSha',
      '--define=version=$version',
      'compile',
      'exe',
      if (targetOs != hostOs || targetArch != hostArch) ...[
        '--target-os=$targetOs',
        '--target-arch=$targetArch',
        '--experimental-cross-compilation',
      ],
      '--output=$buildPath/celest.exe',
      'bin/celest.dart',
    ],
    workingDirectory: platform.script.resolve('..').toFilePath(),
  );
  if (!buildDir.existsSync()) {
    throw StateError('Build directory does not exist');
  }

  if (!platform.isWindows) {
    final exeUri = platform.script.resolve('../$buildPath/celest.exe');
    final exe = fileSystem.file(exeUri);
    final destExe = p.withoutExtension(p.absolute(exeUri.path));
    if (!exe.existsSync() && !fileSystem.file(destExe).existsSync()) {
      throw StateError('Executable does not exist: $exe');
    }
    exe.renameSync(destExe);
  }

  final bundler = switch (targetOs) {
    'linux' => LinuxDebBundler(arch: targetArch),
    _ => throw UnsupportedError('Unsupported OS: $targetOs'),
  };

  print('Bundling with ${bundler.runtimeType}...');
  await bundler.bundle();

  print('Successfully wrote ${bundler.outputFilepath}');
  return bundler.outputFilepath;
}

abstract class Bundler {
  String get os;
  String get arch;
  String get extension;

  /// The path to the output file, dependent on the OS/arch.
  String get outputFilepath => p.join(
        outputsDir.path,
        'celest_cli-$os-$arch.$extension',
      );

  /// The directory to use for temporary (non-bundled) files.
  final Directory tempDir = fileSystem.systemTempDirectory.createTempSync(
    'celest_build_',
  );

  /// Bundles the CLI and its dependencies into a single file, performing
  /// code signing and notarization as needed.
  Future<void> bundle();
}

final class LinuxArchiveBundler extends Bundler {
  LinuxArchiveBundler({required this.arch});

  @override
  String get os => 'linux';

  @override
  final String arch;

  @override
  String get extension => 'tar.gz';

  @override
  Future<void> bundle() async {
    // Encode a directory from disk to disk, no memory
    final encoder = TarFileEncoder();
    await encoder.tarDirectory(
      buildDir,
      compression: TarFileEncoder.gzip,
      filename: outputFilepath,
    );
  }
}

final class LinuxDebBundler extends Bundler {
  LinuxDebBundler({required this.arch});

  @override
  String get os => 'linux';

  @override
  final String arch;

  @override
  String get extension => 'deb';

  @override
  Future<void> bundle() async {
    /// Creates the DEB file structure.
    ///
    /// DEBIAN/
    ///  control
    ///  postinst
    ///  postrm
    /// opt/
    ///  celest/
    ///   celest
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
        final outputControl = Template(
          controlFile.readAsStringSync(),
        ).renderString({
          'arch': switch (arch) {
            'arm64' => 'arm64',
            'x64' => 'amd64',
            _ => throw UnsupportedError('Unsupported arch: $arch'),
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
      [
        '--build',
        debDir.path,
        outputFilepath,
      ],
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
  final proc = await processManager.start(<String>[
    executable,
    ...args,
  ], workingDirectory: workingDirectory);

  // For logging
  executable = executable == 'xcrun' ? args.first : executable;
  args = executable == 'xcrun' ? args.skip(1).toList() : args;

  final logsBuf = StringBuffer();
  proc.stdout.transform(utf8.decoder).transform(const LineSplitter()).listen((
    event,
  ) {
    logsBuf.writeln(event);
    stdout.writeln('$executable: $event');
  });
  proc.stderr.transform(utf8.decoder).transform(const LineSplitter()).listen((
    event,
  ) {
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

import 'dart:convert';
import 'dart:io';

import 'package:native_assets_cli/native_assets_cli.dart';

const packageName = 'cedar_ffi';
const ffiPackageName = 'cedar_ffi';

final IOSink buildLogs = () {
  final logsFile = File.fromUri(
    Platform.script.resolve('.dart_tool/build.log'),
  );
  logsFile.createSync(recursive: true);
  return logsFile.openWrite(mode: FileMode.write);
}();

/// Implements the protocol from `package:native_assets_cli` by building
/// the C code in `src/` and reporting what native assets it built.
void main(List<String> args) async {
  // Parse the build configuration passed to this CLI from Dart or Flutter.
  final buildConfig = await BuildConfig.fromArgs(args);
  buildLogs.writeln(buildConfig.toString());
  final buildOutput = BuildOutput()
    ..dependencies.dependencies.addAll([
      buildConfig.packageRoot.resolve('build.dart'),
      buildConfig.packageRoot.resolve('src/'),
    ]);

  // Build the Rust code in `src/` to `target/`.
  //
  // Since we're in a workspace, this will default to the repo root which we
  // don't want.
  final cargoOutput = buildConfig.packageRoot.resolve('target/');
  await runProcess(
    'cargo',
    ['build', '--release'],
    environment: {
      'CARGO_TARGET_DIR': cargoOutput.toFilePath(),
    },
    workingDirectory: buildConfig.packageRoot.resolve('src').toFilePath(),
  );

  final binaryName = buildConfig.targetOs.dylibFileName(ffiPackageName);
  final binaryOut = cargoOutput.resolve('release/$binaryName');
  if (!File.fromUri(binaryOut).existsSync()) {
    throw Exception('$binaryOut does not exist');
  }
  final nativeAsset = Asset(
    id: 'package:$packageName/src/ffi/cedar_bindings.g.dart',
    linkMode: LinkMode.dynamic,
    target: buildConfig.target,
    path: AssetAbsolutePath(binaryOut),
  );
  buildLogs.writeln('Compiled asset: ${nativeAsset.toString()}');
  buildOutput.assets.add(nativeAsset);

  // Write the output according to the native assets protocol so that Dart or
  // Flutter can find the native assets produced by this script.
  await buildOutput.writeToFile(outDir: buildConfig.outDir);

  await buildLogs.flush();
  await buildLogs.close();
}

Future<void> runProcess(
  String exe,
  List<String> args, {
  Map<String, String>? environment,
  String? workingDirectory,
}) async {
  final process = await Process.start(
    exe,
    args,
    environment: environment,
    workingDirectory: workingDirectory,
    includeParentEnvironment: true,
  );
  final stdoutBuffer = StringBuffer();
  final stderrBuffer = StringBuffer();
  final stdoutSub = process.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((line) {
    buildLogs.writeln('STDOUT: $line');
    stderrBuffer.writeln(line);
  });
  final stderrSub = process.stderr
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((line) {
    buildLogs.writeln('STDERR: $line');
    stderrBuffer.writeln(line);
  });
  final (exitCode, _, _) = await (
    process.exitCode,
    stdoutSub.asFuture<void>(),
    stderrSub.asFuture<void>(),
  ).wait;
  await buildLogs.flush();
  if (exitCode != 0) {
    throw ProcessException(
      exe,
      args,
      'STDOUT:\n$stdoutBuffer\n'
      'STDERR:\n$stderrBuffer',
      exitCode,
    );
  }
}

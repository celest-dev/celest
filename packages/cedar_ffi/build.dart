import 'dart:convert';
import 'dart:io';

import 'package:native_assets_cli/native_assets_cli.dart';

const packageName = 'cedar_ffi';

final IOSink buildLogs = () {
  final logsFile = File.fromUri(
    Platform.script.resolve('.dart_tool/build.log'),
  );
  logsFile.createSync(recursive: true);
  return logsFile.openWrite(mode: FileMode.write)
    ..writeln('Starting build: ${DateTime.now()}');
}();

void main(List<String> args) async {
  try {
    await build(args, (config, output) async {
      buildLogs.writeln(config.toString());

      output.addDependencies([
        config.packageRoot.resolve('build.dart'),
        config.packageRoot.resolve('src/'),
      ]);

      // Build the Rust code in `src/` to `target/`.
      //
      // Since we're in a workspace, this will default to the repo root which we
      // don't want.
      final cargoOutput = config.packageRoot.resolve('target/');
      await runProcess(
        'cargo',
        ['build', '--release'],
        environment: {
          'CARGO_TARGET_DIR': cargoOutput.toFilePath(),
        },
        workingDirectory: config.packageRoot.resolve('src').toFilePath(),
      );

      final binaryName = config.targetOS.dylibFileName(packageName);
      final binaryOut = cargoOutput.resolve('release/$binaryName');
      if (!File.fromUri(binaryOut).existsSync()) {
        throw Exception('$binaryOut does not exist');
      }
      if (config.targetOS == OS.windows) {
        // Workaround for https://github.com/dart-lang/sdk/issues/55207
        //
        // Bundle a second asset which can resolve symbols from a previously
        // loaded DLL. This allows having a fallback mechanism, since you
        // cannot add duplicate assets.
        //
        // This only matters in release mode, but since `config.buildMode` is
        // always set to `release` in Dart, it's no good.
        final loadedAsset = NativeCodeAsset(
          package: packageName,
          name: 'src/ffi/cedar_bindings.loaded.ffi.dart',
          linkMode: LookupInProcess(),
          os: config.targetOS,
          architecture: config.targetArchitecture,
        );
        output.addAsset(loadedAsset);
      }
      final nativeAsset = NativeCodeAsset(
        package: packageName,
        name: 'src/ffi/cedar_bindings.bundled.ffi.dart',
        linkMode: DynamicLoadingBundled(),
        os: config.targetOS,
        architecture: config.targetArchitecture,
        file: binaryOut,
      );
      buildLogs.writeln('Compiled asset: ${nativeAsset.toString()}');
      output.addAsset(nativeAsset);
    });
  } finally {
    await buildLogs.flush();
    await buildLogs.close();
  }
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

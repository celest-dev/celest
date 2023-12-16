import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/src/context.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:package_config/package_config.dart';

final class EntrypointDefinition {
  EntrypointDefinition({
    required this.functionName,
    required this.apiName,
    this.packageConfig,
  });

  final String functionName;
  final String apiName;
  final PackageConfig? packageConfig;

  String get name => '$apiName/$functionName';
  late final String path =
      projectPaths.functionEntrypoint(apiName, functionName);

  @override
  String toString() => prettyPrintJson({
        'name': name,
        'apiName': apiName,
        'path': path,
        'packageConfig':
            packageConfig == null ? null : PackageConfig.toJson(packageConfig!),
      });
}

final class EntrypointResult {
  const EntrypointResult({
    required this.functionName,
    required this.apiName,
    required this.outputPath,
  });

  final String functionName;
  final String apiName;
  final String outputPath;

  @override
  String toString() => prettyPrintJson({
        'functionName': functionName,
        'apiName': apiName,
        'outputPath': outputPath,
      });
}

final class EntrypointCompiler {
  EntrypointCompiler({
    required this.logger,
    required this.verbose,
    required this.enabledExperiments,
  });

  final Logger logger;
  final bool verbose;
  final List<String> enabledExperiments;

  Future<void> compileAll(List<EntrypointDefinition> entrypoints) async {}

  Future<EntrypointResult> compile(EntrypointDefinition entrypoint) async {
    logger.detail('Compiling entrypoint: $entrypoint');
    final compileProgress = logger.progress('Compiling ${entrypoint.name}...');
    try {
      final pathWithoutDart =
          entrypoint.path.substring(0, entrypoint.path.length - 5);
      if (!FileSystemEntity.isFileSync(entrypoint.path)) {
        throw StateError(
          'Entrypoint file does not exist or is not a file: '
          '${entrypoint.path}',
        );
      }
      String? packageConfigPath;
      if (entrypoint.packageConfig case final packageConfig?) {
        packageConfigPath = '$pathWithoutDart.packages.json';
        final packageConfigFile = File(packageConfigPath);
        logger.detail('Writing package config to ${packageConfigFile.path}');
        final packageConfigString = StringBuffer();
        PackageConfig.writeString(packageConfig, packageConfigString);
        await packageConfigFile.writeAsString(packageConfigString.toString());
      }
      final outputPath = '$pathWithoutDart.dill';
      final buildArgs = [
        '--snapshot-kind=kernel',
        '--snapshot=${p.canonicalize(outputPath)}',
        if (packageConfigPath != null) '--packages=$packageConfigPath',
        if (enabledExperiments.isNotEmpty)
          '--enable-experiment=${enabledExperiments.join(',')}',
        if (verbose) '-v',
        // TODO: Dart defines?
        p.canonicalize(entrypoint.path),
      ];
      logger.detail('Compiling with args: $buildArgs');
      final result = await Process.run(
        Sdk.current.dart,
        buildArgs,
        workingDirectory: projectPaths.projectRoot,
        includeParentEnvironment: true,
        stdoutEncoding: utf8,
        stderrEncoding: utf8,
      );
      final ProcessResult(:exitCode, :stdout as String, :stderr as String) =
          result;
      logger.detail('Compilation finished with status $exitCode');
      if (exitCode == 0) {
        logger.detail('Compilation succeeded');
        compileProgress.complete('Compiled ${entrypoint.name}');
        return EntrypointResult(
          functionName: entrypoint.functionName,
          apiName: entrypoint.apiName,
          outputPath: outputPath,
        );
      }
      logger
        ..err('Compilation failed')
        ..err('Compilation stdout:\n$stdout')
        ..err('Compilation stderr:\n$stderr');
      throw ProcessException(
        Sdk.current.dart,
        buildArgs,
        'Compilation failed',
        exitCode,
      );
    } on Object {
      compileProgress.fail('Failed to compile entrypoint: $entrypoint');
      rethrow;
    }
  }
}

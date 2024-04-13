import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:api_celest/ast.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/compiler/package_config_transform.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';

final class EntrypointDefinition {
  EntrypointDefinition({
    required this.functionName,
    required this.apiName,
  });

  final String functionName;
  final String apiName;

  String get name => '$apiName/$functionName';
  late final String path =
      projectPaths.functionEntrypoint(apiName, functionName);

  @override
  String toString() => prettyPrintJson({
        'name': name,
        'apiName': apiName,
        'path': path,
      });
}

final class EntrypointResult {
  const EntrypointResult({
    required this.nodeId,
    required this.outputDillPath,
    required this.outputDill,
    required this.outputDillSha256,
  });

  final NodeId nodeId;
  final String outputDillPath;
  final Uint8List outputDill;
  final Digest outputDillSha256;

  @override
  String toString() => prettyPrintJson({
        'nodeId': nodeId.toJson(),
        'outputDillPath': outputDillPath,
        'outputDillSha256': outputDillSha256.toString(),
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

  Future<EntrypointResult> compile(NodeId id, String entrypointPath) async {
    logger.fine('Compiling entrypoint: $entrypointPath');
    if (!fileSystem.isFileSync(entrypointPath)) {
      throw StateError(
        'Entrypoint file does not exist or is not a file: '
        '$entrypointPath',
      );
    }
    final pathWithoutDart =
        entrypointPath.substring(0, entrypointPath.length - 5);
    final packageConfig = await transformPackageConfig(
      packageConfigPath: projectPaths.packagesConfig,
      fromRoot: projectPaths.projectRoot,
      toRoot: projectPaths.outputsDir,
    );
    final outputPath = '$pathWithoutDart.dill';
    final buildArgs = <String>[
      Sdk.current.dartAotRuntime,
      Sdk.current.genKernelAotSnapshot,
      '--aot',
      '--platform=${Sdk.current.vmPlatformProductDill}',
      '-Ddart.vm.product=true',
      '--output=$outputPath',
      '--packages=$packageConfig',
      if (enabledExperiments.isNotEmpty)
        '--enable-experiment=${enabledExperiments.join(',')}',
      p.canonicalize(entrypointPath),
    ];
    logger.finer('Compiling with args: $buildArgs');
    final result = await processManager.run(
      buildArgs,
      workingDirectory: projectPaths.outputsDir,
      includeParentEnvironment: true,
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    final ProcessResult(
      :exitCode,
      :stdout as String,
      :stderr as String,
    ) = result;
    logger.fine('Compilation finished with status $exitCode');
    if (exitCode != 0) {
      throw ProcessException(
        Sdk.current.dart,
        buildArgs,
        'Compilation failed:\n$stdout\n$stderr',
        exitCode,
      );
    }
    logger.finer('Compilation succeeded');
    final outputDill = await fileSystem.file(outputPath).readAsBytes();
    final outputDillSha256 = sha256.convert(outputDill);
    return EntrypointResult(
      nodeId: id,
      outputDillPath: outputPath,
      outputDill: outputDill,
      outputDillSha256: outputDillSha256,
    );
  }
}

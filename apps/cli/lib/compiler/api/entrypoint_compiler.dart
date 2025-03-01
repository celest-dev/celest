import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/compiler/package_config_transform.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';

final class EntrypointDefinition {
  EntrypointDefinition({required this.functionName, required this.apiName});

  final String functionName;
  final String apiName;

  String get name => '$apiName/$functionName';
  late final String path = projectPaths.functionEntrypoint(
    apiName,
    functionName,
  );

  @override
  String toString() =>
      prettyPrintJson({'name': name, 'apiName': apiName, 'path': path});
}

final class EntrypointResult {
  const EntrypointResult({
    required this.outputDillPath,
    required this.outputDill,
    required this.outputDillDigest,
  });

  final String outputDillPath;
  final Uint8List outputDill;
  final Digest outputDillDigest;

  @override
  String toString() => prettyPrintJson({
    'outputDillPath': outputDillPath,
    'outputDillSha256': outputDillDigest.toString(),
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

  Future<EntrypointResult> compile({
    required ast.ResolvedProject resolvedProject,
    required String entrypointPath,
  }) async {
    logger.fine('Compiling entrypoint: $entrypointPath');
    if (!fileSystem.isFileSync(entrypointPath)) {
      throw StateError(
        'Entrypoint file does not exist or is not a file: '
        '$entrypointPath',
      );
    }
    final pathWithoutDart = entrypointPath.substring(
      0,
      entrypointPath.length - 5,
    );
    final packageConfig = await transformPackageConfig(
      packageConfigPath: projectPaths.packagesConfig,
      fromRoot: projectPaths.projectRoot,
      toRoot: projectPaths.outputsDir,
    );
    final outputPath = '$pathWithoutDart.dill';
    final (target, platformDill, sdkRoot) = switch (resolvedProject
        .sdkConfig
        .targetSdk) {
      SdkType.flutter => (
        'flutter',
        Sdk.current.flutterPlatformDill!,
        Sdk.current.flutterPatchedSdk!,
      ),
      SdkType.dart => (
        'vm',
        Sdk.current.vmPlatformDill,
        p.join(Sdk.current.sdkPath, 'lib', '_internal'),
      ),
      final unknown => unreachable('Unknown SDK type: $unknown'),
    };

    // NOTE: FE server requires file: URIs for *some* paths on Windows.
    final buildArgs = <String>[
      Sdk.current.dartAotRuntime,
      Sdk.current.frontendServerAotSnapshot,
      '--aot',
      '--tfa',
      '--no-support-mirrors',
      '--sdk-root=$sdkRoot', // Must be path
      '--platform=${Uri.file(platformDill)}', // Must be URI
      '--link-platform',
      '--target=$target',
      '-Ddart.vm.product=true',
      '--output-dill=$outputPath', // Must be path
      '--packages=${Uri.file(packageConfig)}',
      if (enabledExperiments.isNotEmpty)
        '--enable-experiment=${enabledExperiments.join(',')}',
      Uri.file(p.canonicalize(p.normalize(entrypointPath))).toString(),
    ];
    logger.finer('Compiling with args: $buildArgs');
    final result = await processManager.run(
      buildArgs,
      workingDirectory: projectPaths.outputsDir,
      includeParentEnvironment: true,
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    final ProcessResult(:exitCode, :stdout as String, :stderr as String) =
        result;
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
    final outputDillDigest = await _computeMd5(outputDill.asUnmodifiableView());
    return EntrypointResult(
      outputDillPath: outputPath,
      outputDill: outputDill,
      outputDillDigest: outputDillDigest,
    );
  }
}

Future<Digest> _computeMd5(Uint8List data) async {
  return Isolate.run(() => md5.convert(data));
}

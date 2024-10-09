import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/api/entrypoint_generator.dart';
import 'package:celest_cli/codegen/api/local_api_generator.dart';
import 'package:celest_cli/codegen/cloud/cloud_client_generator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart';

final class CloudCodeGenerator extends AstVisitor<void> {
  CloudCodeGenerator({
    required this.project,
    required this.resolvedProject,
  });

  final Project project;
  final ResolvedProject resolvedProject;

  /// A map of generated files to their contents.
  final Map<String, String> fileOutputs = {};

  /// A map of API routes to their target reference.
  final Map<String, Reference> _targets = {};

  Map<String, String> generate() {
    visitProject(project);
    return fileOutputs;
  }

  @override
  void visitProject(Project project) {
    final cloudClientLibraries =
        CloudClientGenerator(project: project).generate();
    for (final library in cloudClientLibraries.entries) {
      final filePath = projectPaths.denormalizeUri(library.key).toFilePath();
      fileOutputs[filePath] = CodeGenerator.emit(
        library.value,
        forFile: filePath,
        pathStrategy: PathStrategy.pretty,
        prefixingStrategy: PrefixingStrategy.none,
      );
    }

    project.apis.values.forEach(visitApi);

    if (project.apis.isNotEmpty) {
      final localApiFile = projectPaths.localApiEntrypoint;
      final localApi = LocalApiGenerator(
        targets: _targets,
        // TODO(dnys1): Improve logic
        projectType: resolvedProject.sdkInfo.flutterSdkVersion == null
            ? CelestProjectType.dart
            : CelestProjectType.flutter,
      ).generate();
      fileOutputs[localApiFile] = CodeGenerator.emit(
        localApi,
        forFile: localApiFile,
        pathStrategy: PathStrategy.pretty,
      );
    }
  }

  @override
  void visitApi(Api api) {
    final outputDir = projectPaths.apiOutput(api.name);
    for (final function in api.functions.values) {
      final generator = EntrypointGenerator(
        project: project,
        api: api,
        function: function,
        httpConfig: resolvedProject
            .apis[api.name]!.functions[function.name]!.httpConfig,
        outputDir: outputDir,
      );
      final entrypoint = generator.generate();
      final entrypointFile =
          projectPaths.functionEntrypoint(api.name, function.name);
      fileOutputs[entrypointFile] = CodeGenerator.emit(
        entrypoint,
        forFile: entrypointFile,
        pathStrategy: PathStrategy.pretty,
      );
      _targets[function.route] = refer(
        generator.targetName,
        p.toUri(entrypointFile).toString(),
      );
    }
  }

  @override
  void visitApiAuthenticated(ApiAuthenticated annotation) {}

  @override
  void visitApiPublic(ApiPublic annotation) {}

  @override
  void visitApiMiddleware(ApiMiddleware annotation) {}

  @override
  void visitApiHttpMetadata(ApiHttpMetadata metadata) {}

  @override
  void visitFunction(CloudFunction function) {}

  @override
  void visitParameter(CloudFunctionParameter parameter) {}

  @override
  void visitEnvironmentVariable(EnvironmentVariable variable) {}

  @override
  void visitSecret(Secret secret) {}

  @override
  void visitAuth(Auth auth) {
    throw UnimplementedError();
  }

  @override
  void visitAuthProvider(AuthProvider provider) {
    throw UnimplementedError();
  }

  @override
  void visitExternalAuthProvider(ExternalAuthProvider provider) {
    throw UnimplementedError();
  }
}

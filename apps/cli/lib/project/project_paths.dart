import 'package:celest_cli/env/env_manager.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';

final class ProjectPaths {
  ProjectPaths(
    this.projectRoot, {
    String? outputsDir,
  }) : outputsDir =
            outputsDir ?? fileSystem.systemTempDirectory.createTempSync().path;

  final String projectRoot;
  final String outputsDir;

  late final String appRoot =
      p.canonicalize(p.normalize(p.join(projectRoot, '..')));
  String get celestConfig => celestProject.config.configDir.path;

  late final String packagesConfig =
      p.join(projectRoot, '.dart_tool', 'package_config.json');
  late final String pubspecYaml = p.join(projectRoot, 'pubspec.yaml');
  late final String analysisOptionsYaml =
      p.join(projectRoot, 'analysis_options.yaml');
  late final String projectDart = p.join(projectRoot, 'project.dart');
  late final String projectLib = p.join(projectRoot, 'lib');
  late final String localApiEntrypoint = p.join(outputsDir, 'api.local.dart');
  late final String clientOutputsDir =
      p.join(projectRoot, 'lib', 'src', 'client');

  late final String resourcesDart = p.join(projectRoot, 'resources.dart');
  late final String apisDir = p.join(projectRoot, 'functions');
  late final String configDir = p.join(projectRoot, 'config');
  late final String envFile = p.join(projectRoot, 'config', '.env');

  late final String modelsDir = p.join(projectRoot, 'lib', 'models');
  late final String modelsDart = p.join(projectRoot, 'lib', 'models.dart');
  late final String exceptionsDir = p.join(projectRoot, 'lib', 'exceptions');
  late final String exceptionsDart =
      p.join(projectRoot, 'lib', 'exceptions.dart');

  late final EnvManager envManager = EnvManager(envFile);

  late final String authDart = p.join(projectRoot, 'auth', 'auth.dart');

  String api(String apiName) => p.join(apisDir, '$apiName.dart');
  String apiOutput(String apiName) => p.join(outputsDir, 'functions', apiName);
  String functionEntrypoint(String apiName, String functionName) => p.join(
        apiOutput(apiName),
        '$functionName.dart',
      );

  Uri normalizeUri(Uri uri) {
    return switch (uri.scheme) {
      'file' || '' => _fileToProjectUri(uri),
      'dart' => normalizeDartUrl(uri),
      'package' => uri,
      _ => uri,
    };
  }

  Uri denormalizeUri(Uri uri) {
    return switch (uri.scheme) {
      'project' => _projectToFileUri(uri),
      _ => uri,
    };
  }

  Uri _fileToProjectUri(Uri uri) {
    // Store relative location in posix format for convenience and easier
    // cross-platform testing.
    final relativePath = p.relative(
      p.fromUri(uri),
      from: projectRoot,
    );
    return Uri(scheme: 'project', path: relativePath);
  }

  Uri _projectToFileUri(Uri uri) {
    return Uri.file(p.join(projectRoot, uri.path));
  }
}

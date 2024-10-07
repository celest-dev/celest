import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';

final class ProjectPaths {
  ProjectPaths(
    this.projectRoot, {
    this.parentAppRoot,
    String? clientDir,
    String? outputsDir,
  })  : clientRoot = clientDir ?? p.join(outputsDir ?? projectRoot, 'client'),
        outputsDir =
            outputsDir ?? fileSystem.systemTempDirectory.createTempSync().path;

  final String projectRoot;
  final String outputsDir;

  final String? parentAppRoot;
  String get celestConfig => celestProject.config.configDir.path;

  late final String packagesConfig =
      p.join(projectRoot, '.dart_tool', 'package_config.json');
  late final String pubspecYaml = p.join(projectRoot, 'pubspec.yaml');
  late final String analysisOptionsYaml =
      p.join(projectRoot, 'analysis_options.yaml');
  late final String projectDart = p.join(projectRoot, 'project.dart');
  late final String projectLib = p.join(projectRoot, 'lib');
  late final String localApiEntrypoint = p.join(outputsDir, 'api.local.dart');
  late final String legacyClientOutputsDir =
      p.join(projectRoot, 'lib', 'src', 'client');
  final String clientRoot;
  late final String clientOutputsDir = p.join(clientRoot, 'lib', 'src');
  late final String projectCacheDir =
      p.join(projectRoot, '.dart_tool', 'celest');

  // Generated
  late final String generatedDir =
      p.join(projectRoot, 'lib', 'src', 'generated');
  late final String resourcesDart = p.join(generatedDir, 'resources.dart');

  late final String apisDir = p.join(projectRoot, 'lib', 'src', 'functions');
  late final String legacyApisDir = p.join(projectRoot, 'functions');
  late final String configDir = p.join(projectRoot, 'config');

  String get envFile {
    final legacyEnvFile =
        fileSystem.file(p.join(projectRoot, 'config', '.env'));
    if (legacyEnvFile.existsSync()) {
      return legacyEnvFile.path;
    }
    return p.join(projectRoot, '.env');
  }

  String envFileFor(String environment) =>
      p.join(p.dirname(envFile), '.env.$environment');

  late final String modelsDir = p.join(projectRoot, 'lib', 'models');
  late final String modelsDart = p.join(projectRoot, 'lib', 'models.dart');
  late final String exceptionsDir = p.join(projectRoot, 'lib', 'exceptions');
  late final String exceptionsDart =
      p.join(projectRoot, 'lib', 'exceptions.dart');

  late final String authDart = p.join(projectRoot, 'auth.dart');
  late final String legacyAuthDart = p.join(projectRoot, 'auth', 'auth.dart');

  String api(String apiName) => p.join(legacyApisDir, '$apiName.dart');
  String apiOutput(String apiName) => p.join(outputsDir, 'functions', apiName);
  String functionEntrypoint(String apiName, String functionName) => p.join(
        apiOutput(apiName),
        '$functionName.dart',
      );

  Uri normalizeUri(Uri uri) {
    return switch (uri) {
      Uri(scheme: 'file' || '') => _fileToProjectUri(uri),
      Uri(scheme: 'dart') => normalizeDartUrl(uri),
      Uri(scheme: 'package') => uri,
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
    return Uri.file(p.join(projectRoot, 'lib', 'src', uri.path));
  }
}

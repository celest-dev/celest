import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/path.dart';

final class ProjectPaths {
  ProjectPaths(
    this.projectRoot, {
    this.parentAppRoot,
    String? clientDir,
    String? outputsDir,
  })  : clientRoot = clientDir ?? p.join(outputsDir ?? projectRoot, 'client'),
        outputsDir = outputsDir ??
            p.join(projectRoot, '.dart_tool', 'celest', 'outputs');

  final String projectRoot;
  final String outputsDir;

  final String? parentAppRoot;
  String get celestConfig => celestProject.config.configDir.path;

  late final String packageRoot = p.join(projectRoot, 'lib');
  late final String packagesConfig = p.join(
    projectRoot,
    '.dart_tool',
    'package_config.json',
  );
  late final String pubspecYaml = p.join(projectRoot, 'pubspec.yaml');
  late final String analysisOptionsYaml = p.join(
    projectRoot,
    'analysis_options.yaml',
  );
  late final String projectDart = p.join(
    projectRoot,
    'lib',
    'src',
    'project.dart',
  );
  late final String projectLib = p.join(projectRoot, 'lib');
  late final String localApiEntrypoint = p.join(outputsDir, 'api.local.dart');
  final String clientRoot;
  late final String clientPackageRoot = p.join(clientRoot, 'lib');
  late final String clientOutputsDir = p.join(clientRoot, 'lib', 'src');
  late final String projectCacheDir = p.join(
    projectRoot,
    '.dart_tool',
    'celest',
  );

  // Generated
  late final String generatedDir = p.join(
    projectRoot,
    'lib',
    'src',
    'generated',
  );
  late final String buildDir = p.join(projectRoot, 'build');

  late final String apisDir = p.join(projectRoot, 'lib', 'src', 'functions');
  late final String configDir = p.join(projectRoot, 'config');

  String get envFile => p.join(projectRoot, '.env');

  String envFileFor(String environment) =>
      p.join(p.dirname(envFile), '.env.$environment');

  late final String modelsDir = p.join(projectRoot, 'lib', 'models');
  late final String modelsDart = p.join(projectRoot, 'lib', 'models.dart');
  late final String exceptionsDir = p.join(projectRoot, 'lib', 'exceptions');
  late final String exceptionsDart = p.join(
    projectRoot,
    'lib',
    'exceptions.dart',
  );

  late final String authDart = p.join(projectRoot, 'auth.dart');

  String api(String apiName) => p.join(apisDir, '$apiName.dart');
  String apiOutput(String apiName) => p.join(outputsDir, 'functions', apiName);
  String functionEntrypoint(String apiName, String functionName) =>
      p.join(apiOutput(apiName), '$functionName.dart');

  Uri normalizeUri(Uri uri) {
    return switch (uri) {
      Uri(scheme: 'file' || '', :final path) => fileToPackageUri(path),
      Uri(scheme: 'dart') => normalizeDartUrl(uri),
      Uri(scheme: 'package') => uri,
      _ => uri,
    };
  }

  Uri denormalizeUri(Uri uri) {
    return switch (uri) {
      Uri(
        scheme: 'package',
        pathSegments: [final package, ...final pathSegments],
      )
          when package == 'celest_backend' ||
              package == celestProject.clientPackageName =>
        packageToFileUri(package, pathSegments),
      _ => uri,
    };
  }

  Uri fileToPackageUri(String path) {
    if (!p.isRelative(path)) {
      path = p.absolute(path);
    }
    if (p.isWithin(packageRoot, path)) {
      path = p.relative(path, from: packageRoot).to(p.url);
      return Uri(
        scheme: 'package',
        pathSegments: ['celest_backend', ...p.url.split(path)],
      );
    }
    if (p.isWithin(clientPackageRoot, path)) {
      path = p.relative(path, from: clientPackageRoot).to(p.url);
      return Uri(
        scheme: 'package',
        pathSegments: [celestProject.clientPackageName, ...p.url.split(path)],
      );
    }
    return p.toUri(path);
  }

  Uri packageToFileUri(String package, List<String> pathSegments) {
    if (package == 'celest_backend') {
      return Uri.file(p.joinAll([packageRoot, ...pathSegments]));
    }
    if (package == celestProject.clientPackageName) {
      return Uri.file(p.joinAll([clientPackageRoot, ...pathSegments]));
    }
    throw ArgumentError('Cannot denormalize package $package');
  }
}

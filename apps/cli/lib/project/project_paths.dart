import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';

final class ProjectPaths {
  ProjectPaths(
    this.projectRoot, {
    String? outputsDir,
  }) : outputsDir = outputsDir ?? p.join(projectRoot, '.dart_tool', 'celest');

  final String projectRoot;
  final String outputsDir;

  late final String appRoot =
      p.canonicalize(p.normalize(p.join(projectRoot, '..')));
  late final String celestConfig = CelestConfig.instance.configDir.path;

  late final String projectYaml = p.join(projectRoot, 'pubspec.yaml');
  late final String analysisOptionsYaml =
      p.join(projectRoot, 'analysis_options.yaml');
  late final String projectDart = p.join(projectRoot, 'project.dart');
  late final String projectBuildDart = p.join(outputsDir, 'project.build.dart');
  late final String localApiEntrypoint = p.join(outputsDir, 'api.local.dart');

  late final String resourcesDart = p.join(projectRoot, 'resources.dart');
  late final String apisDir = p.join(projectRoot, 'apis');
  late final String configDir = p.join(projectRoot, 'config');

  String apiOutput(String apiName) => p.join(outputsDir, 'apis', apiName);
  String functionEntrypoint(String apiName, String functionName) => p.join(
        apiOutput(apiName),
        '$functionName.dart',
      );

  Uri normalizeUri(Uri uri) {
    return switch (uri.scheme) {
      'file' || '' => _fileToAssetUri(uri),
      'dart' => normalizeDartUrl(uri),
      'package' => uri,
      _ => uri,
    };
  }

  Uri _fileToAssetUri(Uri uri) {
    // Store relative location in posix format for convenience and easier
    // cross-platform testing.
    final relativePath = p.relative(
      p.fromUri(uri),
      from: projectRoot,
    );
    return Uri(scheme: 'project', path: relativePath);
  }
}

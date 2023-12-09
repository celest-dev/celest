import 'package:celest_cli/src/context.dart';

final class ProjectPaths {
  ProjectPaths(
    this.projectRoot, {
    String? outputsDir,
  }) : outputsDir = outputsDir ?? p.join(projectRoot, '.dart_tool', 'celest');

  final String projectRoot;
  final String outputsDir;

  late final String appRoot =
      p.canonicalize(p.normalize(p.join(projectRoot, '..')));

  late final String projectYaml = p.join(projectRoot, 'pubspec.yaml');
  late final String projectDart = p.join(projectRoot, 'project.dart');
  late final String projectBuildDart = p.join(outputsDir, 'project.build.dart');

  late final String resourcesDart = p.join(projectRoot, 'resources.dart');
  late final String apisDir = p.join(projectRoot, 'apis');
  late final String configDir = p.join(projectRoot, 'config');

  ProjectEnvPaths environment(String environmentName) =>
      ProjectEnvPaths(this, environmentName);
}

final class ProjectEnvPaths {
  ProjectEnvPaths(this._projectPaths, this._environmentName);

  final ProjectPaths _projectPaths;
  final String _environmentName;

  late final String outputsDir = p.join(
    _projectPaths.outputsDir,
    'environments',
    _environmentName,
  );

  String apiOutput(String apiName) => p.join(outputsDir, 'apis', apiName);
  String functionEntrypoint(String apiName, String functionName) => p.join(
        apiOutput(apiName),
        '$functionName.dart',
      );
}

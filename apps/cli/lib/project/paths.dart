import 'package:path/path.dart' as p;

final class ProjectPaths {
  ProjectPaths(
    this._celestDir, {
    String? outputsDir,
  }) : outputsDir = outputsDir ?? p.join(_celestDir, '.dart_tool', 'celest');

  final String _celestDir;

  String absolute(String relativePath) => p.join(projectRoot, relativePath);
  String relativeToRoot(String path) =>
      p.relative(p.absolute(path), from: projectRoot);

  late final String appRoot =
      p.canonicalize(p.normalize(p.join(_celestDir, '..')));
  late final String projectRoot = _celestDir;
  late final String outputsDir;

  late final String projectYaml = p.join(projectRoot, 'pubspec.yaml');
  late final String projectDart = p.join(projectRoot, 'project.dart');
  late final String projectBuildDart = p.join(outputsDir, 'project.build.dart');

  late final String resourcesDart = p.join(projectRoot, 'resources.dart');

  late final String apisDir = p.join(projectRoot, 'apis');
  String apiOutput(String apiName) => p.join(outputsDir, 'apis', apiName);
  String functionEntrypoint(String apiName, String functionName) => p.join(
        outputsDir,
        'apis',
        apiName,
        '$functionName.dart',
      );
}

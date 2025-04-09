import 'package:celest_cli/src/openapi/ast/openapi_ast.dart';
import 'package:celest_cli/src/openapi/loader/openapi_v3_loader.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

final _versionPattern = RegExp(r'^(\d)\.(\d)(?:\.(\d))?$');

final class OpenApiDocumentLoader {
  OpenApiDocumentLoader();

  OpenApiDocument load({
    required String jsonOrYaml,
    required Uri sourceUri,
  }) {
    return loadOpenApiDocument(
      jsonOrYaml,
      sourceUri: sourceUri,
    );
  }
}

OpenApiDocument loadOpenApiDocument(
  String jsonOrYaml, {
  required Uri sourceUri,
}) {
  final document = loadYamlDocument(jsonOrYaml, sourceUrl: sourceUri);
  final root = document.contents as YamlMap;

  final version = (root.nodes['swagger'] ?? root.nodes['openapi'])?.value;
  if (version == null || version is! String) {
    throw Exception('Could not detect OpenAPI version');
  }

  final semverMatch = _versionPattern.firstMatch(version);
  final majorVersion = switch (semverMatch?.group(1)) {
    final match? => int.tryParse(match),
    null => null,
  };
  final minorVersion = switch (semverMatch?.group(2)) {
    final match? => int.tryParse(match),
    null => 0,
  };
  final patchVersion = switch (semverMatch?.group(3)) {
    final match? => int.tryParse(match),
    null => 0,
  };
  if (majorVersion == null || minorVersion == null || patchVersion == null) {
    throw Exception('Invalid OpenAPI version string: $version');
  }
  final semver = Version(
    majorVersion,
    minorVersion,
    patchVersion,
  );
  return switch (majorVersion) {
    3 => OpenApiV3Loader(version: semver, rootNode: root).load(),
    2 => throw Exception('OpenAPI 2.0 is not supported'),
    _ => throw Exception('Unknown OpenAPI version: $version'),
  };
}

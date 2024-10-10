import 'package:pub_semver/pub_semver.dart';
import 'package:pub_semver/src/version_range.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

extension DependencyToYaml on Dependency {
  YamlNode toYaml() => switch (this) {
        HostedDependency(:final version, :final hosted?) => _map({
            'version': version.toYaml(),
            'hosted': YamlMap.wrap({
              'name': hosted.name,
              if (hosted.url case final url?) 'url': url.toString(),
            }),
          }),
        HostedDependency(:final version) => version.toYaml(),
        PathDependency(:final path) => _map({
            'path': YamlScalar.wrap(
              path,
              style: path.contains(' ')
                  ? ScalarStyle.SINGLE_QUOTED
                  : ScalarStyle.PLAIN,
            ),
          }),
        SdkDependency(:final sdk) => _map({'sdk': sdk}),
        GitDependency(:final url, :final ref, :final path) => _map({
            'git': _map({
              'url': url.toString(),
              if (ref != null) 'ref': ref,
              if (path != null) 'path': path,
            }),
          }),
        _ => throw StateError('Invalid dependency: $this'),
      };

  YamlMap _map(Map<Object /* String | YamlNode */, Object> nodes) {
    return wrapAsYamlNode(
      nodes.map(
        (key, value) => MapEntry(
          key is YamlNode ? key : YamlScalar.wrap(key),
          switch (value) {
            YamlScalar(value: List() || Map()) => value.value,
            YamlScalar(value: YamlScalar()) => value.value,
            _ => value,
          },
        ),
      ),
      collectionStyle: CollectionStyle.BLOCK,
    ) as YamlMap;
  }
}

extension VersionConstraintToYaml on VersionConstraint {
  YamlScalar toYaml() => YamlScalar.wrap(
        toString(),
        style: switch (this) {
          CompatibleWithVersionRange() => ScalarStyle.PLAIN,
          VersionRange() => ScalarStyle.SINGLE_QUOTED,
          _ => ScalarStyle.PLAIN,
        },
      );
}

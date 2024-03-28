import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml/yaml.dart';

extension DependencyToYaml on Dependency {
  YamlNode toYaml() => switch (this) {
        HostedDependency(:final version, :final hosted?) => YamlMap.wrap({
            'version': version.toString(),
            'hosted': YamlMap.wrap({
              'name': hosted.name,
              if (hosted.url case final url?) 'url': url.toString(),
            }),
          }),
        HostedDependency(:final version) => YamlScalar.wrap(version.toString()),
        PathDependency(:final path) => YamlMap.wrap({'path': path}),
        SdkDependency(:final sdk) => YamlMap.wrap({'sdk': sdk}),
        GitDependency(:final url, :final ref, :final path) => YamlMap.wrap({
            'git': {
              'url': url.toString(),
              if (ref != null) 'ref': ref,
              if (path != null) 'path': path,
            },
          }),
        _ => throw StateError('Invalid dependency: $this'),
      };
}

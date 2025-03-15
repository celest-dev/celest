import 'package:celest_cli/src/pub/pub_dependency.dart';
import 'package:collection/collection.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

enum DependencyType {
  dependency('dependencies'),
  dependencyOverride('dependency_overrides'),
  devDependency('dev_dependencies');

  const DependencyType(this.key);

  final String key;
}

extension PubspecCopyWith on Pubspec {
  Pubspec copyWith({
    String? name,
    Version? version,
    String? description,
    String? publishTo,
    Uri? repository,
    Uri? issueTracker,
    Map<String, VersionConstraint>? environment,
    Map<String, Dependency>? dependencies,
    Map<String, Dependency>? devDependencies,
    Map<String, Dependency>? dependencyOverrides,
    Map<String, Dependency>? flutter,
  }) {
    return Pubspec(
      name ?? this.name,
      version: version ?? this.version,
      description: description ?? this.description,
      repository: repository ?? this.repository,
      issueTracker: issueTracker ?? this.issueTracker,
      publishTo: publishTo ?? this.publishTo,
      environment: environment ?? this.environment,
      dependencies: dependencies ?? this.dependencies,
      devDependencies: devDependencies ?? this.devDependencies,
      dependencyOverrides: dependencyOverrides ?? this.dependencyOverrides,
      flutter: flutter ?? this.flutter,
    );
  }

  Pubspec addDeps({
    Map<String, Dependency>? dependencies,
    Map<String, Dependency>? devDependencies,
    Map<String, Dependency>? dependencyOverrides,
  }) {
    return copyWith(
      dependencies: {...this.dependencies, ...?dependencies},
      devDependencies: {...this.devDependencies, ...?devDependencies},
      dependencyOverrides: {
        ...this.dependencyOverrides,
        ...?dependencyOverrides,
      },
    );
  }
}

extension PubspecToYaml on Pubspec {
  String toYaml({String? source}) {
    final pubspecYaml = StringBuffer('''
name: $name
''');
    if (description != null) {
      pubspecYaml.writeln('description: $description');
    }
    if (publishTo != null) {
      pubspecYaml.writeln('publish_to: $publishTo');
    }
    final yaml = StringBuffer('''
$pubspecYaml
environment:
  sdk:

dependencies:
''');
    if (devDependencies.isNotEmpty) {
      yaml.writeln();
      yaml.writeln('dev_dependencies:');
    }
    if (dependencyOverrides.isNotEmpty) {
      yaml
        ..writeln()
        ..writeln('dependency_overrides:');
    }
    final editor = YamlEditor(source ?? yaml.toString());
    for (final key in environment.keys.sorted()) {
      editor.update(['environment', key], environment[key]!.toYaml());
    }

    void addConstraints(
      Map<String, Dependency> constraints,
      DependencyType type,
    ) {
      final dependencyMap = <String, YamlNode>{};
      for (final dependency in constraints.keys.sorted()) {
        var hasDependency = true;
        final currentValue =
            editor
                .parseAt(
                  [type.key, dependency],
                  orElse: () {
                    hasDependency = false;
                    return YamlScalar.wrap(null);
                  },
                )
                .value;

        // Fixes an issue where if a dependency was specified with a null
        // constraint, e.g. `test:` instead of `test: ^1.0.0`, the edit
        // operation will produce invalid YAML.
        if (hasDependency && currentValue == null) {
          editor.remove([type.key, dependency]);
        }
        dependencyMap[dependency] = constraints[dependency]!.toYaml();
      }

      editor.update([
        type.key,
      ], wrapAsYamlNode(dependencyMap, collectionStyle: CollectionStyle.BLOCK));
    }

    addConstraints(dependencies, DependencyType.dependency);
    addConstraints(devDependencies, DependencyType.devDependency);
    if (dependencyOverrides.isNotEmpty) {
      addConstraints(dependencyOverrides, DependencyType.dependencyOverride);
    }

    return editor.toString();
  }
}

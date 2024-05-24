import 'package:celest_cli/pub/pub_dependency.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
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
  celest:

dev_dependencies:
  test:
''');
    if (dependencyOverrides.isNotEmpty) {
      yaml
        ..writeln()
        ..writeln('dependency_overrides: {}');
    }
    final editor = YamlEditor(source ?? yaml.toString());
    if (environment case final environment?) {
      environment.forEach((key, constraint) {
        editor.update(
          ['environment', key],
          constraint == null ? '' : constraint.toString(),
        );
      });
    }

    void addConstraints(
      Map<String, Dependency> constraints,
      DependencyType type,
    ) {
      for (final MapEntry(key: dep, value: constraint) in constraints.entries) {
        final path = <String>[type.key, dep];
        editor.update(path, constraint.toYaml());
      }
    }

    addConstraints(dependencies, DependencyType.dependency);
    addConstraints(devDependencies, DependencyType.devDependency);
    addConstraints(dependencyOverrides, DependencyType.dependencyOverride);

    return editor.toString();
  }
}

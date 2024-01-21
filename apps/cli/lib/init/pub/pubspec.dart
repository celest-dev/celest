import 'package:celest_cli/init/pub/pub_dependency.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml_edit/yaml_edit.dart';

enum DependencyType {
  dependency('dependencies'),
  dependencyOverride('dependency_overrides'),
  devDependency('dev_dependencies');

  const DependencyType(this.key);

  final String key;
}

extension PubspecToYaml on Pubspec {
  String toYaml() {
    final pubspecYaml = StringBuffer('''
name: $name
''');
    if (description != null) {
      pubspecYaml.writeln('description: $description');
    }
    if (publishTo != null) {
      pubspecYaml.writeln('publish_to: $publishTo');
    }
    final editor = YamlEditor('''
$pubspecYaml
environment:
  sdk:

dependencies:
  celest:

dev_dependencies:
  test:
''');
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

    return editor.toString();
  }
}

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_migration.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

final class AddAnalyzerPlugin extends ProjectMigration {
  AddAnalyzerPlugin(super.projectRoot, this.appRoot);

  final String appRoot;
  late final parentAnalysisOptionsFile = fileSystem
      .directory(appRoot)
      .childFile('analysis_options.yaml');

  @override
  bool get needsMigration {
    if (!parentAnalysisOptionsFile.existsSync()) {
      return true;
    }
    return !parentAnalysisOptionsFile.readAsStringSync().contains('- celest');
  }

  @override
  String get name => 'core.project.add_analyzer_plugin';

  @override
  Future<ProjectMigrationResult> create() async {
    if (parentAnalysisOptionsFile.existsSync()) {
      final editor = YamlEditor(await parentAnalysisOptionsFile.readAsString());

      var hasAnalyzer = true;
      final analyzer =
          editor.parseAt(
                ['analyzer'],
                orElse: () {
                  hasAnalyzer = false;
                  return YamlMap();
                },
              )
              as YamlMap;
      final existingPlugins = analyzer.containsKey('plugins')
          ? analyzer.nodes['plugins'] as YamlList
          : null;
      final hasPlugins = existingPlugins != null;
      if ((existingPlugins ?? []).contains('celest')) {
        return const ProjectMigrationSuccess();
      }
      if (!hasAnalyzer) {
        // Probably just an `include` line. Don't use editor because it will
        // put the `analyzer` block before `include` which looks dumb.
        await parentAnalysisOptionsFile.writeAsString('''
${editor.toString().trim()}

analyzer:
  plugins:
    - celest
''');
        return const ProjectMigrationSuccess();
      }
      if (!hasPlugins) {
        editor.update(['analyzer', 'plugins'], ['celest']);
        await parentAnalysisOptionsFile.writeAsString(editor.toString());
      } else {
        // Don't update a list that's already present since only one plugin
        // can be added at a time.
        return const ProjectMigrationSuccess();
      }
    } else {
      await parentAnalysisOptionsFile.writeAsString('''
analyzer:
  plugins:
    - celest
''');
    }

    return const ProjectMigrationSuccess();
  }
}

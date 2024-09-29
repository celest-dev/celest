import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/src/context.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

final class AddAnalyzerPlugin extends ProjectMigration {
  AddAnalyzerPlugin(this.parentProject);

  final ParentProject parentProject;

  @override
  Future<bool> create(String projectRoot) async {
    final parentAnalysisOptionsFile = fileSystem
        .directory(parentProject.path)
        .childFile('analysis_options.yaml');
    if (parentAnalysisOptionsFile.existsSync()) {
      final editor = YamlEditor(await parentAnalysisOptionsFile.readAsString());

      var hasAnalyzer = true;
      final analyzer = editor.parseAt(
        ['analyzer'],
        orElse: () {
          hasAnalyzer = false;
          return YamlMap();
        },
      ) as YamlMap;
      final existingPlugins = analyzer.containsKey('plugins')
          ? analyzer.nodes['plugins'] as YamlList
          : null;
      final hasPlugins = existingPlugins != null;
      if ((existingPlugins ?? []).contains('celest')) {
        return false;
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
        return false;
      }
      if (!hasPlugins) {
        editor.update(['analyzer', 'plugins'], ['celest']);
        await parentAnalysisOptionsFile.writeAsString(editor.toString());
      } else {
        // Don't update a list that's already present since only one plugin
        // can be added at a time.
        return false;
      }
    } else {
      await parentAnalysisOptionsFile.writeAsString('''
analyzer:
  plugins:
    - celest
''');
    }

    return false;
  }
}

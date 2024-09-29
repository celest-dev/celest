import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:logging/logging.dart';
import 'package:yaml/yaml.dart';

final class AnalysisOptions {
  const AnalysisOptions._({
    this.enabledExperiments = const [],
  });

  final List<String> enabledExperiments;

  static const _empty = AnalysisOptions._();
  static final _logger = Logger('AnalysisOptions');

  static Future<AnalysisOptions> load(String path) async {
    path = p.isAbsolute(path)
        ? path
        : p.canonicalize(
            p.join(projectPaths.projectRoot, path),
          );
    final analysisOptionsFile = fileSystem.file(path);
    if (!await analysisOptionsFile.exists()) {
      _logger.finest('No analysis options file detected at $path');
      return _empty;
    }
    final analysisOptionsContent = await analysisOptionsFile.readAsString();
    final analysisOptions = loadYamlDocument(analysisOptionsContent);
    final analysisOptionsMap = analysisOptions.contents;
    if (analysisOptionsMap is! YamlMap) {
      _logger.finer('Invalid analysis options file: $analysisOptionsContent');
      return _empty;
    }
    final analyzerOptions = analysisOptionsMap.value['analyzer'];
    if (analyzerOptions is! YamlMap) {
      _logger.finer('No analyzer settings found');
      return _empty;
    }
    final enabledExperiments = analyzerOptions.value['enable-experiment'];
    if (enabledExperiments is! YamlList) {
      _logger.finer('No enabled experiments found');
      return _empty;
    }
    return AnalysisOptions._(
      enabledExperiments: enabledExperiments.value.cast<String>(),
    );
  }

  @override
  String toString() => prettyPrintJson({
        'enabledExperiments': enabledExperiments,
      });
}

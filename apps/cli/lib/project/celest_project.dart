import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:celest_cli/analyzer/analysis_options.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

/// Static information about the current Celest project.
final class CelestProject {
  CelestProject._({
    required this.projectPaths,
    required AnalysisOptions analysisOptions,
    required this.config,
  }) : _analysisOptions = analysisOptions;

  static final _logger = Logger('CelestProject');

  static Future<CelestProject> init({
    required String projectRoot,
    String? outputsDir,
  }) async {
    _logger.finest('Loading celest project at root: "$projectRoot"...');
    final projectPaths = ProjectPaths(
      projectRoot,
      outputsDir: outputsDir,
    );
    final [
      config as CelestConfig,
      analysisOptions as AnalysisOptions,
    ] = await Future.wait([
      CelestConfig.load(),
      AnalysisOptions.load(projectPaths.analysisOptionsYaml),
    ]);
    _logger
      ..finest('Loaded analysis options: $analysisOptions')
      ..finest('Loaded Celest config: $config');
    final project = CelestProject._(
      projectPaths: projectPaths,
      analysisOptions: analysisOptions,
      config: config,
    );
    return project;
  }

  String get packageName => 'celest_backend';

  final ProjectPaths projectPaths;
  AnalysisOptions _analysisOptions;
  AnalysisOptions get analysisOptions => _analysisOptions;

  late final _analysisContextCollection = AnalysisContextCollectionImpl(
    includedPaths: [projectPaths.projectRoot],
    sdkPath: Sdk.current.sdkPath,
    // Needed for collecting subtypes.
    enableIndex: true,
  );

  /// The [AnalysisContext] for the current project.
  late final AnalysisContext analysisContext =
      _analysisContextCollection.contexts.first;

  /// The [CelestConfig] for the current project.
  final CelestConfig config;

  /// The [CelestDatabase] for the current project.
  late final database = CelestDatabase(config);

  Pubspec get pubspec => Pubspec.parse(
        fileSystem.file(projectPaths.projectYaml).readAsStringSync(),
        sourceUrl: Uri.file(projectPaths.projectYaml),
      );

  Future<Set<String>> invalidate(Iterable<String> files) async {
    for (final file in files) {
      analysisContext.changeFile(file);
      if (p.basename(file) == 'analysis_options.yaml') {
        _analysisOptions = await AnalysisOptions.load(file);
      }
    }
    final changedFiles = await analysisContext.applyPendingFileChanges();
    return changedFiles.toSet();
  }

  Future<void> close() async {
    await Future.wait([
      _analysisContextCollection.dispose(forTesting: true),
      database.close(),
    ]);
    _logger.finest('Closed Celest project');
  }
}

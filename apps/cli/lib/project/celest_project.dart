import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:celest_cli/analyzer/analysis_options.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/src/context.dart';

/// Static information about the current Celest project.
final class CelestProject {
  CelestProject._({
    required this.projectPaths,
    required AnalysisOptions analysisOptions,
    required this.config,
  }) : _analysisOptions = analysisOptions;

  static Future<CelestProject> init({
    required String projectRoot,
    String? outputsDir,
    String? clientOutputsDir,
  }) async {
    final projectPaths = ProjectPaths(
      projectRoot,
      outputsDir: outputsDir,
      clientOutputsDir: clientOutputsDir,
    );
    final (config, analysisOptions) = await (
      CelestConfig.load(),
      AnalysisOptions.load(projectPaths.analysisOptionsYaml),
    ).wait;
    final project = CelestProject._(
      projectPaths: projectPaths,
      analysisOptions: analysisOptions,
      config: config,
    );
    return project;
  }

  final ProjectPaths projectPaths;
  AnalysisOptions _analysisOptions;
  AnalysisOptions get analysisOptions => _analysisOptions;

  /// The [AnalysisContext] for the current project.
  late final AnalysisContext analysisContext = AnalysisContextCollectionImpl(
    includedPaths: [projectPaths.projectRoot],
    sdkPath: Sdk.current.sdkPath,
    // Needed for collecting subtypes.
    enableIndex: true,
  ).contexts.first;

  /// The [CelestConfig] for the current project.
  final CelestConfig config;

  /// The [CelestDatabase] for the current project.
  late final database = CelestDatabase(config);

  Future<Set<String>> invalidate(Set<String> files) async {
    for (final file in files) {
      analysisContext.changeFile(file);
      if (p.basename(file) == 'analysis_options.yaml') {
        _analysisOptions = await AnalysisOptions.load(file);
      }
    }
    final changedFiles = await analysisContext.applyPendingFileChanges();
    return changedFiles.toSet();
  }
}

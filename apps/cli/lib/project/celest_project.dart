import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:celest/src/runtime/serve.dart';
import 'package:celest_cli/analyzer/analysis_options.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_core/src/storage/storage.dart';
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
  late final DriverBasedAnalysisContext analysisContext =
      _analysisContextCollection.contexts.single;

  /// The [CelestConfig] for the current project.
  final CelestConfig config;

  /// The [CelestDatabase] for the current project.
  late final database = CelestDatabase(config);

  Pubspec get pubspec => Pubspec.parse(
        fileSystem.file(projectPaths.pubspecYaml).readAsStringSync(),
        sourceUrl: Uri.file(projectPaths.pubspecYaml),
      );

  Future<Set<String>> invalidate(Iterable<String> files) async {
    for (final file in files) {
      if (p.basename(file) == 'analysis_options.yaml') {
        _analysisOptions = await AnalysisOptions.load(file);
      }
      if (p.extension(file) == '.dart') {
        // Change the file in the analysis context.
        analysisContext.changeFile(file);
      }
    }
    final changedFiles = await analysisContext.applyPendingFileChanges();
    _logger.finest(
      'Changed files: ${changedFiles.join(Platform.lineTerminator)}',
    );
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

typedef CelestProjectUris = ({
  Uri localUri,
  Uri? productionUri,
});

extension CelestProjectUriStorage on Storage {
  Uri? getUri(String key) => switch (read(key)) {
        final uri? => Uri.parse(uri),
        _ => null,
      };

  Uri? getProductionUri(String projectName) =>
      getUri('$projectName.productionUri');
  Uri setProductionUri(String projectName, Uri uri) {
    write('$projectName.productionUri', uri.toString());
    return uri;
  }

  Uri getLocalUri(String projectName) {
    final uri = getUri('$projectName.localUri');
    return uri ?? Uri.parse('http://localhost:$defaultCelestPort');
  }

  Uri setLocalUri(String projectName, Uri uri) {
    write('$projectName.localUri', uri.toString());
    return uri;
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:celest/src/runtime/serve.dart';
import 'package:celest_cli/analyzer/analysis_options.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/env/env_manager.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_core/_internal.dart';
import 'package:hub/context.dart' show HubMetadata;
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

enum ParentProjectType { dart, flutter }

final class ParentProject {
  const ParentProject({
    required this.name,
    required this.path,
    required this.pubspec,
    required this.pubspecYaml,
    required this.type,
  });

  static Future<ParentProject?> load(String path) async {
    return Isolate.run(() async {
      final dir = fileSystem.directory(path);
      final pubspecFile = dir.childFile('pubspec.yaml');
      if (!pubspecFile.existsSync()) {
        return null;
      }
      final pubspecYaml = await pubspecFile.readAsString();
      final pubspec = Pubspec.parse(pubspecYaml, sourceUrl: pubspecFile.uri);
      return ParentProject(
        name: pubspec.name,
        path: path,
        pubspec: pubspec,
        pubspecYaml: pubspecYaml,
        type: switch (pubspec.dependencies.containsKey('flutter')) {
          true => ParentProjectType.flutter,
          false => ParentProjectType.dart,
        },
      );
    });
  }

  final String name;
  final String path;
  final Pubspec pubspec;
  final String pubspecYaml;
  final ParentProjectType type;
}

/// Static information about the current Celest project.
final class CelestProject {
  CelestProject._({
    required this.projectPaths,
    required AnalysisOptions analysisOptions,
    required this.config,
    required this.envManager,
    required this.parentProject,
  }) : _analysisOptions = analysisOptions;

  static final _logger = Logger('CelestProject');

  static Future<CelestProject> init({
    required String projectRoot,
    ParentProject? parentProject,
    String? configHome,
    String? outputsDir,
  }) async {
    _logger.finest('Loading celest project at root: "$projectRoot"...');
    final projectPaths = ProjectPaths(
      projectRoot,
      parentAppRoot: parentProject?.path,
      outputsDir: outputsDir,
    );
    final [
      config as CelestConfig,
      analysisOptions as AnalysisOptions,
    ] = await Future.wait([
      CelestConfig.load(
        configHome: configHome?.let(fileSystem.directory),
      ),
      AnalysisOptions.load(projectPaths.analysisOptionsYaml),
    ]);
    _logger
      ..finest('Loaded analysis options: $analysisOptions')
      ..finest('Loaded Celest config: $config');
    final envManager = EnvManager(projectPaths.envFile);
    await envManager.spawn();
    envManager.envVars.ignore();
    _logger.finest('Spawned env manager');
    final project = CelestProject._(
      projectPaths: projectPaths,
      analysisOptions: analysisOptions,
      config: config,
      envManager: envManager,
      parentProject: parentProject,
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

  final EnvManager envManager;
  final ParentProject? parentProject;

  /// The [AnalysisContext] for the current project.
  late final DriverBasedAnalysisContext analysisContext =
      _analysisContextCollection.contextFor(
    p.join(projectPaths.projectRoot, 'project.dart'),
  );

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

extension CelestProjectUriStorage on IsolatedNativeStorage {
  Future<Uri?> getUri(String key) async => switch (await read(key)) {
        final uri? => Uri.parse(uri),
        _ => null,
      };

  Future<Uri?> getProductionUri(String projectName) =>
      getUri('$projectName.productionUri');
  Future<Uri> setProductionUri(String projectName, Uri uri) async {
    await write('$projectName.productionUri', uri.toString());
    return uri;
  }

  Future<Uri> getLocalUri(String projectName) async {
    final uri = await getUri('$projectName.localUri');
    return uri ?? Uri.parse('http://localhost:$defaultCelestPort');
  }

  Future<Uri> setLocalUri(String projectName, Uri uri) async {
    await write('$projectName.localUri', uri.toString());
    return uri;
  }

  Future<HubMetadata?> getMetadata(String projectName) async {
    final (keyId, key) = await (
      read('$projectName.keyId'),
      read('$projectName.key'),
    ).wait;
    if (keyId != null && key != null) {
      return HubMetadata(
        keyId: base64Decode(keyId),
        key: base64Decode(key),
      );
    }
    return null;
  }

  Future<HubMetadata> setMetadata(
    String projectName,
    HubMetadata metadata,
  ) async {
    await (
      write('$projectName.keyId', base64Encode(metadata.keyId)),
      write('$projectName.key', base64Encode(metadata.key!)),
    ).wait;
    return metadata;
  }
}

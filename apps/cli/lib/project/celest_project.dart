import 'dart:io';
import 'dart:isolate';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/src/dart/analysis/byte_store.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:celest/src/runtime/serve.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/analyzer/analysis_options.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/database/cache/cache_database.dart';
import 'package:celest_cli/database/project/project_database.dart';
import 'package:celest_cli/env/env_manager.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/pub/cached_pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:native_storage/native_storage.dart';
import 'package:package_config/package_config.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final class ParentProject {
  const ParentProject({
    required this.name,
    required this.path,
    required this.pubspec,
    required this.pubspecYaml,
    required this.type,
  });

  static Future<ParentProject?> load(String path) async {
    return Isolate.run(() => loadSync(path));
  }

  static ParentProject? loadSync(String path) {
    final dir = fileSystem.directory(path);
    final pubspecFile = dir.childFile('pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      return null;
    }
    final pubspecYaml = pubspecFile.readAsStringSync();
    final pubspec = Pubspec.parse(pubspecYaml, sourceUrl: pubspecFile.uri);
    return ParentProject(
      name: pubspec.name,
      path: path,
      pubspec: pubspec,
      pubspecYaml: pubspecYaml,
      type: switch (pubspec.dependencies.containsKey('flutter')) {
        true => ast.SdkType.flutter,
        false => ast.SdkType.dart,
      },
    );
  }

  final String name;
  final String path;
  final Pubspec pubspec;
  final String pubspecYaml;
  final ast.SdkType type;
}

/// Static information about the current Celest project.
final class CelestProject {
  CelestProject._({
    required this.projectPaths,
    required AnalysisOptions analysisOptions,
    required this.config,
    required this.parentProject,
    required this.cacheDb,
    required ByteStore byteStore,
    ProjectDatabase? projectDb,
  }) : _analysisOptions = analysisOptions,
       _byteStore = byteStore,
       _projectDb = projectDb;

  static final _logger = Logger('CelestProject');

  static Future<CelestProject> init({
    required String projectRoot,
    ParentProject? parentProject,
    String? configHome,
    String? clientDir,
    String? outputsDir,
    @visibleForTesting CacheDatabase? cacheDb,
    @visibleForTesting ByteStore? byteStore,
    @visibleForTesting ProjectDatabase? projectDb,
  }) async {
    _logger.finest('Loading celest project at root: "$projectRoot"...');
    final projectPaths = ProjectPaths(
      projectRoot,
      parentAppRoot: parentProject?.path,
      clientDir: clientDir,
      outputsDir: outputsDir,
    );
    final [
      config as CelestConfig,
      analysisOptions as AnalysisOptions,
    ] = await Future.wait([
      CelestConfig.load(configHome: configHome?.let(fileSystem.directory)),
      AnalysisOptions.load(projectPaths.analysisOptionsYaml),
    ]);
    _logger
      ..finest('Loaded analysis options: $analysisOptions')
      ..finest('Loaded Celest config: $config');
    _logger.finest('Spawned env manager');
    cacheDb ??= await CacheDatabase.open(projectRoot, verbose: verbose);
    byteStore ??= MemoryCachingByteStore(
      cacheDb.byteStore,
      1 << 30, // 1 GB
    );
    final project = CelestProject._(
      projectPaths: projectPaths,
      analysisOptions: analysisOptions,
      config: config,
      parentProject: parentProject,
      cacheDb: cacheDb,
      byteStore: byteStore,
    );
    return project;
  }

  String get packageName => 'celest_backend';

  final ProjectPaths projectPaths;
  AnalysisOptions _analysisOptions;
  AnalysisOptions get analysisOptions => _analysisOptions;

  final ByteStore _byteStore;
  late final _analysisContextCollection = AnalysisContextCollectionImpl(
    includedPaths: [projectPaths.projectRoot],
    sdkPath: Sdk.current.sdkPath,
    // Needed for collecting subtypes.
    enableIndex: true,
    byteStore: _byteStore,
  );

  Future<ast.SdkType> determineProjectType() async {
    final packageConfigFile = fileSystem.file(projectPaths.packagesConfig);
    if (packageConfigFile.existsSync()) {
      final packageConfig = await loadPackageConfig(packageConfigFile);
      for (final package in packageConfig.packages) {
        if (package.name == 'flutter' || package.name == 'sky_engine') {
          return ast.SdkType.flutter;
        }
      }
      return ast.SdkType.dart;
    }
    final pubspec = Pubspec.parse(
      await fileSystem.file(projectPaths.pubspecYaml).readAsString(),
      sourceUrl: p.toUri(projectPaths.pubspecYaml),
    );
    return switch (pubspec.dependencies.containsKey('flutter')) {
      true => ast.SdkType.flutter,
      false => ast.SdkType.dart,
    };
  }

  final EnvManager envManager = EnvManager();
  final ParentProject? parentProject;

  /// The [AnalysisContext] for the current project.
  late final DriverBasedAnalysisContext analysisContext =
      _analysisContextCollection.contextFor(
        p.join(projectPaths.projectRoot, 'project.dart'),
      );

  /// The [CelestConfig] for the current project.
  final CelestConfig config;

  /// The [CacheDatabase] for the current project.
  final CacheDatabase cacheDb;

  /// The [ProjectDatabase] for the current project.
  ProjectDatabase get projectDb =>
      _projectDb ??= ProjectDatabase(
        projectRoot: projectPaths.projectRoot,
        verbose: verbose,
      );
  ProjectDatabase? _projectDb;

  late final _cachedPubspec = CachedPubspec(
    fileSystem.file(projectPaths.pubspecYaml),
  );
  Pubspec get pubspec => _cachedPubspec.pubspec;
  String get pubspecYaml => _cachedPubspec.pubspecYaml;

  late final _cachedClientPubspec = CachedPubspec(
    fileSystem.directory(projectPaths.clientRoot).childFile('pubspec.yaml'),
  );
  Pubspec get clientPubspec => _cachedClientPubspec.pubspec;
  String get clientPubspecYaml => _cachedClientPubspec.pubspecYaml;

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

  /// The name of the project as declared in the `project.dart` file.
  ///
  /// We parse the `project.dart` file to retrieve it since it is cheap and
  /// follows a consistent pattern.
  String get projectName {
    final projectDartFiles = [
      projectPaths.projectDart,
      projectPaths.projectDartLegacy,
    ].map(fileSystem.file);
    File? projectDart;
    for (final projectDartFile in projectDartFiles) {
      if (projectDartFile.existsSync()) {
        projectDart = projectDartFile;
        break;
      }
    }
    if (projectDart == null) {
      // Shouldn't ever happen since we shouldn't be requesting this before
      // the project is generated.
      throw StateError('No project.dart file found in the project root.');
    }
    final projectLibrary = analysisContext.currentSession.getParsedLibrary(
      projectDart.path,
    );
    switch (projectLibrary) {
      case ParsedLibraryResult(:final units):
        final declarations = units
            .expand((unit) => unit.unit.declarations)
            .whereType<TopLevelVariableDeclaration>()
            .expand((declaration) => declaration.variables.variables);
        for (final declaration in declarations) {
          if (declaration.initializer case MethodInvocation(
            methodName: SimpleIdentifier(name: 'Project'),
            :final argumentList,
          )) {
            for (final argument in argumentList.arguments) {
              if (argument case NamedExpression(
                name: Label(label: SimpleIdentifier(name: 'name')),
                expression: SimpleStringLiteral(value: final projectName),
              )) {
                return projectName;
              }
            }
          }
        }
        throw StateError('No Project(name: "name") found in project.dart');
      default:
        throw StateError('Failed to parse project.dart');
    }
  }

  Future<void> close() async {
    await Future.wait([
      _analysisContextCollection.dispose(forTesting: true),
      cacheDb.close(),
    ]);
    _logger.finest('Closed Celest project');
  }
}

typedef CelestProjectUris = ({Uri localUri, Uri? productionUri});

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
}

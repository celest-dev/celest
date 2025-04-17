import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:analyzer/src/error/codes.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/analyzer/analysis_error.dart';
import 'package:celest_cli/src/analyzer/analysis_result.dart';
import 'package:celest_cli/src/analyzer/celest_analysis_helpers.dart';
import 'package:celest_cli/src/analyzer/resolver/project_resolver.dart';
import 'package:celest_cli/src/ast/ast.dart';
import 'package:celest_cli/src/config/feature_flags.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/database/cache/cache_database.dart';
import 'package:celest_cli/src/init/edits/source_edit_applier.dart';
import 'package:celest_cli/src/pub/project_dependency.dart';
import 'package:celest_cli/src/pub/pub_action.dart';
import 'package:celest_cli/src/pub/pub_environment.dart';
import 'package:celest_cli/src/pub/pubspec.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:source_span/source_span.dart';
import 'package:stream_transform/stream_transform.dart';

final class CelestAnalyzer
    with CelestAnalysisHelpers
    implements AnalysisErrorListener {
  CelestAnalyzer._();

  factory CelestAnalyzer() => _instance ??= CelestAnalyzer._();
  static CelestAnalyzer? _instance;

  static final Logger _logger = Logger('CelestAnalyzer');

  /// Warms up the analyzer caches by resolving the core libraries and types
  /// in a background thread.
  ///
  /// The results will be persisted to the byte store so that they can be
  /// reused in subsequent analyzer instances.
  static Future<void> warmUp(String projectRoot) async {
    final database = await CacheDatabase.open(projectRoot, verbose: false);

    var projectDir = fileSystem.directory(projectRoot);
    final Iterable<String> dependencies;
    if (!fileSystem.file(p.join(projectRoot, 'pubspec.lock')).existsSync()) {
      // If the project hasn't been created yet, create a dummy project to warm
      // up the caches.
      projectDir = fileSystem.systemTempDirectory.createTempSync('celest_');
      dependencies = ProjectDependency.backendDependencies.keys;
      final pubspec = Pubspec(
        'warmup_celest_cache',
        environment: {'sdk': PubEnvironment.dartSdkConstraint},
        dependencies: ProjectDependency.backendDependencies.toPub(),
      );
      await [
        projectDir.childFile('pubspec.yaml').writeAsString(pubspec.toYaml()),
        projectDir.childFile('project.dart').writeAsString('''
import 'package:celest/celest.dart';

const project = Project(name: 'cache_warmup');
'''),
      ].wait;
      await runPub(action: PubAction.get, workingDirectory: projectDir.path);
    } else {
      // Otherwise, cache the dependencies of the existing project.
      final pubspec = Pubspec.parse(
        projectDir.childFile('pubspec.yaml').readAsStringSync(),
      );
      dependencies = pubspec.dependencies.keys;
    }

    final contextCollection = AnalysisContextCollectionImpl(
      includedPaths: [projectDir.path],
      sdkPath: Sdk.current.sdkPath,
      // Needed for collecting subtypes.
      enableIndex: true,
      byteStore: database.byteStore,
    );
    final context = contextCollection.contextFor(
      p.join(projectDir.path, 'project.dart'),
    );
    final libraries = {
      'dart:core',
      'dart:typed_data',
      'package:celest_core/celest_core.dart',
      'package:celest_core/src/exception/cloud_exception.dart',
      'package:celest_core/src/auth/user.dart',
      ...dependencies.map((dep) => 'package:$dep/$dep.dart'),
    };
    await Future.wait(libraries.map(context.currentSession.getLibraryByUri));
  }

  @override
  DriverBasedAnalysisContext get context => celestProject.analysisContext;

  final List<CelestAnalysisError> _errors = [];
  final List<CelestAnalysisError> _warnings = [];
  final List<CelestAnalysisError> _infos = [];
  final List<CelestAnalysisError> _debugs = [];

  late _ScopedWidgetCollector _widgetCollector;
  late ast.ProjectBuilder _project;
  CelestProjectResolver? _resolver;
  CelestProjectResolver get resolver => _resolver!;

  /// Whether [code] and [message] represent a possible false-positive for
  /// missing code generation.
  bool _missingCodegenError(AnalysisError error) {
    switch (error.errorCode) {
      case CompileTimeErrorCode.URI_DOES_NOT_EXIST:
        final regex = RegExp(r'''Target of URI doesn't exist: '(.+?)'\.''');
        final match = regex.firstMatch(error.message);
        final uri = match?.group(1);
        if (uri == null) {
          return false;
        }
        final path =
            context.currentSession.uriConverter.uriToPath(Uri.parse(uri));
        if (path == null) {
          _logger.fine('Failed to convert URI to path: $uri');
          return false;
        }
        return p.isWithin(projectPaths.generatedDir, path);
    }

    return false;
  }

  @override
  void reportError(
    String error, {
    AnalysisErrorSeverity? severity,
    SourceSpan? location,
  }) {
    switch (severity) {
      case AnalysisErrorSeverity.error || null:
        _errors.add(
          CelestAnalysisError(
            message: error,
            location: location,
            severity: severity,
          ),
        );
      case AnalysisErrorSeverity.warning:
        _warnings.add(
          CelestAnalysisError(
            message: error,
            location: location,
            severity: severity,
          ),
        );
      case AnalysisErrorSeverity.info:
        _infos.add(
          CelestAnalysisError(
            message: error,
            location: location,
            severity: severity,
          ),
        );
      case AnalysisErrorSeverity.debug:
        _debugs.add(
          CelestAnalysisError(
            message: error,
            location: location,
            severity: severity,
          ),
        );
    }
  }

  @override
  void onError(AnalysisError error) {
    // TODO:
  }

  @override
  void reset() {
    _logger.finest('Clearing analyzer caches...');
    super.reset();
    _initFuture = null;
    _resolver = null;
    typeHelper.reset();
  }

  Future<void> init({required bool migrateProject}) async {
    _errors.clear();
    _warnings.clear();
    _infos.clear();
    _debugs.clear();
    _resolver ??= CelestProjectResolver(
      featureFlags: await FeatureFlags.load(),
      migrateProject: migrateProject,
      errorReporter: this,
      context: context,
    );
    await (_initFuture ??= _init());
    await _resolver!.resolveCustomTypes();
  }

  Future<void>? _initFuture;
  Future<void> _init() async {
    final (
      dartCore as LibraryElementResult,
      dartTypedData as LibraryElementResult,
      celestCoreExceptions,
      celestCoreUser,
      celestConfigValues,
      jsonAnnotation,
    ) = await (
      context.currentSession.getLibraryByUri('dart:core'),
      context.currentSession.getLibraryByUri('dart:typed_data'),

      // Resolve the specific URIs instead of resolving the whole package
      // (which takes much much longer).
      context.currentSession.getLibraryByUri(
        'package:celest_core/src/exception/cloud_exception.dart',
      ),
      context.currentSession.getLibraryByUri(
        'package:celest_core/src/auth/user.dart',
      ),
      context.currentSession.getLibraryByUri(
        'package:celest/src/config/config_values.dart',
      ),

      // `package:json_annotation/json_annotation.dart` is used in the
      // generated code when serializing/deserializing models.
      context.currentSession.getLibraryByUri(
        'package:json_annotation/src/json_key.dart',
      ),
    ).wait;
    if (celestCoreExceptions is! LibraryElementResult ||
        celestCoreUser is! LibraryElementResult) {
      await dumpPackageConfig();
      throw StateError('Failed to resolve celest_core');
    }
    if (celestConfigValues is! LibraryElementResult) {
      await dumpPackageConfig();
      throw StateError('Failed to resolve celest');
    }
    final jsonAnnotationLib = switch (jsonAnnotation) {
      LibraryElementResult() => jsonAnnotation,
      _ => null,
    };
    if (jsonAnnotationLib == null) {
      await dumpPackageConfig();
      _logger.fine(
        'Failed to resolve package:json_annotation',
        jsonAnnotation,
        StackTrace.current,
      );
    }

    final envElement = celestConfigValues.getClassElement('env');
    final secretElement = celestConfigValues.getClassElement('secret');
    typeHelper
      ..coreTypes = CoreTypes(
        typeProvider: dartCore.element2.typeProvider,
        coreExceptionType: dartCore.getClassType('Exception'),
        coreErrorType: dartCore.getClassType('Error'),
        coreBigIntType: dartCore.getClassType('BigInt'),
        dateTimeType: dartCore.getClassType('DateTime'),
        durationType: dartCore.getClassType('Duration'),
        coreRegExpType: dartCore.getClassType('RegExp'),
        coreStackTraceType: dartCore.getClassType('StackTrace'),
        coreUriType: dartCore.getClassType('Uri'),
        coreUriDataType: dartCore.getClassType('UriData'),
        typedDataUint8ListType: dartTypedData.getClassType('Uint8List'),
        badRequestExceptionType: celestCoreExceptions.getClassType(
          'BadRequestException',
        ),
        internalServerErrorType: celestCoreExceptions.getClassType(
          'InternalServerError',
        ),
        userType: celestCoreUser.getClassType('User'),
        cloudExceptionType: celestCoreExceptions.getClassType('CloudException'),
        celestEnvType: envElement.thisType,
        celestEnvElement: envElement,
        celestSecretType: secretElement.thisType,
        celestSecretElement: secretElement,
        jsonKeyElement: jsonAnnotationLib?.getClassElement('JsonKey'),
      )
      ..typeSystem = dartCore.element2.typeSystem
      ..typeProvider = dartCore.element2.typeProvider;

    typeHelper.init();
  }

  @override
  Set<InterfaceElement2> get customModelTypes =>
      _resolver?.customModelTypes ?? const {};

  @override
  Set<InterfaceElement2> get customExceptionTypes =>
      _resolver?.customExceptionTypes ?? const {};

  Future<CelestAnalysisResult> analyzeProject({
    bool migrateProject = false,
    bool updateResources = true,
  }) async {
    await performance.trace(
      'CelestAnalyzer',
      'init',
      () => init(migrateProject: migrateProject),
    );
    if (_errors.isNotEmpty) {
      return CelestAnalysisResult.failure(
        _errors,
        warnings: _warnings,
        infos: _infos,
      );
    }

    final project = await performance.trace(
      'CelestAnalyzer',
      'findProject',
      _findProject,
    );
    if (project == null || _errors.isNotEmpty) {
      return CelestAnalysisResult.failure(
        _errors,
        warnings: _warnings,
        infos: _infos,
      );
    }

    _project = project.toBuilder();
    _widgetCollector = _ScopedWidgetCollector(errorReporter: reportError);
    final variables = await performance.trace(
      'CelestAnalyzer',
      'resolveEnvVariables',
      resolver.resolveVariables,
    );

    final secrets = await performance.trace(
      'CelestAnalyzer',
      'resolveSecrets',
      resolver.resolveSecrets,
    );

    final auth = await performance.trace(
      'CelestAnalyzer',
      'collectAuth',
      () => _collectAuth(migrateProject: migrateProject),
    );
    if (auth != null) {
      _project.auth.replace(auth);
      variables.addAll(auth.variables.values);
      secrets.addAll(auth.secrets.values);
    }

    await performance.trace(
      'CelestAnalyzer',
      'collectApis',
      () => _collectApis(
        hasAuth: auth != null,
        variables: variables,
        secrets: secrets,
      ),
    );

    final hasCloudAuth = auth?.providers.isNotEmpty ?? false;
    final databases = await performance.trace(
      'CelestAnalyzer',
      'resolveDatabases',
      () => _resolveDatabases(hasCloudAuth: hasCloudAuth),
    );
    if (databases.isNotEmpty) {
      for (final database in databases) {
        _project.databases[database.name] = database;
      }
    } else if (hasCloudAuth) {
      final cloudAuthElement = await helper.getClass(
        'package:celest_cloud_auth/src/database/auth_database.dart',
        'CloudAuthDatabase',
      );
      if (cloudAuthElement == null) {
        throw StateError('Failed to resolve CloudAuthDatabase');
      }
      _project.databases['CloudAuthDatabase'] = ast.Database(
        name: 'CloudAuthDatabase',
        dartName: 'cloudAuth',
        schema: ast.DriftDatabaseSchema(
          declaration:
              typeHelper.toReference(cloudAuthElement.thisType).toTypeReference,
          version: await resolveSchemaVersion(cloudAuthElement),
          location: cloudAuthElement.sourceLocation!,
        ),
        config: ast.CelestDatabaseConfig(
          hostname: ast.Variable(
            'CLOUD_AUTH_DATABASE_HOST',
            location: cloudAuthElement.sourceLocation!,
          ),
          token: ast.Secret(
            'CLOUD_AUTH_DATABASE_TOKEN',
            location: cloudAuthElement.sourceLocation!,
          ),
        ),
        location: auth!.location,
      );
    }

    await performance.trace(
      'CelestAnalyzer',
      'applyMigrations',
      _applyMigrations,
    );

    // Add config values only at the end since other components may contribute
    // to them.
    _project.variables.replace(variables);
    _project.secrets.replace(secrets);

    return CelestAnalysisResult.success(
      project: _project.build(),
      errors: _errors,
      warnings: _warnings,
      infos: _infos,
    );
  }

  Future<ast.Project?> _findProject() async {
    _logger.fine('Analyzing project...');
    final projectFilePath = projectPaths.projectDart;
    if (!fileSystem.file(projectFilePath).existsSync()) {
      reportError('No project file found at $projectFilePath');
      return null;
    }
    _logger.finer('Found project file at $projectFilePath');
    final projectLibrary = context.currentSession.getParsedLibrary(
      projectFilePath,
    );
    if (projectLibrary is! ParsedLibraryResult) {
      reportError('Failed to parse project.dart file');
      return null;
    }
    final projectErrors = projectLibrary.units
        .expand((unit) => unit.errors)
        .where((error) => error.severity == Severity.error)
        .toList();
    if (projectErrors.isNotEmpty) {
      for (final projectError in projectErrors) {
        _logger.finest(
          'ERROR (project.dart): type=${projectError.errorCode.type} '
          'name=${projectError.errorCode.name}',
        );
        reportError(
          projectError.message,
          location: projectError.source.toSpan(
            projectError.problemMessage.offset,
            projectError.problemMessage.offset +
                projectError.problemMessage.length,
          ),
        );
      }
      return null;
    }
    _logger.finer('Resolved project file');
    // TODO(dnys1): Some errors are okay, for example if `resources.dart` hasn't
    // been updated yet and references a resource that doesn't exist yet.
    // if (projectFile.errors.isNotEmpty) {
    //   reportError(
    //     'Project file has errors:\n${projectFile.errors.join('\n')}',
    //     SourceLocation(
    //       path: projectFileRelativePath,
    //       line: 0,
    //       column: 0,
    //     ),
    //   );
    // }
    return resolver.resolveProject(projectLibrary: projectLibrary);
  }

  Future<void> _collectApis({
    required bool hasAuth,
    required Set<ast.Variable> variables,
    required Set<ast.Secret> secrets,
  }) async {
    final apiDir = fileSystem.directory(projectPaths.apisDir);
    if (!await apiDir.exists()) {
      return;
    }

    final apiFiles = await apiDir
        .list(followLinks: true)
        .whereType<File>()
        .map((file) => file.path)
        .where((path) => path.endsWith('.dart'))
        .toList();
    final apiDeclarations = _widgetCollector.collect(
      apiFiles,
      scope: 'API',
      placeholder: '<api_name>',
    );
    for (final MapEntry(key: apiName, value: apiPath)
        in apiDeclarations.entries) {
      if (apiName.startsWith('_')) {
        // This would lead to private fields being generated in the client. It
        // also allows us to reserve all `_` paths for internal usage.
        reportError(
          'API names may not start with an underscore (`_`)',
          location: SourceFile.fromString(
            await fileSystem.file(apiPath).readAsString(),
            url: p.toUri(apiPath),
          ).span(0, 0),
        );
        continue;
      }

      final apiLibraryResult = await resolveLibrary(apiPath);
      final apiErrors = apiLibraryResult.units
          .expand((unit) => unit.errors)
          .where((error) => error.severity == Severity.error)
          .toList();

      // If there's a false positive from missing generated code, which can
      // happen for example when starting from a template proejct, then skip
      // reporting errors since they may be resolved through generation, and if
      // not, they'll be caught by the frontend compiler.
      final falsePositiveForGeneratedCode =
          apiErrors.isNotEmpty && apiErrors.any(_missingCodegenError);

      if (apiErrors.isNotEmpty && !falsePositiveForGeneratedCode) {
        for (final apiError in apiErrors) {
          reportError(
            apiError.message,
            location: apiError.source.toSpan(
              apiError.problemMessage.offset,
              apiError.problemMessage.offset + apiError.problemMessage.length,
            ),
          );
        }
        continue;
      }
      final baseApi = await resolver.resolveApi(
        apiFilepath: apiPath,
        apiName: apiName,
        apiLibrary: apiLibraryResult,
        variables: variables,
        secrets: secrets,
        hasAuth: hasAuth,
      );
      if (baseApi == null) {
        return;
      }
      _project.apis.update((apis) => apis[apiName] = baseApi);
    }
  }

  Future<ast.Auth?> _collectAuth({required bool migrateProject}) async {
    final potentialAuthFiles = [
      projectPaths.authDart,
      projectPaths.projectDart,
    ];
    final authLibraries = await Future.wait(
      potentialAuthFiles
          .where((it) => fileSystem.file(it).existsSync())
          .map(resolveLibrary),
    );
    final authErrors = authLibraries
        .expand((library) => library.units)
        .expand((unit) => unit.errors)
        .where((error) => error.severity == Severity.error)
        .toList();
    if (authErrors.isNotEmpty) {
      for (final authError in authErrors) {
        reportError(
          authError.message,
          location: authError.source.toSpan(
            authError.problemMessage.offset,
            authError.problemMessage.offset + authError.problemMessage.length,
          ),
        );
      }
      return null;
    }

    for (final library in authLibraries) {
      final auth = await resolver.resolveAuth(
        authFilepath: context.currentSession.uriConverter.uriToPath(
          library.element.source.uri,
        )!,
        authLibrary: library,
      );
      if (auth != null) {
        return auth;
      }
    }
    return null;
  }

  Future<List<ast.Database>> _resolveDatabases({
    required bool hasCloudAuth,
  }) async {
    final databaseFile = fileSystem.file(projectPaths.projectDart);
    if (!databaseFile.existsSync()) {
      return const [];
    }
    final databaseLibrary = await resolveLibrary(databaseFile.path);
    final database = await resolver.resolveDatabase(
      databaseFilepath: databaseFile.path,
      databaseLibrary: databaseLibrary,
      hasCloudAuth: hasCloudAuth,
    );
    return database == null ? const [] : [database];
  }

  Future<void> _applyMigrations() async {
    await SourceEditApplier(resolver.pendingEdits).apply();
    resolver.pendingEdits.clear();
  }
}

final class _ScopedWidgetCollector {
  _ScopedWidgetCollector({required this.errorReporter});

  final AnalysisErrorReporter errorReporter;

  Map<String, String> collect(
    List<String> files, {
    required String scope,
    required String placeholder,
  }) {
    final declarations = <String, String>{};
    for (final file in files) {
      switch (p.basename(file).split('.')) {
        case [final baseName, 'dart']:
          declarations[baseName] = file;
        default:
          errorReporter(
            '$scope files must be named as follows: $placeholder.dart',
          );
          continue;
      }
    }
    return declarations;
  }
}

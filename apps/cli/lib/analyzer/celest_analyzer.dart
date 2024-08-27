import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:api_celest/ast.dart' as ast;
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/analyzer/celest_analysis_helpers.dart';
import 'package:celest_cli/analyzer/resolver/legacy_project_resolver.dart';
import 'package:celest_cli/analyzer/resolver/project_resolver.dart';
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/config/feature_flags.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:source_span/source_span.dart';
import 'package:stream_transform/stream_transform.dart';

final class CelestAnalyzer
    with CelestAnalysisHelpers
    implements AnalysisErrorListener {
  CelestAnalyzer._();

  factory CelestAnalyzer() => _instance ??= CelestAnalyzer._();
  static CelestAnalyzer? _instance;

  static final Logger _logger = Logger('CelestAnalyzer');

  @override
  AnalysisContext get context => celestProject.analysisContext;

  final List<CelestAnalysisError> _errors = [];
  final List<CelestAnalysisError> _warnings = [];
  final List<CelestAnalysisError> _infos = [];

  late _ScopedWidgetCollector _widgetCollector;
  late ast.ProjectBuilder _project;
  CelestProjectResolver? _resolver;
  CelestProjectResolver get resolver => _resolver!;

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
    _lastAnalyzed = projectPaths.projectRoot;
    _resolver = null;
    typeHelper.reset();
  }

  Future<void> init({required bool migrateProject}) async {
    _errors.clear();
    _warnings.clear();
    _infos.clear();
    if (_lastAnalyzed != projectPaths.projectRoot) {
      reset();
    }
    _resolver ??= LegacyCelestProjectResolver(
      featureFlags: await FeatureFlags.load(),
      migrateProject: migrateProject,
      errorReporter: this,
      context: context,
    );
    await Future.wait([
      _initFuture ??= _init(),
      _resolver!.resolveCustomTypes(),
    ]);
  }

  Future<void>? _initFuture;
  Future<void> _init() async {
    final (
      dartCore as LibraryElementResult,
      dartTypedData as LibraryElementResult,
      celestCore
    ) = await (
      context.currentSession.getLibraryByUri('dart:core'),
      context.currentSession.getLibraryByUri('dart:typed_data'),
      context.currentSession
          .getLibraryByUri('package:celest_core/celest_core.dart'),
    ).wait;
    if (celestCore is! LibraryElementResult) {
      await dumpPackageConfig();
      throw StateError('Failed to resolve celest_core');
    }
    typeHelper.coreTypes = CoreTypes(
      typeProvider: dartCore.element.typeProvider,
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
      badRequestExceptionType: celestCore.getClassType('BadRequestException'),
      internalServerErrorType: celestCore.getClassType('InternalServerError'),
      userType: celestCore.getClassType('User'),
      cloudExceptionType: celestCore.getClassType('CloudException'),
    );
  }

  @override
  Set<InterfaceElement> get customModelTypes =>
      _resolver?.customModelTypes ?? const {};

  @override
  Set<InterfaceElement> get customExceptionTypes =>
      _resolver?.customExceptionTypes ?? const {};

  String? _lastAnalyzed;

  Future<CelestAnalysisResult> analyzeProject({
    bool migrateProject = false,
    bool updateResources = true,
  }) async {
    await init(migrateProject: migrateProject);
    if (_errors.isNotEmpty) {
      return CelestAnalysisResult.failure(
        _errors,
        warnings: _warnings,
        infos: _infos,
      );
    }

    final project = await _findProject();
    if (project == null) {
      return CelestAnalysisResult.failure(
        _errors,
        warnings: _warnings,
        infos: _infos,
      );
    }

    _project = project.toBuilder();
    _widgetCollector = _ScopedWidgetCollector(
      errorReporter: reportError,
    );
    _project.envVars.replace(
      await resolver.resolveEnvironmentVariables(),
    );

    // Regenerate resources.dart before analyzing remaining project files.
    // TODO(dnys1): Find a better way to do this.
    if (updateResources) {
      _logger.fine('Regenerating resources.dart');
      final resourcesDart = fileSystem.file(projectPaths.resourcesDart);
      if (!resourcesDart.existsSync()) {
        await resourcesDart.create(recursive: true);
      }
      await resourcesDart.writeAsString(
        CloudCodeGenerator.generateResourcesDart(_project.build()),
      );
      await celestProject.invalidate({projectPaths.resourcesDart});
    }

    final hasAuth = await _collectAuth(migrateProject: migrateProject);
    await _collectApis(hasAuth: hasAuth);

    if (migrateProject) {
      await _applyMigrations();
    }

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
    if (!await fileSystem.file(projectFilePath).exists()) {
      reportError('No project file found at $projectFilePath');
      return null;
    }
    _logger.finer('Found project file at $projectFilePath');
    final projectLibrary = await resolveLibrary(projectFilePath);
    final projectErrors = projectLibrary.units
        .expand((unit) => unit.errors)
        .where((error) => error.severity == Severity.error)
        .toList();
    if (projectErrors.isNotEmpty) {
      for (final projectError in projectErrors) {
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
    typeHelper
      ..typeSystem = projectLibrary.element.typeSystem
      ..typeProvider = projectLibrary.typeProvider;
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
  }) async {
    final apiDir = fileSystem.directory(projectPaths.apisDir);
    if (!await apiDir.exists()) {
      return;
    }

    final apiFiles = await apiDir
        .list()
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
      if (apiErrors.isNotEmpty) {
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
        environmentVariables: _project.envVars.build(),
        hasAuth: hasAuth,
      );
      if (baseApi == null) {
        return;
      }
      _project.apis.update(
        (apis) => apis[apiName] = baseApi,
      );
    }
  }

  Future<bool> _collectAuth({required bool migrateProject}) async {
    final authFilepath = projectPaths.authDart;
    final authFile = fileSystem.file(authFilepath);
    if (!authFile.existsSync()) {
      if (!migrateProject) {
        return false;
      }
      final legacyAuthFile = fileSystem.file(projectPaths.legacyAuthDart);
      if (!legacyAuthFile.existsSync()) {
        return false;
      }
      await legacyAuthFile.copy(authFilepath);
      await legacyAuthFile.delete();
      try {
        await legacyAuthFile.parent.delete(recursive: false);
      } on Object {
        // Do not delete directory if not empty.
        _logger.finest('Failed to delete legacy auth directory');
      }
    }

    final authLibrary = await resolveLibrary(authFile.path);
    final authErrors = authLibrary.units
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
      return false;
    }

    final auth = await resolver.resolveAuth(
      authFilepath: authFilepath,
      authLibrary: authLibrary,
    );
    if (auth == null) {
      return false;
    }

    _project.auth.replace(auth);
    return true;
  }

  Future<void> _applyMigrations() async {
    if (resolver.pendingEdits.isEmpty) {
      return;
    }

    _logger.fine('Applying ${resolver.pendingEdits.length} migrations');

    final fileChanges = <Future<void>>[];
    for (final entry in resolver.pendingEdits.entries) {
      final path = entry.key;

      // Sort edits in reserve order to avoid offset changes.
      final edits = entry.value.sorted((a, b) {
        return -a.offset.compareTo(b.offset);
      });

      _logger.finest('Applying migrations to $path: $edits');

      final file = context.currentSession.getFile(path) as FileResult;
      var source = file.content;

      for (final edit in edits) {
        source = source.replaceRange(
          edit.offset,
          edit.offset + edit.length,
          edit.replacement,
        );
      }

      const celestImport = 'package:celest/celest.dart';
      if (!source.contains(celestImport)) {
        var offset = source.indexOf('import ');
        if (offset == -1) {
          final libraryOffset = source.indexOf('library');
          if (libraryOffset != -1) {
            offset = source.indexOf(';', libraryOffset) + 1;
          } else {
            offset = 0;
          }
        }
        source = source.replaceRange(
          offset,
          offset,
          "import '$celestImport';\n",
        );
      }

      // Replace resources.dart imports
      source = source.replaceFirst(
        "../resources.dart';",
        "../generated/resources.dart';",
      );

      fileChanges.add(fileSystem.file(path).writeAsString(source));
    }

    final oldResources = fileSystem
        .directory(projectPaths.projectRoot)
        .childFile('resources.dart');
    if (oldResources.existsSync()) {
      fileChanges.add(oldResources.delete());
    }

    await Future.wait(fileChanges);

    _logger.finest('Applied migrations to disk');

    for (final path in pendingEdits.keys) {
      context.changeFile(path);
    }
    final changes = await context.applyPendingFileChanges();

    _logger.finest('Applied changes in analyzer: $changes');
  }
}

final class _ScopedWidgetCollector {
  _ScopedWidgetCollector({
    required this.errorReporter,
  });

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

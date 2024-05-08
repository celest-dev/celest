import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
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
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
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
  late _ScopedWidgetCollector _widgetCollector;
  late ast.ProjectBuilder _project;
  late CelestProjectResolver _resolver;

  @override
  void reportError(
    String error, {
    AnalysisErrorSeverity? severity,
    SourceSpan? location,
  }) {
    _errors.add(
      CelestAnalysisError(
        message: error,
        location: location,
        severity: severity,
      ),
    );
  }

  @override
  void onError(AnalysisError error) {
    // TODO:
  }

  Future<void> init() async {
    _errors.clear();
    if (_lastAnalyzed != projectPaths.projectRoot) {
      _lastAnalyzed = projectPaths.projectRoot;
      _logger.finest('Analyzing new project. Clearing caches.');
      typeHelper.reset();
      reset();
    }
    await Future.wait([
      _initFuture ??= _init(),
      _initCustomTypes(),
    ]);

    _resolver = LegacyCelestProjectResolver(
      errorReporter: this,
      customExceptionTypes: customExceptionTypes,
      customModelTypes: customModelTypes,
      context: context,
    );
  }

  Future<void>? _initFuture;
  Future<void> _init() async {
    final dartCore = await context.currentSession.getLibraryByUri('dart:core')
        as LibraryElementResult;
    final dartTypedData = await context.currentSession
        .getLibraryByUri('dart:typed_data') as LibraryElementResult;
    final celestCore = await context.currentSession
            .getLibraryByUri('package:celest_core/celest_core.dart')
        as LibraryElementResult;
    typeHelper.coreTypes = CoreTypes(
      coreExceptionType: dartCore.getClassType('Exception'),
      coreErrorType: dartCore.getClassType('Error'),
      coreBigIntType: dartCore.getClassType('BigInt'),
      coreDateTimeType: dartCore.getClassType('DateTime'),
      coreDurationType: dartCore.getClassType('Duration'),
      coreRegExpType: dartCore.getClassType('RegExp'),
      coreStackTraceType: dartCore.getClassType('StackTrace'),
      coreUriType: dartCore.getClassType('Uri'),
      coreUriDataType: dartCore.getClassType('UriData'),
      typedDataUint8ListType: dartTypedData.getClassType('Uint8List'),
      badRequestExceptionType: celestCore.getClassType('BadRequestException'),
      internalServerExceptionType:
          celestCore.getClassType('InternalServerException'),
      userType: celestCore.getClassType('User'),
    );
  }

  @override
  Set<InterfaceElement> customModelTypes = const {};

  @override
  Set<InterfaceElement> customExceptionTypes = const {};

  Future<void> _initCustomTypes() async {
    final [customModelTypes, customExceptionTypes] = await Future.wait([
      _collectCustomTypes(CustomType.model),
      _collectCustomTypes(CustomType.exception),
    ]);
    this.customModelTypes = customModelTypes;
    this.customExceptionTypes = customExceptionTypes;
    typeHelper.overrides.clear();
    for (final element in customExceptionTypes.followedBy(customModelTypes)) {
      final isOverride =
          element.metadata.any((annotation) => annotation.isOverride);
      if (!isOverride) {
        continue;
      }
      if (element is! ExtensionTypeElement) {
        reportError(
          'Only extension types may be marked as overrides',
          location: element.sourceLocation,
        );
        continue;
      }
      final typeErasure = element.typeErasure;
      if (typeErasure is! InterfaceType) {
        reportError(
          'Only interface types may be overridden',
          location: element.sourceLocation,
        );
        continue;
      }
      if (typeErasure.element is ExtensionTypeElement) {
        reportError(
          'Extension types may not be overridden',
          location: element.sourceLocation,
        );
        continue;
      }
      final erasureSource = typeErasure.element.library.source.uri;
      if (erasureSource case Uri(scheme: 'dart', path: 'core')) {
        reportError(
          'Overriding types from `dart:core` is not allowed',
          location: element.sourceLocation,
        );
        continue;
      }
      final overridesCustomType = switch (
          context.currentSession.uriConverter.uriToPath(erasureSource)) {
        final path? => p.isWithin(projectPaths.projectRoot, path),
        _ => false,
      };
      if (overridesCustomType) {
        reportError(
          'Overriding custom types is not allowed',
          location: element.sourceLocation,
        );
        continue;
      }
      if (typeHelper.overrides[typeErasure] case final existing?) {
        reportError(
          'The type ${typeErasure.element.name} is already overridden by '
          '${existing.element.name} (${existing.element.library.source.uri}).',
          location: element.sourceLocation,
        );
        continue;
      }
      // TODO(dnys1): This shouldn't be required but having an `on` clause with
      // an exttype which doesn't implement the interface causes an error.
      if (!element.thisType.implementsRepresentationType) {
        reportError(
          'Custom overrides must implement their representation type',
          location: element.sourceLocation,
        );
        continue;
      }
      typeHelper.overrides[typeErasure] = element.thisType;
    }
  }

  Future<Set<InterfaceElement>> _collectCustomTypes(CustomType type) async {
    final files = <File>[];
    final dir = fileSystem.directory(type.dir);
    if (dir.existsSync()) {
      files.addAll(
        await dir.list(recursive: true).whereType<File>().toList(),
      );
    }
    final legacyBarrelFile = fileSystem.file(type.legacyPath);
    if (legacyBarrelFile.existsSync()) {
      files.add(legacyBarrelFile);
    }
    final customTypes = <InterfaceElement>{};
    await Future.wait([
      for (final file in files)
        resolveLibrary(file.path).then((library) {
          final types = namespaceForLibrary(library.element);
          customTypes.addAll(types);
        }),
    ]);
    return customTypes;
  }

  String? _lastAnalyzed;

  Future<CelestAnalysisResult> analyzeProject({
    bool updateResources = true,
  }) async {
    await init();
    if (_errors.isNotEmpty) {
      return CelestAnalysisResult.failure(_errors);
    }

    final project = await _findProject();
    if (project == null) {
      return CelestAnalysisResult.failure(_errors);
    }

    _project = project.toBuilder();
    _widgetCollector = _ScopedWidgetCollector(
      errorReporter: reportError,
    );
    _project.envVars.replace(
      await _resolver.resolveEnvironmentVariables(),
    );

    // Regenerate resources.dart before analyzing remaining project files.
    // TODO(dnys1): Find a better way to do this.
    if (updateResources) {
      _logger.fine('Regenerating resources.dart');
      await fileSystem.file(projectPaths.resourcesDart).writeAsString(
            CloudCodeGenerator.generateResourcesDart(_project.build()),
          );
      await celestProject.invalidate({projectPaths.resourcesDart});
    }

    final hasAuth = await _collectAuth();
    await _collectApis(hasAuth: hasAuth);
    return CelestAnalysisResult.success(
      project: _project.build(),
      errors: _errors,
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
    return _resolver.resolveProject(projectLibrary: projectLibrary);
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
      final baseApi = await _resolver.resolveApi(
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

  Future<bool> _collectAuth() async {
    final authFilepath = projectPaths.authDart;
    final authFile = fileSystem.file(authFilepath);
    if (!authFile.existsSync()) {
      return false;
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

    final auth = await _resolver.resolveAuth(
      authFilepath: authFilepath,
      authLibrary: authLibrary,
    );
    if (auth == null) {
      return false;
    }

    _project.auth.replace(auth);
    return true;
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

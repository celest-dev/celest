import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:analyzer/src/dart/resolver/scope.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/list.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_proto/ast.dart' as ast;
import 'package:celest_proto/ast.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:source_span/source_span.dart';
import 'package:stream_transform/stream_transform.dart';

enum CustomType {
  model,
  exception;

  String get legacyPath => switch (this) {
        model => projectPaths.modelsDart,
        exception => projectPaths.exceptionsDart,
      };

  String get dir => switch (this) {
        model => projectPaths.modelsDir,
        exception => projectPaths.exceptionsDir,
      };
}

final class CelestAnalyzer {
  CelestAnalyzer._();

  factory CelestAnalyzer() => _instance ??= CelestAnalyzer._();

  static CelestAnalyzer? _instance;
  static final Logger _logger = Logger('CelestAnalyzer');
  AnalysisContext get _context => celestProject.analysisContext;
  final List<AnalysisError> _errors = [];
  late _ScopedWidgetCollector _widgetCollector;
  late ast.ProjectBuilder _project;

  void _reportError(
    String error, {
    AnalysisErrorSeverity? severity,
    SourceSpan? location,
  }) {
    _errors.add(
      AnalysisError(
        message: error,
        location: location,
        severity: severity,
      ),
    );
  }

  Future<void> init() async {
    _errors.clear();
    if (_lastAnalyzed != projectPaths.projectRoot) {
      _lastAnalyzed = projectPaths.projectRoot;
      _logger.finest('Analyzing new project. Clearing caches.');
      typeHelper.reset();
      _apiNamespace.clear();
    }
    await Future.wait([
      _initFuture ??= _init(),
      _initCustomTypes(),
    ]);
  }

  Future<void>? _initFuture;
  Future<void> _init() async {
    final dartCore = await _context.currentSession.getLibraryByUri('dart:core')
        as LibraryElementResult;
    final dartTypedData = await _context.currentSession
        .getLibraryByUri('dart:typed_data') as LibraryElementResult;
    final celestCore = await _context.currentSession
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

  Set<InterfaceElement> _customModelTypes = const {};
  Set<InterfaceElement> _customExceptionTypes = const {};

  Future<void> _initCustomTypes() async {
    final [customModelTypes, customExceptionTypes] = await Future.wait([
      _collectCustomTypes(CustomType.model),
      _collectCustomTypes(CustomType.exception),
    ]);
    _customModelTypes = customModelTypes;
    _customExceptionTypes = customExceptionTypes;
    typeHelper.overrides.clear();
    for (final element in _customExceptionTypes.followedBy(_customModelTypes)) {
      final isOverride =
          element.metadata.any((annotation) => annotation.isOverride);
      if (!isOverride) {
        continue;
      }
      if (element is! ExtensionTypeElement) {
        _reportError(
          'Only extension types may be marked as overrides',
          location: element.sourceLocation,
        );
        continue;
      }
      final typeErasure = element.typeErasure;
      if (typeErasure is! InterfaceType) {
        _reportError(
          'Only interface types may be overridden',
          location: element.sourceLocation,
        );
        continue;
      }
      if (typeErasure.element is ExtensionTypeElement) {
        _reportError(
          'Extension types may not be overridden',
          location: element.sourceLocation,
        );
        continue;
      }
      final erasureSource = typeErasure.element.library.source.uri;
      if (erasureSource case Uri(scheme: 'dart', path: 'core')) {
        _reportError(
          'Overriding types from `dart:core` is not allowed',
          location: element.sourceLocation,
        );
        continue;
      }
      final overridesCustomType = switch (
          _context.currentSession.uriConverter.uriToPath(erasureSource)) {
        final path? => p.isWithin(projectPaths.projectRoot, path),
        _ => false,
      };
      if (overridesCustomType) {
        _reportError(
          'Overriding custom types is not allowed',
          location: element.sourceLocation,
        );
        continue;
      }
      if (typeHelper.overrides[typeErasure] case final existing?) {
        _reportError(
          'The type ${typeErasure.element.name} is already overridden by '
          '${existing.element.name} (${existing.element.library.source.uri}).',
          location: element.sourceLocation,
        );
        continue;
      }
      // TODO(dnys1): This shouldn't be required but having an `on` clause with
      // an exttype which doesn't implement the interface causes an error.
      if (!element.thisType.implementsRepresentationType) {
        _reportError(
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
        _resolveLibrary(file.path).then((library) {
          final types = _namespaceForLibrary(library.element);
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

    _project = project;
    _widgetCollector = _ScopedWidgetCollector(
      errorReporter: _reportError,
    );
    _project.envVars.replace(projectPaths.envManager.reload());

    // Regenerate resources.dart before analyzing remaining project files.
    // TODO(dnys1): Find a better way to do this.
    if (updateResources) {
      _logger.fine('Regenerating resources.dart');
      await fileSystem.file(projectPaths.resourcesDart).writeAsString(
            CloudCodeGenerator.generateResourcesDart(_project.build()),
          );
      await celestProject.invalidate({projectPaths.resourcesDart});
    }

    var hasAuth = false;
    if (zDebugMode || platform.environment.containsKey('CELEST_ENABLE_AUTH')) {
      hasAuth = await _collectAuth();
    }
    await _collectApis(hasAuth: hasAuth);
    return CelestAnalysisResult.success(
      project: _project.build(),
      errors: _errors,
    );
  }

  Future<ResolvedLibraryResult> _resolveLibrary(String path) async {
    final library = await _context.currentSession.getResolvedLibrary(path);
    switch (library) {
      case ResolvedLibraryResult():
        return library;
      case UriOfExternalLibraryResult():
      case CannotResolveUriResult():
      case DisposedAnalysisContextResult():
      case InvalidPathResult():
      case NotElementOfThisSessionResult():
      case NotLibraryButAugmentationResult():
      case NotLibraryButPartResult():
      case NotPathOfUriResult():
      case InvalidResult():
      case _:
        throw StateError(
          'Could not resolve library at "$path": ${library.runtimeType}',
        );
    }
  }

  Future<ast.ProjectBuilder?> _findProject() async {
    _logger.fine('Analyzing project...');
    final projectFilePath = projectPaths.projectDart;
    if (!await fileSystem.file(projectFilePath).exists()) {
      _reportError('No project file found at $projectFilePath');
      return null;
    }
    _logger.finer('Found project file at $projectFilePath');
    final projectFile = await _resolveLibrary(projectFilePath);
    _logger.finer('Resolved project file');
    typeHelper
      ..typeSystem = projectFile.element.typeSystem
      ..typeProvider = projectFile.typeProvider;
    // TODO(dnys1): Some errors are okay, for example if `resources.dart` hasn't
    // been updated yet and references a resource that doesn't exist yet.
    // if (projectFile.errors.isNotEmpty) {
    //   _reportError(
    //     'Project file has errors:\n${projectFile.errors.join('\n')}',
    //     SourceLocation(
    //       path: projectFileRelativePath,
    //       line: 0,
    //       column: 0,
    //     ),
    //   );
    // }
    final (topLevelConstants, hasErrors) =
        projectFile.element.topLevelConstants(onError: _reportError);
    if (hasErrors) {
      return null;
    }
    final projectDefinition =
        topLevelConstants.firstWhereOrNull((el) => el.element.type.isProject);
    if (projectDefinition == null) {
      _reportError('$projectFilePath: No `Project` type found');
      return null;
    }
    final (
      element: projectDefinitionElement,
      value: projectDefinitionValue,
    ) = projectDefinition;

    // Validate `project` variable
    final projectDefineLocation = projectDefinitionElement.sourceLocation;
    _logger
        .finer('Resolved project definition location: $projectDefineLocation');
    final projectName =
        projectDefinitionValue.getField('name')?.toStringValue();
    assert(
      projectName != null,
      'This should be impossible given that `name` is a required field on `Project`',
    );
    if (projectName!.isEmpty) {
      _reportError(
        'The project name cannot be empty.',
        location: projectDefineLocation,
      );
    }
    _logger.finer('Resolved project name: $projectName');

    return ast.ProjectBuilder()
      ..name = projectName
      ..reference = refer(
        projectDefinitionElement.name,
        projectPaths.normalizeUri(p.toUri(projectFilePath)).toString(),
      )
      ..sdkInfo.replace(
        SdkInfo(
          sdkVersion: Version.parse(Sdk.current.version),
          enabledExperiments: celestProject.analysisOptions.enabledExperiments,
        ),
      )
      ..location = projectDefineLocation;
  }

  List<ast.ApiMetadata> _collectApiMetadata(
    Element element, {
    required bool hasAuth,
  }) {
    var hasAuthMetadata = false;
    return element.metadata
        .map((annotation) {
          final location = annotation.sourceLocation(element.source!);
          final type = annotation.computeConstantValue()?.type;
          if (type == null) {
            // TODO(dnys1): Add separate `hints` parameter to `_reportError`
            /// for suggestions on how to resolve the error/links to docs.
            _reportError(
              'Could not resolve annotation. Annotations must be '
              'authorization grants like `@authenticated` or `@public`.',
              location: location,
            );
            return null;
          }

          void assertSingleAuth() {
            if (hasAuthMetadata) {
              _reportError(
                'Only one `@authenticated` or `@public` annotation '
                'may be specified on the same function or API library.',
                location: location,
              );
            }
            hasAuthMetadata = true;
          }

          switch (type) {
            case _ when type.isApiAuthenticated:
              if (!hasAuth) {
                _reportError(
                  'The `@authenticated` annotation may only be used in '
                  'projects with authentication enabled.',
                  location: location,
                );
              }
              assertSingleAuth();
              return ast.ApiAuthenticated(location: location);
            case _ when type.isApiPublic:
              assertSingleAuth();
              return ast.ApiPublic(location: location);
            case _ when type.isMiddleware:
              // return ast.ApiMiddleware(
              //   type: typeHelper.toReference(type),
              //   location: location,
              // );
              unreachable();
            default:
              return null;
          }
        })
        .nonNulls
        .toList();
  }

  ast.ApiAuth? _applicableAuth({
    required Iterable<ast.ApiMetadata> apiMetadata,
    required Iterable<ast.ApiMetadata> functionMetadata,
  }) {
    final functionAuth = functionMetadata.whereType<ast.ApiAuth>().firstOrNull;
    final apiAuth = apiMetadata.whereType<ast.ApiAuth>().firstOrNull;
    if (apiAuth is ast.ApiAuthenticated && functionAuth is ast.ApiPublic) {
      _reportError(
        '`@public` has no effect when `@authenticated` is applied at the '
        'API level. It is recommended to move the `@public` method to '
        'another API.',
        location: functionAuth.location,
        severity: AnalysisErrorSeverity.warning,
      );
      return apiAuth;
    }
    if (functionAuth != null) {
      return functionAuth;
    }
    if (apiAuth != null) {
      return apiAuth;
    }
    return null;
  }

  ast.NodeReference? _parameterReference(
    ParameterElement parameter, {
    required ast.ApiAuth? applicableAuth,
  }) {
    final annotations = parameter.metadata;
    if (annotations.isEmpty) {
      return null;
    }
    if (annotations.length > 1) {
      _reportError(
        'Only one annotation may be specified on a parameter',
        location: parameter.sourceLocation.safeExpand(
          annotations.fold<FileSpan>(
            annotations[0].sourceLocation(parameter.source!),
            (span, el) {
              return span.safeExpand(el.sourceLocation(parameter.source!));
            },
          ),
        ),
      );
      return null;
    }
    final annotation = annotations.single;
    final location = annotation.sourceLocation(parameter.source!);
    final value = annotation.computeConstantValue();
    final annotationType = value?.type;
    if (value == null || annotationType == null) {
      _reportError('Could not resolve annotation', location: location);
      return null;
    }
    switch (annotationType) {
      case DartType(isEnvironmentVariable: true):
        if (!validEnvTypes.isExactlyType(parameter.type)) {
          _reportError(
            'The type of an environment variable parameter must be one of: '
            '`String`, `Uri`, `int`, `double`, `num`, or `bool`',
            location: parameter.sourceLocation,
          );
          return null;
        }
        final name = value.getField('name')?.toStringValue();
        if (name == null) {
          _reportError(
            'The `name` field is required on `EnvironmentVariable` annotations',
            location: location,
          );
          return null;
        }
        const reservedEnvVars = ['PORT'];
        if (reservedEnvVars.contains(name)) {
          _reportError(
            'The environment variable name `$name` is reserved by Celest',
            location: parameter.sourceLocation,
          );
          return null;
        }
        if (_project.envVars.build().none((envVar) => envVar.envName == name)) {
          _reportError(
            'The environment variable `$name` does not exist',
            location: location,
          );
          return null;
        }
        return ast.NodeReference(
          type: ast.NodeType.environmentVariable,
          name: name,
        );
      case DartType(isUserContext: true):
        if (!TypeChecker.fromStatic(typeHelper.coreTypes.userType)
            .isExactlyType(parameter.type)) {
          _reportError(
            'The type of a user context parameter must be `User`',
            location: parameter.sourceLocation,
          );
          return null;
        }
        if (applicableAuth case null || ast.ApiPublic()) {
          if (typeHelper.typeSystem.isNonNullable(parameter.type)) {
            _reportError(
              'A user context parameter may only be required in an '
              '`@authenticated` function',
              location: parameter.sourceLocation,
            );
          }
        }
        return ast.NodeReference(
          name: r'$user',
          type: ast.NodeType.userContext,
        );
    }
    return null;
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
      final baseApi = await _collectApi(
        apiName: apiName,
        apiFile: apiPath,
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

  /// Ensures that a referenced type which will be surfaced in the client
  /// is defined in the `lib/` directory.
  void _ensureClientReferenceable(
    InterfaceElement modelType,
    SourceSpan location, {
    required CustomType type,
  }) {
    final isCustomType = switch (_context.currentSession.uriConverter
        .uriToPath(modelType.library.source.uri)) {
      final path? => p.isWithin(projectPaths.projectRoot, path),
      _ => false,
    };
    if (!isCustomType) {
      return;
    }
    final isDefinedInLib = switch (type) {
      CustomType.model => _customModelTypes.contains(modelType),
      CustomType.exception => _customExceptionTypes.contains(modelType),
    };
    if (!isDefinedInLib) {
      final expectedPath = p
          .relative(
            type.dir,
            from: projectPaths.projectRoot,
          )
          .to(p.url);
      _reportError(
        'Custom ${type.name} types referenced in APIs must be defined within the '
        '`celest/$expectedPath` folder.',
        location: location,
      );
    }
  }

  final _apiNamespace =
      <(LibraryElement, bool recursive), Set<InterfaceElement>>{};
  Set<InterfaceElement> _namespaceForLibrary(
    LibraryElement library, {
    bool recursive = false,
  }) {
    final visited = <LibraryElement>{};

    Iterable<InterfaceElement> forNamespace(Namespace namespace) sync* {
      yield* namespace.definedNames.values.whereType();
      yield* namespace.definedNames.values
          .whereType<TypeAliasElement>()
          .map((el) => el.aliasedElement ?? el.aliasedType.element)
          .whereType();
    }

    Iterable<InterfaceElement> search(LibraryElement library) sync* {
      if (!visited.add(library)) {
        return;
      }
      yield* forNamespace(library.exportNamespace);
      if (!recursive) {
        return;
      }
      for (final importedLibrary in library.importedLibraries) {
        yield* search(importedLibrary);
      }
    }

    return _apiNamespace[(library, recursive)] ??= search(library).toSet();
  }

  Set<DartType> _collectExceptionTypes(LibraryElement apiLibrary) {
    final customExceptions = _customExceptionTypes;
    final apiNamespace = _namespaceForLibrary(apiLibrary, recursive: true);
    final exceptionTypes = <DartType>{};
    for (var interfaceElement in apiNamespace) {
      final overriddenBy = typeHelper.overrides[interfaceElement.thisType];
      final isOverriden = overriddenBy != null;
      if (isOverriden) {
        interfaceElement = overriddenBy.element;
      }
      final interfaceType = interfaceElement.thisType;
      final interfaceUri = interfaceElement.library.source.uri;
      final isDartType = interfaceUri.scheme == 'dart';
      if (isDartType && !isOverriden) {
        continue;
      }
      final isExceptionType = typeHelper.typeSystem.isSubtypeOf(
        interfaceType.extensionTypeErasure,
        typeHelper.coreTypes.coreExceptionType,
      );
      final isErrorType = typeHelper.typeSystem.isSubtypeOf(
        interfaceType.extensionTypeErasure,
        typeHelper.coreTypes.coreErrorType,
      );
      final isExceptionOrErrorType = isExceptionType || isErrorType;
      if (!isExceptionOrErrorType) {
        continue;
      }
      final exportedFromExceptionsDart = isOverriden ||
          customExceptions.contains(interfaceElement) ||
          _customModelTypes.contains(interfaceElement);

      // Only types defined within the celest/ project folder need to be in
      // lib/ since all others can be imported on the client side.
      final mustBeExportedFromExceptionsDart = switch (
          _context.currentSession.uriConverter.uriToPath(interfaceUri)) {
        final path? => p.isWithin(projectPaths.projectRoot, path),
        _ => false,
      };
      if (!exportedFromExceptionsDart && mustBeExportedFromExceptionsDart) {
        _reportError(
          'Custom exception types referenced in APIs must be defined within the '
          '`celest/lib/exceptions` folder',
          location: interfaceElement.sourceLocation,
        );
        continue;
      }
      final isInstantiable = switch (interfaceElement) {
        final ClassElement classElement => classElement.isConstructable,
        ExtensionTypeElement() || EnumElement() => true,
        _ => false,
      };
      if (!isInstantiable) {
        continue;
      }
      final isSerializable = typeHelper.isSerializable(interfaceType);
      if (!isSerializable.isSerializable) {
        // Serialization issues are only reported if the type is a custom type
        // (e.g. exported from `exceptions/`). Otherwise, users are still
        // allowed to throw it, but it will not be serialized in the response.
        if (exportedFromExceptionsDart) {
          for (final reason in isSerializable.reasons) {
            // TODO(dnys1): Add a helpful link/description for this error.
            _reportError(
              'The exception type "${interfaceElement.name}" cannot be serialized '
              'as JSON. Hide this type from the API or make it serializable: '
              '$reason',
              location: interfaceElement.sourceLocation,
            );
          }
        }
        continue;
      }
      exceptionTypes.add(interfaceType);
    }
    return exceptionTypes;
  }

  Future<ast.Api?> _collectApi({
    required String apiName,
    required String apiFile,
    required bool hasAuth,
  }) async {
    if (apiName.startsWith('_')) {
      // This would lead to private fields being generated in the client. It
      // also allows us to reserve all `_` paths for internal usage.
      _reportError(
        'API names may not start with an underscore (`_`)',
        location: SourceFile.fromString(
          await fileSystem.file(apiFile).readAsString(),
          url: p.toUri(apiFile),
        ).span(0, 0),
      );
      return null;
    }

    final apiLibraryResult = await _resolveLibrary(apiFile);
    final apiErrors = apiLibraryResult.units
        .expand((unit) => unit.errors)
        .where((error) => error.severity == Severity.error)
        .toList();
    if (apiErrors.isNotEmpty) {
      for (final apiError in apiErrors) {
        _reportError(
          apiError.message,
          location: apiError.source.toSpan(
            apiError.problemMessage.offset,
            apiError.problemMessage.offset + apiError.problemMessage.length,
          ),
        );
      }
      return null;
    }

    final library = apiLibraryResult.element;
    final libraryMetdata = _collectApiMetadata(library, hasAuth: hasAuth);
    final apiExceptionTypes = _collectExceptionTypes(library);
    final functions = Map.fromEntries(
      (await library.topLevelElements
              .whereType<FunctionElement>()
              .asyncMap((func) async {
        if (func.isPrivate) {
          return null;
        }

        final functionMetadata = _collectApiMetadata(func, hasAuth: hasAuth);
        final applicableAuth = _applicableAuth(
          apiMetadata: libraryMetdata,
          functionMetadata: functionMetadata,
        );
        final returnType = func.returnType;
        final function = ast.CloudFunction(
          name: func.name,
          apiName: apiName,
          typeParameters: await func.typeParameters.asyncMap((type) async {
            final typeRef = typeHelper.toReference(
              type.instantiate(nullabilitySuffix: NullabilitySuffix.none),
            );
            final bound = type.bound;
            if (bound == null) {
              // Will be caught in serializer.
              // TODO(dnys1): Verify that generics are used in parameters/returns
              return typeRef;
            }
            final hasAllowedSubtypes = await bound.hasAllowedSubtypes();
            if (!hasAllowedSubtypes.allowed) {
              final disallowedTypes = hasAllowedSubtypes.disallowedTypes
                  .map((type) => type.element.name)
                  .join(', ');
              _reportError(
                'Classes with subtypes (which are not sealed classes) are not '
                'currently supported as bounds. Disallowed subtypes: '
                '$disallowedTypes',
                location: type.sourceLocation,
              );
            }
            return typeRef;
          }),
          parameters: await func.parameters.asyncMap((param) async {
            final paramType = param.type;
            final paramTypeRef = typeHelper.toReference(paramType);
            final paramLoc = param.sourceLocation;
            if (paramType.element case final InterfaceElement interface) {
              _ensureClientReferenceable(
                interface,
                paramLoc,
                type: CustomType.model,
              );
            }
            final parameter = ast.CloudFunctionParameter(
              name: param.name,
              type: paramTypeRef,
              required: param.isRequired,
              named: param.isNamed,
              location: paramLoc,
              references: _parameterReference(
                param,
                applicableAuth: applicableAuth,
              ),
              annotations: param.metadata
                  .map((annotation) => annotation.toCodeBuilder)
                  .nonNulls
                  .toList(),
              defaultTo: param.defaultTo,
            );
            if (parameter.name.startsWith(r'$')) {
              // Ensures that we can have all local variables in the generated
              // client start with `$` without conflicting with parameter names
              // and no one should absolutely need to do this anyway.
              _reportError(
                r'Parameter names may not start with a dollar sign (`$`)',
                location: parameter.location,
              );
            }
            if (parameter.type.isFunctionContext) {
              return parameter;
            }
            // Check must happen before `isSerializable`
            final hasAllowedSubtypes = await param.type.hasAllowedSubtypes();
            if (!hasAllowedSubtypes.allowed) {
              final disallowedTypes = hasAllowedSubtypes.disallowedTypes
                  .map((type) => type.element.name)
                  .join(', ');
              _reportError(
                'Classes with subtypes (which are not sealed classes) are not '
                'currently supported as parameters. Disallowed subtypes: '
                '$disallowedTypes',
                location: parameter.location,
              );
            }
            final parameterTypeVerdict = typeHelper.isSerializable(paramType);
            if (!parameterTypeVerdict.isSerializable) {
              for (final reason in parameterTypeVerdict.reasons) {
                _reportError(
                  'The type of a parameter must be serializable as JSON. $reason',
                  location: switch (reason.location) {
                    final reasonLoc? =>
                      parameter.location.safeExpand(reasonLoc),
                    _ => parameter.location,
                  },
                );
              }
            }
            return parameter;
          }),
          returnType: typeHelper.toReference(returnType),
          flattenedReturnType: typeHelper.toReference(returnType.flattened),
          location: func.sourceLocation,
          metadata: functionMetadata,
          annotations: func.metadata
              .map((annotation) => annotation.toCodeBuilder)
              .nonNulls
              .toList(),
          docs: func.docLines,
        );

        if (func.returnType.element case final InterfaceElement interface) {
          _ensureClientReferenceable(
            interface,
            func.sourceLocation,
            type: CustomType.model,
          );
        }

        var hasContext = false;
        for (final param in function.parameters) {
          if (param.type.isFunctionContext) {
            if (hasContext) {
              _reportError(
                'A FunctionContext parameter may only be specified once',
                location: param.location,
              );
            }
            hasContext = true;
          }
        }
        // Check must happen before `isSerializable`
        final hasAllowedSubtypes =
            await returnType.flattened.hasAllowedSubtypes();
        if (!hasAllowedSubtypes.allowed) {
          final disallowedTypes = hasAllowedSubtypes.disallowedTypes
              .map((type) => type.element.name)
              .join(', ');
          _reportError(
            'Classes with subtypes (which are not sealed classes) are not '
            'currently supported as return types. Disallowed subtypes: '
            '$disallowedTypes',
            location: function.location,
          );
        }
        final returnTypeVerdict = switch (returnType.flattened) {
          VoidType() => const Verdict.yes(),
          final flattened => typeHelper.isSerializable(flattened),
        };
        if (!returnTypeVerdict.isSerializable) {
          for (final reason in returnTypeVerdict.reasons) {
            _reportError(
              'The return type of a function must be serializable as JSON. $reason',
              location: switch (reason.location) {
                final reasonLoc? => function.location.safeExpand(reasonLoc),
                _ => function.location,
              },
            );
          }
        }
        return MapEntry(function.name, function);
      }))
          .nonNulls,
    );
    return ast.Api(
      name: apiName,
      location: SourceFile.fromString(
        library.source.contents.data,
        url: library.source.uri,
      ).span(0, 0),
      metadata: libraryMetdata,
      functions: functions,
      docs: library.docLines,
      exceptionTypes: apiExceptionTypes.map(typeHelper.toReference),
    );
  }

  Future<bool> _collectAuth() async {
    final authFilepath = projectPaths.authDart;
    final authFile = fileSystem.file(authFilepath);
    if (!authFile.existsSync()) {
      return false;
    }

    final authLibrary = await _resolveLibrary(authFile.path);
    final authErrors = authLibrary.units
        .expand((unit) => unit.errors)
        .where((error) => error.severity == Severity.error)
        .toList();
    if (authErrors.isNotEmpty) {
      for (final authError in authErrors) {
        _reportError(
          authError.message,
          location: authError.source.toSpan(
            authError.problemMessage.offset,
            authError.problemMessage.offset + authError.problemMessage.length,
          ),
        );
      }
      return false;
    }

    final (topLevelConstants, hasErrors) =
        authLibrary.element.topLevelConstants(onError: _reportError);
    if (hasErrors) {
      return false;
    }
    final authDefinition =
        topLevelConstants.firstWhereOrNull((el) => el.element.type.isAuth);
    if (authDefinition == null) {
      // TODO(dnys1): Report error?
      _logger.finest('No `Auth` definition found in $authFilepath');
      return false;
    }

    final (
      element: authDefinitionElement,
      value: authDefinitionValue,
    ) = authDefinition;

    // Validate `auth` variable.
    final authDefinitionLocation = authDefinitionElement.sourceLocation;
    final authProviders =
        authDefinitionValue.getField('providers')?.toListValue();
    if (authProviders == null) {
      _reportError(
        'The `providers` field is required on `Auth` definitions',
        location: authDefinitionLocation,
      );
      return false;
    }
    if (authProviders.isEmpty) {
      _reportError(
        'At least one Auth provider must be specified in `providers`',
        location: authDefinitionLocation,
      );
      return false;
    }

    final uniqueAuthProviders = <ast.AuthProvider>{};
    for (final authProvider in authProviders) {
      final ast.AuthProviderType type;
      switch (authProvider.type) {
        case InterfaceType(isAuthProviderEmail: true):
          type = ast.AuthProviderType.email;
        default:
          _reportError(
            'Unknown auth provider type: ${authProvider.type}',
            location: authDefinitionLocation,
          );
          continue;
      }
      final astAuthProvider = ast.AuthProvider(
        type: type,
        location: authDefinitionLocation,
      );
      if (!uniqueAuthProviders.add(astAuthProvider)) {
        _reportError(
          'Duplicate auth provider: $type',
          location: authDefinitionLocation,
        );
      }
    }

    _project.auth
      ..location = authDefinitionLocation
      ..providers.addAll(uniqueAuthProviders);
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

extension TopLevelConstants on LibraryElement {
  static final _logger = Logger('TopLevelConstants');

  (List<TopLevelConstant>, bool hasErrors) topLevelConstants({
    required AnalysisErrorReporter onError,
  }) {
    var hasConstantEvalErrors = false;
    final topLevelConstants = <TopLevelConstant>[];
    final topLevelVariables = topLevelElements
        .whereType<TopLevelVariableElement>()
        .where((variable) => !variable.isPrivate);
    for (final topLevelVariable in topLevelVariables) {
      if (!topLevelVariable.isConst) {
        onError(
          'All top-level variables must be `const`',
          location: topLevelVariable.sourceLocation,
        );
        hasConstantEvalErrors = true;
        continue;
      }
      switch (topLevelVariable.computeConstantValue()) {
        case final DartObject constantValue:
          topLevelConstants.add(
            (element: topLevelVariable, value: constantValue),
          );
        default:
          onError(
            'Top-level constant could not be evaluated',
            location: topLevelVariable.sourceLocation,
          );
          hasConstantEvalErrors = true;
      }
    }
    _logger.finest(() {
      final constantInfo = {
        'hasConstantEvalErrors': '$hasConstantEvalErrors',
        'constants': {
          for (final constant in topLevelConstants)
            constant.element.name: {
              'type': constant.element.type.toString(),
              'value': constant.value.toString(),
            },
        },
      };
      return 'Resolved top-level constants in ${source.uri}: '
          '${prettyPrintJson(constantInfo)}';
    });
    return (topLevelConstants, hasConstantEvalErrors);
  }
}

typedef TopLevelConstant = ({
  TopLevelVariableElement element,
  DartObject value
});

extension on LibraryElementResult {
  DartType getClassType(String name) =>
      (element.exportNamespace.get(name) as ClassElement).thisType;
}

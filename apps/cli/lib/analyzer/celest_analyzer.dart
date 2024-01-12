// ignore_for_file: implementation_imports

import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/uri_converter.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer/src/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:analyzer/src/dart/analysis/search.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:analyzer/src/generated/source.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/list.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:source_span/source_span.dart';
import 'package:yaml/yaml.dart';

final class CelestAnalyzer {
  CelestAnalyzer._(
    this._context,
  );

  factory CelestAnalyzer() {
    final contextCollection = AnalysisContextCollectionImpl(
      includedPaths: [projectPaths.projectRoot],
      sdkPath: Sdk.current.sdkPath,
      // TODO(dnys1): Custom resource provider with Sentry integration and mock support?
      resourceProvider: PhysicalResourceProvider.INSTANCE,
      // Needed for [_collectSubtypes].
      enableIndex: true,
    );
    final context = contextCollection.contexts.first;
    return CelestAnalyzer._(context);
  }

  static final Logger _logger = Logger('CelestAnalyzer');
  final AnalysisContext _context;
  AnalysisDriver get _driver => (_context as DriverBasedAnalysisContext).driver;
  final List<AnalysisError> _errors = [];
  late _ScopedWidgetCollector _widgetCollector;
  late ast.ProjectBuilder _project;
  late final enabledExperiments = _loadEnabledExperiments(
    projectPaths.analysisOptionsYaml,
  );

  List<String> _loadEnabledExperiments(String path) {
    final analysisOptionsFile = fileSystem.file(path);
    if (!analysisOptionsFile.existsSync()) {
      _logger.finest('No analysis options file detected at $path');
      return const [];
    }
    final analysisOptionsContent = analysisOptionsFile.readAsStringSync();
    final analysisOptions = loadYamlDocument(analysisOptionsContent);
    final analysisOptionsMap = analysisOptions.contents.value;
    if (analysisOptionsMap is! YamlMap) {
      _logger.finer('Invalid analysis options file: $analysisOptionsContent');
      return const [];
    }
    final analyzerOptions = analysisOptionsMap.value['analyzer'];
    if (analyzerOptions is! YamlMap) {
      _logger.finer('No analyzer settings found');
      return const [];
    }
    final enabledExperiments = analyzerOptions.value['enable-experiment'];
    if (enabledExperiments is! YamlList) {
      _logger.finer('No enabled experiments found');
      return const [];
    }
    return enabledExperiments.value.cast<String>();
  }

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

  late final DartType _coreErrorType;
  late final DartType _coreExceptionType;

  late final _loadedCoreTypes = _loadCoreTypes();
  Future<void> _loadCoreTypes() async {
    final dartCore = await _context.currentSession.getLibraryByUri('dart:core')
        as LibraryElementResult;
    _coreExceptionType =
        (dartCore.element.exportNamespace.get('Exception') as ClassElement)
            .thisType;
    _coreErrorType =
        (dartCore.element.exportNamespace.get('Error') as ClassElement)
            .thisType;
  }

  Future<({ast.Project? project, List<AnalysisError> errors})> analyzeProject([
    List<String>? invalidatedFiles,
  ]) async {
    _errors.clear();
    if (invalidatedFiles != null) {
      for (final file in invalidatedFiles) {
        _context.changeFile(file);
      }
      await _context.applyPendingFileChanges();
    }
    await _loadedCoreTypes;
    final project = await _findProject();
    if (project == null) {
      return (project: null, errors: _errors);
    }
    _project = project;
    _widgetCollector = _ScopedWidgetCollector(
      errorReporter: _reportError,
    );
    _project.envVars.replace(projectPaths.envManager.envVars);
    await _collectApis();
    return (project: _project.build(), errors: _errors);
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
    if (!fileSystem.file(projectFilePath).existsSync()) {
      _reportError('No project file found at $projectFilePath');
      return null;
    }
    _logger.finer('Found project file at $projectFilePath');
    final projectFile = await _resolveLibrary(projectFilePath);
    _logger.finer('Resolved project file');
    typeHelper
      ..typeSystem = projectFile.element.typeSystem
      ..typeProvider = projectFile.typeProvider
      ..coreErrorType = _coreErrorType
      ..coreExceptionType = _coreExceptionType;
    // TODO: Some errors are okay, for example if `resources.dart` hasn't
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
    final topLevelVariables = projectFile.element.topLevelElements
        .whereType<TopLevelVariableElement>()
        .where((variable) => !variable.isPrivate);
    var hasConstantEvalErrors = false;
    final topLevelConstants =
        <({TopLevelVariableElement element, DartObject value})>[];
    for (final topLevelVariable in topLevelVariables) {
      if (!topLevelVariable.isConst) {
        _reportError(
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
          _reportError(
            'Top-level constant could not be evaluated',
            location: topLevelVariable.sourceLocation,
          );
          hasConstantEvalErrors = true;
      }
    }
    _logger.finest(
      () => 'Resolved top-level constants: ${prettyPrintJson({
            'hasConstantEvalErrors': '$hasConstantEvalErrors',
            'constants': {
              for (final constant in topLevelConstants)
                constant.element.name: {
                  'type': constant.element.type.toString(),
                  'value': constant.value.toString(),
                },
            },
          })}',
    );
    if (hasConstantEvalErrors) {
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
      ..location = projectDefineLocation;
  }

  List<ast.ApiMetadata> _collectApiMetadata(Element element) {
    var hasAuth = false;
    return element.metadata
        .map((annotation) {
          final location = annotation.sourceLocation(element.source!);
          final type = annotation.computeConstantValue()?.type;
          if (type == null) {
            _reportError('Could not resolve annotation', location: location);
            return null;
          }

          void assertSingleAuth() {
            if (hasAuth) {
              _reportError(
                'Only one `api.authenticated` or `api.public` annotation '
                'may be specified on the same function or API library.',
                location: location,
              );
            }
            hasAuth = true;
          }

          switch (type) {
            case _ when type.isApiAuthenticated:
              assertSingleAuth();
              return ast.ApiAuthenticated(location: location);
            case _ when type.isApiPublic:
              assertSingleAuth();
              return ast.ApiPublic(location: location);
            case _ when type.isMiddleware:
              return ast.ApiMiddleware(
                type: typeHelper.toReference(type),
                location: location,
              );
            default:
              _reportError('Invalid API annotation', location: location);
              return null;
          }
        })
        .nonNulls
        .toList();
  }

  ast.NodeReference? _parameterReference(ParameterElement parameter) {
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
    if (!annotationType.isEnvironmentVariable) {
      _reportError('Invalid parameter annotation', location: location);
      return null;
    }
    final typeProvider = parameter.library!.typeProvider;
    final validEnvTypes = TypeChecker.any([
      TypeChecker.fromStatic(typeProvider.stringType),
      TypeChecker.fromStatic(typeProvider.numType),
      TypeChecker.fromStatic(typeProvider.intType),
      TypeChecker.fromStatic(typeProvider.doubleType),
      TypeChecker.fromStatic(typeProvider.boolType),
    ]);
    if (!validEnvTypes.isExactlyType(parameter.type)) {
      _reportError(
        'The type of an environment variable parameter must be one of: '
        '`String`, `int`, `double`, `num`, or `bool`',
        location: parameter.sourceLocation,
      );
      return null;
    }
    final name = value.getField('name')?.toStringValue();
    if (name == null) {
      _reportError(
        'The `name` field is required on `EnvironmentVariable` annotations',
        location: annotation.element?.sourceLocation ?? location,
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
        location: annotation.element?.sourceLocation ?? location,
      );
      return null;
    }
    return ast.NodeReference(
      type: ast.NodeType.environmentVariable,
      name: name,
    );
  }

  Future<void> _collectApis() async {
    final apiDir = Directory(projectPaths.apisDir);
    if (!apiDir.existsSync()) {
      return;
    }

    final apiFiles = apiDir
        .listSync()
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
      );
      if (baseApi == null) {
        return;
      }
      _project.apis.update(
        (apis) => apis[apiName] = baseApi,
      );
    }
  }

  /// Collects all subtypes of the given [type].
  Future<List<DartType>> _collectSubtypes(InterfaceElement element) async {
    final searchedFiles = SearchedFiles();
    final subtypes = await _driver.search.subTypes(element, searchedFiles);
    return subtypes
        .where((res) {
          return switch (res.kind) {
            SearchResultKind.REFERENCE_IN_EXTENDS_CLAUSE ||
            SearchResultKind.REFERENCE_IN_IMPLEMENTS_CLAUSE ||
            SearchResultKind.REFERENCE_IN_ON_CLAUSE ||
            SearchResultKind.REFERENCE_IN_WITH_CLAUSE =>
              true,
            _ => false,
          };
        })
        .map((res) => (res.enclosingElement as InterfaceElement).thisType)
        .toList();
  }

  /// Ensures custom [type]s (e.g. those defined in the current project), have
  /// allowed subtypes.
  ///
  /// Currently, only `sealed` classes are allowed to have subtypes.
  Future<bool> _hasAllowedSubtypes(DartType type) async {
    if (type is! InterfaceType) {
      return true;
    }
    final element = type.element;
    var hasAllowedSubtypes = true;
    // Recurse into type arguments before processing this wrapper, e.g. [type]
    // could be List<T> where T is of interest.
    for (final typeArgument in type.typeArguments) {
      hasAllowedSubtypes &= await _hasAllowedSubtypes(typeArgument);
    }
    final libraryUri = type.element.librarySource.uri;
    final libraryPath =
        _context.currentSession.uriConverter.uriToPath(libraryUri);
    if (libraryPath == null) {
      _logger.finest('Could not resolve path for URI: $libraryUri');
      return true;
    }
    if (!p.isWithin(projectPaths.projectRoot, libraryPath)) {
      return true;
    }
    final subtypes =
        typeHelper.subtypes[element] ??= await _collectSubtypes(element);
    for (final subtype in subtypes) {
      hasAllowedSubtypes &= await _hasAllowedSubtypes(subtype);
    }
    if (element is ClassElement && element.isSealed) {
      return hasAllowedSubtypes && subtypes.isNotEmpty;
    }
    return hasAllowedSubtypes && subtypes.isEmpty;
  }

  Future<ast.Api?> _collectApi({
    required String apiName,
    required String apiFile,
  }) async {
    final apiLibraryResult = await _resolveLibrary(apiFile);
    final library = apiLibraryResult.element;
    final libraryMetdata = _collectApiMetadata(library);
    final functions = Map.fromEntries(
      (await library.topLevelElements
              .whereType<FunctionElement>()
              .asyncMap((func) async {
        if (func.isPrivate) {
          return null;
        }

        final funcNode = apiLibraryResult.getElementDeclaration(func)!.node;
        final exceptionCollector = ExceptionTypeCollector(
          source: library.source,
          uriConverter: _context.currentSession.uriConverter,
          errorReporter: _reportError,
        );
        funcNode.accept(exceptionCollector);
        final exceptionTypes = exceptionCollector.exceptionTypes;
        // These are supported but are handled by the common runtime.
        exceptionTypes.removeAll([
          _coreErrorType,
          _coreExceptionType,
        ]);
        for (final exceptionType in exceptionTypes) {
          final isSerializable = typeHelper.isSerializable(exceptionType);
          if (!isSerializable.isSerializable) {
            for (final reason in isSerializable.reasons) {
              _reportError(
                'The type of a thrown exception must be serializable as JSON. '
                '$exceptionType is not serializable: $reason',
                location:
                    exceptionCollector.exceptionTypeLocations[exceptionType],
              );
            }
          }
        }

        final function = ast.CloudFunction(
          name: func.name,
          apiName: apiName,
          parameters: await func.parameters.asyncMap((param) async {
            final parameter = ast.CloudFunctionParameter(
              name: param.name,
              type: typeHelper.toReference(param.type),
              required: param.isRequired,
              named: param.isNamed,
              location: param.sourceLocation,
              references: _parameterReference(param),
            );
            if (parameter.type.isFunctionContext) {
              return parameter;
            }
            // Check must happen before `isSerializable`
            if (!await _hasAllowedSubtypes(param.type)) {
              _reportError(
                'Classes with subtypes (which are not sealed classes) are not '
                'currently supported as parameters',
                location: parameter.location,
              );
            }
            final parameterTypeVerdict = typeHelper.isSerializable(param.type);
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
          returnType: typeHelper.toReference(func.returnType),
          flattenedReturnType:
              typeHelper.toReference(func.returnType.flattened),
          exceptionTypes: exceptionTypes.map(typeHelper.toReference).toList(),
          location: func.sourceLocation,
          metadata: _collectApiMetadata(func),
        );

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
        final returnType = func.returnType;
        // Check must happen before `isSerializable`
        if (!await _hasAllowedSubtypes(returnType.flattened)) {
          _reportError(
            'Classes with subtypes (which are not sealed classes) are not '
            'currently supported as return types',
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
    );
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

final class ExceptionTypeCollector extends RecursiveAstVisitor<void> {
  ExceptionTypeCollector({
    required this.source,
    required this.uriConverter,
    required this.errorReporter,
  });

  final Source source;
  final UriConverter uriConverter;
  final Set<DartType> exceptionTypes = {};
  final Map<DartType, FileSpan> exceptionTypeLocations = {};
  final AnalysisErrorReporter errorReporter;

  static final _logger = Logger('ExceptionTypeCollector');

  @override
  void visitMethodInvocation(MethodInvocation node) {
    // TODO(dnys1): Support recursion into methods outside the library.
    super.visitMethodInvocation(node);
    // final functionElement = switch (node.function) {
    //   final SimpleIdentifier identifier => identifier.staticElement,
    //   _ => null,
    // } as ExecutableElement?;
    // if (functionElement == null) {
    //   print('Unknown function element: ${node.function.runtimeType}');
    //   return;
    // }
    // if (functionElement.librarySource.uri !=
    //     unit.declaredElement!.librarySource.uri) {
    //   final resolvedLibrary =
    //       await session.getResolvedLibraryByElement(functionElement.library)
    //           as ResolvedLibraryResult;
    //   await resolvedLibrary
    //       .getElementDeclaration(functionElement)!
    //       .node
    //       .accept(this);
    // }
  }

  @override
  void visitThrowExpression(ThrowExpression node) {
    super.visitThrowExpression(node);
    final staticType = node.expression.staticType;
    if (staticType == null) {
      errorReporter(
        'Could not resolve thrown type',
        location: node.sourceLocation(source),
      );
      return;
    }
    if (!staticType.isThrowable) {
      errorReporter(
        'The type of a thrown expression must be a subtype of `Error` or `Exception`',
        location: node.sourceLocation(source),
      );
      return;
    }
    final staticTypeString =
        staticType.getDisplayString(withNullability: false);
    final libraryUri = staticType.element?.librarySource?.uri;
    if (libraryUri == null) {
      _logger.finest(
        'Could not resolve library URI of type: $staticTypeString',
      );
      return;
    }
    final libraryPath = uriConverter.uriToPath(libraryUri);
    if (libraryPath == null) {
      _logger.finest(
        'Could not resolve library path of type: $staticTypeString',
      );
      return;
    }
    if (!p.isWithin(projectPaths.projectRoot, libraryPath)) {
      _logger.finest('Skipping non-custom error type: $staticTypeString');
      return;
    }
    exceptionTypeLocations[staticType] = node.sourceLocation(source);
    exceptionTypes.add(staticType);
  }
}

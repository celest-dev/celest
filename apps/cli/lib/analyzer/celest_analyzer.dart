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
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:analyzer/src/generated/source.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
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

  String get expectedPath => switch (this) {
        CustomType.model => ClientPaths.models,
        CustomType.exception => ClientPaths.exceptions,
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

  Future<void> init() => _initFuture ??= _init();

  Future<void>? _initFuture;
  Future<void> _init() async {
    final dartCore = await _context.currentSession.getLibraryByUri('dart:core')
        as LibraryElementResult;
    typeHelper.coreExceptionType =
        (dartCore.element.exportNamespace.get('Exception') as ClassElement)
            .thisType;
    typeHelper.coreErrorType =
        (dartCore.element.exportNamespace.get('Error') as ClassElement)
            .thisType;
    final celestCore = await _context.currentSession
            .getLibraryByUri('package:celest_core/celest_core.dart')
        as LibraryElementResult;
    typeHelper.badRequestExceptionType = (celestCore.element.exportNamespace
            .get('BadRequestException') as ClassElement)
        .thisType;
    typeHelper.internalServerExceptionType = (celestCore.element.exportNamespace
            .get('InternalServerException') as ClassElement)
        .thisType;
  }

  LibraryElementResult? _modelsLibrary;
  LibraryElementResult? _exceptionsLibrary;

  Future<void> _initTypeLibraries() async {
    try {
      _modelsLibrary = await _context.currentSession.getLibraryByUri(
        Uri.file(CustomType.model.expectedPath).toString(),
      ) as LibraryElementResult;
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
      _modelsLibrary = null;
    }
    try {
      _exceptionsLibrary = await _context.currentSession.getLibraryByUri(
        Uri.file(CustomType.exception.expectedPath).toString(),
      ) as LibraryElementResult;
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
      _exceptionsLibrary = null;
    }
  }

  Future<CelestAnalysisResult> analyzeProject({
    bool updateResources = true,
  }) async {
    _errors.clear();
    await init();
    await _initTypeLibraries();
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

    await _collectApis();
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
      ..sdkInfo.replace(
        SdkInfo(
          sdkVersion: Version.parse(Sdk.current.version),
          enabledExperiments: celestProject.analysisOptions.enabledExperiments,
        ),
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
            // TODO(dnys1): Add separate `hints` parameter to `_reportError`
            /// for suggestions on how to resolve the error/links to docs.
            _reportError(
              'Could not resolve annotation. Annotations must be '
              'authorization grants like `@api.authenticated()` or '
              '`@api.public()`.',
              location: location,
            );
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
              // return ast.ApiMiddleware(
              //   type: typeHelper.toReference(type),
              //   location: location,
              // );
              throw unreachable();
            default:
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
      return null;
    }
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
  }

  Future<void> _collectApis() async {
    final apiDir = Directory(projectPaths.apisDir);
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
    Reference reference,
    SourceSpan location, {
    required CustomType type,
  }) {
    final url = reference.url;
    final symbol = reference.symbol;
    if (url == null || symbol == null) {
      return;
    }
    final uri = Uri.parse(url);
    if (uri.scheme == 'dart') {
      return;
    }
    final filepath = switch (uri.scheme) {
      'package' => _context.currentSession.uriConverter.uriToPath(uri),
      _ => projectPaths.denormalizeUri(uri).toFilePath(),
    };
    if (filepath == null) {
      performance.captureError(
        'Could not resolve URI: $uri',
        stackTrace: StackTrace.current,
      );
      return;
    }
    if (symbol.startsWith('_')) {
      // Private types are reported elsewhere.
      return;
    }
    final element = switch (type) {
      CustomType.model => _modelsLibrary?.element.exportNamespace.get(symbol),
      CustomType.exception =>
        _exceptionsLibrary?.element.exportNamespace.get(symbol),
    };
    if (element == null) {
      final expectedPath = p
          .relative(
            type.expectedPath,
            from: projectPaths.projectRoot,
          )
          .to(p.url);
      _reportError(
        'Types referenced in APIs must be defined in the `celest/$expectedPath`'
        ' file or exported from that file.',
        location: location,
      );
    }
  }

  Future<ast.Api?> _collectApi({
    required String apiName,
    required String apiFile,
  }) async {
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
          typeHelper.coreErrorType,
          typeHelper.coreExceptionType,
        ]);
        for (final exceptionType in exceptionTypes) {
          final exceptionTypeLoc =
              exceptionCollector.exceptionTypeLocations[exceptionType]!;
          _ensureClientReferenceable(
            typeHelper.toReference(exceptionType),
            exceptionTypeLoc,
            type: CustomType.exception,
          );
          final isSerializable = typeHelper.isSerializable(exceptionType);
          if (!isSerializable.isSerializable) {
            for (final reason in isSerializable.reasons) {
              _reportError(
                'The type of a thrown exception must be serializable as JSON. '
                '$exceptionType is not serializable: $reason',
                location: exceptionTypeLoc,
              );
            }
          }
        }

        final function = ast.CloudFunction(
          name: func.name,
          apiName: apiName,
          parameters: await func.parameters.asyncMap((param) async {
            final paramType = typeHelper.toReference(param.type);
            final paramLoc = param.sourceLocation;
            _ensureClientReferenceable(
              paramType,
              paramLoc,
              type: CustomType.model,
            );
            final parameter = ast.CloudFunctionParameter(
              name: param.name,
              type: paramType,
              required: param.isRequired,
              named: param.isNamed,
              location: paramLoc,
              references: _parameterReference(param),
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
          annotations: func.metadata
              .map((annotation) => annotation.toCodeBuilder)
              .nonNulls
              .toList(),
          docs: func.docLines,
        );

        _ensureClientReferenceable(
          typeHelper.toReference(func.returnType),
          func.sourceLocation,
          type: CustomType.model,
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

import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:yaml/yaml.dart';

typedef ErrorReporter = void Function(String message, SourceLocation location);

final class CelestAnalyzer {
  CelestAnalyzer._(
    this._context,
  );

  factory CelestAnalyzer() {
    final contextCollection = AnalysisContextCollection(
      includedPaths: [projectPaths.projectRoot],
      sdkPath: Sdk.current.sdkPath,
      // TODO(dnys1): Custom resource provider with Sentry integration and mock support?
      resourceProvider: PhysicalResourceProvider.INSTANCE,
    );
    final context = contextCollection.contexts.single;
    return CelestAnalyzer._(context);
  }

  static final Logger _logger = Logger('CelestAnalyzer');
  final AnalysisContext _context;
  final List<AnalysisException> _errors = [];
  late _ScopedWidgetCollector _widgetCollector;
  late ast.ProjectBuilder _project;
  final TypeHelper typeHelper = TypeHelper();
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

  void _reportError(String error, SourceLocation location) {
    _errors.add(
      AnalysisException(
        message: error,
        location: location,
      ),
    );
  }

  Future<({ast.Project? project, List<AnalysisException> errors})>
      analyzeProject([List<String>? invalidatedFiles]) async {
    _errors.clear();
    if (invalidatedFiles != null) {
      for (final file in invalidatedFiles) {
        _context.changeFile(file);
      }
      await _context.applyPendingFileChanges();
    }
    final project = await _findProject();
    if (project == null) {
      return (project: null, errors: _errors);
    }
    _project = project;
    _widgetCollector = _ScopedWidgetCollector(
      errorReporter: _reportError,
    );
    _project.envVars.replace(
      projectPaths.envManager.env.keys.map(ast.EnvironmentVariable.new),
    );
    await _collectApis();
    return (project: _project.build(), errors: _errors);
  }

  Future<ast.ProjectBuilder?> _findProject() async {
    _logger.fine('Analyzing project...');
    final projectFilePath = projectPaths.projectDart;
    if (!fileSystem.file(projectFilePath).existsSync()) {
      _reportError(
        'No project file found at $projectFilePath',
        SourceLocation(
          uri: projectFilePath,
          line: 0,
          column: 0,
        ),
      );
      return null;
    }
    _logger.finer('Found project file at $projectFilePath');
    final projectFile =
        await _context.currentSession.getResolvedUnit(projectFilePath);
    if (projectFile is! ResolvedUnitResult || !projectFile.exists) {
      _reportError(
        'Could not resolve project file',
        SourceLocation(
          uri: projectFilePath,
          line: 0,
          column: 0,
        ),
      );
      return null;
    }
    _logger.finer('Resolved project file');
    typeHelper
      ..typeSystem = projectFile.typeSystem
      ..typeProvider = projectFile.typeProvider;
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
    final topLevelVariables = projectFile
        .unit.declaredElement!.topLevelVariables
        .where((variable) => !variable.isPrivate);
    var hasConstantEvalErrors = false;
    final topLevelConstants =
        <({TopLevelVariableElement element, DartObject value})>[];
    for (final topLevelVariable in topLevelVariables) {
      if (!topLevelVariable.isConst) {
        _reportError(
          'All top-level variables must be `const`',
          topLevelVariable.sourceLocation,
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
            topLevelVariable.sourceLocation,
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
      _reportError(
        'No `Project` type found',
        SourceLocation(
          uri: projectFilePath,
          line: 0,
          column: 0,
        ),
      );
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
        projectDefineLocation,
      );
    }
    _logger.finer('Resolved project name: $projectName');

    return ast.ProjectBuilder()
      ..name = projectName
      ..reference = refer(
        projectDefinitionElement.name,
        projectPaths.normalizeUri(p.toUri(projectFilePath)).toString(),
      )
      ..location.replace(projectDefineLocation);
  }

  List<ast.ApiMetadata> _collectApiMetadata(Element element) {
    var hasAuth = false;
    return element.metadata
        .map((annotation) {
          final location = annotation.sourceLocation(element.source!);
          final type = annotation.computeConstantValue()?.type;
          if (type == null) {
            _reportError('Could not resolve annotation', location);
            return null;
          }

          void assertSingleAuth() {
            if (hasAuth) {
              _reportError(
                'Only one `api.authenticated` or `api.public` annotation '
                'may be specified on the same function or API library.',
                location,
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
              _reportError('Invalid API annotation', location);
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
        annotations[1].sourceLocation(parameter.source!),
      );
      return null;
    }
    final annotation = annotations.single;
    final location = annotation.sourceLocation(parameter.source!);
    final value = annotation.computeConstantValue();
    final annotationType = value?.type;
    if (annotationType == null) {
      _reportError('Could not resolve annotation', location);
      return null;
    }
    if (annotationType.isEnvironmentVariable) {
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
          location,
        );
        return null;
      }
      final name = value?.getField('name')?.toStringValue();
      if (name == null) {
        _reportError(
          'The `name` field is required on `EnvironmentVariable` annotations',
          location,
        );
        return null;
      }
      const reservedEnvVars = ['PORT'];
      if (reservedEnvVars.contains(name)) {
        _reportError(
          'The environment variable name `$name` is reserved by Celest',
          location,
        );
        return null;
      }
      if (_project.envVars.build().none((envVar) => envVar.envName == name)) {
        _reportError(
          'The environment variable `$name` does not exist',
          location,
        );
        return null;
      }
      return ast.NodeReference(
        type: ast.NodeType.environmentVariable,
        name: name,
      );
    }
    _reportError('Invalid parameter annotation', location);
    return null;
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

  Future<ast.Api?> _collectApi({
    required String apiName,
    required String apiFile,
  }) async {
    final apiLibraryResult =
        await _context.currentSession.getResolvedLibrary(apiFile);
    if (apiLibraryResult is! ResolvedLibraryResult) {
      _reportError(
        'Could not resolve API file',
        SourceLocation(uri: apiFile, line: 0, column: 0),
      );
      return null;
    }
    final library = apiLibraryResult.element;
    final libraryMetdata = _collectApiMetadata(library);
    final functions = Map.fromEntries(
      library.topLevelElements.whereType<FunctionElement>().map((func) {
        if (func.isPrivate) {
          return null;
        }

        final function = ast.CloudFunction(
          name: func.name,
          apiName: apiName,
          parameters: func.parameters.map((param) {
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
            final parameterTypeVerdict = typeHelper.isSerializable(param.type);
            if (!parameterTypeVerdict.isSerializable) {
              for (final reason in parameterTypeVerdict.reasons) {
                _reportError(
                  'The type of a parameter must be serializable as JSON. $reason',
                  parameter.location,
                );
              }
            }
            return parameter;
          }).toList(),
          returnType: typeHelper.toReference(func.returnType),
          flattenedReturnType:
              typeHelper.toReference(func.returnType.flattened),
          location: func.sourceLocation,
          metadata: _collectApiMetadata(func),
        );

        var hasContext = false;
        for (final param in function.parameters) {
          if (param.type.isFunctionContext) {
            if (hasContext) {
              _reportError(
                'A FunctionContext parameter may only be specified once',
                param.location,
              );
            }
            hasContext = true;
          }
        }
        final returnType = func.returnType;
        final returnTypeVerdict = switch (returnType.flattened) {
          VoidType() => const Verdict.yes(),
          final flattened => typeHelper.isSerializable(flattened),
        };
        if (!returnTypeVerdict.isSerializable) {
          for (final reason in returnTypeVerdict.reasons) {
            _reportError(
              'The return type of a function must be serializable as JSON. $reason',
              function.location,
            );
          }
        }
        return MapEntry(function.name, function);
      }).nonNulls,
    );
    return ast.Api(
      name: apiName,
      metadata: libraryMetdata,
      functions: functions,
    );
  }
}

final class AnalysisException implements Exception {
  const AnalysisException({
    required this.message,
    required this.location,
  });

  final String message;
  final SourceLocation location;

  @override
  String toString() {
    return '${location.uri}:${location.line}:${location.column}: $message';
  }
}

final class _ScopedWidgetCollector {
  _ScopedWidgetCollector({
    required this.errorReporter,
  });

  final ErrorReporter errorReporter;

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
            SourceLocation(uri: file, line: 0, column: 0),
          );
          continue;
      }
    }
    return declarations;
  }
}

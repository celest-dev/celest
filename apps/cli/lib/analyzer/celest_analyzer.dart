import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:yaml/yaml.dart';

typedef ErrorReporter = void Function(String message, SourceLocation location);

final class CelestAnalyzer {
  CelestAnalyzer._(
    this._projectPaths,
    this._context,
  );

  factory CelestAnalyzer({
    required ProjectPaths projectPaths,
  }) {
    final contextCollection = AnalysisContextCollection(
      includedPaths: [projectPaths.projectRoot],
      sdkPath: Sdk.current.sdkPath,
    );
    final context = contextCollection.contexts.single;
    return CelestAnalyzer._(
      projectPaths,
      context,
    );
  }

  static final Logger _logger = Logger('CelestAnalyzer');
  final ProjectPaths _projectPaths;
  final AnalysisContext _context;
  final List<AnalysisException> _errors = [];
  late _ScopedWidgetCollector _widgetCollector;
  late ast.ProjectBuilder _project;
  final TypeHelper typeHelper = TypeHelper();
  late final enabledExperiments = _loadEnabledExperiments(
    _projectPaths.analysisOptionsYaml,
  );

  List<String> _loadEnabledExperiments(String path) {
    final analysisOptionsFile = File(path);
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
      analyzeProject() async {
    _errors.clear();
    final project = await _findProject();
    if (project == null) {
      return (project: null, errors: _errors);
    }
    _project = project;
    _widgetCollector = _ScopedWidgetCollector(
      errorReporter: _reportError,
    );
    await _collectApis();
    await _collectEnv();
    return (project: _project.build(), errors: _errors);
  }

  Future<ast.ProjectBuilder?> _findProject() async {
    _logger.fine('Analyzing project...');
    final projectFilePath = _projectPaths.projectDart;
    if (!File(projectFilePath).existsSync()) {
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
        _projectPaths.normalizeUri(p.toUri(projectFilePath)).toString(),
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
                'Only one `api.authenticated` or `api.anonymous` annotation '
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
            case _ when type.isApiAnonymous:
              assertSingleAuth();
              return ast.ApiAnonymous(location: location);
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

  Future<void> _collectApis() async {
    final apiDir = Directory(_projectPaths.apisDir);
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

  Future<void> _collectEnv() async {
    final envDir = Directory(_projectPaths.configDir);
    if (!envDir.existsSync()) {
      _logger.finer('No config directory found. Skipping env collection.');
      return;
    }

    final envFiles = envDir
        .listSync()
        .whereType<File>()
        .map((file) => file.path)
        .where(
          (path) =>
              p.basename(path).startsWith('env') && path.endsWith('.dart'),
        )
        .toList();
    _logger.finest('Found ${envFiles.length} env files: $envFiles');
    final envDeclarations = _widgetCollector.collect(
      envFiles,
      scope: 'Environment variable',
      placeholder: 'env',
    );
    assert(
      envDeclarations.length == 1,
      'There should only ever be one env collected, even with multiple '
      'environment overridees.',
    );
    for (final path in envDeclarations.values) {
      _logger.finer('Collecting base env from $path');
      final envVars = await _collectEnvironmentVariables(path);
      _logger.finer('Collected base env vars: $envVars');
      _project.envVars.addAll(envVars);
    }
  }

  Future<List<ast.EnvironmentVariable>> _collectEnvironmentVariables(
    String path,
  ) async {
    final envLibraryResult =
        await _context.currentSession.getResolvedLibrary(path);
    if (envLibraryResult is! ResolvedLibraryResult) {
      _reportError(
        'Could not resolve environment variable file',
        SourceLocation(uri: path, line: 0, column: 0),
      );
      return [];
    }
    final library = envLibraryResult.element;
    final topLevelVariables = library.definingCompilationUnit.topLevelVariables
        .where((variable) => !variable.isPrivate);
    final topLevelConstants =
        <({TopLevelVariableElement element, DartObject value})>[];
    for (final topLevelVariable in topLevelVariables) {
      if (!topLevelVariable.isConst) {
        _reportError(
          'Environment variables must be declared as `const`',
          topLevelVariable.sourceLocation,
        );
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
      }
    }
    final envVars = <ast.EnvironmentVariable>[];
    final seenEnvNames = <String>{};
    for (final topLevelConstant in topLevelConstants) {
      if (!topLevelConstant.element.type.isEnvironmentVariable) {
        _reportError(
          'Only environment variables can be declared in this file.',
          topLevelConstant.element.sourceLocation,
        );
        continue;
      }
      final location = topLevelConstant.element.sourceLocation;
      final dartName = topLevelConstant.element.name;
      final envName = topLevelConstant.value.getField('name')?.toStringValue();
      if (envName == null) {
        _reportError(
          'Environment variable value could not be evaluated',
          location,
        );
        continue;
      }
      if (envName.isEmpty) {
        _reportError(
          'The environment variable name cannot be empty.',
          location,
        );
        continue;
      }
      if (!seenEnvNames.add(envName)) {
        _reportError(
          'Duplicate environment variable name: "$envName"',
          location,
        );
        continue;
      }
      envVars.add(
        ast.EnvironmentVariable(
          dartName: dartName,
          envName: envName,
          location: location,
        ),
      );
    }
    return envVars;
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

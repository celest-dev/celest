import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/element/element.dart';
// ignore: implementation_imports
import 'package:analyzer/src/generated/source.dart';
import 'package:built_collection/built_collection.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:celest_cli/serialization/checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;

final class CelestAnalyzer {
  CelestAnalyzer._(this._projectPaths, this._context);

  factory CelestAnalyzer({
    required ProjectPaths projectPaths,
  }) {
    final contextCollection = AnalysisContextCollection(
      includedPaths: [projectPaths.projectRoot],
    );
    final context = contextCollection.contexts.single;
    return CelestAnalyzer._(projectPaths, context);
  }

  final ProjectPaths _projectPaths;
  final AnalysisContext _context;
  final List<AnalysisException> _errors = [];

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
    var project = await _findProject();
    if (project == null) {
      return (project: null, errors: _errors);
    }
    project = await _collectApis(project);
    return (project: project.build(), errors: _errors);
  }

  Future<ast.ProjectBuilder?> _findProject() async {
    final projectFilePath = _projectPaths.projectDart;
    final projectFileRelativePath =
        _projectPaths.relativeToRoot(projectFilePath);
    if (!File(projectFilePath).existsSync()) {
      _reportError(
        'No project file found at ${_projectPaths.relativeToRoot(projectFilePath)}',
        SourceLocation(
          path: projectFileRelativePath,
          line: 0,
          column: 0,
        ),
      );
      return null;
    }
    final projectFile =
        await _context.currentSession.getResolvedUnit(projectFilePath);
    if (projectFile is! ResolvedUnitResult) {
      _reportError(
        'Could not resolve project file',
        SourceLocation(
          path: projectFileRelativePath,
          line: 0,
          column: 0,
        ),
      );
      return null;
    }
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
          topLevelVariable.sourceLocation(_projectPaths.projectRoot),
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
            topLevelVariable.sourceLocation(_projectPaths.projectRoot),
          );
          hasConstantEvalErrors = true;
      }
    }
    if (hasConstantEvalErrors) {
      return null;
    }
    final projectDefinition =
        topLevelConstants.firstWhereOrNull((el) => el.element.type.isProject);
    if (projectDefinition == null) {
      _reportError(
        'No `Project` type found',
        SourceLocation(
          path: projectFileRelativePath,
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
    final projectDefineLocation =
        projectDefinitionElement.sourceLocation(_projectPaths.projectRoot);
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

    // Collect environments
    final environmentsValue = projectDefinitionValue
        .getField('environments')
        ?.toListValue()
        ?.map((env) => env.toStringValue())
        .toList();
    assert(
      environmentsValue != null,
      'This should be impossible given that `environments` is a required field on `Project`',
    );
    if (environmentsValue!.isEmpty) {
      _reportError(
        'No environments have been defined for this project.',
        projectDefineLocation,
      );
      return null;
    }
    assert(
      environmentsValue.whereType<Null>().isEmpty,
      'This should be impossible given that `environments` is a required field on `Project`',
    );

    var environmentNameErrors = false;
    final environments = environmentsValue.cast<String>();
    final seenEnvironments = <String>{};
    for (final environment in environments) {
      if (environment.isEmpty) {
        _reportError(
          'Environment names cannot be empty.',
          projectDefineLocation,
        );
        environmentNameErrors = true;
        continue;
      }
      if (!seenEnvironments.add(environment)) {
        _reportError(
          'Duplicate environment name: "$environment".',
          projectDefineLocation,
        );
        environmentNameErrors = true;
        continue;
      }
    }
    if (environmentNameErrors) {
      return null;
    }

    return ast.ProjectBuilder()
      ..name = projectName
      ..reference = refer('define', projectFileRelativePath)
      ..location.replace(projectDefineLocation)
      ..environmentNames.addAll(environments);
  }

  List<ast.ApiMetadata> _collectApiMetadata(Element element) {
    var hasAuth = false;
    return element.metadata
        .map((annotation) {
          final location = annotation.sourceLocation(
            element.source!,
            _projectPaths.projectRoot,
          );
          final type = annotation.computeConstantValue()?.type;
          if (type == null) {
            _reportError('Could not resolve annotation', location);
            return null;
          }

          void assertSingleAuth() {
            if (hasAuth) {
              _reportError(
                'Either `api.authenticated` or `api.anonymous` may be specified '
                'but not both.',
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
                type: type.toCodeBuilder(_projectPaths.projectRoot),
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

  Future<ast.ProjectBuilder> _collectApis(ast.ProjectBuilder project) async {
    final apiDir = Directory(_projectPaths.apisDir);
    if (!apiDir.existsSync()) {
      return project;
    }
    final environmentNames = project.environmentNames.build();

    final apiFiles = apiDir
        .listSync()
        .whereType<File>()
        .map((file) => file.path)
        .where((path) => path.endsWith('.dart'))
        .toList();
    final apiDeclarations = BuiltMap<String, ApiDeclaration>.build((builder) {
      for (final apiFile in apiFiles) {
        switch (p.basename(apiFile).split('.')) {
          case [final apiName, final environmentName, 'dart']:
            if (!environmentNames.contains(environmentName)) {
              _reportError(
                'Unknown environment for file: "$environmentName"',
                SourceLocation(path: apiFile, line: 0, column: 0),
              );
              continue;
            }
            builder.updateValue(
              apiName,
              (decl) => decl..environmentOverrides[environmentName] = apiFile,
              ifAbsent: () => ApiDeclaration()
                ..environmentOverrides[environmentName] = apiFile,
            );
          case [final apiName, 'dart']:
            builder.updateValue(
              apiName,
              (decl) => decl..baseApi = apiFile,
              ifAbsent: () => ApiDeclaration()..baseApi = apiFile,
            );
          default:
            _reportError(
              'API files must be named as follows: <api_name>.dart or <api_name>.<environment_name>.dart',
              SourceLocation(path: apiFile, line: 0, column: 0),
            );
            continue;
        }
      }
    });

    for (final MapEntry(key: apiName, value: apiDeclaration)
        in apiDeclarations.entries) {
      // Collect base API
      if (apiDeclaration.baseApi case final baseApiPath?) {
        final baseApi = await _collectApi(
          apiName: apiName,
          environmentName: '',
          apiFile: baseApiPath,
        );
        if (baseApi == null) {
          continue;
        }
        project.baseEnvironment.update(
          (env) => env.apis[apiName] = baseApi,
        );
      }

      // Collect environment APIs
      for (final MapEntry(key: environmentName, value: apiEnvironmentPath)
          in apiDeclaration.environmentOverrides.entries) {
        final environmentApi = await _collectApi(
          apiName: apiName,
          environmentName: environmentName,
          apiFile: apiEnvironmentPath,
        );
        if (environmentApi == null) {
          continue;
        }
        project.environmentOverrides.updateValue(
          environmentName,
          (env) => env.rebuild(
            (b) => b.apis.updateValue(
              apiName,
              (api) => api.rebuild(
                (b) => b
                  ..metadata.addAll(environmentApi.metadata)
                  ..functions.update((functions) {
                    for (final function in environmentApi.functions.entries) {
                      functions[function.key] = function.value;
                    }
                  }),
              ),
              ifAbsent: () => environmentApi,
            ),
          ),
          ifAbsent: () => ast.Environment.build(
            (b) => b
              ..name = environmentName
              ..apis[apiName] = environmentApi,
          ),
        );
      }
    }
    return project;
  }

  Future<ast.Api?> _collectApi({
    required String apiName,
    required String environmentName,
    required String apiFile,
  }) async {
    final apiUnit = await _context.currentSession.getUnitElement(apiFile);
    if (apiUnit is! UnitElementResult) {
      _reportError(
        'Could not resolve API file',
        SourceLocation(path: apiFile, line: 0, column: 0),
      );
      return null;
    }
    final libraryMetdata = _collectApiMetadata(apiUnit.element.library);
    final functions = Map.fromEntries(
      apiUnit.element.library.topLevelElements
          .whereType<FunctionElement>()
          .map((func) {
        if (func.isPrivate) {
          return null;
        }

        final function = ast.CloudFunction(
          name: func.name,
          apiName: apiName,
          parameters: func.parameters.map((param) {
            final parameter = ast.CloudFunctionParameter(
              name: param.name,
              type: param.type.toCodeBuilder(_projectPaths.projectRoot),
              required: param.isRequired,
              named: param.isNamed,
              location: param.sourceLocation(_projectPaths.projectRoot),
            );
            if (parameter.type.isFunctionContext) {
              return parameter;
            }
            final parameterTypeVerdict = param.type.isValidParameterType;
            if (!parameterTypeVerdict.isJsonSerializable) {
              _reportError(
                'The type of a parameter must be serializable as JSON. ${parameterTypeVerdict.reason}',
                parameter.location,
              );
            }
            return parameter;
          }).toList(),
          returnType: func.returnType.toCodeBuilder(_projectPaths.projectRoot),
          flattenedReturnType: func.returnType.flattened
              .toCodeBuilder(_projectPaths.projectRoot),
          location: func.sourceLocation(_projectPaths.projectRoot),
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
        final returnTypeVerdict = returnType.isValidReturnType;
        if (!returnTypeVerdict.isJsonSerializable) {
          _reportError(
            'The return type of a function must be serializable as JSON. ${returnTypeVerdict.reason}',
            function.location,
          );
        }
        return MapEntry(function.name, function);
      }).nonNulls,
    );
    return ast.Api(
      name: apiName,
      environmentName: environmentName,
      metadata: libraryMetdata,
      functions: functions,
    );
  }
}

extension on Element {
  ast.SourceLocation sourceLocation(String projectRoot) {
    final uri = source!.uri;
    final (lineNo, column) = source!.offsetToLineCol(nameOffset);
    return ast.SourceLocation(
      path: p.relative(p.fromUri(uri), from: projectRoot),
      line: lineNo,
      column: column,
    );
  }
}

extension on ElementAnnotation {
  ast.SourceLocation sourceLocation(Source source, String projectRoot) {
    final impl = this as ElementAnnotationImpl;
    final offset = impl.annotationAst.offset;
    final (lineNo, column) = source.offsetToLineCol(offset);
    return ast.SourceLocation(
      path: p.relative(p.fromUri(source.uri), from: projectRoot),
      line: lineNo,
      column: column,
    );
  }
}

extension on Source {
  /// Finds the line and column number corresponding to [offset].
  (int line, int col) offsetToLineCol(int offset) {
    final source = this;
    final lines = LineSplitter.split(source.contents.data);
    var currOffset = 0;
    var lineNo = 1;
    var column = 1;
    for (final line in lines) {
      if (currOffset + line.length >= offset) {
        column = offset - currOffset;
        break;
      }
      currOffset += line.length + 1;
      lineNo++;
    }
    return (lineNo, column);
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
    return '${location.path}:${location.line}:${location.column}: $message';
  }
}

final class ApiDeclaration {
  String? baseApi;
  final Map<String, String> environmentOverrides = {};
}

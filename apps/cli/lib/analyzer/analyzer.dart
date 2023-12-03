import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
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
import 'package:pubspec_parse/pubspec_parse.dart';

final class CelestAnalyzer {
  CelestAnalyzer._(this.projectPaths, this._context);

  static CelestAnalyzer start({
    required ProjectPaths projectPaths,
  }) {
    final contextCollection = AnalysisContextCollection(
      includedPaths: [projectPaths.projectRoot],
    );
    final context = contextCollection.contexts.single;
    return CelestAnalyzer._(projectPaths, context);
  }

  final ProjectPaths projectPaths;
  final AnalysisContext _context;
  final List<AnalysisException> errors = [];

  void _reportError(String error, SourceLocation location) {
    errors.add(
      AnalysisException(
        message: error,
        location: location,
      ),
    );
  }

  Future<({ast.Project project, List<AnalysisException> errors})>
      analyzeProject() async {
    var project = await _findProject();
    project = await _collectApis(project);
    return (project: project.build(), errors: errors);
  }

  Future<ast.ProjectBuilder> _findProject() async {
    final projectYamlFile = File(projectPaths.projectYaml).readAsStringSync();
    final projectPubspec = Pubspec.parse(projectYamlFile);

    final projectFilePath = projectPaths.projectDart;
    final projectFileRelativePath =
        projectPaths.relativeToRoot(projectFilePath);
    if (!File(projectFilePath).existsSync()) {
      throw AnalysisException(
        message:
            'No project file found at ${projectPaths.relativeToRoot(projectFilePath)}',
        location: SourceLocation(
          path: projectFileRelativePath,
          line: 0,
          column: 0,
        ),
      );
    }
    final projectFile =
        await _context.currentSession.getResolvedUnit(projectFilePath);
    final resolvedProjectFile = switch (projectFile) {
      ResolvedUnitResult _ => projectFile,
      _ => throw AnalysisException(
          message: 'Could not resolve project file',
          location: SourceLocation(
            path: projectFileRelativePath,
            line: 0,
            column: 0,
          ),
        ),
    };
    if (projectFile.errors.isNotEmpty) {
      throw AnalysisException(
        message: 'Project file has errors:\n${projectFile.errors.join('\n')}',
        location: SourceLocation(
          path: projectFileRelativePath,
          line: 0,
          column: 0,
        ),
      );
    }
    final topLevelFunctions =
        resolvedProjectFile.unit.declaredElement!.functions;
    final projectDefine = topLevelFunctions.firstWhere((el) {
      return el.name == 'define';
    });

    // Validate `define` method
    final projectDefineLocation =
        projectDefine.sourceLocation(projectPaths.projectRoot);
    switch (projectDefine.parameters) {
      case [final single] when single.type.isProjectContext:
        break;
      default:
        throw AnalysisException(
          message:
              'The `define` method must have a single parameter of type ProjectContext',
          location: projectDefineLocation,
        );
    }

    // Collect environments
    final environmentsAnnotation =
        projectDefine.metadata.firstWhereOrNull((annotation) {
      return switch (annotation.element) {
        ConstructorElement(
          enclosingElement: ClassElement(:final name, :final library),
        ) =>
          name == 'environments' && library.isPackageCelest,
        // TODO: Handle constant variable
        _ => false,
      };
    });
    // TODO: Handle constant evaluation errors
    if (environmentsAnnotation == null) {
      // TODO: What to do with no environments?
      throw AnalysisException(
        message: 'No environments have been defined for this project.',
        location: projectDefineLocation,
      );
    }
    final environmentNames = environmentsAnnotation
        .computeConstantValue()
        ?.getField('named')
        ?.toListValue()
        ?.map((value) => value.toStringValue())
        .nonNulls
        .toList();
    if (environmentNames == null) {
      throw AnalysisException(
        message:
            'The `environments` annotation must have a `named` parameter of type List<String>',
        location: environmentsAnnotation.sourceLocation(
          projectDefine.source,
          projectPaths.projectRoot,
        ),
      );
    }

    return ast.ProjectBuilder()
      ..name = projectPubspec.name
      ..reference = refer('define', projectFileRelativePath)
      ..location.replace(projectDefineLocation)
      ..environmentNames.addAll(environmentNames);
  }

  List<ast.ApiMetadata> _collectMetadata(Element element) {
    return element.metadata
        .map((annotation) {
          final location = annotation.sourceLocation(
            element.source!,
            projectPaths.projectRoot,
          );
          final value = annotation.computeConstantValue();
          if (value == null) {
            _reportError(
              'Could not resolve annotation',
              location,
            );
            return null;
          }
          final type = value.type!.element!;
          switch (type) {
            case _
                when type.library!.isCelestApi && type.name == 'authenticated':
              return ast.ApiMetadataAuthenticated(
                location: location,
              );
            case _ when type.isMiddleware:
              return ast.ApiMetadataMiddleware(
                type: value.type!.toCodeBuilder(projectPaths.projectRoot),
                location: location,
              );
            case _:
              _reportError('Invalid annotation value', location);
              return null;
          }
        })
        .nonNulls
        .toList();
  }

  Future<ast.ProjectBuilder> _collectApis(ast.ProjectBuilder project) async {
    final apiDir = Directory(projectPaths.apisDir);
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

  Future<ast.Api> _collectApi({
    required String apiName,
    required String environmentName,
    required String apiFile,
  }) async {
    final apiUnitResult = await _context.currentSession.getUnitElement(apiFile);
    final apiUnit = switch (apiUnitResult) {
      UnitElementResult _ => apiUnitResult.element,
      _ => throw AnalysisException(
          message: 'Could not resolve API file',
          location: SourceLocation(path: apiFile, line: 0, column: 0),
        ),
    };
    final libraryMetdata = _collectMetadata(apiUnit.library);
    final functions = Map.fromEntries(
      apiUnit.library.topLevelElements.whereType<FunctionElement>().map((func) {
        if (func.isPrivate) {
          return null;
        }

        final function = ast.CloudFunction(
          name: func.name,
          apiName: apiName,
          parameters: func.parameters.map((param) {
            final parameter = ast.Parameter(
              name: param.name,
              type: param.type.toCodeBuilder(projectPaths.projectRoot),
              required: param.isRequired,
              named: param.isNamed,
              location: param.sourceLocation(projectPaths.projectRoot),
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
          returnType: func.returnType.toCodeBuilder(projectPaths.projectRoot),
          flattenedReturnType:
              func.returnType.flattened.toCodeBuilder(projectPaths.projectRoot),
          location: func.sourceLocation(projectPaths.projectRoot),
          metadata: _collectMetadata(func),
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
  bool get isMiddleware {
    final el = this;
    if (el is! ClassElement) {
      return false;
    }
    final supertypes = el.allSupertypes;
    if (supertypes.isEmpty) {
      return false;
    }
    return supertypes.any((supertype) {
      final supertypeElement = supertype.element;
      if (supertypeElement is! ClassElement) {
        return false;
      }
      return supertypeElement.library.isPackageCelest &&
          supertypeElement.name == 'Middleware';
    });
  }

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

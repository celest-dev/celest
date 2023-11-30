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

  Future<(ast.Project, List<AnalysisException>)> analyzeProject() async {
    var project = await _findProject();
    project = await _collectApis(project);
    return (project.build(), errors);
  }

  Future<ast.ProjectBuilder> _findProject() async {
    final projectYamlFile = File(projectPaths.projectYaml).readAsStringSync();
    final projectPubspec = Pubspec.parse(projectYamlFile);

    final projectFilePath = projectPaths.projectDart;
    // TODO(dnys1): Assert exists
    final projectFile =
        await _context.currentSession.getUnitElement(projectFilePath);
    final resolvedProjectFile = switch (projectFile) {
      UnitElementResult _ => projectFile,
      _ => throw StateError('Bad resolution: $projectFile'),
    };
    final topLevelFunctions = resolvedProjectFile.element.functions;
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
        _reportError(
          'The `define` method must have a single parameter of type ProjectContext',
          projectDefineLocation,
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
        _ => false,
      };
    });
    if (environmentsAnnotation == null) {
      // TODO: What to do with no environments?
      throw StateError('No environments defined for project');
    }
    final environmentNames = environmentsAnnotation
        .computeConstantValue()
        ?.getField('named')
        ?.toListValue()
        ?.map((value) => value.toStringValue())
        .nonNulls
        .toList();
    if (environmentNames == null) {
      throw StateError('Bad environments: $environmentsAnnotation');
    }

    return ast.ProjectBuilder()
      ..name = projectPubspec.name
      ..reference = refer(
        'define',
        projectPaths.relativeToRoot(projectFilePath),
      )
      ..location.replace(projectDefineLocation)
      ..environmentNames.addAll(environmentNames);
  }

  List<ast.ApiMetadata> _collectMetadata(Element element) {
    return element.metadata.map((annotation) {
      final value = annotation.computeConstantValue();
      if (value == null) {
        throw StateError('Bad annotation: $annotation');
      }
      final type = value.type!.element!;
      switch (type) {
        case _ when type.library!.isCelestApi && type.name == 'authenticated':
          return ast.ApiMetadataAuthenticated(
            location: annotation.sourceLocation(
              element.source!,
              projectPaths.projectRoot,
            ),
          );
        case _ when type.isMiddleware:
          return ast.ApiMetadataMiddleware(
            type: value.type!.toCodeBuilder(projectPaths.projectRoot),
            location: annotation.sourceLocation(
              element.source!,
              projectPaths.projectRoot,
            ),
          );
        case _:
          throw StateError('Bad annotation: $annotation');
      }
    }).toList();
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
              // TODO: Report error
              throw StateError('Bad environment: $environmentName');
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
          // TODO: Report error
          default:
            throw StateError('Bad file: $apiFile');
        }
      }
    });

    for (final MapEntry(key: apiName, value: apiDeclaration)
        in apiDeclarations.entries) {
      // Collect base API
      if (apiDeclaration.baseApi case final baseApiPath?) {
        final baseApi = await _collectApi(apiName, baseApiPath);
        project.baseEnvironment.update(
          (env) => env.apis[apiName] = baseApi,
        );
      }

      // Collect environment APIs
      for (final MapEntry(key: environmentName, value: apiEnvironmentPath)
          in apiDeclaration.environmentOverrides.entries) {
        final environmentApi = await _collectApi(apiName, apiEnvironmentPath);
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

  Future<ast.Api> _collectApi(String apiName, String apiFile) async {
    final apiUnitResult = await _context.currentSession.getUnitElement(apiFile);
    final apiUnit = switch (apiUnitResult) {
      UnitElementResult _ => apiUnitResult.element,
      _ => throw StateError('Bad resolution: $apiUnitResult'),
    };
    final libraryMetdata = _collectMetadata(apiUnit.library);
    final functions = Map.fromEntries(
      apiUnit.library.topLevelElements.whereType<FunctionElement>().map((func) {
        // TODO(dnys1): Skip private functions.
        final function = ast.CloudFunction(
          name: func.name,
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
            'The return type of a function must be serializable as JSON. ${returnTypeVerdict.reason}}',
            function.location,
          );
        }
        return MapEntry(function.name, function);
      }),
    );
    return ast.Api(
      name: apiName,
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
    final uri = this.source!.uri;
    final source = this.source!.contents.data;
    final lines = LineSplitter.split(source);
    var currOffset = 0;
    var lineNo = 1;
    var column = 0;
    // Find the line/column number of `nameOffset`.
    for (final line in lines) {
      if (currOffset + line.length >= nameOffset) {
        column = nameOffset - currOffset;
        break;
      }
      currOffset += line.length + 1;
      lineNo++;
    }
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
    final lines = LineSplitter.split(source.contents.data);
    var currOffset = 0;
    var lineNo = 1;
    var column = 0;
    // Find the line/column number of `nameOffset`.
    for (final line in lines) {
      if (currOffset + line.length >= offset) {
        column = offset - currOffset;
        break;
      }
      currOffset += line.length + 1;
      lineNo++;
    }
    return ast.SourceLocation(
      path: p.relative(p.fromUri(source.uri), from: projectRoot),
      line: lineNo,
      column: column,
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
    return '${location.path}:${location.line}:${location.column}: $message';
  }
}

final class ApiDeclaration {
  String? baseApi;
  final Map<String, String> environmentOverrides = {};
}

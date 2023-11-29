import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:celest_cli/analyzer/dart_type.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/ast.dart';
import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';

final class CelestAnalyzer {
  CelestAnalyzer._(this.projectRoot, this._context);

  static CelestAnalyzer start({
    required String projectRoot,
  }) {
    final contextCollection = AnalysisContextCollection(
      includedPaths: [projectRoot],
    );
    final context = contextCollection.contexts.single;
    return CelestAnalyzer._(projectRoot, context);
  }

  final String projectRoot;
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
    final project = await _findProject();
    final apis = await _collectApis();
    return (
      project.rebuild((p) => p.apis.addAll(apis)),
      errors,
    );
  }

  Future<ast.Project> _findProject() async {
    final projectYaml = p.join(projectRoot, 'pubspec.yaml');
    final projectYamlFile = File(projectYaml).readAsStringSync();
    final projectPubspec = Pubspec.parse(projectYamlFile);

    final projectFilePath = p.join(projectRoot, 'project.dart');
    // TODO(dnys1): Assert exists
    final projectFile =
        await _context.currentSession.getUnitElement(projectFilePath);
    final resolvedProjectFile = switch (projectFile) {
      UnitElementResult _ => projectFile,
      _ => throw StateError('Bad resolution: $projectFile'),
    };
    final topLevelClasses = resolvedProjectFile.element.classes;
    final projectClass = topLevelClasses.firstWhere((el) {
      if (el.supertype case final supertype?) {
        return supertype.element.library.isPackageCelest &&
            supertype.element.name == 'Project';
      }
      return false;
    });

    return ast.Project(
      name: projectPubspec.name,
      implementation: ast.ProjectClass(
        name: projectClass.name,
        location: projectClass.sourceLocation,
      ),
    );
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
            location: element.sourceLocation,
          );
        case _ when type.isMiddleware:
          return ast.ApiMetadataMiddleware(
            type: value.type!.toCodeBuilder,
            location: element.sourceLocation,
          );
        case _:
          throw StateError('Bad annotation: $annotation');
      }
    }).toList();
  }

  Future<List<ast.Api>> _collectApis() async {
    final apis = <ast.Api>[];
    final apiDir = Directory(p.join(projectRoot, 'apis'));
    if (!apiDir.existsSync()) {
      return const [];
    }
    final apiFiles = apiDir
        .listSync()
        .whereType<File>()
        .map((file) => file.path)
        .where((path) => path.endsWith('.dart'))
        .toList();
    for (final apiFile in apiFiles) {
      final apiUnitResult =
          await _context.currentSession.getUnitElement(apiFile);
      final apiUnit = switch (apiUnitResult) {
        UnitElementResult _ => apiUnitResult.element,
        _ => throw StateError('Bad resolution: $apiUnitResult'),
      };
      final libraryMetdata = _collectMetadata(apiUnit.library);
      final functions = apiUnit.library.topLevelElements
          .whereType<FunctionElement>()
          .map((func) {
        final function = ast.CloudFunction(
          name: func.name,
          parameters: func.parameters.map((param) {
            final parameter = ast.Parameter(
              name: param.name,
              type: param.type.toCodeBuilder,
              required: param.isRequired,
              named: param.isNamed,
              location: param.sourceLocation,
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
          returnType: func.returnType.toCodeBuilder,
          location: func.sourceLocation,
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
        return function;
      }).toList();
      apis.add(
        ast.Api(
          uri: apiUnit.library.source.uri,
          name: p.basenameWithoutExtension(apiFile),
          metadata: libraryMetdata,
          functions: functions,
        ),
      );
    }
    return apis;
  }
}

extension on LibraryElement {
  bool get isPackageCelest =>
      source.uri.scheme == 'package' && source.uri.path.startsWith('celest/');
  bool get isCelestApi => isPackageCelest && name == 'api';
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

  ast.SourceLocation get sourceLocation {
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
      uri: uri,
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
    return '${location.uri}:${location.line}:${location.column}: $message';
  }
}

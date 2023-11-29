import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/analyzer/ast.dart';
import 'package:celest_cli/analyzer/validator.dart';
import 'package:path/path.dart' as p;

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

  Future<(ProjectAst, List<ValidationException>)> analyzeProject() async {
    final projectClass = await _findProjectClass();
    final apis = await _collectApis();
    final project = ProjectAst(
      projectClass: projectClass,
      apis: apis,
    );
    final validator = AstValidator();
    project.accept(validator);
    return (project, validator.errors);
  }

  Future<String> _findProjectClass() async {
    final projectFile = await _context.currentSession
        .getUnitElement(p.join(projectRoot, 'project.dart'));
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
    return projectClass.name;
  }

  List<ApiMetdataAst> _collectMetadata(Element element) {
    return element.metadata.map((annotation) {
      final value = annotation.computeConstantValue();
      if (value == null) {
        throw StateError('Bad annotation: $annotation');
      }
      final type = value.type!.element!;
      switch (type) {
        case _ when type.library!.isCelestApi && type.name == 'authenticated':
          return ApiMetdataAst.apiAuthenticated(
            location: element.sourceLocation(projectRoot),
            element: annotation,
          );
        case _ when type.isMiddleware:
          return ApiMetdataAst.apiMiddleware(
            type: value.type!.toAst,
            location: element.sourceLocation(projectRoot),
            element: annotation,
          );
        case _:
          throw StateError('Bad annotation: $annotation');
      }
    }).toList();
  }

  Future<List<ApiAst>> _collectApis() async {
    final apis = <ApiAst>[];
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
        return FunctionAst(
          name: func.name,
          parameters: func.parameters.map((param) {
            return ParameterAst(
              name: param.name,
              type: param.type.toAst,
              required: param.isRequired,
              named: param.isNamed,
              location: param.sourceLocation(projectRoot),
              element: param,
            );
          }).toList(),
          returnType: func.returnType.toAst,
          location: func.sourceLocation(projectRoot),
          metadata: _collectMetadata(func),
          element: func,
        );
      }).toList();
      apis.add(
        ApiAst(
          name: p.basenameWithoutExtension(apiFile),
          metadata: libraryMetdata,
          functions: functions,
          element: apiUnit.library,
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

  SourceLocation sourceLocation(String projectRoot) {
    final path = this.source!.uri.toFilePath();
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
    return SourceLocation(
      path: p.relative(path, from: projectRoot),
      line: lineNo,
      column: column,
    );
  }
}

extension on DartType {
  TypeAst get toAst => TypeAst(
        libraryUri: switch (this) {
          final ParameterizedType typ => typ.element!.librarySource!.uri,
          _ => Uri(),
        },
        name: switch (this) {
          final ParameterizedType typ => typ.element!.name!,
          _ => '',
        },
        typeArguments: switch (this) {
          final ParameterizedType typ =>
            typ.typeArguments.map((t) => t.toAst).toList(),
          _ => const [],
        },
        dartType: this,
      );
}

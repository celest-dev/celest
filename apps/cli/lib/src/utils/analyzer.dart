import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/element/element.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/element/type.dart';
// ignore: implementation_imports
import 'package:analyzer/src/generated/source.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart' as codegen;
// ignore: implementation_imports
import 'package:code_builder/src/visitors.dart';

extension LibraryElementHelper on LibraryElement {
  bool get isPackageCelest =>
      source.uri.scheme == 'package' && source.uri.path.startsWith('celest/');
  bool get isCelestApi => isPackageCelest && name == 'api';
}

extension DartTypeHelper on DartType {
  DartType get flattened {
    switch (this) {
      case final InterfaceType interface:
        final typeSystem = interface.element.library.typeSystem;
        final flattened = typeSystem.flatten(this);
        return switch ((this, flattened)) {
          // TODO(dnys1): https://github.com/dart-lang/sdk/issues/54260
          (
            InterfaceType(
              typeArguments: [
                final RecordTypeImpl originalRecordType,
              ]
            ),
            final RecordTypeImpl recordType,
          ) =>
            RecordTypeImpl(
              namedFields: recordType.namedFields,
              positionalFields: recordType.positionalFields,
              nullabilitySuffix: recordType.nullabilitySuffix,
              alias: originalRecordType.alias,
            ),
          _ => flattened,
        };
      default:
        return this;
    }
  }

  bool get isProject => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'Project' && library.isPackageCelest,
        _ => false,
      };

  bool get isProjectContext => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'ProjectContext' && library.isPackageCelest,
        _ => false,
      };

  bool get isApiAuthenticated => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'authenticated' && library.isCelestApi,
        _ => false,
      };

  bool get isApiAnonymous => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'anonymous' && library.isCelestApi,
        _ => false,
      };

  bool get isEnvironmentVariable => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'EnvironmentVariable' && library.isPackageCelest,
        _ => false,
      };

  bool get isMiddleware {
    final el = element;
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

  bool get isEnum => element is EnumElement;

  bool get isSimpleJson =>
      isDartCoreBool ||
      isDartCoreDouble ||
      isDartCoreInt ||
      isDartCoreNum ||
      isDartCoreString ||
      isDartCoreObject ||
      isDartCoreNull ||
      isEnum;
}

extension ElementSourceLocation on Element {
  ast.SourceLocation get sourceLocation {
    final uri = source!.uri;
    final (lineNo, column) = source!.offsetToLineCol(nameOffset);
    return ast.SourceLocation(
      // Store relative location in posix format for convenience and easier
      // cross-platform testing.
      path: Uri(
        scheme: 'project',
        path: p.relative(
          p.fromUri(uri),
          from: projectPaths.projectRoot,
        ),
      ).toString(),
      line: lineNo,
      column: column,
    );
  }
}

extension ElementAnnotationSourceLocation on ElementAnnotation {
  ast.SourceLocation sourceLocation(Source source) {
    final impl = this as ElementAnnotationImpl;
    final offset = impl.annotationAst.offset;
    final (lineNo, column) = source.offsetToLineCol(offset);
    return ast.SourceLocation(
      // Store relative location in posix format for convenience and easier
      // cross-platform testing.
      path: Uri(
        scheme: 'project',
        path: p.relative(
          p.fromUri(source.uri),
          from: projectPaths.projectRoot,
        ),
      ).toString(),
      line: lineNo,
      column: column,
    );
  }
}

extension SourceLineCol on Source {
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

extension DartTypeUri on DartType {
  String? get uri {
    final library = element?.library;
    final sourceUri = library?.source.uri;
    return switch (this) {
      _ when library == null || sourceUri == null => null,
      _ when library.isDartCore => 'dart:core',
      _ when sourceUri.scheme == 'file' || sourceUri.scheme == '' => Uri(
          scheme: 'project',
          // Store relative location in posix format for convenience and easier
          // cross-platform testing.
          path: p.relative(
            p.fromUri(sourceUri),
            from: projectPaths.projectRoot,
          ),
        ).toString(),
      _ => sourceUri.toString(),
    };
  }
}

final class TypedefRecordType extends codegen.Expression
    implements codegen.Reference, codegen.Spec {
  const TypedefRecordType({
    this.symbol,
    this.url,
    required this.recordType,
    required this.isNullable,
  });

  @override
  final String? symbol;
  @override
  final String? url;

  final codegen.RecordType recordType;
  final bool isNullable;

  @override
  R accept<R>(SpecVisitor<R> visitor, [R? context]) =>
      visitor.visitRecordType(recordType, context);

  @override
  codegen.Expression constInstance(
    Iterable<codegen.Expression> positionalArguments, [
    Map<String, codegen.Expression> namedArguments = const {},
    List<codegen.Reference> typeArguments = const [],
  ]) {
    throw UnimplementedError();
  }

  @override
  codegen.Expression constInstanceNamed(
    String name,
    Iterable<codegen.Expression> positionalArguments, [
    Map<String, codegen.Expression> namedArguments = const {},
    List<codegen.Reference> typeArguments = const [],
  ]) {
    throw UnsupportedError(
      'Record types do not have named constructors',
    );
  }

  @override
  codegen.Expression newInstance(
    Iterable<codegen.Expression> positionalArguments, [
    Map<String, codegen.Expression> namedArguments = const {},
    List<codegen.Reference> typeArguments = const [],
  ]) {
    throw UnimplementedError();
  }

  @override
  codegen.Expression newInstanceNamed(
    String name,
    Iterable<codegen.Expression> positionalArguments, [
    Map<String, codegen.Expression> namedArguments = const {},
    List<codegen.Reference> typeArguments = const [],
  ]) {
    throw UnsupportedError(
      'Record types do not have named constructors',
    );
  }

  @override
  codegen.Reference get type => recordType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypedefRecordType &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          url == other.url &&
          recordType == other.recordType &&
          isNullable == other.isNullable;

  @override
  int get hashCode => Object.hash(
        symbol,
        url,
        recordType,
        isNullable,
      );
}

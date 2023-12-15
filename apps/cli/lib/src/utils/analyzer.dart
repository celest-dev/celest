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
import 'package:collection/collection.dart';

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

extension RecordTypeHelper on RecordType {
  String get symbol {
    switch (alias) {
      case final alias?:
        return alias.element.displayName;
      default:
        final reference = typeHelper.toReference(this) as codegen.RecordType;
        final uniqueHash = const ListEquality<Object>().hash([
          ...reference.positionalFieldTypes,
          ...reference.namedFieldTypes.entries.expand(
            (entry) => [entry.key, entry.value],
          ),
        ]);
        return 'Record\$${uniqueHash.toRadixString(36)}';
    }
  }

  String? get url => switch (alias) {
        final alias? => alias.element.sourceLocation.uri.toString(),
        _ => null,
      };

  Uri get uri => switch (url) {
        final url? => Uri.parse(url).replace(fragment: symbol),
        _ => Uri(fragment: symbol),
      };
}

extension ElementSourceLocation on Element {
  ast.SourceLocation get sourceLocation {
    final uri = source!.uri;
    final (lineNo, column) = source!.offsetToLineCol(nameOffset);
    return ast.SourceLocation(
      uri: uri,
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
      uri: source.uri,
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
  Uri? get uri {
    final sourceUri = element?.library?.source.uri;
    if (sourceUri == null) {
      return null;
    }
    return projectPaths.normalizeUri(sourceUri);
  }
}

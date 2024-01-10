import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
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
import 'package:source_span/source_span.dart';

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

  DartType get nonNullable => (this as TypeImpl).withNullability(
        NullabilitySuffix.none,
      );

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

  bool get isApiPublic => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'public' && library.isCelestApi,
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

  bool get isThrowable {
    return typeHelper.typeSystem.isSubtypeOf(this, typeHelper.coreErrorType) ||
        typeHelper.typeSystem.isSubtypeOf(this, typeHelper.coreExceptionType);
  }

  Uri? get sourceUri {
    final sourceUri = switch (alias) {
      final alias? => alias.element.sourceLocation.sourceUrl,
      _ => element?.sourceLocation.sourceUrl,
    };
    if (sourceUri == null) {
      return null;
    }
    return projectPaths.normalizeUri(sourceUri);
  }

  Uri get uri {
    if (this is DynamicType) {
      return Uri.parse('dart:core#dynamic');
    }
    return sourceUri!;
  }

  Uri get instantiatedUri {
    final type = this;
    final symbol = switch (type) {
      final RecordType type => type.symbol,
      _ => element?.name,
    };
    assert(symbol != null, 'Symbol is null for $type');
    final symbolizedUri = switch (sourceUri) {
      final sourceUri? => sourceUri.replace(fragment: symbol),
      _ => Uri(fragment: symbol),
    };
    switch (type) {
      case InterfaceType(
            :final typeArguments,
            element: InterfaceElement(:final typeParameters)
          )
          when typeParameters.isNotEmpty:
        return symbolizedUri.replace(
          queryParameters: {
            for (final (index, typeParameter) in typeParameters.indexed)
              typeParameter.name:
                  typeArguments[index].instantiatedUri.toString(),
          },
        );
      default:
        return symbolizedUri;
    }
  }
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
}

extension NodeSourceLocation on AstNode {
  ast.FileSpan sourceLocation(Source source) {
    return source.toSpan(offset, end);
  }
}

extension ElementSourceLocation on Element {
  ast.FileSpan get sourceLocation {
    return source!.toSpan(nameOffset, nameOffset + nameLength);
  }
}

extension ElementAnnotationSourceLocation on ElementAnnotation {
  ast.FileSpan sourceLocation(Source source) {
    final impl = this as ElementAnnotationImpl;
    return source.toSpan(impl.annotationAst.offset, impl.annotationAst.end);
  }
}

extension SourceToSpan on Source {
  static final _sourceFiles = <Source, SourceFile>{};

  FileSpan toSpan(int start, [int? end]) {
    final sourceFile = _sourceFiles[this] ??= SourceFile.fromString(
      contents.data,
      url: uri,
    );
    return sourceFile.span(start, end);
  }
}

// TODO: File ticket with Dart team around hashcode/equality of DartType
// == of RecordType does not take into account alias.
// hashCode only takes into account the length of positionalFields and namedFields.
final class DartTypeEquality implements Equality<DartType> {
  const DartTypeEquality({this.ignoreNullability = false});

  final bool ignoreNullability;

  @override
  bool equals(DartType e1, DartType e2) {
    if (e1 is RecordType && e2 is RecordType) {
      return RecordTypeEquality(ignoreNullability: ignoreNullability)
          .equals(e1, e2);
    }
    if (ignoreNullability) {
      e1 = (e1 as TypeImpl).withNullability(NullabilitySuffix.none);
      e2 = (e2 as TypeImpl).withNullability(NullabilitySuffix.none);
    }
    return e1 == e2;
  }

  @override
  int hash(DartType e) {
    if (e is RecordType) {
      return RecordTypeEquality(ignoreNullability: ignoreNullability).hash(e);
    }
    if (ignoreNullability) {
      e = (e as TypeImpl).withNullability(NullabilitySuffix.none);
    }
    return e.hashCode;
  }

  @override
  bool isValidKey(Object? o) => o is DartType;
}

// TODO: File ticket with Dart team around hashcode/equality of DartType
final class RecordTypeEquality implements Equality<RecordType> {
  const RecordTypeEquality({this.ignoreNullability = false});

  final bool ignoreNullability;

  @override
  bool equals(RecordType e1, RecordType e2) {
    if (identical(e1, e2)) {
      return true;
    }
    if (!ignoreNullability) {
      if (e1.nullabilitySuffix != e2.nullabilitySuffix) {
        return false;
      }
    }
    if (e1.alias != e2.alias) {
      return false;
    }

    final thisPositional = e1.positionalFields;
    final otherPositional = e2.positionalFields;
    if (thisPositional.length != otherPositional.length) {
      return false;
    }
    for (var i = 0; i < thisPositional.length; i++) {
      final thisField = thisPositional[i];
      final otherField = otherPositional[i];
      if (!const DartTypeEquality().equals(thisField.type, otherField.type)) {
        return false;
      }
    }

    final thisNamed = e1.namedFields;
    final otherNamed = e2.namedFields;
    if (thisNamed.length != otherNamed.length) {
      return false;
    }
    for (var i = 0; i < thisNamed.length; i++) {
      final thisField = thisNamed[i];
      final otherField = otherNamed[i];
      if (thisField.name != otherField.name ||
          !const DartTypeEquality().equals(thisField.type, otherField.type)) {
        return false;
      }
    }

    return true;
  }

  @override
  int hash(RecordType e) => const DeepCollectionEquality().hash([
        e.nullabilitySuffix,
        e.alias,
        e.positionalFields.map(
          (field) => const DartTypeEquality().hash(field.type),
        ),
        e.namedFields.map((field) => field.name),
        e.namedFields.map(
          (field) => const DartTypeEquality().hash(field.type),
        ),
      ]);

  @override
  bool isValidKey(Object? o) => o is RecordType;
}

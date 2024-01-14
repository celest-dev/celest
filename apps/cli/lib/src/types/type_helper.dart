import 'dart:async';
import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_provider.dart';
import 'package:analyzer/dart/element/type_system.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:analyzer/src/dart/element/type.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart' as codegen;

final class TypeHelper {
  factory TypeHelper() => _instance;
  TypeHelper._();

  static final _instance = TypeHelper._();

  TypeSystem? _typeSystem;
  TypeSystem get typeSystem {
    if (_typeSystem == null) {
      throw StateError(
        'TypeHelper.typeSystem was accessed before it was initialized. '
        'The type system is only available after analysis.',
      );
    }
    return _typeSystem!;
  }

  set typeSystem(TypeSystem typeSystem) {
    _typeSystem = typeSystem;
  }

  TypeProvider? _typeProvider;
  TypeProvider get typeProvider {
    if (_typeProvider == null) {
      throw StateError(
        'TypeHelper.typeProvider was accessed before it was initialized. '
        'The type provider is only available after analysis.',
      );
    }
    return _typeProvider!;
  }

  set typeProvider(TypeProvider typeProvider) {
    _typeProvider = typeProvider;
  }

  DartType? _coreExceptionType;
  DartType get coreExceptionType {
    if (_coreExceptionType == null) {
      throw StateError(
        'TypeHelper.coreExceptionType was accessed before it was initialized. '
        'The core exception type is only available after analysis.',
      );
    }
    return _coreExceptionType!;
  }

  set coreExceptionType(DartType coreExceptionType) {
    _coreExceptionType = coreExceptionType;
  }

  DartType? _coreErrorType;
  DartType get coreErrorType {
    if (_coreErrorType == null) {
      throw StateError(
        'TypeHelper.coreErrorType was accessed before it was initialized. '
        'The core error type is only available after analysis.',
      );
    }
    return _coreErrorType!;
  }

  set coreErrorType(DartType coreErrorType) {
    _coreErrorType = coreErrorType;
  }

  // TODO(dnys1): File ticket with Dart team around hashcode/equality of DartType
  final _dartTypeToReference = HashMap<DartType, codegen.Reference>(
    equals: const DartTypeEquality().equals,
    hashCode: const DartTypeEquality().hash,
  );
  final _referenceToDartType = <codegen.Reference, DartType>{};
  final _wireTypeToDartType = <String, DartType>{};
  final _serializationVerdicts = HashMap<DartType, Verdict>(
    equals: const DartTypeEquality().equals,
    hashCode: const DartTypeEquality().hash,
  );
  // final _customSerializers = <SerializationSpec, codegen.Class>{};

  // TODO(dnys1): Test types that are only referred to in nested fields/parameters
  /// ^^^^
  codegen.Reference toReference(DartType type) {
    if (_dartTypeToReference[type] case final reference?) {
      return reference;
    }
    final reference = type.accept(const _TypeToCodeBuilder());
    _dartTypeToReference[type] ??= reference;
    _referenceToDartType[reference] ??= type;
    _referenceToDartType[reference.toTypeReference] ??= type;
    // Perform for nullable version of [type] so that subsequent
    // nullable/non-nullable promotions which require [fromReference] succeed.
    if (!reference.isNullableOrFalse) {
      final nullableType = (type as TypeImpl)
          .withNullability(NullabilitySuffix.question)
        ..alias = type.alias;
      final nullableReference = reference.withNullability(true);
      _referenceToDartType[nullableReference] ??= nullableType;
    }
    if (toUri(type) case final wireType?) {
      _wireTypeToDartType[wireType] ??= type;
    }
    return reference;
  }

  DartType fromReference(codegen.Reference reference) {
    final dartType = _referenceToDartType[reference];
    if (dartType == null) {
      throw unreachable(
        'Reference $reference was not found in the cache. Did you forget to '
        'call toReference?',
      );
    }
    return dartType;
  }

  String? toUri(DartType type) => switch (type.element) {
        final element? => urlOfElement(element),
        _ => null,
      };

  DartType fromWireType(String wireType) {
    final type = _wireTypeToDartType[wireType];
    if (type == null) {
      throw unreachable(
        'Wire type $wireType was not found in the cache. Did you forget to '
        'call toReference?',
      );
    }
    return type;
  }

  /// Determines whether a [DartType] can be serialized.
  ///
  /// Types must:
  /// - Be a simple JSON type (bool, double, int, String, null, Object)
  /// - Be an enum
  /// - Be a supported Dart SDK type
  /// - Be a class with a constructor named `fromJson` that takes a single
  ///   required parameter whose type is `Map<String, dynamic>`.
  /// - Be a class with a method named `toJson` that takes no required parameters.
  /// - Be a class which: has fields of the above types, has a constructor with
  ///   all fields present. For these classes, we generate custom serialization
  ///   code.
  Verdict isSerializable(DartType type) =>
      _serializationVerdicts[type] ??= runZoned(
        () => type.accept(const IsSerializable()),
        zoneValues: {
          _seenKey: Zone.current[_seenKey] ??
              HashSet(
                equals: const DartTypeEquality(ignoreNullability: true).equals,
                hashCode: const DartTypeEquality(ignoreNullability: true).hash,
              ),
        },
      );

  static const _seenKey = #seen;

  /// The set of types seen by the current [isSerializable] check.
  Set<DartType> get seen => Zone.current[_seenKey] as Set<DartType>;

  Iterable<codegen.Class> customSerializers(DartType type) sync* {
    final verdict = isSerializable(type);
    if (verdict case VerdictYes(:final serializationSpecs)) {
      for (final serializationSpec in serializationSpecs) {
        yield SerializerGenerator(serializationSpec).build();
        for (final subtype in serializationSpec.subtypes) {
          yield SerializerGenerator(
            subtype,
            parent: serializationSpec,
          ).build();
        }
      }
    }
  }

  final Map<InterfaceElement, List<InterfaceType>> subtypes = {};
}

final class _TypeToCodeBuilder implements TypeVisitor<codegen.Reference> {
  const _TypeToCodeBuilder();

  @override
  codegen.Reference visitDynamicType(DynamicType type) =>
      DartTypes.core.dynamic;

  @override
  codegen.Reference visitFunctionType(FunctionType type) {
    return codegen.FunctionType(
      (b) => b
        ..returnType = typeHelper.toReference(type.returnType)
        ..optionalParameters.addAll([
          for (final parameter
              in type.parameters.where((p) => p.isOptionalPositional))
            typeHelper.toReference(parameter.type),
        ])
        ..requiredParameters.addAll([
          for (final parameter
              in type.parameters.where((p) => p.isRequiredPositional))
            typeHelper.toReference(parameter.type),
        ])
        ..namedParameters.addAll({
          for (final parameter
              in type.parameters.where((p) => p.isOptionalNamed))
            parameter.name: typeHelper.toReference(parameter.type),
        })
        ..namedRequiredParameters.addAll({
          for (final parameter
              in type.parameters.where((p) => p.isRequiredNamed))
            parameter.name: typeHelper.toReference(parameter.type),
        })
        ..types.addAll([
          for (final formal in type.typeFormals)
            codegen.TypeReference(
              (t) => t
                ..symbol = formal.name
                ..bound = switch (formal.bound) {
                  final bound? => typeHelper.toReference(bound),
                  _ => null,
                },
            ),
        ]),
    );
  }

  @override
  codegen.Reference visitInterfaceType(InterfaceType type) {
    final typeArguments = type.typeArguments.map(typeHelper.toReference);
    final ref = codegen.TypeReference(
      (t) => t
        ..symbol = type.element.name
        ..url = type.uri.toString()
        ..types.addAll(typeArguments)
        ..isNullable = type.nullabilitySuffix != NullabilitySuffix.none,
    );
    return ref;
  }

  @override
  codegen.Reference visitInvalidType(InvalidType type) =>
      codegen.refer(type.getDisplayString(withNullability: false));

  @override
  codegen.Reference visitNeverType(NeverType type) => DartTypes.core.never;

  @override
  codegen.Reference visitRecordType(RecordType type) {
    if (type.alias case final alias?) {
      return codegen.TypeReference(
        (b) => b
          ..symbol = alias.element.displayName
          ..url = projectPaths
              .normalizeUri(alias.element.sourceLocation.sourceUrl!)
              .toString()
          // TODO(dnys1): https://github.com/dart-lang/sdk/issues/54346
          // ..isNullable = alias.element.nullabilitySuffix != NullabilitySuffix.none,
          ..isNullable = typeHelper.typeSystem.isNullable(type),
      );
    }
    return codegen.RecordType(
      (r) => r
        ..positionalFieldTypes.addAll([
          for (final parameter in type.positionalFields)
            typeHelper.toReference(parameter.type),
        ])
        ..namedFieldTypes.addAll({
          for (final parameter in type.namedFields)
            parameter.name: typeHelper.toReference(parameter.type),
        })
        ..isNullable = type.nullabilitySuffix == NullabilitySuffix.question,
    );
  }

  @override
  codegen.Reference visitTypeParameterType(TypeParameterType type) {
    return codegen.TypeReference(
      (t) => t
        ..symbol = type.getDisplayString(withNullability: false)
        ..bound = type.bound is DynamicType
            ? null
            : typeHelper.toReference(type.bound),
    );
  }

  @override
  codegen.Reference visitVoidType(VoidType type) => DartTypes.core.void$;
}

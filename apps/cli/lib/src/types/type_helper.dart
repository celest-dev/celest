import 'dart:async';
import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_provider.dart';
import 'package:analyzer/dart/element/type_system.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:analyzer/src/dart/element/type.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/serialization/serialization_verdict.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart' as codegen;

final class CoreTypes implements TypeProvider {
  CoreTypes({
    required TypeProvider typeProvider,
    required this.coreExceptionType,
    required this.coreErrorType,
    required this.coreBigIntType,
    required this.dateTimeType,
    required this.durationType,
    required this.coreRegExpType,
    required this.coreStackTraceType,
    required this.coreUriType,
    required this.coreUriDataType,
    required this.typedDataUint8ListType,
    required this.badRequestExceptionType,
    required this.internalServerErrorType,
    required this.userType,
  }) : _typeProvider = typeProvider;

  final TypeProvider _typeProvider;

  final DartType coreExceptionType;
  final DartType coreErrorType;
  final DartType coreBigIntType;
  final DartType dateTimeType;
  final DartType durationType;
  final DartType coreRegExpType;
  final DartType coreStackTraceType;
  final DartType coreUriType;
  final DartType coreUriDataType;
  final DartType typedDataUint8ListType;

  final DartType badRequestExceptionType;
  final DartType internalServerErrorType;
  final DartType userType;

  @override
  ClassElement get boolElement => _typeProvider.boolElement;

  @override
  InterfaceType get boolType => _typeProvider.boolType;

  @override
  DartType get bottomType => _typeProvider.bottomType;

  @override
  InterfaceType get deprecatedType => _typeProvider.deprecatedType;

  @override
  ClassElement get doubleElement => _typeProvider.doubleElement;

  @override
  InterfaceType get doubleType => _typeProvider.doubleType;

  @override
  DartType get dynamicType => _typeProvider.dynamicType;

  @override
  ClassElement? get enumElement => _typeProvider.enumElement;

  @override
  InterfaceType? get enumType => _typeProvider.enumType;

  @override
  InterfaceType get functionType => _typeProvider.functionType;

  @override
  InterfaceType get futureDynamicType => _typeProvider.futureDynamicType;

  @override
  ClassElement get futureElement => _typeProvider.futureElement;

  @override
  InterfaceType get futureNullType => _typeProvider.futureNullType;

  @override
  ClassElement get futureOrElement => _typeProvider.futureOrElement;

  @override
  InterfaceType get futureOrNullType => _typeProvider.futureOrNullType;

  @override
  InterfaceType futureOrType(DartType valueType) {
    return _typeProvider.futureOrType(valueType);
  }

  @override
  InterfaceType futureType(DartType valueType) {
    return _typeProvider.futureType(valueType);
  }

  @override
  ClassElement get intElement => _typeProvider.intElement;

  @override
  InterfaceType get intType => _typeProvider.intType;

  @override
  bool isNonSubtypableClass(InterfaceElement element) {
    return _typeProvider.isNonSubtypableClass(element);
  }

  @override
  bool isObjectGetter(String id) {
    return _typeProvider.isObjectGetter(id);
  }

  @override
  bool isObjectMember(String id) {
    return _typeProvider.isObjectMember(id);
  }

  @override
  bool isObjectMethod(String id) {
    return _typeProvider.isObjectMethod(id);
  }

  @override
  InterfaceType get iterableDynamicType => _typeProvider.iterableDynamicType;

  @override
  ClassElement get iterableElement => _typeProvider.iterableElement;

  @override
  InterfaceType get iterableObjectType => _typeProvider.iterableObjectType;

  @override
  InterfaceType iterableType(DartType elementType) {
    return _typeProvider.iterableType(elementType);
  }

  @override
  ClassElement get listElement => _typeProvider.listElement;

  @override
  InterfaceType listType(DartType elementType) {
    return _typeProvider.listType(elementType);
  }

  @override
  ClassElement get mapElement => _typeProvider.mapElement;

  @override
  InterfaceType get mapObjectObjectType => _typeProvider.mapObjectObjectType;

  @override
  InterfaceType mapType(DartType keyType, DartType valueType) {
    return _typeProvider.mapType(keyType, valueType);
  }

  @override
  NeverType get neverType => _typeProvider.neverType;

  @override
  ClassElement get nullElement => _typeProvider.nullElement;

  @override
  InterfaceType get nullType => _typeProvider.nullType;

  @override
  ClassElement get numElement => _typeProvider.numElement;

  @override
  InterfaceType get numType => _typeProvider.numType;

  @override
  ClassElement get objectElement => _typeProvider.objectElement;

  @override
  InterfaceType get objectQuestionType => _typeProvider.objectQuestionType;

  @override
  InterfaceType get objectType => _typeProvider.objectType;

  @override
  ClassElement get recordElement => _typeProvider.recordElement;

  @override
  InterfaceType get recordType => _typeProvider.recordType;

  @override
  ClassElement get setElement => _typeProvider.setElement;

  @override
  InterfaceType setType(DartType elementType) {
    return _typeProvider.setType(elementType);
  }

  @override
  InterfaceType get stackTraceType => _typeProvider.stackTraceType;

  @override
  InterfaceType get streamDynamicType => _typeProvider.streamDynamicType;

  @override
  ClassElement get streamElement => _typeProvider.streamElement;

  @override
  InterfaceType streamType(DartType elementType) {
    return _typeProvider.streamType(elementType);
  }

  @override
  ClassElement get stringElement => _typeProvider.stringElement;

  @override
  InterfaceType get stringType => _typeProvider.stringType;

  @override
  ClassElement get symbolElement => _typeProvider.symbolElement;

  @override
  InterfaceType get symbolType => _typeProvider.symbolType;

  @override
  InterfaceType get typeType => _typeProvider.typeType;

  @override
  VoidType get voidType => _typeProvider.voidType;
}

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

  CoreTypes? _coreTypes;
  CoreTypes get coreTypes {
    if (_coreTypes == null) {
      throw StateError(
        'TypeHelper.coreTypes was accessed before it was initialized. '
        'The core types are only available after analysis.',
      );
    }
    return _coreTypes!;
  }

  set coreTypes(CoreTypes coreTypes) {
    _coreTypes = coreTypes;
  }

  // TODO(dnys1): File ticket with Dart team around hashcode/equality of DartType
  final _dartTypeToReference = HashMap<DartType, codegen.Reference>(
    equals: const DartTypeEquality().equals,
    hashCode: const DartTypeEquality().hash,
  );
  final _referenceToDartType = <codegen.Reference, DartType>{};
  final _wireTypeToDartType = <String, DartType>{};
  final serializationVerdicts = HashMap<DartType, Verdict>(
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
      _referenceToDartType[reference.withNullability(true)] ??=
          (type as TypeImpl).withNullability(NullabilitySuffix.question)
            ..alias = type.alias;
      _referenceToDartType[reference.withNullability(false)] ??= type;
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
  Verdict isSerializable(DartType type) {
    final verdict = serializationVerdicts[type] ??= runZoned(
      () => type.asOverriden.accept(const IsSerializable()),
      zoneValues: {
        _seenKey: Zone.current[_seenKey] ??
            HashSet(
              equals: const DartTypeEquality(ignoreNullability: true).equals,
              hashCode: const DartTypeEquality(ignoreNullability: true).hash,
            ),
      },
    );
    assert(
      () {
        bool isValidOverride(Verdict verdict) {
          if (verdict is! VerdictYes) {
            return true;
          }
          if (!(verdict.primarySpec?.type.isExtensionType ?? false)) {
            return false;
          }
          for (final additionalSpec in verdict.additionalSpecs) {
            if (const DartTypeEquality(ignoreNullability: true)
                .equals(additionalSpec.type, type)) {
              return false;
            }
          }
          return true;
        }

        if (type.isOverridden) {
          return isValidOverride(verdict);
        }
        return true;
      }(),
      'isSerializable($type) returned an invalid verdict',
    );

    return verdict;
  }

  static const _seenKey = #seen;

  /// The set of types seen by the current [isSerializable] check.
  Set<DartType?> get seen => Zone.current[_seenKey] as Set<DartType?>;

  Iterable<SerializerDefinition> customSerializers(
    DartType type,
  ) {
    final verdict = isSerializable(type);
    if (verdict case VerdictYes(:final primarySpec?, :final additionalSpecs)) {
      return SerializerGenerator(
        primarySpec,
        additionalSerializationSpecs: additionalSpecs,
      ).build();
    }
    return const Iterable.empty();
  }

  final Map<InterfaceElement, List<InterfaceType>> subtypes = Map.identity();

  /// Maps 3p types to their extension type overrides.
  final Map<InterfaceType, InterfaceType> overrides = Map.identity();

  /// Reset all caches.
  void reset() {
    _dartTypeToReference.clear();
    _referenceToDartType.clear();
    _wireTypeToDartType.clear();
    serializationVerdicts.clear();
    subtypes.clear();
    overrides.clear();
  }
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
    return builtInTypes[type] ?? ref;
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

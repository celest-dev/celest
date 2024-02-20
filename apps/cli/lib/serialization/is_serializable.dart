import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:analyzer/src/dart/element/member.dart';
import 'package:analyzer/src/dart/element/type_algebra.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart' as code_builder;
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:source_span/source_span.dart';

enum _TypePosition { parameter, return$ }

sealed class Verdict {
  const Verdict();

  const factory Verdict.yes({
    SerializationSpec? primarySpec,
    Set<SerializationSpec> additionalSpecs,
  }) = VerdictYes;
  factory Verdict.no(
    String reason, {
    FileSpan? location,
  }) = VerdictNo.single;

  bool get isSerializable;
  List<VerdictReason> get reasons;

  Verdict operator &(Verdict other) => switch ((this, other)) {
        (
          VerdictYes(
            primarySpec: final primarySpecThis,
            additionalSpecs: final additionalSpecsThis
          ),
          VerdictYes(
            primarySpec: final primarySpecOther,
            additionalSpecs: final additionalSpecsOther
          )
        ) =>
          Verdict.yes(
            primarySpec: primarySpecThis,
            additionalSpecs: {
              if (primarySpecOther != null) primarySpecOther,
              ...additionalSpecsThis,
              ...additionalSpecsOther,
            },
          ),
        (VerdictYes(), final VerdictNo no) ||
        (final VerdictNo no, VerdictYes()) =>
          no,
        (
          VerdictNo(reasons: final reasonsThis),
          VerdictNo(reasons: final reasonsOther)
        ) =>
          VerdictNo([...reasonsThis, ...reasonsOther]),
      };

  Verdict withPrimarySpec(SerializationSpec spec);
  Verdict withAdditionalSpec(SerializationSpec spec);
}

final class VerdictYes extends Verdict {
  const VerdictYes({
    this.primarySpec,
    this.additionalSpecs = const {},
  });

  @override
  bool get isSerializable => true;

  final SerializationSpec? primarySpec;
  final Set<SerializationSpec> additionalSpecs;

  @override
  Verdict withPrimarySpec(SerializationSpec spec) => Verdict.yes(
        primarySpec: spec,
        additionalSpecs: additionalSpecs,
      );

  @override
  Verdict withAdditionalSpec(SerializationSpec spec) => Verdict.yes(
        primarySpec: primarySpec,
        additionalSpecs: {
          ...additionalSpecs,
          spec,
        },
      );

  @override
  List<VerdictReason> get reasons => const [];
}

final class VerdictNo extends Verdict {
  const VerdictNo(this.reasons);
  VerdictNo.single(
    String reason, {
    FileSpan? location,
  }) : reasons = [VerdictReason(reason, location: location)];

  @override
  bool get isSerializable => false;

  @override
  final List<VerdictReason> reasons;

  @override
  Verdict withPrimarySpec(SerializationSpec spec) => this;

  @override
  Verdict withAdditionalSpec(SerializationSpec spec) => this;

  @override
  String toString() => reasons.join('; ');
}

final class VerdictReason {
  const VerdictReason(this.reason, {this.location});

  final String reason;
  final FileSpan? location;

  @override
  String toString() => reason;
}

final class SerializationSpec {
  SerializationSpec({
    required this.type,
    required this.wireType,
    code_builder.Reference? castType,
    required this.fields,
    required this.parameters,
    required this.hasFromJson,
    required bool hasToJson,
    this.extensionType,
  })  : castType = castType ?? wireType,
        _hasToJson = hasToJson;

  final DartType type;

  /// The type returned by the `toJson` method.
  final code_builder.Reference wireType;

  /// The type expected by the `fromJson` constructor, if a `fromJson`
  /// constructor is provided.
  ///
  /// Otherwise, the class is constructed directly and this defaults to the
  /// [wireType].
  final code_builder.Reference castType;

  final List<FieldSpec> fields;
  final List<ParameterSpec> parameters;
  final bool hasFromJson;
  final bool _hasToJson;

  bool get hasToJson {
    var hasToJson = _hasToJson;
    var parent = this.parent;
    while (parent != null) {
      hasToJson |= parent.hasToJson;
      parent = parent.parent;
    }
    return hasToJson;
  }

  SerializationSpec? parent;
  final List<SerializationSpec> subtypes = [];
  final SerializationSpec? extensionType;

  bool get isExtensionType => extensionType != null;

  SerializationSpec copyWith({
    DartType? type,
    code_builder.Reference? wireType,
    code_builder.Reference? castType,
    List<FieldSpec>? fields,
    List<ParameterSpec>? parameters,
    bool? hasFromJson,
    bool? hasToJson,
    SerializationSpec? extensionType,
  }) =>
      SerializationSpec(
        type: type ?? this.type,
        wireType: wireType ?? this.wireType,
        castType: castType ?? this.castType,
        fields: fields ?? this.fields,
        parameters: parameters ?? this.parameters,
        hasFromJson: hasFromJson ?? this.hasFromJson,
        hasToJson: hasToJson ?? this.hasToJson,
        extensionType: extensionType ?? this.extensionType,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SerializationSpec &&
        const DartTypeEquality().equals(type, other.type) &&
        wireType == other.wireType &&
        castType == other.castType &&
        const ListEquality<FieldSpec>().equals(fields, other.fields) &&
        const ListEquality<ParameterSpec>()
            .equals(parameters, other.parameters) &&
        hasFromJson == other.hasFromJson &&
        _hasToJson == other._hasToJson &&
        parent?.type == other.parent?.type &&
        const ListEquality<SerializationSpec>()
            .equals(subtypes, other.subtypes) &&
        extensionType == other.extensionType;
  }

  @override
  int get hashCode => Object.hash(
        const DartTypeEquality().hash(type),
        wireType,
        castType,
        const ListEquality<FieldSpec>().hash(fields),
        const ListEquality<ParameterSpec>().hash(parameters),
        hasFromJson,
        _hasToJson,
        parent == null ? null : const DartTypeEquality().hash(parent!.type),
        const ListEquality<SerializationSpec>().hash(subtypes),
        extensionType,
      );
}

@immutable
final class FieldSpec {
  const FieldSpec({
    required this.name,
    required this.type,
  });

  final String name;
  final DartType type;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FieldSpec &&
        name == other.name &&
        const DartTypeEquality().equals(type, other.type);
  }

  @override
  int get hashCode => Object.hash(name, const DartTypeEquality().hash(type));
}

@immutable
final class ParameterSpec {
  const ParameterSpec({
    required this.name,
    required this.type,
    required this.isPositional,
    required this.isOptional,
    required this.isNamed,
    required this.defaultValue,
  });

  final String name;
  final DartType type;
  final bool isPositional;
  final bool isOptional;
  final bool isNamed;
  final code_builder.Expression? defaultValue;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ParameterSpec &&
        name == other.name &&
        const DartTypeEquality().equals(type, other.type) &&
        isPositional == other.isPositional &&
        isOptional == other.isOptional &&
        isNamed == other.isNamed;
  }

  @override
  int get hashCode => Object.hash(
        name,
        const DartTypeEquality().hash(type),
        isPositional,
        isOptional,
        isNamed,
      );
}

/// Determines whether a [DartType] can be serialized to/from JSON.
///
/// - Be a simple JSON type (bool, double, int, String, null, Object)
/// - Be an enum
/// - Be a supported Dart SDK type
/// - Be a class with a constructor named `fromJson` that takes a single
///   required parameter whose type is `Map<String, dynamic>`.
/// - Be a class with a method named `toJson` that takes no required parameters.
/// - Be a class which: has fields of the above types, has a constructor with
///   all fields present. For these classes, we generate custom serialization
///   code.
final class IsSerializable extends TypeVisitor<Verdict> {
  const IsSerializable();

  Verdict? _isSimpleJson(DartType type) {
    if (type is! InterfaceType) {
      // Cannot make a verdict.
      return null;
    }
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreNum || // TODO(dnys1): test
        type.isDartCoreString ||
        type.isDartCoreNull) {
      return const Verdict.yes();
    }
    if (type.isDartCoreEnum) {
      return const VerdictNo([
        VerdictReason('Untyped enums are not supported'),
      ]);
    }
    if (type.isDartCoreSet) {
      return const VerdictNo([
        VerdictReason('Set types are not supported'),
      ]);
    }
    if (type.isDartCoreSymbol) {
      return const VerdictNo([
        VerdictReason('Symbol types are not supported'),
      ]);
    }
    if (type.isDartCoreType) {
      return const VerdictNo([
        VerdictReason('Type literals are not supported'),
      ]);
    }
    // Cannot make a verdict.
    return null;
  }

  Verdict _isJson(DartType type) {
    const invalidJson = VerdictNo([
      VerdictReason('Type is not valid JSON'),
    ]);
    if (type is! InterfaceType) {
      return invalidJson;
    }
    if (_isSimpleJson(type) case final verdict?) {
      return verdict;
    }
    if (type.isDartCoreObject) {
      return const Verdict.yes();
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      return _isJson(type.typeArguments.single);
    }
    if (type.isDartCoreMap) {
      final [keyType, valueType] = type.typeArguments;
      if (!keyType.isDartCoreString) {
        return const VerdictNo([
          VerdictReason('Map keys must be strings'),
        ]);
      }
      return switch (valueType) {
        // This is the only case where `Object`/`dynamic` are allowed.
        InterfaceType(isDartCoreObject: true) ||
        DynamicType() =>
          const Verdict.yes(),
        _ => _isJson(valueType),
      };
    }
    return invalidJson;
  }

  @override
  Verdict visitDynamicType(DynamicType type) => const VerdictNo([
        VerdictReason('Dynamic values are not supported'),
      ]);

  @override
  Verdict visitFunctionType(FunctionType type) => const VerdictNo([
        VerdictReason('Function types are not supported'),
      ]);

  // Most logic for `_checkCustomDeserializer` and `_checkCustomSerializer` is
  // pulled from `package:json_serializable/src/type_helpers/json_helper.dart`.

  Verdict _checkCustomDeserializer(
    InterfaceType type,
    ConstructorElement fromJsonCtor,
    DartType wireType,
  ) {
    // Using the `declaration` here so we get the original definition –
    // and not one with the generics already populated.
    //
    // For example, if `type` is `IList<String>`, then `fromJsonCtor` will
    // have its parameter with type `Object Function(String) fromJsonT` and
    // `fromJsonCtor.declaration` will have its parameter with type
    // `Object Function(T) fromJsonT`.
    fromJsonCtor = fromJsonCtor.declaration;

    final positionalParameters = fromJsonCtor.parameters
        .where((parameter) => parameter.isPositional)
        .toList();
    final namedParameters = fromJsonCtor.parameters
        .where((parameter) => parameter.isNamed)
        .toList();
    if (positionalParameters.isEmpty || namedParameters.isNotEmpty) {
      final functionSignature =
          'factory ${type.element.name}.fromJson(${wireType.getDisplayString(withNullability: false)} json)';
      return Verdict.no(
        'The fromJson constructor of type ${type.element.name} must have '
        'one required, positional parameter whose type matches the return '
        'type of its toJson method, e.g. $functionSignature',
        location: fromJsonCtor.sourceLocation,
      );
    }

    String fromJsonForName(String genericType) => 'fromJson$genericType';

    final parameters = Queue.of(fromJsonCtor.parameters);
    final requiredParam = parameters.removeFirst();
    if (requiredParam.isOptional) {
      return Verdict.no(
        'The fromJson constructor of type ${type.element.name} must have '
        'one required, positional parameter.',
        location: fromJsonCtor.sourceLocation,
      );
    }
    switch (wireType) {
      case DartType(isDartCoreObject: true) || DynamicType():
      case _
          when typeHelper.typeSystem.isAssignableTo(
            wireType,
            requiredParam.type,
          ):
        // OK, will cast in serializer.
        break;
      default:
        return Verdict.no(
          'The parameter type of ${type.element.name}\'s fromJson constructor '
          'must be assignable to $wireType.',
          location: fromJsonCtor.sourceLocation,
        );
    }

    var verdict = const Verdict.yes();
    for (final parameter in parameters) {
      switch (parameter.type) {
        case FunctionType(
            returnType: final TypeParameterType funcReturnType,
            normalParameterTypes: [
              DynamicType() ||
                  DartType(
                    isDartCoreObject: true,
                    nullabilitySuffix: NullabilitySuffix.question
                  )
            ],
          ):
          final expectedCtorParamName =
              fromJsonForName(funcReturnType.element.name);
          if (parameter.name != expectedCtorParamName) {
            verdict &= Verdict.no(
              'The parameter "${parameter.name}" of ${type.element.name}\'s '
              'fromJson constructor must be named "$expectedCtorParamName".',
              location: parameter.sourceLocation,
            );
          }
        default:
          return Verdict.no(
            'The fromJson constructor of ${type.element.name} has an unexpected '
            'parameter: ${parameter.name}. The only extra parameters allowed are '
            'functions of the form `T Function(Object?) fromJsonT` where `T` is '
            'a type parameter of ${type.element.name}.',
            location: parameter.sourceLocation,
          );
      }
    }

    return verdict;
  }

  Verdict _checkCustomSerializer(
    InterfaceType type,
    MethodElement toJsonMethod,
  ) {
    String toJsonForName(String genericType) => 'toJson$genericType';

    // Using the `declaration` here so we get the original definition –
    // and not one with the generics already populated.
    //
    // For example, if `type` is `IList<String>`, then `toJsonMethod` will
    // be `Object Function(String) toJsonT` and `toJsonMethod.declaration`
    // will be `Object Function(T) toJsonT`.
    toJsonMethod = toJsonMethod.declaration;

    var verdict = const Verdict.yes();
    for (final parameter in toJsonMethod.parameters) {
      switch (parameter.type) {
        case FunctionType(
            returnType: DartType(isDartCoreObject: true) || DynamicType(),
            normalParameterTypes: [final TypeParameterType funcParameterType],
          ):
          final expectedFuncParamName =
              toJsonForName(funcParameterType.element.name);
          if (parameter.name != expectedFuncParamName) {
            verdict &= Verdict.no(
              'The parameter "${parameter.name}" of ${type.element.name}\'s '
              'toJson method must be named "$expectedFuncParamName".',
              location: parameter.sourceLocation,
            );
          }
        default:
          return Verdict.no(
            'The toJson method of ${type.element.name} has an unexpected '
            'parameter: ${parameter.name}. The only parameters allowed are '
            'functions of the form `Object Function(T) toJsonT` where `T` is '
            'a type parameter of ${type.element.name}.',
            location: parameter.sourceLocation,
          );
      }
    }
    final returnType = toJsonMethod.returnType;
    verdict &= switch (_isJson(returnType)) {
      VerdictYes() => const Verdict.yes(),
      _ => Verdict.no(
          'Invalid return type of ${type.element.name}\'s toJson method: '
          '$returnType. Only simple JSON types are allowed.',
          location: toJsonMethod.sourceLocation,
        ),
    };
    return verdict;
  }

  Verdict _visitExtensionType(
    InterfaceType type,
    ExtensionTypeElement element,
  ) {
    final erasureType = type.extensionTypeErasure;
    var erasureVerdict = typeHelper.isSerializable(erasureType);
    // If it's a no but only because it is not allowed as a raw JSON type, then
    // allow it if it's a JsonX type from package:celest.
    if (erasureVerdict is VerdictNo) {
      final jsonVerdict = _isJson(erasureType);
      if (jsonVerdict is VerdictYes && type.isJsonExtensionType) {
        erasureVerdict = jsonVerdict;
      }
    }
    switch (erasureVerdict) {
      case VerdictNo():
        return VerdictNo([
          VerdictReason(
            'The representation type of ${element.name} is not serializable',
            location: element.sourceLocation,
          ),
          ...erasureVerdict.reasons,
        ]);
      case VerdictYes(primarySpec: final erasurePrimaySpec):
        if (erasurePrimaySpec != null) {
          final verdict = _visitCustomInterfaceType(type);
          return switch (verdict) {
            VerdictNo() => verdict,
            // ignore: unnecessary_null_checks
            VerdictYes(:final primarySpec!, :final additionalSpecs) =>
              Verdict.yes(
                primarySpec: erasurePrimaySpec.copyWith(
                  extensionType: primarySpec..parent = erasurePrimaySpec,
                ),
                additionalSpecs: {
                  ...additionalSpecs,
                  ...erasureVerdict.additionalSpecs,
                },
              ),
          };
        }
        // If primarySpec is null, then this is a builtin interface type and
        // we must create the serialization spec for it.
        ConstructorElement? constructor;
        if (element.primaryConstructor.name.isEmpty &&
            !element.primaryConstructor.isPrivate) {
          constructor = element.primaryConstructor;
        } else {
          constructor = element.constructors.firstWhereOrNull((ctor) {
            if (ctor.name.isNotEmpty || ctor.isPrivate) {
              return false;
            }
            if (ctor.parameters case [final parameter]
                when TypeChecker.fromStatic(parameter.type)
                    .isExactlyType(erasureType)) {
              return true;
            }
            return false;
          });
        }
        final (fields: _, :toJsonMethod, :fromJsonCtor) =
            element.interfaceMembers(type);
        // The representation type is either a built-in or a primitive at
        // this point.
        final wireType =
            builtInTypes[erasureType] ?? typeHelper.toReference(erasureType);
        final spec = SerializationSpec(
          type: erasureType,
          wireType: wireType,
          fields: [],
          parameters: [],
          hasFromJson: false,
          hasToJson: false,
        );
        return erasureVerdict.withPrimarySpec(
          spec.copyWith(
            extensionType: SerializationSpec(
              type: type,
              wireType: wireType,
              fields: [
                if (element.representation.isPublic)
                  FieldSpec(
                    name: element.representation.name,
                    type: element.representation.type,
                  ),
              ],
              parameters: [
                if (constructor != null)
                  ParameterSpec(
                    name: constructor.parameters.single.name,
                    type: erasureType,
                    isPositional: true,
                    isOptional: false,
                    isNamed: false,
                    defaultValue: null,
                  ),
              ],
              hasFromJson: fromJsonCtor != null,
              hasToJson: toJsonMethod != null,
            )..parent = spec,
          ),
        );
    }
  }

  Verdict _visitCustomInterfaceType(InterfaceType type) {
    final element = type.element;
    final (:fields, :toJsonMethod, :fromJsonCtor) =
        element.interfaceMembers(type);

    // Check if non-SDK class is serializable.
    //
    // Either it has its own fromJson/toJson methods, or it meets the
    // requirements needed to generate implementations.
    var verdict = const Verdict.yes();

    // Check type arguments
    // TODO(dnys1): Check bad arguments
    for (final typeArgument in type.typeArguments) {
      verdict &= typeHelper.isSerializable(typeArgument);
    }

    // Check toJson
    final hasToJson = toJsonMethod != null;
    if (hasToJson) {
      verdict &= _checkCustomSerializer(type, toJsonMethod);
    } else {
      verdict &= type.accept(
        const _IsSerializableClass(_TypePosition.return$),
      );
    }
    final wireType = toJsonMethod?.returnType ?? jsonMapType;

    // Check fromJson
    final hasFromJson = fromJsonCtor != null;
    if (hasFromJson) {
      verdict &= _checkCustomDeserializer(
        type,
        fromJsonCtor,
        wireType,
      );
    } else {
      verdict &= type.accept(
        const _IsSerializableClass(_TypePosition.parameter),
      );
    }
    final wireConstructor = fromJsonCtor ??
        type.constructors.singleWhereOrNull((ctor) => ctor.name.isEmpty);
    if (wireConstructor == null) {
      return verdict &
          Verdict.no(
            'Class ${element.displayName} must have an unnamed constructor '
            'with the same number of parameters as fields.',
            location: element.sourceLocation,
          );
    }

    final spec = SerializationSpec(
      type: type,
      wireType: typeHelper.toReference(wireType),
      castType: fromJsonCtor?.parameters.first.type.let(typeHelper.toReference),
      fields: [
        for (final field in fields)
          FieldSpec(name: field.displayName, type: field.type),
      ],
      parameters: [
        for (final parameter in wireConstructor.parameters)
          ParameterSpec(
            name: parameter.displayName,
            type: parameter.type,
            isPositional: parameter.isPositional,
            isOptional: parameter.isOptional,
            isNamed: parameter.isNamed,
            defaultValue: parameter.declaration.defaultTo,
          ),
      ],
      hasFromJson: fromJsonCtor != null,
      hasToJson: toJsonMethod != null,
    );
    verdict = verdict.withPrimarySpec(spec);

    InterfaceType instantiateSubtype(InterfaceType subtype) {
      final superParameters = type.element.typeParameters;
      final superArguments = type.typeArguments;
      assert(superParameters.length == superArguments.length);
      for (final subtypeSupertype in subtype.allSupertypes) {
        if (subtypeSupertype.element.declaration == type.element) {
          final substitutionMap = <TypeParameterElement, DartType>{};
          final subtypeSuperArgs = subtypeSupertype.typeArguments;
          for (var i = 0; i < subtypeSuperArgs.length; i++) {
            final subParameter = subtypeSuperArgs[i].element;
            if (subParameter is TypeParameterElement) {
              substitutionMap[subParameter] = superArguments[i];
            }
          }
          return Substitution.fromMap(substitutionMap)
              .mapInterfaceType(subtype);
        }
      }
      unreachable();
    }

    final subtypes = [
      for (final subtype
          in typeHelper.subtypes[type.element] ?? const <InterfaceType>[])
        switch (subtype) {
          InterfaceType(:final typeArguments) when typeArguments.isNotEmpty =>
            instantiateSubtype(subtype),
          _ => subtype,
        },
    ];
    for (final subtype in subtypes) {
      final subtypeVerdict = typeHelper.isSerializable(subtype);
      switch (subtypeVerdict) {
        case VerdictNo():
          verdict &= subtypeVerdict;
        case VerdictYes(:final primarySpec, :final additionalSpecs):
          final serializationSpecs = [
            if (primarySpec != null) primarySpec,
            ...additionalSpecs,
          ];
          for (final subtypeSpec in serializationSpecs) {
            if (subtypes.contains(subtypeSpec.type)) {
              final subtypeWireType =
                  typeHelper.fromReference(subtypeSpec.wireType);
              if (!TypeChecker.fromStatic(jsonMapType)
                  .isExactlyType(subtypeWireType)) {
                verdict &= Verdict.no(
                  'All classes in a sealed class hierarchy must use '
                  'Map<String, Object?> as their wire type but '
                  '${subtypeSpec.type.element!.name!} uses '
                  '${subtypeWireType.getDisplayString(withNullability: false)}',
                );
              }
              spec.subtypes.add(subtypeSpec..parent = spec);
            } else {
              verdict = verdict.withAdditionalSpec(subtypeSpec);
            }
          }
      }
    }

    return verdict;
  }

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    // TODO(dnys1): Test private aliases
    if (type.element.isPrivate) {
      return Verdict.no(
        'Private types are not supported',
        location: type.element.sourceLocation,
      );
    }

    // Extension types are always represented as an InterfaceType over their
    // erasure, which may not be an interface type.
    if (type.element case final ExtensionTypeElement extensionType) {
      return _visitExtensionType(type, extensionType);
    }

    if (_isSimpleJson(type) case final verdict?) {
      return verdict;
    }

    if (type.isDartCoreObject) {
      return const VerdictNo([
        VerdictReason('Object types are not supported'),
      ]);
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      return typeHelper.isSerializable(type.typeArguments.single);
    }
    if (type.isDartCoreMap) {
      final [keyType, valueType] = type.typeArguments;
      if (!keyType.isDartCoreString) {
        return Verdict.no('Map keys must be strings');
      }
      return switch (valueType) {
        // This is the only case where `Object`/`dynamic` are allowed.
        InterfaceType(isDartCoreObject: true) ||
        DynamicType() =>
          const VerdictNo([
            VerdictReason(
              'Maps with dynamic/Object values are no longer supported directly. '
              'To pass JSON maps, use `JsonMap` from `package:celest_core`.',
            ),
          ]),
        _ => typeHelper.isSerializable(valueType),
      };
    }
    if (type.isDartAsyncStream) {
      return const VerdictNo([
        VerdictReason('Stream types are not supported'),
      ]);
    }

    if (type.isEnum) {
      return Verdict.yes(
        // TODO(dnys1): Serialization of extension typed enums
        primarySpec: SerializationSpec(
          type: type,
          wireType: DartTypes.core.string,
          fields: const [],
          parameters: const [],
          hasFromJson: false,
          hasToJson: false,
        ),
      );
    }

    // TODO(dnys1): Test
    // TODO(dnys1): Test for extends/implements these types
    // TODO(dnys1): Test for extends/implements these types w/ custom serde
    if (supportedDartSdkType.isExactlyType(type)) {
      return const Verdict.yes();
    }

    if (!typeHelper.seen.add(type)) {
      // Cycle detected. If there is a level of indirection, this is okay.
      // We have this check to prevent stack overflow, and ensure a proper level
      // of indirection in [_IsSerializableClass] below.
      return const Verdict.yes();
    }

    return _visitCustomInterfaceType(type);
  }

  @override
  Verdict visitInvalidType(InvalidType type) =>
      const VerdictNo([VerdictReason('Invalid type')]);

  @override
  Verdict visitNeverType(NeverType type) =>
      const VerdictNo([VerdictReason('Never types are not supported')]);

  @override
  Verdict visitRecordType(RecordType type) {
    if (type.positionalFields.isNotEmpty) {
      return Verdict.no(
        'Positional fields are not supported in record types',
        location: type.alias?.element.sourceLocation,
      );
    }
    var verdict = Verdict.yes(
      primarySpec: SerializationSpec(
        type: type,
        wireType: typeHelper.toReference(jsonMapType),
        fields: [
          for (final field in type.namedFields)
            FieldSpec(name: field.name, type: field.type),
        ],
        parameters: [
          for (final field in type.namedFields)
            ParameterSpec(
              name: field.name,
              type: field.type,
              isPositional: false,
              isNamed: true,
              isOptional: false,
              defaultValue: null,
            ),
        ],
        hasFromJson: false,
        hasToJson: false,
      ),
    );
    for (final field in type.namedFields) {
      verdict &= typeHelper.isSerializable(field.type);
    }
    return verdict;
  }

  @override
  Verdict visitTypeParameterType(TypeParameterType type) {
    // TODO(dnys1): Tests for different branches
    switch (type.bound) {
      case InterfaceType(:final ClassElement element) when element.isSealed:
        analytics.capture(
          'type_parameter',
          properties: {
            'type': type.getDisplayString(withNullability: false),
            'bound': 'sealed',
          },
        );
        return typeHelper.isSerializable(type.bound);
      case DynamicType():
        analytics.capture(
          'type_parameter',
          properties: {
            'type': type.getDisplayString(withNullability: false),
            'bound': 'unbounded',
          },
        );
        return const VerdictNo([
          VerdictReason('Unbounded generic types are not supported'),
        ]);
      default:
        analytics.capture(
          'type_parameter',
          properties: {
            'type': type.getDisplayString(withNullability: false),
            'bound': 'other',
          },
        );
        return VerdictNo([
          VerdictReason(
            'Unsupported generic bound: ${type.bound}. Only sealed classes '
            'can be used as bounds.',
            location: type.element.sourceLocation,
          ),
        ]);
    }
  }

  @override
  Verdict visitVoidType(VoidType type) =>
      Verdict.no('Void types are not supported');
}

final class _IsSerializableClass extends TypeVisitor<Verdict> {
  const _IsSerializableClass(this.position);

  final _TypePosition position;

  @override
  Verdict visitDynamicType(DynamicType type) => unreachable('Not a class type');

  @override
  Verdict visitFunctionType(FunctionType type) =>
      unreachable('Not a class type');

  Verdict _visitClass(InterfaceType type, ClassElement element) {
    final fields = element.sortedFields(type);
    var verdict = const Verdict.yes();
    var fieldsVerdict = const Verdict.yes();
    for (final field in fields) {
      if (field.isPrivate) {
        fieldsVerdict &= Verdict.no(
          'Private field "${field.displayName}" is not supported in a class '
          'used as a return type. Consider defining custom fromJson/toJson '
          'methods or making the field public.',
          location: field.sourceLocation,
        );
        continue;
      }
      if (const DartTypeEquality().equals(type, field.type)) {
        fieldsVerdict &= Verdict.no(
          'Classes are not allowed to have fields of their own type.',
          location: field.sourceLocation,
        );
        continue;
      }
      final fieldVerdict = typeHelper.isSerializable(field.type);
      fieldsVerdict &= switch (fieldVerdict) {
        VerdictYes() => fieldVerdict,
        _ => Verdict.no(
            'Field "${field.displayName}" of type "${element.displayName}" is '
            'not serializable: $fieldVerdict',
            location: field.sourceLocation,
          ),
      };
    }
    if (position == _TypePosition.return$) {
      verdict &= fieldsVerdict;
    }
    var constructorVerdict = const Verdict.yes();
    final unnamedConstructor = type.constructors.firstWhereOrNull((ctor) {
      if (ctor.name.isNotEmpty) {
        return false;
      }
      final parameters = ctor.parameters;
      for (final parameter in parameters) {
        FieldElement? fieldFormal(ParameterElement param) {
          return switch (param) {
            FieldFormalParameterElement(:final field?) => field,
            SuperFormalParameterElement(:final superConstructorParameter?) =>
              fieldFormal(superConstructorParameter),
            _ => fields.firstWhereOrNull((field) => field.name == param.name),
          };
        }

        final parameterField = fieldFormal(parameter);
        if (parameterField == null) {
          constructorVerdict &= Verdict.no(
            'Constructor parameter "${parameter.displayName}" is not '
            'supported.',
            location: parameter.sourceLocation,
          );
          return false;
        }
        if (fields.none((f) => f.name == parameterField.name)) {
          constructorVerdict &= Verdict.no(
            'Constructor parameter "${parameter.displayName}" is not '
            'a field of the class ${element.displayName}.',
            location: parameter.sourceLocation,
          );
          return false;
        }
      }
      return true;
    });
    if (unnamedConstructor == null) {
      constructorVerdict &= Verdict.no(
        'Class ${element.displayName} must have an unnamed constructor with '
        'the same number of parameters as fields.',
        location: element.sourceLocation,
      );
    } else if (element.isAbstract &&
        !element.isSealed &&
        !unnamedConstructor.isFactory) {
      constructorVerdict &= Verdict.no(
        'Class ${element.displayName} is abstract and must have an unnamed factory '
        'or fromJson factory constructor to be used.',
        location: element.sourceLocation,
      );
    }
    if (position == _TypePosition.parameter) {
      verdict &= constructorVerdict;
    }
    return verdict;
  }

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    final element = type.element;
    switch (element) {
      case ClassElement():
        return _visitClass(type, element);
      default:
        return Verdict.no(
          'The type ${element.displayName} is not serializable since it is not '
          'a class or does not have a fromJson/toJson method.',
          location: element.sourceLocation,
        );
    }
  }

  @override
  Verdict visitInvalidType(InvalidType type) => unreachable('Not a class type');

  @override
  Verdict visitNeverType(NeverType type) => unreachable('Not a class type');

  @override
  Verdict visitRecordType(RecordType type) => unreachable('Not a class type');

  @override
  Verdict visitTypeParameterType(TypeParameterType type) =>
      unreachable('Not a class type');

  @override
  Verdict visitVoidType(VoidType type) => unreachable('Not a class type');
}

typedef InterfaceMembers = ({
  List<FieldElement> fields,
  MethodElement? toJsonMethod,
  ConstructorElement? fromJsonCtor,
});

extension on InterfaceElement {
  InterfaceMembers interfaceMembers(InterfaceType type) {
    final element = this;
    switch (element) {
      case EnumElement():
        unreachable('Handled before this');
      case MixinElement():
        unreachable('Mixins are not supported');
      case final ClassElement classElement:
        return (
          fields: classElement.sortedFields(type),
          toJsonMethod: type.getMethod('toJson'),
          fromJsonCtor: classElement.constructors
              .firstWhereOrNull((ctor) => ctor.name == 'fromJson'),
        );
      case ExtensionTypeElement():
        final representationType = type.extensionTypeErasure;
        if (representationType is! InterfaceType) {
          unreachable('Extension type erasure is not an interface type');
        }

        // Extension types can be used to override their representation type's
        // toJson/fromJson methods.
        //
        // If the extension type implements its representation types, this
        // indicates that the representation type's fromJson/toJson methods are
        // valid fallbacks for the extension type.
        //
        // An extension type which does not implement its representation type
        // and does not provide its own toJson/fromJson methods indicates that
        // Celest should generate its own fromJson/toJson methods.
        final repMembers = representationType.element.interfaceMembers(type);
        final fields = repMembers.fields;
        MethodElement? repToJsonMethod;
        ConstructorElement? repFromJsonCtor;
        if (element.allSupertypes.contains(representationType)) {
          repToJsonMethod = repMembers.toJsonMethod;
          repFromJsonCtor = repMembers.fromJsonCtor;
        }
        final members = (
          fields: fields,
          toJsonMethod: element.getMethod('toJson') ?? repToJsonMethod,
          fromJsonCtor: element.constructors
                  .firstWhereOrNull((ctor) => ctor.name == 'fromJson') ??
              repFromJsonCtor,
        );
        analytics.capture(
          'extension_type',
          properties: {
            'type': type.getDisplayString(withNullability: false),
            'representationType': representationType.getDisplayString(
              withNullability: false,
            ),
            'hasToJson': members.toJsonMethod != null,
            'hasFromJson': members.fromJsonCtor != null,
          },
        );
        return members;
      case final unknownElement:
        unreachable(
          'Unknown interface element (${unknownElement.runtimeType}): '
          '$unknownElement',
        );
    }
  }
}

// Below is copied from `package:json_serializable`.

extension on ClassElement {
  /// Returns a [List] of all instance [FieldElement] items for this class and
  /// super classes, sorted first by their location in the inheritance hierarchy
  /// (super first) and then by their location in the source file.
  List<FieldElement> sortedFields(InterfaceType type) {
    // Get all of the fields that need to be assigned
    final elementInstanceFields = Map.fromEntries(
      this
          .fields
          // Note: Unlike `json_serializable` we do not support synthetic fields,
          // i.e. those fields which are synthesized from getters/setters.
          .where((e) => !e.isStatic && !e.isSynthetic)
          .map((e) {
        final member = inheritanceManager.getMember(
          type,
          Name(e.library.source.uri, e.name),
        );
        if (member case final PropertyAccessorMember member
            when member.isGetter) {
          assert(member.variable is FieldElement);
          return MapEntry(e.name, member.variable as FieldElement);
        }
        return MapEntry(e.name, e);
      }),
    );

    final inheritedFields = <String, FieldElement>{};

    const dartCoreObject = TypeChecker.fromUrl('dart:core#Object');

    // ignore: deprecated_member_use
    for (final v in inheritanceManager.getInheritedConcreteMap(type).values) {
      assert(v is! FieldElement);
      if (dartCoreObject.isExactly(v.enclosingElement)) {
        continue;
      }

      if (v is PropertyAccessorElement && v.isGetter) {
        assert(v.variable is FieldElement);
        final variable = v.variable as FieldElement;
        // Note: Unlike `json_serializable` we do not support synthetic fields,
        // i.e. those fields which are synthesized from getters/setters.
        if (variable.isSynthetic) {
          continue;
        }
        assert(!inheritedFields.containsKey(variable.name));
        inheritedFields[variable.name] = variable;
      }
    }

    // Get the list of all fields for `element`
    final allFields =
        elementInstanceFields.keys.toSet().union(inheritedFields.keys.toSet());

    final fields = allFields
        .map((e) => _FieldSet(elementInstanceFields[e], inheritedFields[e]))
        .toList()
      ..sort();

    return fields.map((fs) => fs.field).toList(growable: false);
  }
}

class _FieldSet implements Comparable<_FieldSet> {
  factory _FieldSet(FieldElement? classField, FieldElement? superField) {
    // At least one of these will != null, perhaps both.
    final fields = [classField, superField].nonNulls.toList();

    // Prefer the class field over the inherited field when sorting.
    final sortField = fields.first;

    return _FieldSet._(sortField);
  }

  _FieldSet._(this.field);

  final FieldElement field;

  @override
  int compareTo(_FieldSet other) => _sortByLocation(field, other.field);

  static int _sortByLocation(FieldElement a, FieldElement b) {
    final checkerA = TypeChecker.fromStatic(
      (a.enclosingElement as InterfaceElement).thisType,
    );

    if (!checkerA.isExactly(b.enclosingElement)) {
      // in this case, you want to prioritize the enclosingElement that is more
      // "super".

      if (checkerA.isAssignableFrom(b.enclosingElement)) {
        return -1;
      }

      final checkerB = TypeChecker.fromStatic(
        (b.enclosingElement as InterfaceElement).thisType,
      );

      if (checkerB.isAssignableFrom(a.enclosingElement)) {
        return 1;
      }
    }

    /// Returns the offset of given field/property in its source file – with a
    /// preference for the getter if it's defined.
    int offsetFor(FieldElement e) {
      if (e.isSynthetic) {
        return (e.getter ?? e.setter)!.nameOffset;
      }
      return e.nameOffset;
    }

    return offsetFor(a).compareTo(offsetFor(b));
  }
}

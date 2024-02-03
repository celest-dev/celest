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
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart' as code_builder;
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:source_span/source_span.dart';

enum _TypePosition { parameter, return$ }

sealed class Verdict {
  const Verdict();

  const factory Verdict.yes({
    Set<SerializationSpec> serializationSpecs,
  }) = VerdictYes;
  factory Verdict.no(
    String reason, {
    FileSpan? location,
  }) = VerdictNo.single;

  bool get isSerializable;
  List<VerdictReason> get reasons;

  Verdict operator &(Verdict other) => switch ((this, other)) {
        (
          VerdictYes(serializationSpecs: final serializationSpecsThis),
          VerdictYes(serializationSpecs: final serializationSpecsOther)
        ) =>
          Verdict.yes(
            serializationSpecs: {
              ...serializationSpecsThis,
              ...serializationSpecsOther,
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

  Verdict withSpec(SerializationSpec spec);
}

final class VerdictYes extends Verdict {
  const VerdictYes({
    this.serializationSpecs = const {},
  });

  @override
  bool get isSerializable => true;

  final Set<SerializationSpec> serializationSpecs;

  @override
  Verdict withSpec(SerializationSpec spec) => Verdict.yes(
        serializationSpecs: {
          ...serializationSpecs,
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
  Verdict withSpec(SerializationSpec spec) => this;

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
    DartType? castType,
    required this.fields,
    required this.parameters,
    required this.hasFromJson,
    required bool hasToJson,
  })  : castType = castType ?? wireType,
        _hasToJson = hasToJson;

  final DartType type;

  /// The type returned by the `toJson` method.
  final DartType wireType;

  /// The type expected by the `fromJson` constructor, if a `fromJson`
  /// constructor is provided.
  ///
  /// Otherwise, the class is constructed directly and this defaults to the
  /// [wireType].
  final DartType castType;

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SerializationSpec &&
        const DartTypeEquality().equals(type, other.type) &&
        const DartTypeEquality().equals(wireType, other.wireType) &&
        const DartTypeEquality().equals(castType, other.castType) &&
        const ListEquality<FieldSpec>().equals(fields, other.fields) &&
        const ListEquality<ParameterSpec>()
            .equals(parameters, other.parameters) &&
        hasFromJson == other.hasFromJson &&
        _hasToJson == other._hasToJson &&
        parent?.type == other.parent?.type &&
        const ListEquality<SerializationSpec>()
            .equals(subtypes, other.subtypes);
  }

  @override
  int get hashCode => Object.hash(
        const DartTypeEquality().hash(type),
        const DartTypeEquality().hash(wireType),
        const DartTypeEquality().hash(castType),
        const ListEquality<FieldSpec>().hash(fields),
        const ListEquality<ParameterSpec>().hash(parameters),
        hasFromJson,
        _hasToJson,
        parent == null ? null : const DartTypeEquality().hash(parent!.type),
        const ListEquality<SerializationSpec>().hash(subtypes),
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

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    // TODO(dnys1): Test private aliases
    if (type.element.isPrivate) {
      return Verdict.no(
        'Private types are not supported',
        location: type.element.sourceLocation,
      );
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
          const Verdict.yes(),
        _ => typeHelper.isSerializable(valueType),
      };
    }
    if (type.isDartAsyncStream) {
      return const VerdictNo([
        VerdictReason('Stream types are not supported'),
      ]);
    }

    if (type.isEnum) {
      return const Verdict.yes().withSpec(
        SerializationSpec(
          type: type,
          wireType: typeHelper.typeProvider.stringType,
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

    final element = type.element;
    if (element is! ClassElement) {
      return Verdict.no(
        'The type "${element.displayName}" is not serializable since it is not '
        'a class or does not have a fromJson/toJson method.',
      );
    }

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
    final toJsonMethod = type.getMethod('toJson');
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
    final fromJsonCtor = type.constructors.singleWhereOrNull(
      (element) => element.name == 'fromJson',
    );
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
      wireType: wireType,
      castType: fromJsonCtor?.parameters.first.type,
      fields: [
        for (final field in element.sortedFields(type))
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
    verdict = verdict.withSpec(spec);

    InterfaceType instantiateSubtype(InterfaceType subtype) {
      final superParameters = type.element.typeParameters;
      final superArguments = type.typeArguments;
      assert(superParameters.length == superArguments.length);
      var subtypeSupertype = subtype.superclass!;
      while (subtypeSupertype.element is ClassElement &&
          !subtypeSupertype.isDartCoreObject) {
        if (subtypeSupertype.element.declaration != type.element) {
          final superSuper = subtypeSupertype.superclass;
          assert(
            superSuper?.element is ClassElement &&
                (superSuper!.element as ClassElement).isDartCoreObject,
          );
          subtypeSupertype = superSuper!;
          continue;
        }
        final substitutionMap = <TypeParameterElement, DartType>{};
        final subtypeSuperArgs = subtypeSupertype.typeArguments;
        for (var i = 0; i < subtypeSuperArgs.length; i++) {
          final subParameter = subtypeSuperArgs[i].element;
          if (subParameter is TypeParameterElement) {
            substitutionMap[subParameter] = superArguments[i];
          }
        }
        return Substitution.fromMap(substitutionMap).mapInterfaceType(subtype);
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
        case VerdictYes(:final serializationSpecs):
          for (final subtypeSpec in serializationSpecs) {
            if (subtypes.contains(subtypeSpec.type)) {
              if (!TypeChecker.fromStatic(jsonMapType)
                  .isExactlyType(subtypeSpec.wireType)) {
                verdict &= Verdict.no(
                  'All classes in a sealed class hierarchy must use '
                  'Map<String, Object?> as their wire type but '
                  '${subtypeSpec.type.element!.name!} uses '
                  '${subtypeSpec.wireType.getDisplayString(withNullability: false)}',
                );
              }
              spec.subtypes.add(subtypeSpec..parent = spec);
            } else {
              verdict = verdict.withSpec(subtypeSpec);
            }
          }
      }
    }

    return verdict;
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
    var verdict = const Verdict.yes();
    for (final field in type.namedFields) {
      verdict &= typeHelper.isSerializable(field.type);
    }
    return verdict.withSpec(
      SerializationSpec(
        type: type,
        wireType: jsonMapType,
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
  }

  @override
  Verdict visitTypeParameterType(TypeParameterType type) {
    // TODO(dnys1): Generic tests and support?
    return Verdict.no('Generic types are not supported');
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

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    final element = type.element;
    if (element is! ClassElement) {
      return Verdict.no(
        'The type ${element.displayName} is not serializable since it is not '
        'a class or does not have a fromJson/toJson method.',
        location: element.sourceLocation,
      );
    }
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

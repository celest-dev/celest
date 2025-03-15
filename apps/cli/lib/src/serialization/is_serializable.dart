import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:analyzer/src/dart/element/member.dart';
import 'package:analyzer/src/dart/element/type_algebra.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/serialization/common.dart';
import 'package:celest_cli/src/serialization/serialization_spec.dart';
import 'package:celest_cli/src/serialization/serialization_verdict.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:collection/collection.dart';

enum TypePosition { parameter, return$ }

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
      return const VerdictNo([VerdictReason('Set types are not supported')]);
    }
    if (type.isDartCoreSymbol) {
      return const VerdictNo([VerdictReason('Symbol types are not supported')]);
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
    const invalidJson = VerdictNo([VerdictReason('Type is not valid JSON')]);
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
        return const VerdictNo([VerdictReason('Map keys must be strings')]);
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
  Verdict visitDynamicType(DynamicType type) => const VerdictYes();

  @override
  Verdict visitFunctionType(FunctionType type) =>
      const VerdictNo([VerdictReason('Function types are not supported')]);

  // Most logic for `_checkCustomDeserializer` and `_checkCustomSerializer` is
  // pulled from `package:json_serializable/src/type_helpers/json_helper.dart`.

  Verdict _checkCustomDeserializer(
    InterfaceType type,
    ExecutableElement fromJsonCtor,
    DartType wireType,
  ) {
    if (fromJsonCtor is! ConstructorElement) {
      if (!identical(fromJsonCtor.returnType, type)) {
        return Verdict.no(
          'The return type of ${type.element.name}\'s fromJson constructor '
          'must be ${type.element.name}.',
        );
      }
    }

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
    if (positionalParameters.isEmpty) {
      final functionSignature =
          'factory ${type.element.name}.fromJson(${wireType.getDisplayString()} json)';
      return Verdict.no(
        'The fromJson constructor of type ${type.element.name} must have '
        'one required, positional parameter whose type matches the return '
        'type of its toJson method, e.g. $functionSignature',
        location: fromJsonCtor.sourceLocation,
      );
    }
    final requiredNamedParameters = namedParameters.where((p) => p.isRequired);
    if (requiredNamedParameters.isNotEmpty) {
      final parameter = requiredNamedParameters.first;
      return Verdict.no(
        'The fromJson constructor of ${type.element.name} has an unexpected '
        'parameter: ${parameter.name}. FromJson constructors can only have '
        'positional parameters or optional named parameters.',
        location: parameter.sourceLocation,
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
    for (final parameter in parameters.where((p) => p.isPositional)) {
      switch (parameter.type) {
        case FunctionType(
            returnType: final TypeParameterType funcReturnType,
            normalParameterTypes: [
              DynamicType() ||
                  DartType(
                    isDartCoreObject: true,
                    nullabilitySuffix: NullabilitySuffix.question,
                  ),
            ],
          ):
          final expectedCtorParamName = fromJsonForName(
            funcReturnType.element.name,
          );
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
          final expectedFuncParamName = toJsonForName(
            funcParameterType.element.name,
          );
          if (parameter.name != expectedFuncParamName) {
            verdict &= Verdict.no(
              'The parameter "${parameter.name}" of ${type.element.name}\'s '
              'toJson method must be named "$expectedFuncParamName".',
              location: parameter.sourceLocation,
            );
          }
        case _ when parameter.isPositional || parameter.isRequired:
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
    // Do not go through type helper since it will swap out `erasureType` for
    // the extension type override (`type`) if there is one, causing stack overflow.
    var erasureVerdict = erasureType.accept(this);
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
                primarySpec: primarySpec
                  ..representationType = erasurePrimaySpec.erased,
                additionalSpecs: {
                  // Create a representation type spec which has no fromJson/toJson
                  // methods but which carries the correct wire type.
                  if (!type.isOverridden)
                    erasurePrimaySpec.copyWith(
                      wireType: primarySpec.wireType,
                      castType: primarySpec.castType,
                      toJsonType: null,
                      fromJsonType: null,
                      fromJsonParameters: const [],
                    ),
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
                when TypeChecker.fromStatic(
                  parameter.type,
                ).isExactlyType(erasureType)) {
              return true;
            }
            return false;
          });
        }
        final (:toJsonMethod, :fromJsonCtor, wireType: _) =
            type.interfaceMembers;
        // The representation type is either a built-in or a primitive at
        // this point.
        final wireType = builtInTypeToReference[erasureType] ??
            typeHelper.toReference(erasureType);
        return erasureVerdict.withPrimarySpec(
          SerializationSpec(
            type: type,
            wireType: wireType,
            fields: [
              if (element.representation.isPublic)
                FieldSpec(
                  name: element.representation.name,
                  type: element.representation.type,
                ),
            ],
            wireConstructor: constructor,
            constructorParameters: constructor.parameterSpecs,
            fromJsonParameters: fromJsonCtor.parameterSpecs,
            fromJsonType: fromJsonCtor?.returnType as InterfaceType?,
            toJsonType: (toJsonMethod?.enclosingElement3 as InterfaceElement?)
                ?.thisType,
            representationType: SerializationSpec(
              type: erasureType,
              wireType: wireType,
              wireConstructor: null,
              fromJsonType: null,
              toJsonType: null,
            ),
          ),
        );
    }
  }

  Verdict _visitCustomInterfaceType(InterfaceType type) {
    final element = type.element;
    final (:toJsonMethod, :fromJsonCtor, :wireType) = type.interfaceMembers;

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
    } else if (!type.extensionTypeErasure.isEnumLike) {
      // When no toJson method is provided, we must check the representation
      // type's fields and constructor, even if this is an extension type, since
      // we will just cast into the extension type at the end, but we only have
      // access to all fields and constructors on the representation type.
      verdict &= type.extensionTypeErasure.accept(
        const _IsSerializableClass(TypePosition.return$),
      );
    }

    // Check fromJson
    final hasFromJson = fromJsonCtor != null;
    if (hasFromJson) {
      verdict &= _checkCustomDeserializer(type, fromJsonCtor, wireType);
    } else if (!type.extensionTypeErasure.isEnumLike) {
      // Same rationale as the toJson check re: erasure type.
      verdict &= type.extensionTypeErasure.accept(
        const _IsSerializableClass(TypePosition.parameter),
      );
    }
    final wireConstructor = type.wireConstructor;
    if (wireConstructor == null && fromJsonCtor == null && !type.isEnumLike) {
      return verdict &
          Verdict.no(
            'Class ${element.displayName} must have an unnamed constructor '
            'with the same number of parameters as fields or a `fromJson` '
            'constructor.',
            location: element.sourceLocation,
            isBecauseOfFlutter: type.isFlutterType,
          );
    }

    final spec = SerializationSpec(
      type: type,
      wireType: typeHelper.toReference(wireType),
      castType: fromJsonCtor?.parameters.first.type.let(typeHelper.toReference),
      fields: type.fieldSpecs,
      wireConstructor: wireConstructor,
      constructorParameters: wireConstructor.parameterSpecs,
      fromJsonParameters: fromJsonCtor.parameterSpecs,
      fromJsonType: fromJsonCtor?.returnType as InterfaceType?,
      toJsonType:
          (toJsonMethod?.enclosingElement3 as InterfaceElement?)?.thisType,
    );
    verdict = verdict.withPrimarySpec(spec);

    if (type.isEnumLike) {
      return verdict;
    }

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
          return Substitution.fromMap(
            substitutionMap,
          ).mapInterfaceType(subtype);
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
              final subtypeWireType = typeHelper.fromReference(
                subtypeSpec.wireType,
              );
              if (!TypeChecker.fromStatic(
                jsonMapType,
              ).isExactlyType(subtypeWireType)) {
                verdict &= Verdict.no(
                  'All classes in a sealed class hierarchy must use '
                  'Map<String, Object?> as their wire type but '
                  '${subtypeSpec.type.element!.name!} uses '
                  '${subtypeWireType.getDisplayString()}',
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
      return const Verdict.yes();
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
        //
        // Even though we have `JsonMap` type now, `package:json_serializable`
        // and others allow Map<String, Object?> and this allows for a cleaner
        // migration path from using those types with Celest.
        InterfaceType(isDartCoreObject: true) ||
        DynamicType() =>
          const Verdict.yes(),
        _ => typeHelper.isSerializable(valueType),
      };
    }
    if (type.isDartAsyncStream) {
      return const VerdictNo([
        VerdictReason('Stream types are not supported in this position'),
      ]);
    }

    // TODO(dnys1): Test
    // TODO(dnys1): Test for extends/implements these types
    // TODO(dnys1): Test for extends/implements these types w/ custom serde
    if (builtInTypeChecker.isExactlyType(type)) {
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
      // TODO(dnys1): Remove this limitation. Follow package:json_serializable format.
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
        wireConstructor: null,
        constructorParameters: [
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
        fromJsonType: null,
        toJsonType: null,
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
          properties: {'type': type.getDisplayString(), 'bound': 'sealed'},
        );
        return typeHelper.isSerializable(type.bound);
      case DynamicType():
        analytics.capture(
          'type_parameter',
          properties: {'type': type.getDisplayString(), 'bound': 'unbounded'},
        );
        return const Verdict.yes();
      default:
        analytics.capture(
          'type_parameter',
          properties: {'type': type.getDisplayString(), 'bound': 'other'},
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

  final TypePosition position;

  @override
  Verdict visitDynamicType(DynamicType type) => unreachable('Not a class type');

  @override
  Verdict visitFunctionType(FunctionType type) =>
      unreachable('Not a class type');

  Verdict _visitClass(InterfaceType type, ClassElement element) {
    var verdict = const Verdict.yes();
    final unnamedConstructor = type.wireConstructor;
    var constructorVerdict = const Verdict.yes();

    if (unnamedConstructor == null) {
      constructorVerdict &= Verdict.no(
        'Class ${element.displayName} must have an unnamed constructor with '
        'the same number of parameters as fields.',
        location: element.sourceLocation,
        isBecauseOfFlutter: type.isFlutterType,
      );
    } else if (element.isAbstract &&
        !element.isSealed &&
        !unnamedConstructor.isFactory) {
      constructorVerdict &= Verdict.no(
        'Class ${element.displayName} is abstract and must have an unnamed factory '
        'or fromJson factory constructor to be used.',
        location: element.sourceLocation,
        isBecauseOfFlutter: type.isFlutterType,
      );
    }

    // If the class is abstract and/or its primary constructor is redirecting,
    // we need to check the fields of the redirected class since that is what
    // will be instantiated.
    final fields = switch (unnamedConstructor) {
      ConstructorElement(
        redirectedConstructor: Element(
          // TODO(dnys1): This is missing some edge cases. For example, a class
          // could redirect to another redirecting constructor.
          enclosingElement3: final ClassElement redirectedClass,
        ),
      ) =>
        redirectedClass.sortedFields(redirectedClass.thisType),
      // Special case for Exception which is basically a redirecting constructor
      // but uses `=>` syntax.
      _ when element.name == 'Exception' && element.library.isDartCore =>
        element.library
            .getClass('_Exception')!
            .let((impl) => impl.sortedFields(impl.thisType)),
      _ => element.sortedFields(type),
    };
    var fieldsVerdict = const Verdict.yes();
    for (final field in List.of(fields)) {
      final (:ignoreFromJson, :ignoreToJson) = type._ignoredByJsonKey(field);
      final ignore = switch (position) {
        TypePosition.parameter => ignoreFromJson,
        TypePosition.return$ => ignoreToJson,
      };
      if (ignore) {
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
      switch (fieldVerdict) {
        case VerdictYes():
          fieldsVerdict &= fieldVerdict;
        case VerdictNo():
          // Ignore, we can't serialize. If later we determine the getter is
          // needed to construct the object, we'll error then.
          if (field.isSynthetic) {
            fields.remove(field);
            continue;
          }
          fieldsVerdict &= Verdict.no(
            'Field "${field.displayName}" of type "${element.displayName}" is '
            'not serializable: $fieldVerdict',
            location: field.sourceLocation,
            isBecauseOfFlutter: type.isFlutterType,
          );
      }
    }
    if (position == TypePosition.return$) {
      verdict &= fieldsVerdict;
    }

    if (constructorVerdict is VerdictYes) {
      final parameters = unnamedConstructor!.parameters;
      for (final parameter in parameters) {
        final parameterField = parameter.fieldFormal(fields);
        if (parameterField == null && parameter.isRequired) {
          constructorVerdict &= Verdict.no(
            'Required parameter "${parameter.displayName}" cannot be '
            'populated because it has no matching fields. Available fields: '
            '${fields.map((field) => field.name).join(', ')}',
            location: parameter.sourceLocation,
            isBecauseOfFlutter: type.isFlutterType,
          );
          continue;
        }

        final hasField = fields.any((field) {
          if (parameter.name.startsWith('_')) {
            return field.name == parameter.name.substring(1);
          }
          return field.name == parameter.name;
        });
        if (!hasField) {
          constructorVerdict &= Verdict.no(
            'Constructor parameter "${parameter.displayName}" is not '
            'a field of the class ${element.displayName}.',
            location: parameter.sourceLocation,
            isBecauseOfFlutter: type.isFlutterType,
          );
          continue;
        }
      }
    }

    if (position == TypePosition.parameter) {
      verdict &= constructorVerdict;
    }
    return verdict;
  }

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    final element = type.element;
    if (element is! ClassElement) {
      unreachable('Only classes should reach here');
    }
    return _visitClass(type, element);
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
  MethodElement? toJsonMethod,
  ExecutableElement? fromJsonCtor,
  DartType wireType,
});

extension on InterfaceType {
  MethodElement? get toJsonMethod => switch (element) {
        // Extension types always reset the toJson method to the representation
        // type.
        ExtensionTypeElement() => getMethod('toJson'),
        _ => lookUpMethod2('toJson', element.library),
      };

  ExecutableElement? get fromJsonCtor =>
      lookUpConstructor('fromJson', element.library) ??
      switch (getMethod('fromJson')) {
        final method? when method.isStatic => method,
        _ => null,
      };

  DartType get wireType => toJsonMethod?.returnType ?? defaultWireType!;

  ConstructorElement? get wireConstructor {
    if (!isOverridden) {
      return constructors.firstWhereOrNull((ctor) => ctor.name.isEmpty);
    }
    ConstructorElement? unnamedConstructor;
    final overriddenAs = asOverriden.element as ExtensionTypeElement;
    unnamedConstructor = overriddenAs.constructors.firstWhereOrNull(
      (ctor) => ctor.name.isEmpty && ctor != overriddenAs.primaryConstructor,
    );
    final representationElement = extensionTypeErasure.element as ClassElement;
    unnamedConstructor ??= representationElement.constructors.firstWhereOrNull(
      (ctor) => ctor.name.isEmpty,
    );
    return unnamedConstructor;
  }

  /// Checks if a field is ignored by `@JsonKey(ignore: true)` or one of
  /// `@JsonKey(includeToJson: false)` or `@JsonKey(includeFromJson: false)`.
  ({bool ignoreToJson, bool ignoreFromJson}) _ignoredByJsonKey(
    FieldElement field,
  ) {
    // Collect all metadata on the field up the ancestor chain.
    //
    // We only include the element itself, any mixins, and all superclasses.
    // We do not include interfaces (e.g. `implements X`) because classes do
    // not inherit metadata from interfaces.
    final allMetadata = <ElementAnnotation>{
      ...field.metadata,
      if (field.getter case final getter?) ...getter.metadata,
    };

    void addMixins(InterfaceElement element) {
      allMetadata.addAll(
        element.mixins.expand((mixin) sync* {
          final mixinField = mixin.element.getField(field.name);
          if (mixinField == null) {
            return;
          }
          yield* mixinField.metadata;
          if (mixinField.getter case final getter?) {
            yield* getter.metadata;
          }
        }),
      );
    }

    addMixins(element);

    var enclosingElement = element.supertype?.element;
    while (enclosingElement != null) {
      if (enclosingElement.getField(field.name) case final field?) {
        allMetadata.addAll(field.metadata);
        if (field.getter case final getter?) {
          allMetadata.addAll(getter.metadata);
        }
      }
      addMixins(enclosingElement);
      enclosingElement = enclosingElement.supertype?.element;
    }

    // Check for `@JsonKey` annotations from `package:json_annotation`.
    for (final annotation in allMetadata) {
      final value = annotation.computeConstantValue();
      if (value == null) {
        continue;
      }
      final isJsonKey = switch (value.type) {
        final type? => identical(
            type,
            typeHelper.coreTypes.jsonKeyElement?.thisType,
          ),
        _ => false,
      };
      if (!isJsonKey) {
        continue;
      }
      // Ignore as requested. If later we determine the field is needed to
      // construct the object, we'll error then.
      if (value.getField('ignore')?.toBoolValue() case final ignore?) {
        return (ignoreToJson: ignore, ignoreFromJson: ignore);
      }
      final (includeFromJson, includeToJson) = (
        value.getField('includeFromJson')?.toBoolValue() ?? true,
        value.getField('includeToJson')?.toBoolValue() ?? true,
      );
      return (ignoreToJson: !includeToJson, ignoreFromJson: !includeFromJson);
    }

    return (ignoreToJson: false, ignoreFromJson: false);
  }

  List<FieldSpec> get fieldSpecs => switch (element) {
        final ClassElement element => [
            for (final field in element.sortedFields(this))
              run(() {
                final (:ignoreToJson, :ignoreFromJson) =
                    _ignoredByJsonKey(field);
                return FieldSpec(
                  name: field.displayName,
                  type: field.type,
                  ignore: ignoreToJson || field.type.isDartCoreNull,
                );
              }),
          ],
        EnumElement() => const [],
        ExtensionTypeElement(:final representation) => [
            FieldSpec(name: representation.name, type: representation.type),
          ],
        _ => unreachable(),
      };

  InterfaceMembers get interfaceMembers {
    switch (element) {
      case EnumElement():
        return (
          toJsonMethod: toJsonMethod,
          fromJsonCtor: fromJsonCtor,
          wireType: wireType,
        );
      case MixinElement():
        unreachable('Mixins are not supported');
      case final ClassElement _:
        final serializedType =
            isOverridden ? asOverriden as InterfaceType : this;
        return (
          toJsonMethod: serializedType.toJsonMethod,
          fromJsonCtor: serializedType.fromJsonCtor,
          wireType: serializedType.wireType,
        );
      case final ExtensionTypeElement _:
        final representationType = extensionTypeErasure;
        if (representationType is! InterfaceType) {
          unreachable('Extension type erasure is not an interface type');
        }
        final members = (
          // fields: [
          //   // if (isOverridden)
          //   //   ...(representationType.element as ClassElement).sortedFields(this)
          //   // else
          //   element.representation,
          // ],
          toJsonMethod: toJsonMethod,
          fromJsonCtor: fromJsonCtor,
          wireType: wireType,
        );
        analytics.capture(
          'extension_type',
          properties: {
            'type': getDisplayString(),
            'representationType': representationType.getDisplayString(),
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
  static final _coreObjectUri = Uri.parse('dart:core#Object');
  static final _coreErrorUri = Uri.parse('dart:core#Error');

  /// Fields from dart:core types which should never be serialized.
  static final _coreFields = [
    Name(_coreObjectUri, 'hashCode'),
    Name(_coreObjectUri, 'runtimeType'),
    Name(_coreErrorUri, 'stackTrace'),
  ];

  /// Returns a [List] of all instance [FieldElement] items for this class and
  /// super classes, sorted first by their location in the inheritance hierarchy
  /// (super first) and then by their location in the source file.
  List<FieldElement> sortedFields(InterfaceType type) {
    // Get all of the fields that need to be assigned
    final elementInstanceFields = Map.fromEntries(
      this.fields.where((e) => !e.isStatic && !e.isPrivate).map((e) {
        final member = inheritanceManager.getMember(
          type,
          Name(e.library.source.uri, e.name),
        );
        if (member case final PropertyAccessorMember member
            when member.isGetter) {
          assert(member.variable2 is FieldElement);
          return MapEntry(e.name, member.variable2 as FieldElement);
        }
        return MapEntry(e.name, e);
      }),
    );

    final inheritedFields = <String, FieldElement>{};

    const dartCoreObject = TypeChecker.fromUrl('dart:core#Object');
    if (dartCoreObject.isExactly(this)) {
      return const [];
    }

    final coreErrorType = TypeChecker.fromStatic(
      typeHelper.coreTypes.coreErrorType,
    );

    for (final v
        in inheritanceManager.getInheritedConcreteMap2(type.element).values) {
      assert(v is! FieldElement);
      if (dartCoreObject.isExactly(v.enclosingElement3)) {
        continue;
      }
      if (coreErrorType.isExactly(v.enclosingElement3)) {
        continue;
      }

      if (v.isPrivate) {
        continue;
      }

      if (v is PropertyAccessorElement && v.isGetter) {
        assert(v.variable2 is FieldElement);
        final variable = v.variable2 as FieldElement;
        assert(!inheritedFields.containsKey(variable.name));
        inheritedFields[variable.name] = variable;
      }
    }

    final overriddenFields = <String, FieldElement>{};

    if (thisType.isOverridden) {
      final extensionType = thisType.asOverriden;
      assert(extensionType.isExtensionType);
      final overrideElement = extensionType.element as ExtensionTypeElement;
      for (final field in overrideElement.fields) {
        if (field.isStatic) {
          continue;
        }
        assert(!overriddenFields.containsKey(field.name));
        overriddenFields[field.name] = field;
      }
    }

    // Get the list of all fields for `element`
    final allFields = elementInstanceFields.keys.toSet().union(
          inheritedFields.keys.toSet(),
        );

    final fields = allFields
        .map(
          (e) => _FieldSet(
            overriddenFields[e],
            elementInstanceFields[e],
            inheritedFields[e],
          ),
        )
        .toList()
      ..sort();

    // Remove fields which are synthetic and not serializable.
    final filtered = <FieldElement>[];

    filter:
    for (final field in fields) {
      if (!field.field.isSynthetic) {
        filtered.add(field.field);
        continue;
      }
      for (final coreField in _coreFields) {
        if (coreField.name != field.field.name) {
          continue;
        }
        final overriddenFields =
            inheritanceManager.getOverridden2(this, coreField) ?? const [];
        if (overriddenFields.isNotEmpty) {
          // Skip, it's a core field.
          continue filter;
        }
      }
      switch (typeHelper.isSerializable(field.field.type)) {
        case VerdictYes():
          filtered.add(field.field);
        case VerdictNo():
        // Skip, not serializable.
      }
    }

    return filtered;
  }
}

class _FieldSet implements Comparable<_FieldSet> {
  factory _FieldSet(
    FieldElement? overrideField,
    FieldElement? classField,
    FieldElement? superField,
  ) {
    // At least one of these will != null, perhaps all.
    final fields = [overrideField, classField, superField].nonNulls.toList();

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
      (a.enclosingElement3 as InterfaceElement).thisType,
    );

    if (!checkerA.isExactly(b.enclosingElement3)) {
      // in this case, you want to prioritize the enclosingElement that is more
      // "super".

      if (checkerA.isAssignableFrom(b.enclosingElement3)) {
        return -1;
      }

      final checkerB = TypeChecker.fromStatic(
        (b.enclosingElement3 as InterfaceElement).thisType,
      );

      if (checkerB.isAssignableFrom(a.enclosingElement3)) {
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

extension on ParameterElement {
  FieldElement? fieldFormal(List<FieldElement> fields) {
    return switch (this) {
      FieldFormalParameterElement(:final field?) => field,
      SuperFormalParameterElement(:final superConstructorParameter?) =>
        superConstructorParameter.fieldFormal(fields),
      _ => fields.firstWhereOrNull((field) => field.name == name),
    };
  }
}

extension on ExecutableElement? {
  List<ParameterSpec> get parameterSpecs {
    final parameters = this?.parameters;
    if (parameters == null) {
      return const [];
    }
    final specs = <ParameterSpec>[];
    final fields = switch (this) {
      ParameterElement(
        enclosingElement3: Element(
          enclosingElement3: final ClassElement enclosingElement,
        ),
      ) =>
        enclosingElement.sortedFields(enclosingElement.thisType),
      _ => const <FieldElement>[],
    };
    for (final parameter in parameters) {
      final fieldFormal = parameter.fieldFormal(fields);
      final (:ignoreFromJson, ignoreToJson: _) = switch (parameter) {
        ParameterElement(
          enclosingElement3: Element(
            enclosingElement3: final ClassElement enclosingElement,
          ),
        )
            when fieldFormal != null =>
          enclosingElement.thisType._ignoredByJsonKey(fieldFormal),
        _ => (ignoreFromJson: false, ignoreToJson: false),
      };
      specs.add(
        ParameterSpec(
          name: parameter.displayName,
          type: parameter.type,
          isPositional: parameter.isPositional,
          isOptional: parameter.isOptional,
          isNamed: parameter.isNamed,
          defaultValue: parameter.declaration.defaultToExpression,
          ignore: ignoreFromJson,
        ),
      );
    }
    return specs;
  }
}

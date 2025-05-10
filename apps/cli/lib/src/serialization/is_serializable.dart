import 'dart:collection';

import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
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
        DynamicType() => const Verdict.yes(),
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
    ExecutableElement2 fromJsonCtor,
    DartType wireType,
  ) {
    final typeName = type.element3.name3;

    if (fromJsonCtor is! ConstructorElement2) {
      if (!identical(fromJsonCtor.returnType, type)) {
        return Verdict.no(
          'The return type of $typeName\'s fromJson constructor '
          'must be $typeName.',
        );
      }
    }

    // Using the `baseElement` here so we get the original definition –
    // and not one with the generics already populated.
    //
    // For example, if `type` is `IList<String>`, then `fromJsonCtor` will
    // have its parameter with type `Object Function(String) fromJsonT` and
    // `fromJsonCtor.declaration` will have its parameter with type
    // `Object Function(T) fromJsonT`.
    fromJsonCtor = fromJsonCtor.baseElement;

    final positionalParameters =
        fromJsonCtor.formalParameters
            .where((parameter) => parameter.isPositional)
            .toList();
    final namedParameters =
        fromJsonCtor.formalParameters
            .where((parameter) => parameter.isNamed)
            .toList();
    if (positionalParameters.isEmpty) {
      final functionSignature =
          'factory $typeName.fromJson(${wireType.getDisplayString()} json)';
      return Verdict.no(
        'The fromJson constructor of type $typeName must have '
        'one required, positional parameter whose type matches the return '
        'type of its toJson method, e.g. $functionSignature',
        location: fromJsonCtor.sourceLocation,
      );
    }
    final requiredNamedParameters = namedParameters.where((p) => p.isRequired);
    if (requiredNamedParameters.isNotEmpty) {
      final parameter = requiredNamedParameters.first;
      return Verdict.no(
        'The fromJson constructor of $typeName has an unexpected '
        'parameter: ${parameter.name3}. FromJson constructors can only have '
        'positional parameters or optional named parameters.',
        location: parameter.sourceLocation,
      );
    }

    String fromJsonForName(String genericType) => 'fromJson$genericType';

    final parameters = Queue.of(fromJsonCtor.formalParameters);
    final requiredParam = parameters.removeFirst();
    if (requiredParam.isOptional) {
      return Verdict.no(
        'The fromJson constructor of type $typeName must have '
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
          'The parameter type of $typeName\'s fromJson constructor '
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
            funcReturnType.element3.name3!,
          );
          if (parameter.name3 != expectedCtorParamName) {
            verdict &= Verdict.no(
              'The parameter "${parameter.name3}" of $typeName\'s '
              'fromJson constructor must be named "$expectedCtorParamName".',
              location: parameter.sourceLocation,
            );
          }
        default:
          return Verdict.no(
            'The fromJson constructor of $typeName has an unexpected '
            'parameter: ${parameter.name3}. The only extra parameters allowed are '
            'functions of the form `T Function(Object?) fromJsonT` where `T` is '
            'a type parameter of $typeName.',
            location: parameter.sourceLocation,
          );
      }
    }

    return verdict;
  }

  Verdict _checkCustomSerializer(
    InterfaceType type,
    MethodElement2 toJsonMethod,
  ) {
    String toJsonForName(String genericType) => 'toJson$genericType';

    final typeName = type.element3.name3;

    // Using the `baseElement` here so we get the original definition –
    // and not one with the generics already populated.
    //
    // For example, if `type` is `IList<String>`, then `toJsonMethod` will
    // be `Object Function(String) toJsonT` and `toJsonMethod.declaration`
    // will be `Object Function(T) toJsonT`.
    toJsonMethod = toJsonMethod.baseElement;

    var verdict = const Verdict.yes();
    for (final parameter in toJsonMethod.formalParameters) {
      switch (parameter.type) {
        case FunctionType(
          returnType: DartType(isDartCoreObject: true) || DynamicType(),
          normalParameterTypes: [final TypeParameterType funcParameterType],
        ):
          final expectedFuncParamName = toJsonForName(
            funcParameterType.element3.name3!,
          );
          if (parameter.name3 != expectedFuncParamName) {
            verdict &= Verdict.no(
              'The parameter "${parameter.name3}" of $typeName\'s '
              'toJson method must be named "$expectedFuncParamName".',
              location: parameter.sourceLocation,
            );
          }
        case _ when parameter.isPositional || parameter.isRequired:
          return Verdict.no(
            'The toJson method of $typeName has an unexpected '
            'parameter: ${parameter.name3}. The only parameters allowed are '
            'functions of the form `Object Function(T) toJsonT` where `T` is '
            'a type parameter of $typeName.',
            location: parameter.sourceLocation,
          );
      }
    }
    final returnType = toJsonMethod.returnType;
    verdict &= switch (_isJson(returnType)) {
      VerdictYes() => const Verdict.yes(),
      _ => Verdict.no(
        'Invalid return type of $typeName\'s toJson method: '
        '$returnType. Only simple JSON types are allowed.',
        location: toJsonMethod.sourceLocation,
      ),
    };
    return verdict;
  }

  Verdict _visitExtensionType(
    InterfaceType type,
    ExtensionTypeElement2 element,
  ) {
    final erasureType = element.typeErasure;
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
            'The representation type of ${element.name3} is not serializable',
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
                primarySpec:
                    primarySpec..representationType = erasurePrimaySpec.erased,
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
        ConstructorElement2? constructor;
        if (element.primaryConstructor2.name3 == 'new' &&
            !element.primaryConstructor2.isPrivate) {
          constructor = element.primaryConstructor2;
        } else {
          constructor = element.constructors2.firstWhereOrNull((ctor) {
            if (ctor.name3 != 'new') {
              return false;
            }
            if (ctor.formalParameters case [final parameter]
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
        final wireType =
            builtInTypeToReference[erasureType] ??
            typeHelper.toReference(erasureType);
        return erasureVerdict.withPrimarySpec(
          SerializationSpec(
            type: type,
            wireType: wireType,
            fields: [
              if (element.representation2.isPublic)
                FieldSpec(
                  name: element.representation2.name3!,
                  type: element.representation2.type,
                ),
            ],
            wireConstructor: constructor,
            constructorParameters: constructor.parameterSpecs,
            fromJsonParameters: fromJsonCtor.parameterSpecs,
            fromJsonType: fromJsonCtor?.returnType as InterfaceType?,
            toJsonType:
                (toJsonMethod?.enclosingElement2 as InterfaceElement2?)
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
    final element = type.element3;
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
      castType: fromJsonCtor?.formalParameters.first.type.let(
        typeHelper.toReference,
      ),
      fields: type.fieldSpecs,
      wireConstructor: wireConstructor,
      constructorParameters: wireConstructor.parameterSpecs,
      fromJsonParameters: fromJsonCtor.parameterSpecs,
      fromJsonType: fromJsonCtor?.returnType as InterfaceType?,
      toJsonType:
          (toJsonMethod?.enclosingElement2 as InterfaceElement2?)?.thisType,
    );
    verdict = verdict.withPrimarySpec(spec);

    if (type.isEnumLike) {
      return verdict;
    }

    InterfaceType instantiateSubtype(InterfaceType subtype) {
      final superParameters = type.element3.typeParameters2;
      final superArguments = type.typeArguments;
      assert(superParameters.length == superArguments.length);
      for (final subtypeSupertype in subtype.allSupertypes) {
        if (subtypeSupertype.element3.baseElement == type.element3) {
          final substitutionMap = <TypeParameterElement2, DartType>{};
          final subtypeSuperArgs = subtypeSupertype.typeArguments;
          for (var i = 0; i < subtypeSuperArgs.length; i++) {
            final subParameter = subtypeSuperArgs[i].element3;
            if (subParameter is TypeParameterElement2) {
              substitutionMap[subParameter] = superArguments[i];
            }
          }
          return Substitution.fromMap2(
            substitutionMap,
          ).mapInterfaceType(subtype);
        }
      }
      unreachable();
    }

    final subtypes = [
      for (final subtype
          in typeHelper.subtypes[type.element3] ?? const <InterfaceType>[])
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
    if (type.element3.isPrivate) {
      return Verdict.no(
        'Private types are not supported',
        location: type.element3.sourceLocation,
      );
    }

    // Extension types are always represented as an InterfaceType over their
    // erasure, which may not be an interface type.
    if (type.element3 case final ExtensionTypeElement2 extensionType) {
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
        DynamicType() => const Verdict.yes(),
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
        location: type.alias?.element2.sourceLocation,
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
      case InterfaceType(element3: final ClassElement2 element)
          when element.isSealed:
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
            location: type.element3.sourceLocation,
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

  Verdict _visitClass(InterfaceType type, ClassElement2 element) {
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
      ConstructorElement2(
        redirectedConstructor2: Element2(
          // TODO(dnys1): This is missing some edge cases. For example, a class
          // could redirect to another redirecting constructor.
          enclosingElement2: final ClassElement2 redirectedClass,
        ),
      ) =>
        redirectedClass.sortedFields(redirectedClass.thisType),
      // Special case for Exception which is basically a redirecting constructor
      // but uses `=>` syntax.
      _ when element.name3 == 'Exception' && element.library2.isDartCore =>
        element.library2
            .getClass2('_Exception')!
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
      final parameters = unnamedConstructor!.formalParameters;
      for (final parameter in parameters) {
        final parameterField = parameter.fieldFormal(fields);
        if (parameterField == null && parameter.isRequired) {
          constructorVerdict &= Verdict.no(
            'Required parameter "${parameter.displayName}" cannot be '
            'populated because it has no matching fields. Available fields: '
            '${fields.map((field) => field.name3).join(', ')}',
            location: parameter.sourceLocation,
            isBecauseOfFlutter: type.isFlutterType,
          );
          continue;
        }

        final hasField = fields.any((field) {
          if (parameter.name3!.startsWith('_')) {
            return field.name3! == parameter.name3!.substring(1);
          }
          return field.name3 == parameter.name3;
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
    final element = type.element3;
    if (element is! ClassElement2) {
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

typedef InterfaceMembers =
    ({
      MethodElement2? toJsonMethod,
      ExecutableElement2? fromJsonCtor,
      DartType wireType,
    });

extension on InterfaceType {
  MethodElement2? get toJsonMethod => switch (element3) {
    // Extension types always reset the toJson method to the representation
    // type.
    ExtensionTypeElement2() => getMethod2('toJson'),
    _ => lookUpMethod3('toJson', element3.library2),
  };

  ExecutableElement2? get fromJsonCtor =>
      lookUpConstructor2('fromJson', element3.library2) ??
      switch (getMethod2('fromJson')) {
        final method? when method.isStatic => method,
        _ => null,
      };

  DartType get wireType => toJsonMethod?.returnType ?? defaultWireType!;

  ConstructorElement2? get wireConstructor {
    if (!isOverridden) {
      return constructors2.firstWhereOrNull((ctor) => ctor.name3 == 'new');
    }
    ConstructorElement2? unnamedConstructor;
    final overriddenAs = asOverriden.element3 as ExtensionTypeElement2;
    unnamedConstructor = overriddenAs.constructors2.firstWhereOrNull(
      (ctor) => ctor.name3 == 'new' && ctor != overriddenAs.primaryConstructor2,
    );
    final representationElement =
        extensionTypeErasure.element3 as ClassElement2;
    unnamedConstructor ??= representationElement.constructors2.firstWhereOrNull(
      (ctor) => ctor.name3 == 'new',
    );
    return unnamedConstructor;
  }

  /// Checks if a field is ignored by `@JsonKey(ignore: true)` or one of
  /// `@JsonKey(includeToJson: false)` or `@JsonKey(includeFromJson: false)`.
  ({bool ignoreToJson, bool ignoreFromJson}) _ignoredByJsonKey(
    FieldElement2 field,
  ) {
    // Collect all metadata on the field up the ancestor chain.
    //
    // We only include the element itself, any mixins, and all superclasses.
    // We do not include interfaces (e.g. `implements X`) because classes do
    // not inherit metadata from interfaces.
    final allMetadata = <ElementAnnotation>{
      ...field.metadata2.annotations,
      if (field.getter2 case final getter?) ...getter.metadata2.annotations,
    };

    void addMixins(InterfaceElement2 element) {
      allMetadata.addAll(
        element.mixins.expand((mixin) sync* {
          final mixinField = mixin.element3.getField2(field.name3!);
          if (mixinField == null) {
            return;
          }
          yield* mixinField.metadata2.annotations;
          if (mixinField.getter2 case final getter?) {
            yield* getter.metadata2.annotations;
          }
        }),
      );
    }

    addMixins(element3);

    var enclosingElement = element3.supertype?.element3;
    while (enclosingElement != null) {
      if (enclosingElement.getField2(field.name3!) case final field?) {
        allMetadata.addAll(field.metadata2.annotations);
        if (field.getter2 case final getter?) {
          allMetadata.addAll(getter.metadata2.annotations);
        }
      }
      addMixins(enclosingElement);
      enclosingElement = enclosingElement.supertype?.element3;
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

  List<FieldSpec> get fieldSpecs => switch (element3) {
    final ClassElement2 element => [
      for (final field in element.sortedFields(this))
        run(() {
          final (:ignoreToJson, :ignoreFromJson) = _ignoredByJsonKey(field);
          return FieldSpec(
            name: field.displayName,
            type: field.type,
            ignore: ignoreToJson || field.type.isDartCoreNull,
          );
        }),
    ],
    EnumElement2() => const [],
    ExtensionTypeElement2(representation2: final representation) => [
      FieldSpec(name: representation.name3!, type: representation.type),
    ],
    _ => unreachable(),
  };

  InterfaceMembers get interfaceMembers {
    switch (element3) {
      case EnumElement2():
        return (
          toJsonMethod: toJsonMethod,
          fromJsonCtor: fromJsonCtor,
          wireType: wireType,
        );
      case MixinElement2():
        unreachable('Mixins are not supported');
      case final ClassElement2 _:
        final serializedType =
            isOverridden ? asOverriden as InterfaceType : this;
        return (
          toJsonMethod: serializedType.toJsonMethod,
          fromJsonCtor: serializedType.fromJsonCtor,
          wireType: serializedType.wireType,
        );
      case final ExtensionTypeElement2 _:
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

extension on ClassElement2 {
  static final _coreObjectUri = Uri.parse('dart:core#Object');
  static final _coreErrorUri = Uri.parse('dart:core#Error');

  /// Fields from dart:core types which should never be serialized.
  static final _coreFields = [
    Name(_coreObjectUri, 'hashCode'),
    Name(_coreObjectUri, 'runtimeType'),
    Name(_coreErrorUri, 'stackTrace'),
  ];

  /// Returns a [List] of all instance [FieldElement2] items for this class and
  /// super classes, sorted first by their location in the inheritance hierarchy
  /// (super first) and then by their location in the source file.
  List<FieldElement2> sortedFields(InterfaceType type) {
    // Get all of the fields that need to be assigned
    final elementInstanceFields = Map.fromEntries(
      fields2.where((e) => !e.isStatic && !e.isPrivate).map((e) {
        final member = inheritanceManager.getMember(
          type,
          Name(e.library2.firstFragment.source.uri, e.name3!),
        );
        if (member case final PropertyAccessorMember member
            when member.isGetter) {
          assert(member.variable2 is FieldElement2);
          return MapEntry(e.name3!, member.variable2 as FieldElement2);
        }
        return MapEntry(e.name3!, e);
      }),
    );

    final inheritedFields = <String, FieldElement2>{};

    const dartCoreObject = TypeChecker.fromUrl('dart:core#Object');
    if (dartCoreObject.isExactly(this)) {
      return const [];
    }

    final coreErrorType = TypeChecker.fromStatic(
      typeHelper.coreTypes.coreErrorType,
    );

    for (final v
        in inheritanceManager.getInheritedConcreteMap(type.element3).values) {
      assert(v is! FieldElement2);
      if (dartCoreObject.isExactly(v.enclosingElement2!)) {
        continue;
      }
      if (coreErrorType.isExactly(v.enclosingElement2!)) {
        continue;
      }

      if (v.isPrivate) {
        continue;
      }

      if (v is GetterElement) {
        assert(v.variable3 is FieldElement2);
        final variable = v.variable3 as FieldElement2;
        assert(!inheritedFields.containsKey(variable.name3));
        inheritedFields[variable.name3!] = variable;
      }
    }

    final overriddenFields = <String, FieldElement2>{};

    if (thisType.isOverridden) {
      final extensionType = thisType.asOverriden;
      assert(extensionType.isExtensionType);
      final overrideElement = extensionType.element3 as ExtensionTypeElement2;
      for (final field in overrideElement.fields2) {
        if (field.isStatic) {
          continue;
        }
        assert(!overriddenFields.containsKey(field.name3));
        overriddenFields[field.name3!] = field;
      }
    }

    // Get the list of all fields for `element`
    final allFields = elementInstanceFields.keys.toSet().union(
      inheritedFields.keys.toSet(),
    );

    final fields =
        allFields
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
    final filtered = <FieldElement2>[];

    filter:
    for (final field in fields) {
      if (!field.field.isSynthetic) {
        filtered.add(field.field);
        continue;
      }
      for (final coreField in _coreFields) {
        if (coreField.name != field.field.name3) {
          continue;
        }
        final overriddenFields =
            inheritanceManager.getOverridden(this, coreField) ?? const [];
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
    FieldElement2? overrideField,
    FieldElement2? classField,
    FieldElement2? superField,
  ) {
    // At least one of these will != null, perhaps all.
    final fields = [overrideField, classField, superField].nonNulls.toList();

    // Prefer the class field over the inherited field when sorting.
    final sortField = fields.first;

    return _FieldSet._(sortField);
  }

  _FieldSet._(this.field);

  final FieldElement2 field;

  @override
  int compareTo(_FieldSet other) => _sortByLocation(field, other.field);

  static int _sortByLocation(FieldElement2 a, FieldElement2 b) {
    final checkerA = TypeChecker.fromStatic(
      (a.enclosingElement2 as InterfaceElement2).thisType,
    );

    if (!checkerA.isExactly(b.enclosingElement2)) {
      // in this case, you want to prioritize the enclosingElement that is more
      // "super".

      if (checkerA.isAssignableFrom(b.enclosingElement2)) {
        return -1;
      }

      final checkerB = TypeChecker.fromStatic(
        (b.enclosingElement2 as InterfaceElement2).thisType,
      );

      if (checkerB.isAssignableFrom(a.enclosingElement2)) {
        return 1;
      }
    }

    /// Returns the offset of given field/property in its source file – with a
    /// preference for the getter if it's defined.
    int offsetFor(FieldElement2 e) {
      if (e.isSynthetic) {
        return (e.getter2 ?? e.setter2)!.firstFragment.nameOffset2!;
      }
      return e.firstFragment.nameOffset2!;
    }

    return offsetFor(a).compareTo(offsetFor(b));
  }
}

extension on FormalParameterElement {
  FieldElement2? fieldFormal(List<FieldElement2> fields) {
    return switch (this) {
      FieldFormalParameterElement2(field2: final field?) => field,
      SuperFormalParameterElement2(
        superConstructorParameter2: final superConstructorParameter?,
      ) =>
        superConstructorParameter.fieldFormal(fields),
      _ => fields.firstWhereOrNull((field) => field.name3 == name3),
    };
  }
}

extension on ExecutableElement2? {
  List<ParameterSpec> get parameterSpecs {
    final parameters = this?.formalParameters;
    if (parameters == null) {
      return const [];
    }
    final specs = <ParameterSpec>[];
    final fields = switch (this) {
      FormalParameterElement(
        enclosingElement2: Element2(
          enclosingElement2: final ClassElement2 enclosingElement,
        ),
      ) =>
        enclosingElement.sortedFields(enclosingElement.thisType),
      _ => const <FieldElement2>[],
    };
    for (final parameter in parameters) {
      final fieldFormal = parameter.fieldFormal(fields);
      final (:ignoreFromJson, ignoreToJson: _) = switch (parameter) {
        FormalParameterElement(
          enclosingElement2: Element2(
            enclosingElement2: final ClassElement2 enclosingElement,
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
          defaultValue: parameter.defaultToExpression,
          ignore: ignoreFromJson,
        ),
      );
    }
    return specs;
  }
}

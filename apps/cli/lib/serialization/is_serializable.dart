import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:collection/collection.dart';

enum _TypePosition { parameter, return$ }

sealed class Verdict {
  const Verdict();

  const factory Verdict.yes({
    SerializationSpec? serializationSpec,
  }) = VerdictYes;
  factory Verdict.no(String reason) = VerdictNo.single;

  bool get isSerializable;
  List<String> get reasons;

  Verdict operator &(Verdict other) => switch ((this, other)) {
        (
          VerdictYes(serializationSpec: final serializationSpecThis),
          VerdictYes(serializationSpec: final serializationSpecOther)
        ) =>
          Verdict.yes(
            serializationSpec: serializationSpecThis ?? serializationSpecOther,
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
}

final class VerdictYes extends Verdict {
  const VerdictYes({
    this.serializationSpec,
  });

  @override
  bool get isSerializable => true;

  final SerializationSpec? serializationSpec;

  Verdict withSpec(SerializationSpec spec) =>
      Verdict.yes(serializationSpec: spec);

  @override
  List<String> get reasons => const [];
}

final class VerdictNo extends Verdict {
  const VerdictNo(this.reasons);
  VerdictNo.single(String reason) : reasons = [reason];

  @override
  bool get isSerializable => false;

  @override
  final List<String> reasons;

  @override
  String toString() => reasons.join('; ');
}

final class SerializationSpec {
  SerializationSpec({
    required this.uri,
    required this.isNullable,
    required this.element,
    required this.fields,
    required this.constructor,
  });

  final Uri uri;
  final bool isNullable;
  final ClassElement element;
  final List<FieldElement> fields;
  final ConstructorElement constructor;
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
  // TODO(dnys1): Detect cycles
  const IsSerializable();

  Verdict? _isSimpleJson(InterfaceType type) {
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreNum || // TODO: test
        type.isDartCoreString ||
        type.isDartCoreNull ||
        type.isDartCoreObject) {
      return const Verdict.yes();
    }
    if (type.isDartCoreEnum) {
      return Verdict.no('Untyped enums are not supported');
    }
    if (type.isEnum) {
      return const Verdict.yes();
    }
    if (type.isDartCoreSet) {
      return Verdict.no('Set types are not supported');
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      return type.typeArguments.single.accept(this);
    }
    if (type.isDartCoreMap) {
      if (!type.typeArguments[0].isDartCoreString) {
        return Verdict.no('Map keys must be strings');
      }
      return type.typeArguments[1].accept(this);
    }
    return null;
  }

  @override
  Verdict visitDynamicType(DynamicType type) {
    // Needed to support `Map<String, dynamic>`.
    return const Verdict.yes();
  }

  @override
  Verdict visitFunctionType(FunctionType type) =>
      Verdict.no('Function types are not supported');

  Verdict _customParameterSerializability(
    InterfaceType type,
    ConstructorElement fromJsonCtor,
  ) {
    final requiredParam = fromJsonCtor.parameters.singleOrNull;
    if (requiredParam == null) {
      return Verdict.no(
        'No required parameter found for fromJson constructor of type: ${type.element.name}',
      );
    }
    if (requiredParam.type
        // TODO(dnys1): Use a type checker for Map<String, dynamic> instead.
        case InterfaceType(
          isDartCoreMap: true,
          typeArguments: [
            InterfaceType(isDartCoreString: true),
            DynamicType() || InterfaceType(isDartCoreObject: true),
          ]
        )) {
      return const Verdict.yes();
    }
    return Verdict.no(
      'Invalid parameter type of ${type.element.name}\'s fromJson constructor: ${requiredParam.type}',
    );
  }

  Verdict _customReturnSerializability(
    InterfaceType type,
    MethodElement toJsonMethod,
  ) {
    if (toJsonMethod.parameters.any((param) => !param.isOptional)) {
      return Verdict.no(
        'The toJson method of type $type must not have any required parameters',
      );
    }
    final returnType = toJsonMethod.returnType;
    if (returnType case final InterfaceType returnType) {
      if (_isSimpleJson(returnType) case final verdict?) {
        return verdict;
      }
    }
    return Verdict.no(
      'Invalid return type of ${type.element.name}\'s toJson method: $returnType',
    );
  }

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    if (_isSimpleJson(type) case final verdict?) {
      return verdict;
    }
    // TODO(dnys1): Test
    // TODO(dnys1): Test for extends/implements these types
    // TODO(dnys1): Test for extends/implements these types w/ custom serde
    if (supportedDartSdkType.isExactlyType(type)) {
      return const Verdict.yes();
    }

    // Check if non-SDK class is serializable.
    //
    // Either it has its own fromJson/toJson methods, or it meets the
    // requirements needed to generate implementations.
    var verdict = const Verdict.yes();

    // Check fromJson-able
    {
      final fromJsonCtor = type.constructors.singleWhereOrNull(
        (element) => element.name == 'fromJson',
      );
      final hasCustomSerialization = fromJsonCtor != null;
      if (hasCustomSerialization) {
        verdict &= _customParameterSerializability(type, fromJsonCtor);
      } else {
        verdict &= type.accept(
          const _IsSerializableClass(_TypePosition.parameter),
        );
      }
    }

    // Check toJson-able
    {
      final toJsonMethod = type.getMethod('toJson');
      final hasCustomSerialization = toJsonMethod != null;
      if (hasCustomSerialization) {
        verdict &= _customReturnSerializability(type, toJsonMethod);
      } else {
        verdict &= type.accept(
          const _IsSerializableClass(_TypePosition.return$),
        );
      }
    }
    return verdict;
  }

  @override
  Verdict visitInvalidType(InvalidType type) =>
      Verdict.no('Invalid type: $type');

  @override
  Verdict visitNeverType(NeverType type) =>
      Verdict.no('Never types are not supported');

  @override
  Verdict visitRecordType(RecordType type) {
    var verdict = const Verdict.yes();
    for (final field in type.positionalFields) {
      verdict &= field.type.accept(this);
    }
    for (final field in type.namedFields) {
      verdict &= field.type.accept(this);
    }
    return verdict;
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
  // TODO(dnys1): Detect cycles
  const _IsSerializableClass(this.position);

  final _TypePosition position;

  @override
  Verdict visitDynamicType(DynamicType type) =>
      Verdict.no('Dynamic types are not supported');

  @override
  Verdict visitFunctionType(FunctionType type) =>
      Verdict.no('Function types are not supported');

  @override
  Verdict visitInterfaceType(InterfaceType type) {
    final element = type.element;
    if (element is! ClassElement) {
      return Verdict.no(
        'The type ${element.displayName} is not serializable since it is not '
        'a class or does not have a fromJson/toJson method.',
      );
    }
    final fields = element.sortedFields;
    var verdict = const Verdict.yes();
    var fieldsVerdict = const Verdict.yes();
    for (final field in fields) {
      if (field.isPrivate) {
        fieldsVerdict &= Verdict.no(
          'Private field "${field.displayName}" is not supported in a class '
          'used as a return type. Consider defining custom fromJson/toJson '
          'methods or making the field public.',
        );
        continue;
      }
      final fieldVerdict = field.type.accept(const IsSerializable());
      if (fieldVerdict is VerdictNo) {
        fieldsVerdict &= Verdict.no(
          'Field "${field.displayName}" of type "${element.displayName}" is '
          'not serializable: $fieldVerdict',
        );
      }
    }
    if (position == _TypePosition.return$) {
      verdict &= fieldsVerdict;
    }
    var constructorVerdict = const Verdict.yes();
    final unnamedConstructor = element.constructors.firstWhereOrNull((ctor) {
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
          );
          return false;
        }
        if (!fields.contains(parameterField)) {
          constructorVerdict &= Verdict.no(
            'Constructor parameter "${parameter.displayName}" is not '
            'a field of the class ${element.displayName}.',
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
      );
    } else if (element.isAbstract && !unnamedConstructor.isFactory) {
      constructorVerdict &= Verdict.no(
        'Class ${element.displayName} is abstract and must have an unnamed '
        'or fromJson factory constructor to be used.',
      );
    }
    if (position == _TypePosition.parameter) {
      verdict &= constructorVerdict;
    }
    final dartTypeUri = projectPaths
        .normalizeUri(element.library.source.uri)
        .replace(fragment: element.name);
    return switch (verdict & fieldsVerdict & constructorVerdict) {
      VerdictNo() => verdict,
      VerdictYes() => (verdict as VerdictYes).withSpec(
          SerializationSpec(
            uri: dartTypeUri,
            isNullable: type.nullabilitySuffix != NullabilitySuffix.none,
            element: element,
            fields: fields,
            constructor: unnamedConstructor!,
          ),
        ),
    };
  }

  @override
  Verdict visitInvalidType(InvalidType type) =>
      Verdict.no('Invalid type: $type');

  @override
  Verdict visitNeverType(NeverType type) =>
      Verdict.no('Never types are not supported');

  @override
  Verdict visitRecordType(RecordType type) =>
      type.accept(const IsSerializable());

  @override
  Verdict visitTypeParameterType(TypeParameterType type) {
    // TODO(dnys1): Generic tests and support?
    return Verdict.no('Generic types are not supported');
  }

  @override
  Verdict visitVoidType(VoidType type) =>
      Verdict.no('Void types are not supported');
}

// Below is copied from `package:json_serializable`.

extension on ClassElement {
  /// Returns a [List] of all instance [FieldElement] items for [element] and
  /// super classes, sorted first by their location in the inheritance hierarchy
  /// (super first) and then by their location in the source file.
  List<FieldElement> get sortedFields {
    // Get all of the fields that need to be assigned
    final elementInstanceFields = Map.fromEntries(
      this.fields.where((e) => !e.isStatic).map((e) => MapEntry(e.name, e)),
    );

    final inheritedFields = <String, FieldElement>{};
    final manager = InheritanceManager3();

    const dartCoreObject = TypeChecker.fromUrl('dart:core#Object');

    for (final v in manager.getInheritedConcreteMap2(this).values) {
      assert(v is! FieldElement);
      if (dartCoreObject.isExactly(v.enclosingElement)) {
        continue;
      }

      if (v is PropertyAccessorElement && v.isGetter) {
        assert(v.variable is FieldElement);
        final variable = v.variable as FieldElement;
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

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:collection/collection.dart';

enum _TypePosition { parameter, return$ }

sealed class Verdict {
  const Verdict();

  const factory Verdict.yes() = _VerdictYes;
  factory Verdict.no(String reason) = _VerdictNo.single;

  bool get isSerializable;
  List<String> get reasons;

  Verdict operator &(Verdict other) => switch ((this, other)) {
        (_VerdictYes(), _VerdictYes()) => const Verdict.yes(),
        (_VerdictYes(), _VerdictNo(:final reasons)) ||
        (_VerdictNo(:final reasons), _VerdictYes()) =>
          _VerdictNo(reasons),
        (
          _VerdictNo(reasons: final reasonsThis),
          _VerdictNo(reasons: final reasonsOther)
        ) =>
          _VerdictNo([...reasonsThis, ...reasonsOther]),
      };
}

final class _VerdictYes extends Verdict {
  const _VerdictYes();

  @override
  bool get isSerializable => true;

  @override
  List<String> get reasons => const [];
}

final class _VerdictNo extends Verdict {
  const _VerdictNo(this.reasons);
  _VerdictNo.single(String reason) : reasons = [reason];

  @override
  bool get isSerializable => false;

  @override
  final List<String> reasons;
}

extension TypeIsSerializable on DartType {
  /// Determines whether a [DartType] can be serialized in a return position.
  ///
  /// Types in this position must:
  /// {@macro celest.is_serializable_return}
  Verdict get isValidReturnType =>
      flattened.accept(const _IsSerializable(_TypePosition.return$));

  /// Determines whether a [DartType] can be serialized in a parameter position.
  ///
  /// Types in this position must:
  /// {@macro celest.is_serializable_parameter}
  Verdict get isValidParameterType =>
      flattened.accept(const _IsSerializable(_TypePosition.parameter));
}

/// Determines whether a [DartType] can be serialized to/from JSON.
///
/// For types in the [_TypePosition.parameter] position, the type must:
///
/// {@template celest.is_serializable_parameter}
/// - Be a simple JSON type (bool, double, int, String, null, Object)
/// - Be an enum
/// - Be a supported Dart SDK type
/// - Be a class with a constructor named `fromJson` that takes a single
///   required parameter whose type is `Map<String, dynamic>`.
/// - Be a class which: has fields of the above types, has a constructor with
///   all fields present. For these classes, we generate custom serialization
///   code.
/// {@endtemplate}
///
/// For types in the [_TypePosition.return$] position, the type must:
///
/// {@template celest.is_serializable_return}
/// - Be a simple JSON type (bool, double, int, String, null, Object)
/// - Be an enum
/// - Be a supported Dart SDK type
/// - Be a class with a method named `toJson` that takes no required parameters.
/// - Be a class which: has fields of the above types, has a constructor with
///   all fields present. For these classes, we generate custom serialization
///   code.
/// {@endtemplate}
final class _IsSerializable extends TypeVisitor<Verdict> {
  // TODO(dnys1): Detect cycles
  const _IsSerializable(this.position, [this.depth = 0]);

  final _TypePosition position;
  final int depth;

  void tt() {}

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
      return type.typeArguments.single.accept(
        _IsSerializable(position, depth + 1),
      );
    }
    if (type.isDartCoreMap) {
      if (!type.typeArguments[0].isDartCoreString) {
        return Verdict.no('Map keys must be strings');
      }
      return type.typeArguments[1].accept(
        _IsSerializable(position, depth + 1),
      );
    }
    return null;
  }

  @override
  Verdict visitDynamicType(DynamicType type) {
    // Needed to support `Map<String, dynamic>`.
    return depth > 0
        ? const Verdict.yes()
        : Verdict.no('Dynamic types are not supported');
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
    switch (position) {
      case _TypePosition.parameter:
        // Check for custom serialization.
        final fromJsonCtor = type.constructors.singleWhereOrNull(
          (element) => element.name == 'fromJson',
        );
        if (fromJsonCtor != null) {
          verdict &= _customParameterSerializability(type, fromJsonCtor);
        } else {
          return Verdict.no(
            'Type ${type.element.name} must have a fromJson constructor.',
          );
          // verdict &= type.accept(_IsSerializableClass(position));
        }
      case _TypePosition.return$:
        // Check for custom serialization.
        final toJsonMethod = type.getMethod('toJson');
        if (toJsonMethod != null) {
          verdict &= _customReturnSerializability(type, toJsonMethod);
        } else {
          return Verdict.no(
            'Type ${type.element.name} must have a toJson method.',
          );
          // verdict &= type.accept(_IsSerializableClass(position));
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
      verdict &= field.type.accept(
        _IsSerializable(position, depth + 1),
      );
    }
    for (final field in type.namedFields) {
      verdict &= field.type.accept(
        _IsSerializable(position, depth + 1),
      );
    }
    return verdict;
  }

  @override
  Verdict visitTypeParameterType(TypeParameterType type) {
    // TODO(dnys1): Generic tests and support?
    return Verdict.no('Generic types are not supported');
  }

  @override
  Verdict visitVoidType(VoidType type) {
    if (depth == 0 && position == _TypePosition.return$) {
      return const Verdict.yes();
    }
    return Verdict.no('Void types are not supported in this position');
  }
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
    var verdict = const Verdict.yes();
    final fields = element.sortedFields;
    for (final field in fields) {
      if (field.isPrivate) {
        if (position == _TypePosition.parameter) {
          verdict &= Verdict.no(
            'Private field "${field.displayName}" is not supported in a class '
            'used as a parameter. Consider defining custom fromJson/toJson '
            'methods or making the field public.',
          );
        }
        continue;
      }
      verdict &= field.type.accept(_IsSerializable(position));
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
  Verdict visitRecordType(RecordType type) =>
      type.accept(_IsSerializable(position));

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

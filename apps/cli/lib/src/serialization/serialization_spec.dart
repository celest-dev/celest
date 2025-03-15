import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart' as code_builder;
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

final class SerializationSpec {
  SerializationSpec({
    required this.type,
    required this.wireType,
    code_builder.Reference? castType,
    this.fields = const [],
    required this.wireConstructor,
    this.constructorParameters = const [],
    this.fromJsonParameters = const [],
    required this.fromJsonType,
    required this.toJsonType,
    SerializationSpec? representationType,
  })  : castType = castType ?? wireType,
        _representationType = representationType;

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

  final ConstructorElement? wireConstructor;
  final List<ParameterSpec> constructorParameters;
  final List<ParameterSpec> fromJsonParameters;

  List<ParameterSpec> get parameters =>
      fromJsonType == null ? constructorParameters : fromJsonParameters;

  final DartType? fromJsonType;
  final DartType? toJsonType;

  SerializationSpec? parent;
  final List<SerializationSpec> subtypes = [];
  SerializationSpec? _representationType;

  set representationType(SerializationSpec? value) {
    _representationType = value;
  }

  SerializationSpec get representationType => _representationType ?? this;

  bool get isExtensionType => _representationType != null;

  SerializationSpec get erased {
    // Extension types are never erased. They either override another type or
    // have their own unique global identity. In either case, they retain their
    // identity for the purpose of serialization.
    if (isExtensionType) {
      return this;
    }
    final erased = SerializationSpec(
      type: type,
      wireType: type.defaultWireType?.let(typeHelper.toReference) ?? wireType,
      castType: type.defaultWireType?.let(typeHelper.toReference) ?? castType,
      fields: fields,
      wireConstructor: wireConstructor,
      constructorParameters: constructorParameters,
      fromJsonParameters: const [],
      toJsonType: null,
      fromJsonType: null,
      representationType: _representationType,
    );
    for (final subtype in subtypes) {
      erased.subtypes.add(subtype.erased);
    }
    return erased;
  }

  SerializationSpec copyWith({
    DartType? type,
    code_builder.Reference? wireType,
    code_builder.Reference? castType,
    List<FieldSpec>? fields,
    List<ParameterSpec>? constructorParameters,
    List<ParameterSpec>? fromJsonParameters,
    Object? fromJsonType = const Object(),
    Object? toJsonType = const Object(),
  }) =>
      SerializationSpec(
        type: type ?? this.type,
        wireType: wireType ?? this.wireType,
        castType: castType ?? this.castType,
        fields: fields ?? this.fields,
        wireConstructor: wireConstructor,
        constructorParameters:
            constructorParameters ?? this.constructorParameters,
        fromJsonParameters: fromJsonParameters ?? this.fromJsonParameters,
        fromJsonType: switch (fromJsonType) {
          null => null,
          final DartType type => type,
          _ => this.fromJsonType,
        },
        toJsonType: switch (toJsonType) {
          null => null,
          final DartType type => type,
          _ => this.toJsonType,
        },
        representationType: _representationType,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SerializationSpec &&
        const DartTypeEquality().equals(type, other.type) &&
        wireType == other.wireType &&
        castType == other.castType &&
        const ListEquality<FieldSpec>().equals(fields, other.fields) &&
        const ListEquality<ParameterSpec>().equals(
          constructorParameters,
          other.constructorParameters,
        ) &&
        const ListEquality<ParameterSpec>().equals(
          fromJsonParameters,
          other.fromJsonParameters,
        ) &&
        const DartTypeEquality().equals(fromJsonType, other.fromJsonType) &&
        const DartTypeEquality().equals(toJsonType, other.toJsonType) &&
        parent?.type == other.parent?.type &&
        const ListEquality<SerializationSpec>().equals(
          subtypes,
          other.subtypes,
        ) &&
        _representationType == other._representationType;
  }

  @override
  int get hashCode => Object.hash(
        const DartTypeEquality().hash(type),
        wireType,
        castType,
        const ListEquality<FieldSpec>().hash(fields),
        const ListEquality<ParameterSpec>().hash(constructorParameters),
        const ListEquality<ParameterSpec>().hash(fromJsonParameters),
        const DartTypeEquality().hash(fromJsonType),
        const DartTypeEquality().hash(toJsonType),
        parent == null ? null : const DartTypeEquality().hash(parent!.type),
        const ListEquality<SerializationSpec>().hash(subtypes),
        _representationType,
      );
}

@immutable
final class FieldSpec {
  const FieldSpec({
    required this.name,
    required this.type,
    this.ignore = false,
  });

  final String name;
  final DartType type;
  final bool ignore;

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
    this.ignore = false,
  });

  final String name;
  final DartType type;
  final bool isPositional;
  final bool isOptional;
  final bool isNamed;
  final code_builder.Expression? defaultValue;
  final bool ignore;

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

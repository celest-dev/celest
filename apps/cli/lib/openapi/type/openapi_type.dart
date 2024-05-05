import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/openapi/type/openapi_type_visitor.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:meta/meta.dart';

part 'openapi_type.g.dart';

final OpenApiAnyType _anyType = OpenApiAnyType(
  schema: OpenApiAnyTypeSchema(isNullable: false),
  typeReference: DartTypes.core.object.toTypeReference,
  isNullable: false,
);

abstract mixin class OpenApiTypeBuilder {
  void replace(OpenApiType other);
  void update(void Function(OpenApiTypeBuilder) updates);

  bool? get isNullable;
  set isNullable(bool? isNullable);

  TypeReferenceBuilder? get typeReference;
  set typeReference(TypeReferenceBuilder? b);

  String? get docs;
  set docs(String? docs);

  bool? get deprecated;
  set deprecated(bool? deprecated);
}

@immutable
@BuiltValue(instantiable: false)
sealed class OpenApiType {
  /// Whether the type is nullable in the schema.
  bool get isNullable;

  OpenApiType? get primitiveType;

  TypeReference get typeReference;
  OpenApiTypeSchema get schema;
  BuiltList<TypeReference>? get implements;

  String? get docs;
  bool? get deprecated;
  Object? get defaultValue;

  OpenApiType withNullability(bool isNullable);

  R accept<R>(OpenApiTypeVisitor<R> visitor);
  OpenApiTypeBuilder toBuilder();
  OpenApiType rebuild(void Function(OpenApiTypeBuilder b) updates);
}

@immutable
@BuiltValue(instantiable: false)
sealed class Discriminator {}

abstract class FieldDiscriminator
    implements
        Built<FieldDiscriminator, FieldDiscriminatorBuilder>,
        Discriminator {
  factory FieldDiscriminator({
    required String wireName,
    required String dartName,
    required Map<String, OpenApiType> mapping,
  }) {
    return _$FieldDiscriminator._(
      wireName: wireName,
      dartName: dartName,
      mapping: mapping.build(),
    );
  }

  factory FieldDiscriminator.build([
    void Function(FieldDiscriminatorBuilder b) updates,
  ]) = _$FieldDiscriminator;

  FieldDiscriminator._();

  String get wireName;
  String get dartName;
  BuiltMap<String, OpenApiType> get mapping;
}

abstract class TypeDiscriminator
    implements
        Built<TypeDiscriminator, TypeDiscriminatorBuilder>,
        Discriminator {
  factory TypeDiscriminator({
    required Map<Expression, OpenApiType> mapping,
  }) {
    return _$TypeDiscriminator._(
      mapping: mapping.build(),
    );
  }

  factory TypeDiscriminator.build([
    void Function(TypeDiscriminatorBuilder b) updates,
  ]) = _$TypeDiscriminator;

  TypeDiscriminator._();

  // TODO: Jsonpath
  BuiltMap<Expression, OpenApiType> get mapping;
}

abstract class OpenApiTypeReference
    implements
        Built<OpenApiTypeReference, OpenApiTypeReferenceBuilder>,
        OpenApiType {
  factory OpenApiTypeReference({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    OpenApiType? primitiveType,
    Object? defaultValue,
  }) {
    return _$OpenApiTypeReference._(
      typeReference: typeReference,
      schema: schema,
      primitiveType: primitiveType,
      isNullable: isNullable,
    );
  }

  factory OpenApiTypeReference.build([
    void Function(OpenApiTypeReferenceBuilder) updates,
  ]) = _$OpenApiTypeReference;

  OpenApiTypeReference._();

  @override
  OpenApiTypeReference withNullability(bool isNullable) {
    return _$OpenApiTypeReference._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      primitiveType: primitiveType,
      isNullable: isNullable,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) {
    throw UnimplementedError();
  }
}

extension OpenApiTypeIsPrimitive on OpenApiType {
  bool get isPrimitive => primitiveType != null;
}

sealed class OpenApiPrimitiveType implements OpenApiType {
  @override
  bool get isNullable;

  @override
  OpenApiPrimitiveType get primitiveType;

  @override
  OpenApiPrimitiveType withNullability(bool isNullable);
}

sealed class OpenApiInterfaceType implements OpenApiType {
  OpenApiInterfaceType? get superType;

  // TODO: implements

  @override
  OpenApiInterfaceType rebuild(void Function(OpenApiTypeBuilder b) updates);

  @override
  OpenApiInterfaceType withNullability(bool isNullable);
}

extension OpenApiInterfaceTypeHelpers on OpenApiInterfaceType {
  Iterable<OpenApiType> get allSuperTypes {
    final allSuperTypes = <OpenApiType>{};
    var superType = this.superType;
    while (superType != null) {
      allSuperTypes.add(superType);
      if (superType
          case OpenApiInterfaceType(superType: final superSuperType)) {
        superType = superSuperType;
      }
    }
    return allSuperTypes;
  }
}

sealed class OpenApiIterableInterface implements OpenApiInterfaceType {
  /// The items schema for this array.
  OpenApiType get itemType;

  @override
  OpenApiType get primitiveType;
}

abstract class OpenApiIterableType
    implements
        Built<OpenApiIterableType, OpenApiIterableTypeBuilder>,
        OpenApiType,
        OpenApiIterableInterface {
  factory OpenApiIterableType({
    required OpenApiType itemType,
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiIterableType._(
      itemType: itemType,
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiIterableType.build([
    void Function(OpenApiIterableTypeBuilder b) updates,
  ]) = _$OpenApiIterableType;

  OpenApiIterableType._();

  @override
  OpenApiType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core
              .iterable(itemType.typeReference)
              .withNullability(isNullable)
              .toTypeReference,
        ),
      );

  @override
  OpenApiInterfaceType? get superType => null;

  @override
  OpenApiIterableType withNullability(bool isNullable) {
    return _$OpenApiIterableType._(
      itemType: itemType,
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitIterable(this);
}

abstract class OpenApiListType
    implements
        Built<OpenApiListType, OpenApiListTypeBuilder>,
        OpenApiType,
        OpenApiIterableInterface {
  factory OpenApiListType({
    required OpenApiType itemType,
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiListType._(
      itemType: itemType,
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiListType.build([
    void Function(OpenApiListTypeBuilder b) updates,
  ]) = _$OpenApiListType;

  OpenApiListType._();

  @override
  OpenApiInterfaceType? get superType => null;

  @override
  OpenApiType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core
              .list(itemType.typeReference)
              .withNullability(isNullable)
              .toTypeReference,
        ),
      );

  @override
  OpenApiListType withNullability(bool isNullable) {
    return _$OpenApiListType._(
      itemType: itemType,
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitList(this);
}

abstract class OpenApiSetType
    implements
        Built<OpenApiSetType, OpenApiSetTypeBuilder>,
        OpenApiType,
        OpenApiInterfaceType,
        OpenApiIterableInterface {
  factory OpenApiSetType({
    required OpenApiType itemType,
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiSetType._(
      itemType: itemType,
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiSetType.build([
    void Function(OpenApiSetTypeBuilder b) updates,
  ]) = _$OpenApiSetType;

  OpenApiSetType._();

  @override
  OpenApiInterfaceType? get superType => null;

  @override
  OpenApiType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core
              .set(itemType.typeReference)
              .withNullability(isNullable)
              .toTypeReference,
        ),
      );

  @override
  OpenApiSetType withNullability(bool isNullable) {
    return _$OpenApiSetType._(
      itemType: itemType,
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitSet(this);
}

abstract class OpenApiBooleanType
    implements
        Built<OpenApiBooleanType, OpenApiBooleanTypeBuilder>,
        OpenApiType,
        OpenApiPrimitiveType,
        OpenApiInterfaceType {
  factory OpenApiBooleanType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiBooleanType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiBooleanType.build([
    void Function(OpenApiBooleanTypeBuilder b) updates,
  ]) = _$OpenApiBooleanType;

  OpenApiBooleanType._();

  @override
  OpenApiPrimitiveType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core.bool.withNullability(isNullable).toTypeReference,
        ),
      );

  @override
  OpenApiInterfaceType get superType => _anyType;

  @override
  OpenApiBooleanType withNullability(bool isNullable) {
    return _$OpenApiBooleanType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitBoolean(this);
}

sealed class OpenApiNumberInterface implements OpenApiPrimitiveType {}

abstract class OpenApiNumberType
    implements
        Built<OpenApiNumberType, OpenApiNumberTypeBuilder>,
        OpenApiType,
        OpenApiNumberInterface {
  factory OpenApiNumberType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiNumberType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiNumberType.build([
    void Function(OpenApiNumberTypeBuilder b) updates,
  ]) = _$OpenApiNumberType;

  OpenApiNumberType._();

  @override
  OpenApiPrimitiveType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core.num.withNullability(isNullable).toTypeReference,
        ),
      );

  @override
  OpenApiNumberType withNullability(bool isNullable) {
    return _$OpenApiNumberType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitNumber(this);
}

extension type const OpenApiIntegerFormat(String _) implements String {
  /// https://spec.openapis.org/oas/v3.1.0#data-types
  static const OpenApiIntegerFormat int32 = OpenApiIntegerFormat('int32');
  static const OpenApiIntegerFormat int64 = OpenApiIntegerFormat('int64');

  // TODO
  static const OpenApiIntegerFormat long = OpenApiIntegerFormat('long');
  static const OpenApiIntegerFormat unixTime =
      OpenApiIntegerFormat('unix-time');
}

abstract class OpenApiIntegerType
    implements
        Built<OpenApiIntegerType, OpenApiIntegerTypeBuilder>,
        OpenApiType,
        OpenApiNumberInterface {
  factory OpenApiIntegerType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiIntegerType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiIntegerType.build([
    void Function(OpenApiIntegerTypeBuilder b) updates,
  ]) = _$OpenApiIntegerType;

  OpenApiIntegerType._();

  @override
  OpenApiPrimitiveType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core.num.withNullability(isNullable).toTypeReference,
        ),
      );

  @override
  OpenApiIntegerType withNullability(bool isNullable) {
    return _$OpenApiIntegerType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitInteger(this);
}

extension type const OpenApiDoubleFormat(String _) implements String {
  /// https://spec.openapis.org/oas/v3.1.0#data-types
  static const OpenApiDoubleFormat float = OpenApiDoubleFormat('float');
  static const OpenApiDoubleFormat double = OpenApiDoubleFormat('double');

  // TODO
  static const OpenApiDoubleFormat long = OpenApiDoubleFormat('long');
  static const OpenApiDoubleFormat int32 = OpenApiDoubleFormat('int32');
}

abstract class OpenApiDoubleType
    implements
        Built<OpenApiDoubleType, OpenApiDoubleTypeBuilder>,
        OpenApiType,
        OpenApiInterfaceType,
        OpenApiNumberInterface {
  factory OpenApiDoubleType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiDoubleType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiDoubleType.build([
    void Function(OpenApiDoubleTypeBuilder b) updates,
  ]) = _$OpenApiDoubleType;

  OpenApiDoubleType._();

  @override
  OpenApiPrimitiveType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core.num.withNullability(isNullable).toTypeReference,
        ),
      );

  @override
  OpenApiDoubleType withNullability(bool isNullable) {
    return _$OpenApiDoubleType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitDouble(this);
}

extension type const OpenApiStringFormat(String _) implements String {
  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.2
  static const OpenApiStringFormat email = OpenApiStringFormat('email');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.2
  static const OpenApiStringFormat idnEmail = OpenApiStringFormat('idn-email');

  /// https://spec.openapis.org/oas/v3.1.0#data-types
  static const OpenApiStringFormat password = OpenApiStringFormat('password');

  // TODO

  static const OpenApiStringFormat byte = OpenApiStringFormat('byte');
  static const OpenApiStringFormat binary = OpenApiStringFormat('binary');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.1
  static const OpenApiStringFormat date = OpenApiStringFormat('date');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.1
  static const OpenApiStringFormat dateTime = OpenApiStringFormat('date-time');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.1
  static const OpenApiStringFormat time = OpenApiStringFormat('time');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.1
  static const OpenApiStringFormat duration = OpenApiStringFormat('duration');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.3
  static const OpenApiStringFormat hostname = OpenApiStringFormat('hostname');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.3
  static const OpenApiStringFormat idnHostname =
      OpenApiStringFormat('idn-hostname');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.4
  static const OpenApiStringFormat ipv4 = OpenApiStringFormat('ipv4');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.4
  static const OpenApiStringFormat ipv6 = OpenApiStringFormat('ipv6');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.5
  static const OpenApiStringFormat uri = OpenApiStringFormat('uri');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.5
  static const OpenApiStringFormat uriReference =
      OpenApiStringFormat('uri-reference');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.5
  static const OpenApiStringFormat iri = OpenApiStringFormat('iri');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.5
  static const OpenApiStringFormat iriReference =
      OpenApiStringFormat('iri-reference');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.5
  static const OpenApiStringFormat uuid = OpenApiStringFormat('uuid');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.6
  static const OpenApiStringFormat uriTemplate =
      OpenApiStringFormat('uri-template');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.8
  static const OpenApiStringFormat regex = OpenApiStringFormat('regex');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.7
  static const OpenApiStringFormat jsonPointer =
      OpenApiStringFormat('json-pointer');

  /// https://datatracker.ietf.org/doc/html/draft-bhutton-json-schema-validation-00#section-7.3.7
  static const OpenApiStringFormat relativeJsonPointer =
      OpenApiStringFormat('relative-json-pointer');

  static const OpenApiStringFormat number = OpenApiStringFormat('number');
  static const OpenApiStringFormat eventStream =
      OpenApiStringFormat('event-stream');
  static const OpenApiStringFormat special = OpenApiStringFormat('special');

  // Stripe uses this
  static const OpenApiStringFormat decimal = OpenApiStringFormat('decimal');
}

abstract class OpenApiStringType
    implements
        Built<OpenApiStringType, OpenApiStringTypeBuilder>,
        OpenApiType,
        OpenApiPrimitiveType,
        OpenApiInterfaceType {
  factory OpenApiStringType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiStringType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiStringType.build([
    void Function(OpenApiStringTypeBuilder b) updates,
  ]) = _$OpenApiStringType;

  OpenApiStringType._();

  @override
  OpenApiPrimitiveType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core.string.withNullability(isNullable).toTypeReference,
        ),
      );

  @override
  OpenApiInterfaceType get superType => _anyType;

  @override
  OpenApiStringType withNullability(bool isNullable) {
    return _$OpenApiStringType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitString(this);
}

abstract class OpenApiEmptyType
    implements Built<OpenApiEmptyType, OpenApiEmptyTypeBuilder>, OpenApiType {
  factory OpenApiEmptyType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
  }) {
    return _$OpenApiEmptyType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: false,
    );
  }

  factory OpenApiEmptyType.build([
    void Function(OpenApiEmptyTypeBuilder b) updates,
  ]) = _$OpenApiEmptyType;

  OpenApiEmptyType._();

  static final OpenApiEmptyType instance = _$OpenApiEmptyType._(
    schema: OpenApiEmptyTypeSchema.instance,
    typeReference: DartTypes.core.void$.toTypeReference,
    isNullable: false,
  );

  @override
  OpenApiPrimitiveType? get primitiveType => null;

  @override
  OpenApiEmptyType withNullability(bool isNullable) {
    return this;
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitEmpty(this);
}

/// An anonymous bag of properties.
abstract class OpenApiRecordType
    implements
        Built<OpenApiRecordType, OpenApiRecordTypeBuilder>,
        OpenApiType,
        OpenApiInterfaceType {
  factory OpenApiRecordType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required OpenApiType valueType,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiRecordType._(
      typeReference: typeReference,
      schema: schema,
      valueType: valueType,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiRecordType.build([
    void Function(OpenApiRecordTypeBuilder b) updates,
  ]) = _$OpenApiRecordType;

  OpenApiRecordType._();

  /// The type of values in the record.
  OpenApiType get valueType;

  @override
  OpenApiInterfaceType get superType => _anyType;

  @override
  OpenApiType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core
              .map(DartTypes.core.string, valueType.typeReference)
              .withNullability(isNullable)
              .toTypeReference,
        ),
      );

  @override
  OpenApiRecordType withNullability(bool isNullable) {
    return _$OpenApiRecordType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      valueType: valueType,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitRecord(this);
}

abstract class OpenApiField
    implements Built<OpenApiField, OpenApiFieldBuilder> {
  factory OpenApiField({
    required String name,
    required String dartName,
    required OpenApiType type,
    Object? defaultValue,
  }) {
    return _$OpenApiField._(
      name: name,
      dartName: dartName,
      type: type,
    );
  }

  factory OpenApiField.build([
    void Function(OpenApiFieldBuilder b) updates,
  ]) = _$OpenApiField;

  OpenApiField._();

  String get name;
  String get dartName;
  OpenApiType get type;
  TypeReference get typeReference => type.typeReference;
}

/// Unlike an [OpenApiRecordType], struct types have identity and a unique
/// [name].
abstract class OpenApiStructType
    implements
        Built<OpenApiStructType, OpenApiStructTypeBuilder>,
        OpenApiType,
        OpenApiInterfaceType {
  factory OpenApiStructType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required Map<String, OpenApiField> fields,
    required Iterable<TypeReference> implements,
    OpenApiInterfaceType? superType,
    Discriminator? discriminator,
    required bool isNullable,
    String? docs,
    Object? defaultValue,
  }) {
    return _$OpenApiStructType._(
      typeReference: typeReference,
      schema: schema,
      fields: fields.build(),
      implements: implements.toBuiltList(),
      superType: superType ?? _anyType,
      discriminator: discriminator,
      isNullable: isNullable,
      docs: docs,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiStructType.build([
    void Function(OpenApiStructTypeBuilder b) updates,
  ]) = _$OpenApiStructType;

  OpenApiStructType._();

  /// If non-null, this represents the base class of a sealed hierarchy.
  Discriminator? get discriminator;

  /// The properties for this struct.
  BuiltMap<String, OpenApiField> get fields;

  Iterable<OpenApiField> get serializableFields sync* {
    for (final field in fields.values) {
      if (field.type is! OpenApiSingleValueType) yield field;
    }
  }

  @override
  BuiltList<TypeReference> get implements;

  @override
  OpenApiInterfaceType get superType;

  @override
  OpenApiPrimitiveType? get primitiveType => null;

  @override
  OpenApiStructType withNullability(bool isNullable) {
    return _$OpenApiStructType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      fields: fields,
      implements: implements,
      superType: superType.withNullability(isNullable),
      discriminator: discriminator,
      isNullable: isNullable,
      docs: docs,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitStruct(this);
}

abstract class OpenApiSealedBranch
    implements Built<OpenApiSealedBranch, OpenApiSealedBranchBuilder> {
  factory OpenApiSealedBranch({
    required String name,
    required OpenApiType type,
  }) {
    return _$OpenApiSealedBranch._(
      name: name,
      type: type,
    );
  }

  factory OpenApiSealedBranch.build([
    void Function(OpenApiSealedBranchBuilder) updates,
  ]) = _$OpenApiSealedBranch;

  OpenApiSealedBranch._();

  String get name;

  OpenApiType get type;
}

abstract class OpenApiSealedType
    implements
        Built<OpenApiSealedType, OpenApiSealedTypeBuilder>,
        OpenApiType,
        OpenApiInterfaceType {
  factory OpenApiSealedType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required Iterable<OpenApiSealedBranch> branches,
    required Discriminator discriminator,
    required bool isNullable,
    Object? defaultValue,
  }) {
    assert(branches.isNotEmpty, 'must have at least one case');
    return _$OpenApiSealedType._(
      typeReference: typeReference,
      schema: schema,
      branches: branches.toBuiltList(),
      discriminator: discriminator,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiSealedType.build([
    void Function(OpenApiSealedTypeBuilder b) updates,
  ]) = _$OpenApiSealedType;

  OpenApiSealedType._();

  Discriminator get discriminator;

  BuiltList<OpenApiSealedBranch> get branches;

  @override
  OpenApiInterfaceType get superType => _anyType;

  @override
  OpenApiPrimitiveType? get primitiveType => null;

  @override
  OpenApiSealedType withNullability(bool isNullable) {
    return _$OpenApiSealedType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      discriminator: discriminator,
      branches: branches,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitSealed(this);
}

abstract class OpenApiNullType
    implements
        Built<OpenApiNullType, OpenApiNullTypeBuilder>,
        OpenApiType,
        OpenApiPrimitiveType,
        OpenApiInterfaceType {
  factory OpenApiNullType.build([
    void Function(OpenApiNullTypeBuilder b) updates,
  ]) = _$OpenApiNullType;

  OpenApiNullType._();

  static final OpenApiNullType instance = _$OpenApiNullType._(
    schema: OpenApiNullTypeSchema.instance,
    typeReference: DartTypes.core.null$.toTypeReference,
    isNullable: true,
  );

  @override
  OpenApiPrimitiveType get primitiveType => this;

  @override
  OpenApiNullType withNullability(bool isNullable) {
    return _$OpenApiNullType._(
      schema: schema,
      typeReference: typeReference,
      isNullable: isNullable,
    );
  }

  @override
  OpenApiInterfaceType? get superType => null;

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitNull(this);
}

abstract class OpenApiSingleValueType
    implements
        Built<OpenApiSingleValueType, OpenApiSingleValueTypeBuilder>,
        OpenApiType,
        OpenApiPrimitiveType,
        OpenApiInterfaceType {
  factory OpenApiSingleValueType({
    required OpenApiTypeSchema schema,
    required OpenApiPrimitiveType baseType,
    required Object value,
    required bool isNullable,
  }) {
    return _$OpenApiSingleValueType._(
      schema: schema,
      typeReference: baseType.typeReference,
      baseType: baseType,
      value: value,
      isNullable: baseType.isNullable,
    );
  }

  factory OpenApiSingleValueType.build([
    void Function(OpenApiSingleValueTypeBuilder b) updates,
  ]) = _$OpenApiSingleValueType;

  OpenApiSingleValueType._();

  /// The type of [value].
  OpenApiPrimitiveType get baseType;

  /// The single value for this type.
  Object get value;

  @override
  OpenApiInterfaceType get superType => _anyType;

  @override
  OpenApiPrimitiveType get primitiveType => baseType;

  @override
  OpenApiSingleValueType withNullability(bool isNullable) {
    return _$OpenApiSingleValueType._(
      schema: schema,
      baseType: baseType.withNullability(isNullable),
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      value: value,
      isNullable: isNullable,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitSingleValue(this);
}

abstract class OpenApiEnumType
    implements
        Built<OpenApiEnumType, OpenApiEnumTypeBuilder>,
        OpenApiType,
        OpenApiInterfaceType {
  factory OpenApiEnumType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required OpenApiPrimitiveType baseType,
    required Iterable<Object> values,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiEnumType._(
      typeReference: typeReference,
      schema: schema,
      baseType: baseType,
      values: values.toBuiltList(),
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiEnumType.build([
    void Function(OpenApiEnumTypeBuilder b) updates,
  ]) = _$OpenApiEnumType;

  OpenApiEnumType._();

  /// The enum type.
  OpenApiPrimitiveType get baseType;

  /// The values for this enum.
  BuiltList<Object> get values;

  @override
  OpenApiEnumType withNullability(bool isNullable) {
    return _$OpenApiEnumType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      baseType: baseType.withNullability(isNullable),
      values: values,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitEnum(this);
}

abstract class OpenApiAnyType
    implements
        Built<OpenApiAnyType, OpenApiAnyTypeBuilder>,
        OpenApiType,
        OpenApiPrimitiveType,
        OpenApiInterfaceType {
  factory OpenApiAnyType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    Object? defaultValue,
  }) {
    return _$OpenApiAnyType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiAnyType.build([
    void Function(OpenApiAnyTypeBuilder b) updates,
  ]) = _$OpenApiAnyType;

  OpenApiAnyType._();

  @override
  OpenApiPrimitiveType get primitiveType => rebuild(
        (t) => t.typeReference.replace(
          DartTypes.core.object.withNullability(isNullable).toTypeReference,
        ),
      );

  @override
  OpenApiInterfaceType? get superType =>
      isNullable ? OpenApiNullType.instance : null;

  @override
  OpenApiAnyType withNullability(bool isNullable) {
    return _$OpenApiAnyType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitAny(this);
}

abstract class OpenApiDateType
    implements
        Built<OpenApiDateType, OpenApiDateTypeBuilder>,
        OpenApiType,
        OpenApiPrimitiveType,
        OpenApiInterfaceType {
  factory OpenApiDateType({
    required TypeReference typeReference,
    required OpenApiTypeSchema schema,
    required bool isNullable,
    required OpenApiPrimitiveType primitiveType,
    Object? defaultValue,
  }) {
    return _$OpenApiDateType._(
      typeReference: typeReference,
      schema: schema,
      isNullable: isNullable,
      primitiveType: primitiveType,
      defaultValue: defaultValue,
    );
  }

  factory OpenApiDateType.build([
    void Function(OpenApiDateTypeBuilder b) updates,
  ]) = _$OpenApiDateType;

  OpenApiDateType._();

  @override
  OpenApiPrimitiveType get primitiveType;

  @override
  OpenApiInterfaceType get superType => _anyType;

  @override
  OpenApiDateType withNullability(bool isNullable) {
    return _$OpenApiDateType._(
      typeReference: typeReference.withNullability(isNullable).toTypeReference,
      schema: schema,
      isNullable: isNullable,
      primitiveType: primitiveType.withNullability(isNullable),
      defaultValue: defaultValue,
    );
  }

  @override
  R accept<R>(OpenApiTypeVisitor<R> visitor) => visitor.visitDate(this);
}

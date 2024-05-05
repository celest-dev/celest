import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_visitor.dart';

part 'openapi_type_schema.g.dart';

/// The Schema Object allows the definition of input and output data types.
///
/// These types can be objects, but also primitives and arrays. This object is
/// a superset of the JSON Schema Specification Draft 2020-12.
///
/// For more information about the properties, see JSON Schema Core and JSON
/// Schema Validation.
///
/// Unless stated otherwise, the property definitions follow those of JSON
/// Schema and do not add any additional semantics. Where JSON Schema indicates
/// that behavior is defined by the application (e.g. for annotations), OAS
/// also defers the definition of semantics to the application consuming the
/// OpenAPI document.
///
/// https://spec.openapis.org/oas/v3.1.0#schema-object
@BuiltValue(instantiable: false)
sealed class OpenApiTypeSchema {
  String? get name;
  String? get ref;

  /// Adds support for polymorphism.
  ///
  /// The discriminator is an object name that is used to differentiate between
  /// other schemas which may satisfy the payload description.
  ///
  /// See Composition and Inheritance for more details.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#schema-object
  OpenApiDiscriminator? get discriminator;

  /// Both [title] and [description] can be used to decorate a user interface
  /// with information about the data produced by this user interface. A title
  /// will preferably be short, whereas a description will provide explanation
  /// about the purpose of the instance described by this schema.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-title-and-description
  String? get title;

  /// CommonMark syntax MAY be used for rich text representation.
  String? get description;

  /// Specifies that a schema is deprecated and SHOULD be transitioned out of usage.
  bool get isDeprecated;

  /// This keyword can be used to supply a default JSON value associated with a
  /// particular schema.
  ///
  /// It is RECOMMENDED that a default value be valid against the associated
  /// schema.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-default
  JsonObject? get defaultValue;

  /// If "readOnly" has a value of boolean true, it indicates that the value of
  /// the instance is managed exclusively by the owning authority, and attempts
  /// by an application to modify the value of this property are expected to be
  /// ignored or rejected by that owning authority.
  ///
  /// An instance document that is marked as "readOnly" for the entire document
  /// MAY be ignored if sent to the owning authority, or MAY result in an error,
  /// at the authority's discretion.
  ///
  /// These keywords can be used to assist in user interface instance
  /// generation. In particular, an application MAY choose to use a widget that
  /// hides input values as they are typed for write-only fields.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-readonly-and-writeonly
  bool get readOnly;

  /// If "writeOnly" has a value of boolean true, it indicates that the value is
  /// never present when the instance is retrieved from the owning authority. It
  /// can be present when sent to the owning authority to update or create the
  /// document (or the resource it represents), but it will not be included in
  /// any updated or newly created version of the instance.
  ///
  /// An instance document that is marked as "writeOnly" for the entire document
  /// MAY be returned as a blank document of some sort, or MAY produce an error
  /// upon retrieval, or have the retrieval request ignored, at the authority's
  /// discretion.
  ///
  /// For example, "readOnly" would be used to mark a database-generated serial
  /// number as read-only, while "writeOnly" would be used to mark a password
  /// input field.
  ///
  /// These keywords can be used to assist in user interface instance
  /// generation. In particular, an application MAY choose to use a widget that
  /// hides input values as they are typed for write-only fields.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-readonly-and-writeonly
  bool get writeOnly;

  /// The list of required properties, if any.
  ///
  /// The value of this keyword MUST be an array. Elements of this array, if
  /// any, MUST be strings, and MUST be unique.
  ///
  /// An object instance is valid against this keyword if every item in the
  /// array is the name of a property in the instance.
  ///
  /// Omitting this keyword has the same behavior as an empty array.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-required
  BuiltList<String> get required;
  BuiltMap<String, JsonObject> get extensions;

  OpenApiPrimitive? get primitiveType;

  /// Whether the type is nullable in the schema.
  bool? get isNullable;
  OpenApiTypeSchema withNullability(bool isNullable);

  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]);

  OpenApiTypeSchemaBuilder toBuilder();
  OpenApiTypeSchema rebuild(void Function(OpenApiTypeSchemaBuilder b) updates);
}

extension OpenApiTypeSchemaHelpers on OpenApiTypeSchema {
  bool get isNullableOrFalse => isNullable ?? false;
}

abstract mixin class OpenApiTypeSchemaBuilder {
  void replace(OpenApiTypeSchema other);
  void update(void Function(OpenApiTypeSchemaBuilder) updates);

  String? get name;
  set name(String? name);

  String? get ref;
  set ref(String? ref);

  OpenApiDiscriminatorBuilder get discriminator;
  set discriminator(OpenApiDiscriminatorBuilder? discriminator);

  String? get title;
  set title(String? title);

  String? get description;
  set description(String? description);

  bool? get isDeprecated;
  set isDeprecated(bool? isDeprecated);

  JsonObject? get defaultValue;
  set defaultValue(JsonObject? defaultValue);

  bool? get isNullable;
  set isNullable(bool? isNullable);

  bool? get readOnly;
  set readOnly(bool? readOnly);

  bool? get writeOnly;
  set writeOnly(bool? writeOnly);

  ListBuilder<String> get required;
  set required(ListBuilder<String> required);

  MapBuilder<String, JsonObject> get extensions;
  set extensions(MapBuilder<String, JsonObject> extensions);
}

abstract class OpenApiTypeSchemaReference
    implements
        Built<OpenApiTypeSchemaReference, OpenApiTypeSchemaReferenceBuilder>,
        OpenApiTypeSchema {
  factory OpenApiTypeSchemaReference({
    required String name,
    required String ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    bool? isNullable,
  }) {
    return _$OpenApiTypeSchemaReference._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      isNullable: isNullable,
    );
  }

  factory OpenApiTypeSchemaReference.build([
    void Function(OpenApiTypeSchemaReferenceBuilder) updates,
  ]) = _$OpenApiTypeSchemaReference;

  OpenApiTypeSchemaReference._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(OpenApiTypeSchemaReferenceBuilder b) {
    b.isDeprecated ??= false;
    b.readOnly ??= false;
    b.writeOnly ??= false;
  }

  @override
  String get name;

  @override
  String get ref;

  @override
  OpenApiTypeSchemaReference withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitReference(this, context);
}

abstract class OpenApiArrayTypeSchema
    implements
        Built<OpenApiArrayTypeSchema, OpenApiArrayTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiArrayTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    required OpenApiTypeSchema itemType,
    required bool uniqueItems,
    bool? isNullable,
  }) {
    return _$OpenApiArrayTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      itemType: itemType,
      uniqueItems: uniqueItems,
      isNullable: isNullable,
    );
  }

  factory OpenApiArrayTypeSchema.build([
    void Function(OpenApiArrayTypeSchemaBuilder b) updates,
  ]) = _$OpenApiArrayTypeSchema;

  OpenApiArrayTypeSchema._();

  bool get uniqueItems;

  String get rawType => 'array';

  @override
  OpenApiPrimitive? get primitiveType => null;

  /// The items schema for this array.
  OpenApiTypeSchema get itemType;

  @override
  OpenApiArrayTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitArray(this, context);
}

abstract class OpenApiBooleanTypeSchema
    implements
        Built<OpenApiBooleanTypeSchema, OpenApiBooleanTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiBooleanTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    bool? isNullable,
  }) {
    return _$OpenApiBooleanTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      isNullable: isNullable,
    );
  }

  factory OpenApiBooleanTypeSchema.build([
    void Function(OpenApiBooleanTypeSchemaBuilder b) updates,
  ]) = _$OpenApiBooleanTypeSchema;

  OpenApiBooleanTypeSchema._();

  String get rawType => 'boolean';

  @override
  OpenApiPrimitive? get primitiveType => OpenApiPrimitive.boolean;

  @override
  OpenApiBooleanTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitBoolean(this, context);
}

abstract class OpenApiIntegerTypeSchema
    implements
        Built<OpenApiIntegerTypeSchema, OpenApiIntegerTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiIntegerTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    String? format,
    bool? isNullable,
  }) {
    return _$OpenApiIntegerTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      format: format,
      isNullable: isNullable,
    );
  }

  factory OpenApiIntegerTypeSchema.build([
    void Function(OpenApiIntegerTypeSchemaBuilder b) updates,
  ]) = _$OpenApiIntegerTypeSchema;

  OpenApiIntegerTypeSchema._();

  String get rawType => 'integer';

  /// The format of the integer.
  String? get format;

  @override
  OpenApiPrimitive? get primitiveType => OpenApiPrimitive.integer;

  @override
  OpenApiIntegerTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitInteger(this, context);
}

abstract class OpenApiNumberTypeSchema
    implements
        Built<OpenApiNumberTypeSchema, OpenApiNumberTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiNumberTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    String? format,
    bool? isNullable,
  }) {
    return _$OpenApiNumberTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      format: format,
      isNullable: isNullable,
    );
  }

  factory OpenApiNumberTypeSchema.build([
    void Function(OpenApiNumberTypeSchemaBuilder b) updates,
  ]) = _$OpenApiNumberTypeSchema;

  OpenApiNumberTypeSchema._();

  /// The format of the number.
  String? get format;

  String get rawType => 'number';

  @override
  OpenApiPrimitive? get primitiveType => OpenApiPrimitive.number;

  @override
  OpenApiNumberTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitNumber(this, context);
}

abstract class OpenApiStringTypeSchema
    implements
        Built<OpenApiStringTypeSchema, OpenApiStringTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiStringTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    String? format,
    bool? isNullable,
  }) {
    return _$OpenApiStringTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      format: format,
      isNullable: isNullable,
    );
  }

  factory OpenApiStringTypeSchema.build([
    void Function(OpenApiStringTypeSchemaBuilder b) updates,
  ]) = _$OpenApiStringTypeSchema;

  OpenApiStringTypeSchema._();

  /// The format of the string.
  String? get format;

  String get rawType => 'string';

  @override
  OpenApiPrimitive? get primitiveType => OpenApiPrimitive.string;

  @override
  OpenApiStringTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitString(this, context);
}

abstract class OpenApiEmptyTypeSchema
    implements
        Built<OpenApiEmptyTypeSchema, OpenApiEmptyTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiEmptyTypeSchema.build([
    void Function(OpenApiEmptyTypeSchemaBuilder b) updates,
  ]) = _$OpenApiEmptyTypeSchema;

  OpenApiEmptyTypeSchema._();

  static final OpenApiEmptyTypeSchema instance = _$OpenApiEmptyTypeSchema._(
    isDeprecated: false,
    readOnly: false,
    writeOnly: false,
    required: BuiltList(),
    extensions: BuiltMap(),
  );

  String get rawType => 'never';

  @override
  OpenApiPrimitive? get primitiveType => null;

  @override
  OpenApiEmptyTypeSchema withNullability(bool isNullable) {
    assert(false);
    return this;
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitEmpty(this, context);
}

/// An anonymous bag of properties.
abstract class OpenApiRecordTypeSchema
    implements
        Built<OpenApiRecordTypeSchema, OpenApiRecordTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiRecordTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    required OpenApiTypeSchema valueType,
    bool? isNullable,
  }) {
    return _$OpenApiRecordTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      valueType: valueType,
      isNullable: isNullable,
    );
  }

  factory OpenApiRecordTypeSchema.build([
    void Function(OpenApiRecordTypeSchemaBuilder b) updates,
  ]) = _$OpenApiRecordTypeSchema;

  OpenApiRecordTypeSchema._();

  /// The type of values in the record.
  OpenApiTypeSchema get valueType;

  String get rawType => 'object';

  @override
  OpenApiPrimitive? get primitiveType => null;

  @override
  OpenApiRecordTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitRecord(this, context);
}

abstract class OpenApiFieldSchema
    implements Built<OpenApiFieldSchema, OpenApiFieldSchemaBuilder> {
  factory OpenApiFieldSchema({
    required String name,
    required OpenApiTypeSchema schema,
  }) {
    return _$OpenApiFieldSchema._(
      name: name,
      schema: schema,
    );
  }

  factory OpenApiFieldSchema.build([
    void Function(OpenApiFieldSchemaBuilder b) updates,
  ]) = _$OpenApiFieldSchema;

  OpenApiFieldSchema._();

  String get name;
  OpenApiTypeSchema get schema;
}

/// Unlike an [OpenApiRecordTypeSchema], struct types have identity and a unique
/// [name].
abstract class OpenApiStructTypeSchema
    implements
        Built<OpenApiStructTypeSchema, OpenApiStructTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiStructTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    required Map<String, OpenApiFieldSchema> fields,
    bool? isNullable,
  }) {
    return _$OpenApiStructTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      fields: fields.build(),
      isNullable: isNullable,
    );
  }

  factory OpenApiStructTypeSchema.build([
    void Function(OpenApiStructTypeSchemaBuilder b) updates,
  ]) = _$OpenApiStructTypeSchema;

  OpenApiStructTypeSchema._();

  /// The name of this struct, if it has identity.
  ///
  /// If name is null, this is an anonymous/inline struct and codegen is
  /// responsible for assigning a name based on the context of its usage.
  @override
  String? get name;

  /// The list of required fields, if any.
  @override
  BuiltList<String> get required;

  /// The properties for this struct.
  BuiltMap<String, OpenApiFieldSchema> get fields;

  @override
  OpenApiDiscriminator? get discriminator;

  String get rawType => 'object';

  @override
  OpenApiPrimitive? get primitiveType => null;

  @override
  OpenApiStructTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitStruct(this, context);
}

abstract class OpenApiNullTypeSchema
    implements
        Built<OpenApiNullTypeSchema, OpenApiNullTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiNullTypeSchema.build([
    void Function(OpenApiNullTypeSchemaBuilder b) updates,
  ]) = _$OpenApiNullTypeSchema;

  OpenApiNullTypeSchema._();

  static final OpenApiNullTypeSchema instance = _$OpenApiNullTypeSchema._(
    isNullable: true,
    isDeprecated: false,
    readOnly: false,
    writeOnly: false,
    required: BuiltList(),
    extensions: BuiltMap(),
  );

  String get rawType => 'null';

  @override
  OpenApiPrimitive get primitiveType => OpenApiPrimitive.null$;

  @override
  OpenApiNullTypeSchema withNullability(bool isNullable) {
    if (!isNullable) {
      throw StateError('Cannot have a non-nullable Null type');
    }
    return this;
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitNull(this, context);
}

abstract class OpenApiSingleValueTypeSchema
    implements
        Built<OpenApiSingleValueTypeSchema,
            OpenApiSingleValueTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiSingleValueTypeSchema({
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    required OpenApiTypeSchema baseType,
    required JsonObject value,
    bool? isNullable,
  }) {
    return _$OpenApiSingleValueTypeSchema._(
      name: null,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      baseType: baseType,
      value: value,
      isNullable: isNullable,
    );
  }

  factory OpenApiSingleValueTypeSchema.build([
    void Function(OpenApiSingleValueTypeSchemaBuilder b) updates,
  ]) = _$OpenApiSingleValueTypeSchema;

  OpenApiSingleValueTypeSchema._();

  /// The type of [value].
  OpenApiTypeSchema get baseType;

  /// The single value for this type.
  JsonObject get value;

  @override
  OpenApiPrimitive? get primitiveType => baseType.primitiveType;

  @override
  OpenApiSingleValueTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitSingleValue(this, context);
}

abstract class OpenApiEnumTypeSchema
    implements
        Built<OpenApiEnumTypeSchema, OpenApiEnumTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiEnumTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    required OpenApiTypeSchema baseType,
    required Iterable<JsonObject> values,
    bool? isNullable,
  }) {
    return _$OpenApiEnumTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      baseType: baseType,
      values: values.toBuiltList(),
      isNullable: isNullable,
    );
  }

  factory OpenApiEnumTypeSchema.build([
    void Function(OpenApiEnumTypeSchemaBuilder b) updates,
  ]) = _$OpenApiEnumTypeSchema;

  OpenApiEnumTypeSchema._();

  /// The enum type.
  OpenApiTypeSchema get baseType;

  /// The values for this enum.
  BuiltList<JsonObject> get values;

  @override
  OpenApiPrimitive? get primitiveType => baseType.primitiveType;

  @override
  OpenApiEnumTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitEnum(this, context);
}

abstract class OpenApiSumTypeSchema
    implements
        Built<OpenApiSumTypeSchema, OpenApiSumTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiSumTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    required List<OpenApiTypeSchema> types,
    bool? isNullable,
  }) {
    return _$OpenApiSumTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      types: types.build(),
      isNullable: isNullable,
    );
  }

  factory OpenApiSumTypeSchema.build([
    void Function(OpenApiSumTypeSchemaBuilder b) updates,
  ]) = _$OpenApiSumTypeSchema;

  OpenApiSumTypeSchema._();

  @override
  OpenApiDiscriminator? get discriminator;

  /// The types in this set.
  BuiltList<OpenApiTypeSchema> get types;

  String get rawType => 'anyOf';

  @override
  OpenApiSumTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitSum(this, context);
}

abstract class OpenApiDisjointUnionTypeSchema
    implements
        Built<OpenApiDisjointUnionTypeSchema,
            OpenApiDisjointUnionTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiDisjointUnionTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    required List<OpenApiTypeSchema> types,
    bool? isNullable,
  }) {
    return _$OpenApiDisjointUnionTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      types: types.build(),
      isNullable: isNullable,
    );
  }

  factory OpenApiDisjointUnionTypeSchema.build([
    void Function(OpenApiDisjointUnionTypeSchemaBuilder b) updates,
  ]) = _$OpenApiDisjointUnionTypeSchema;

  OpenApiDisjointUnionTypeSchema._();

  /// The types in this set.
  BuiltList<OpenApiTypeSchema> get types;

  @override
  OpenApiDiscriminator? get discriminator;

  String get rawType => 'oneOf';

  @override
  OpenApiDisjointUnionTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitDisjointUnion(this, context);
}

abstract class OpenApiAnyTypeSchema
    implements
        Built<OpenApiAnyTypeSchema, OpenApiAnyTypeSchemaBuilder>,
        OpenApiTypeSchema {
  factory OpenApiAnyTypeSchema({
    String? name,
    String? ref,
    OpenApiDiscriminator? discriminator,
    String? title,
    String? description,
    bool isDeprecated = false,
    bool readOnly = false,
    bool writeOnly = false,
    JsonObject? defaultValue,
    Iterable<String> required = const [],
    Map<String, JsonObject> extensions = const {},
    bool? isNullable,
  }) {
    return _$OpenApiAnyTypeSchema._(
      name: name,
      ref: ref,
      discriminator: discriminator,
      title: title,
      description: description,
      isDeprecated: isDeprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      defaultValue: defaultValue,
      required: required.toBuiltList(),
      extensions: extensions.build(),
      isNullable: isNullable,
    );
  }

  factory OpenApiAnyTypeSchema.build([
    void Function(OpenApiAnyTypeSchemaBuilder b) updates,
  ]) = _$OpenApiAnyTypeSchema;

  OpenApiAnyTypeSchema._();

  String get rawType => 'any';

  @override
  OpenApiPrimitive? get primitiveType => null;

  @override
  OpenApiAnyTypeSchema withNullability(bool isNullable) {
    return rebuild((b) => b..isNullable = isNullable);
  }

  @override
  R accept<R, C>(OpenApiTypeSchemaVisitor<R, C> visitor, [C? context]) =>
      visitor.visitAny(this, context);
}

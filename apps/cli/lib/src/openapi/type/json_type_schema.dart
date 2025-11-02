// ignore_for_file: avoid_positional_boolean_parameters

import 'package:celest_cli/src/openapi/type/json_type_format.spec.dart';

/// A structural specification of a JSON type.
///
/// This class and all its subtypes should be identifiable based on its structure
/// alone which allows for efficient linking later. No non-structural metadata
/// should be included in the type schema.
sealed class JsonTypeSchema {
  const JsonTypeSchema({
    required bool? isNullable,
    Map<String, Object?>? extensions,
  })  : isNullable = isNullable ?? false,
        extensions = extensions ?? const {};

  final bool isNullable;
  final Map<String, Object?> extensions;

  JsonTypeSchema withNullability(bool isNullable);
}

final class JsonBooleanType extends JsonTypeSchema {
  const JsonBooleanType({
    required super.isNullable,
    super.extensions,
  });

  @override
  JsonBooleanType withNullability(bool isNullable) {
    return JsonBooleanType(
      isNullable: isNullable,
      extensions: extensions,
    );
  }
}

final class JsonIntegerType extends JsonTypeSchema {
  const JsonIntegerType({
    required super.isNullable,
    this.format,
    super.extensions,
  });

  final JsonTypeFormat? format;

  @override
  JsonIntegerType withNullability(bool isNullable) {
    return JsonIntegerType(
      isNullable: isNullable,
      format: format,
      extensions: extensions,
    );
  }
}

final class JsonNumberType extends JsonTypeSchema {
  const JsonNumberType({
    required super.isNullable,
    this.format,
    super.extensions,
  });

  final JsonTypeFormat? format;

  @override
  JsonNumberType withNullability(bool isNullable) {
    return JsonNumberType(
      isNullable: isNullable,
      format: format,
      extensions: extensions,
    );
  }
}

final class JsonStringType extends JsonTypeSchema {
  const JsonStringType({
    required super.isNullable,
    this.format,
    super.extensions,
  });

  final JsonTypeFormat? format;

  @override
  JsonStringType withNullability(bool isNullable) {
    return JsonStringType(
      isNullable: isNullable,
      format: format,
      extensions: extensions,
    );
  }
}

final class JsonNullType extends JsonTypeSchema {
  const JsonNullType._() : super(isNullable: true);

  static const JsonNullType instance = JsonNullType._();

  @override
  JsonNullType withNullability(bool isNullable) {
    // always nullable
    return this;
  }
}

// additionalProperties = false
final class JsonEmptyType extends JsonTypeSchema {
  const JsonEmptyType._() : super(isNullable: false);

  static const JsonEmptyType instance = JsonEmptyType._();

  @override
  JsonEmptyType withNullability(bool isNullable) {
    // always non-nullable
    return this;
  }
}

// additionalProperties = true
final class JsonAnyType extends JsonTypeSchema {
  const JsonAnyType._() : super(isNullable: true);

  static const JsonAnyType instance = JsonAnyType._();

  @override
  JsonAnyType withNullability(bool isNullable) {
    // always nullable
    return this;
  }
}

// properties is! empty
// presence of additional properties will create a colocated [JsonRecordType]... or make the class implement Map
final class JsonObjectType extends JsonTypeSchema {
  const JsonObjectType({
    required super.isNullable,
    required this.required,
    required this.properties,
    required this.additionalProperties,
    super.extensions,
  });

  final Set<String> required;
  final Map<String, JsonTypeSchema> properties;
  final JsonTypeSchema? additionalProperties;

  @override
  JsonObjectType withNullability(bool isNullable) {
    return JsonObjectType(
      isNullable: isNullable,
      properties: properties,
      additionalProperties: additionalProperties,
      required: required,
      extensions: extensions,
    );
  }
}

// properties is empty
// addiitonalProperties is! empty
final class JsonRecordType extends JsonTypeSchema {
  const JsonRecordType({
    required super.isNullable,
    required this.additionalProperties,
    super.extensions,
  });

  final JsonTypeSchema additionalProperties;

  @override
  JsonRecordType withNullability(bool isNullable) {
    return JsonRecordType(
      isNullable: isNullable,
      additionalProperties: additionalProperties,
      extensions: extensions,
    );
  }
}

final class JsonArrayType extends JsonTypeSchema {
  const JsonArrayType({
    required super.isNullable,
    required this.items,
    required this.uniqueItems,
    super.extensions,
  });

  final JsonTypeSchema items;
  final bool uniqueItems;

  @override
  JsonArrayType withNullability(bool isNullable) {
    return JsonArrayType(
      isNullable: isNullable,
      items: items,
      uniqueItems: uniqueItems,
      extensions: extensions,
    );
  }
}

final class JsonSingleValueType extends JsonTypeSchema {
  JsonSingleValueType({
    required this.value,
    required this.type,
    super.extensions,
  }) : super(isNullable: type.isNullable);

  final Object? value; // TODO(dnys1): dartgen constant value?
  final JsonTypeSchema type;

  @override
  JsonSingleValueType withNullability(bool isNullable) {
    return JsonSingleValueType(
      value: value, // assert conforms
      type: type.withNullability(isNullable),
      extensions: extensions,
    );
  }
}

final class JsonEnumType extends JsonTypeSchema {
  JsonEnumType({
    required super.isNullable,
    required this.values,
    super.extensions,
  }) : assert(values.isNotEmpty, 'Must have at least one value');

  final List<String?> values;

  @override
  JsonEnumType withNullability(bool isNullable) {
    return JsonEnumType(
      isNullable: isNullable,
      values: values,
      extensions: extensions,
    );
  }
}

// anyOf
final class JsonSumType extends JsonTypeSchema {
  JsonSumType({
    required super.isNullable,
    required this.types,
    super.extensions,
  }) : assert(types.isNotEmpty, 'Must have at least one type');

  final List<JsonTypeSchema> types;

  @override
  JsonSumType withNullability(bool isNullable) {
    return JsonSumType(
      isNullable: isNullable,
      types: types,
      extensions: extensions,
    );
  }
}

// allOf
final class JsonProductType extends JsonTypeSchema {
  JsonProductType({
    required super.isNullable,
    required this.types,
    super.extensions,
  }) : assert(types.isNotEmpty, 'Must have at least one type');

  final List<JsonTypeSchema> types;

  @override
  JsonProductType withNullability(bool isNullable) {
    return JsonProductType(
      isNullable: isNullable,
      types: types,
      extensions: extensions,
    );
  }
}

// oneOf
final class JsonSealedType extends JsonTypeSchema {
  JsonSealedType({
    required super.isNullable,
    required this.types,
    super.extensions,
  }) : assert(types.isNotEmpty, 'Must have at least one type');

  final List<JsonTypeSchema> types;

  @override
  JsonSealedType withNullability(bool isNullable) {
    return JsonSealedType(
      isNullable: isNullable,
      types: types,
      extensions: extensions,
    );
  }
}

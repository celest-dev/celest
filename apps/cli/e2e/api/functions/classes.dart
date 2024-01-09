/// Tests that classes with and without explicit fromJson/toJson methods are
/// serializable and deserializable.
library;

class EmptySuper {}

class Empty extends EmptySuper {}

Empty empty(Empty value) => value;
Future<Empty> asyncEmpty(Empty value) async => value;

class SuperFields {
  SuperFields(this.superField);

  final String superField;
}

class Fields extends SuperFields {
  Fields(super.superField, this.field);

  final String field;
}

class NamedFields extends SuperFields {
  NamedFields({
    required String superField,
    required this.field,
  }) : super(superField);

  final String field;
}

class MixedFields extends SuperFields {
  MixedFields(
    super.superField, {
    required this.field,
  });

  final String field;
}

Fields fields(Fields value) => value;
Future<Fields> asyncFields(Fields value) async => value;

Fields? nullableFields(Fields? value) => value;
Future<Fields?> asyncNullableFields(Fields? value) async => value;

NamedFields namedFields(NamedFields value) => value;
Future<NamedFields> asyncNamedFields(NamedFields value) async => value;

MixedFields mixedFields(MixedFields value) => value;
Future<MixedFields> asyncMixedFields(MixedFields value) async => value;

class DefaultValues {
  DefaultValues({
    this.field = 'default',
    this.nullableField,
    this.nullableFieldWithDefault = 'default',
  });

  final String field;
  final String? nullableField;
  final String? nullableFieldWithDefault;
  final String fieldWithoutInitializer = 'default';
}

DefaultValues defaultValues(DefaultValues value) => value;
Future<DefaultValues> asyncDefaultValues(DefaultValues value) async => value;

class NestedClass {
  NestedClass(
    this.fields,
    this.nullableFields,
  );

  final Fields fields;
  final Fields? nullableFields;
}

NestedClass nestedClass(NestedClass value) => value;
Future<NestedClass> asyncNestedClass(NestedClass value) async => value;

class OnlyFromJson {
  OnlyFromJson.fromJson(Map<String, Object?> json)
      : field = json['field'] as String;

  final String field;
}

class OnlyToJson {
  OnlyToJson(this.field);

  final String field;

  Map<String, Object?> toJson() => {
        'field': field,
      };
}

class OnlyToJsonWithDefaults {
  OnlyToJsonWithDefaults([this.field = 'default']);

  final String field;
  final String anotherField = 'default';

  Map<String, Object?> toJson() => {
        'field': field,
      };
}

class FromJsonAndToJson {
  FromJsonAndToJson.fromJson(Map<String, Object?> json)
      : field = json['field'] as String;

  final String field;

  Map<String, Object?> toJson() => {
        'field': field,
      };
}

class NonMapToJson {
  NonMapToJson(this.field);

  final String field;

  String toJson() => field;
}

class NonMapToJsonWithDefaults {
  NonMapToJsonWithDefaults([this.field = 'default']);

  final String field;
  final String anotherField = 'default';

  String toJson() => field;
}

class NonMapFromAndToJson {
  NonMapFromAndToJson.fromJson(this.field);

  final String field;

  String toJson() => field;
}

OnlyFromJson onlyFromJson(OnlyFromJson value) => value;
Future<OnlyFromJson> asyncOnlyFromJson(OnlyFromJson value) async => value;

OnlyToJson onlyToJson(OnlyToJson value) => value;
Future<OnlyToJson> asyncOnlyToJson(OnlyToJson value) async => value;

OnlyToJsonWithDefaults onlyToJsonWithDefaults(
  OnlyToJsonWithDefaults value,
) =>
    value;
Future<OnlyToJsonWithDefaults> asyncOnlyToJsonWithDefaults(
  OnlyToJsonWithDefaults value,
) async =>
    value;

FromJsonAndToJson fromAndToJson(FromJsonAndToJson value) => value;
Future<FromJsonAndToJson> asyncFromAndToJson(
  FromJsonAndToJson value,
) async =>
    value;

NonMapToJson nonMapToJson(NonMapToJson value) => value;
Future<NonMapToJson> asyncNonMapToJson(NonMapToJson value) async => value;

NonMapToJsonWithDefaults nonMapToJsonWithDefaults(
  NonMapToJsonWithDefaults value,
) =>
    value;
Future<NonMapToJsonWithDefaults> asyncNonMapToJsonWithDefaults(
  NonMapToJsonWithDefaults value,
) async =>
    value;

NonMapFromAndToJson nonMapFromAndToJson(
  NonMapFromAndToJson value,
) =>
    value;
Future<NonMapFromAndToJson> asyncNonMapFromAndToJson(
  NonMapFromAndToJson value,
) async =>
    value;

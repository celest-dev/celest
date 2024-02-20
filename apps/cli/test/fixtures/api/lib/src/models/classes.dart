class EmptySuper {}

class Empty extends EmptySuper {}

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

class NestedClass {
  NestedClass(
    this.fields,
    this.nullableFields,
  );

  final Fields fields;
  final Fields? nullableFields;
}

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

class FromJsonStatic {
  const FromJsonStatic(this.field);

  static FromJsonStatic fromJson(String field) => FromJsonStatic(field);

  final String field;

  String toJson() => field;
}

/// Tests that classes without explicit fromJson/toJson methods are serializable
/// and deserializable.
library;

class EmptySuper {}

class Empty extends EmptySuper {}

EmptySuper emptySuper(EmptySuper value) => value;
Empty empty(Empty value) => value;

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

SuperFields superFields(SuperFields value) => value;
Fields fields(Fields value) => value;
NamedFields namedFields(NamedFields value) => value;
MixedFields mixedFields(MixedFields value) => value;

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

/// Tests that classes without explicit fromJson/toJson methods are serializable
/// and deserializable.
library;

class EmptySuper {}

class Empty extends EmptySuper {}

EmptySuper emptySuper(EmptySuper value) => value;
Future<EmptySuper> asyncEmptySuper(EmptySuper value) async => value;

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

SuperFields superFields(SuperFields value) => value;
Future<SuperFields> asyncSuperFields(SuperFields value) async => value;

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
  NestedClass(this.fields);

  final Fields fields;
}

NestedClass nestedClass(NestedClass value) => value;
Future<NestedClass> asyncNestedClass(NestedClass value) async => value;

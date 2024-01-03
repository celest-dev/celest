/// Tests that records with and without aliases are serializable and
/// deserializable.
library;

typedef PositionalFields = (
  String field,
  String anotherField,
);

(String field, String anotherField) nonAliasedPositionalFields(
  (String field, String anotherField) value,
) =>
    value;
Future<(String field, String anotherField)> asyncNonAliasedPositionalFields(
  (String field, String anotherField) value,
) async =>
    value;

PositionalFields aliasedPositionalFields(PositionalFields value) => value;
Future<PositionalFields> asyncAliasedPositionalFields(
  PositionalFields value,
) async =>
    value;

(
  (String field, String anotherField) nonAliased,
  PositionalFields aliased,
) positionalFields(
  (String field, String anotherField) nonAliased,
  PositionalFields aliased,
) =>
    (nonAliased, aliased);
Future<
    (
      (String field, String anotherField) nonAliased,
      PositionalFields aliased,
    )> asyncPositionalFields(
  (String field, String anotherField) nonAliased,
  PositionalFields aliased,
) async =>
    (nonAliased, aliased);

typedef NamedFields = ({
  String field,
  String anotherField,
});

({
  String field,
  String anotherField,
}) nonAliasedNamedFields({
  required ({
    String field,
    String anotherField,
  }) value,
}) =>
    value;
Future<
    ({
      String field,
      String anotherField,
    })> asyncNonAliasedNamedFields({
  required ({
    String field,
    String anotherField,
  }) value,
}) async =>
    value;

NamedFields aliasedNamedFields({
  required NamedFields value,
}) =>
    value;
Future<NamedFields> asyncAliasedNamedFields({
  required NamedFields value,
}) async =>
    value;

({
  ({
    String field,
    String anotherField,
  }) nonAliased,
  NamedFields aliased,
}) namedFields({
  required ({
    String field,
    String anotherField,
  }) nonAliased,
  required NamedFields aliased,
}) =>
    (
      nonAliased: nonAliased,
      aliased: aliased,
    );
Future<
    ({
      ({
        String field,
        String anotherField,
      }) nonAliased,
      NamedFields aliased,
    })> asyncNamedFields({
  required ({
    String field,
    String anotherField,
  }) nonAliased,
  required NamedFields aliased,
}) async =>
    (
      nonAliased: nonAliased,
      aliased: aliased,
    );

typedef MixedFields = (
  String field, {
  String anotherField,
});

MixedFields aliasedMixedFields(MixedFields value) => value;
Future<MixedFields> asyncAliasedMixedFields(MixedFields value) async => value;

(String field, {String anotherField}) nonAliasedMixedFields(
  MixedFields value,
) =>
    value;
Future<(String field, {String anotherField})> asyncNonAliasedMixedFields(
  MixedFields value,
) async =>
    value;

(
  (
    String field, {
    String anotherField,
  }) nonAliased, {
  MixedFields aliased,
}) mixedFields(
  (
    String field, {
    String anotherField,
  }) nonAliased, {
  required MixedFields aliased,
}) =>
    (nonAliased, aliased: aliased);
Future<
    (
      (
        String field, {
        String anotherField,
      }) nonAliased, {
      MixedFields aliased,
    })> asyncMixedFields(
  (
    String field, {
    String anotherField,
  }) nonAliased, {
  required MixedFields aliased,
}) async =>
    (nonAliased, aliased: aliased);

typedef Nested = (PositionalFields fields, {NamedFields namedFields});

Nested nested(Nested value) => value;
Future<Nested> asyncNested(Nested value) async => value;

typedef NullableNested = (PositionalFields? fields, {NamedFields? namedFields});

NullableNested? nullableNested(NullableNested? value) => value;
Future<NullableNested?> asyncNullableNested(NullableNested? value) async =>
    value;

// TODO(dnys1): https://github.com/dart-lang/sdk/issues/54346

// typedef AliasedNullable = (
//   String field,
//   String? nullableField, {
//   String anotherField,
//   String? anotherNullableField,
// })?;

// AliasedNullable aliasedNullable(AliasedNullable value) => value;
// Future<AliasedNullable> asyncAliasedNullable(AliasedNullable value) async =>
//     value;

// (
//   String field,
//   String? nullableField, {
//   String anotherField,
//   String? anotherNullableField,
// })? nonAliasedNullable(
//   (
//     String field,
//     String? nullableField, {
//     String anotherField,
//     String? anotherNullableField,
//   })? value,
// ) =>
//     value;
// Future<
//     (
//       String field,
//       String? nullableField, {
//       String anotherField,
//       String? anotherNullableField,
//     })?> asyncNonAliasedNullable(
//   (
//     String field,
//     String? nullableField, {
//     String anotherField,
//     String? anotherNullableField,
//   })? value,
// ) async =>
//     value;

// TODO(dnys1): Generics
void _generics() {}

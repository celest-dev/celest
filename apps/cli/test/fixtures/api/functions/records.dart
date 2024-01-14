/// Tests that records with and without aliases are serializable and
/// deserializable.
library;

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

typedef Nested = ({NamedFields namedFields});

Nested nested(Nested value) => value;
Future<Nested> asyncNested(Nested value) async => value;

typedef NullableNested = ({NamedFields? namedFields});

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

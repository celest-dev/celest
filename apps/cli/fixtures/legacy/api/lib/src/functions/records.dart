/// Tests that records with and without aliases are serializable and
/// deserializable.
library;

import 'package:celest/celest.dart';
import 'package:celest_backend/models/records.dart';

@cloud
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
@cloud
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

@cloud
NamedFieldsRecord aliasedNamedFields({
  required NamedFieldsRecord value,
}) =>
    value;
@cloud
Future<NamedFieldsRecord> asyncAliasedNamedFields({
  required NamedFieldsRecord value,
}) async =>
    value;

@cloud
({
  ({
    String field,
    String anotherField,
  }) nonAliased,
  NamedFieldsRecord aliased,
}) namedFields({
  required ({
    String field,
    String anotherField,
  }) nonAliased,
  required NamedFieldsRecord aliased,
}) =>
    (
      nonAliased: nonAliased,
      aliased: aliased,
    );
@cloud
Future<
    ({
      ({
        String field,
        String anotherField,
      }) nonAliased,
      NamedFieldsRecord aliased,
    })> asyncNamedFields({
  required ({
    String field,
    String anotherField,
  }) nonAliased,
  required NamedFieldsRecord aliased,
}) async =>
    (
      nonAliased: nonAliased,
      aliased: aliased,
    );

@cloud
Nested nested(Nested value) => value;
@cloud
Future<Nested> asyncNested(Nested value) async => value;

@cloud
NullableNested? nullableNested(NullableNested? value) => value;
@cloud
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

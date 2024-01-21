/// Tests that classes with and without explicit fromJson/toJson methods are
/// serializable and deserializable.
library;

import 'package:api/models.dart';

Empty empty(Empty value) => value;
Future<Empty> asyncEmpty(Empty value) async => value;

Fields fields(Fields value) => value;
Future<Fields> asyncFields(Fields value) async => value;

Fields? nullableFields(Fields? value) => value;
Future<Fields?> asyncNullableFields(Fields? value) async => value;

NamedFields namedFields(NamedFields value) => value;
Future<NamedFields> asyncNamedFields(NamedFields value) async => value;

MixedFields mixedFields(MixedFields value) => value;
Future<MixedFields> asyncMixedFields(MixedFields value) async => value;

DefaultValues defaultValues(DefaultValues value) => value;
Future<DefaultValues> asyncDefaultValues(DefaultValues value) async => value;

NestedClass nestedClass(NestedClass value) => value;
Future<NestedClass> asyncNestedClass(NestedClass value) async => value;

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

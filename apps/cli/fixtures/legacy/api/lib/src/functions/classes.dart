/// Tests that classes with and without explicit fromJson/toJson methods are
/// serializable and deserializable.
library;

import 'package:celest/celest.dart';
import 'package:celest_backend/models/classes.dart';

@cloud
Empty empty(Empty value) => value;
@cloud
Future<Empty> asyncEmpty(Empty value) async => value;

@cloud
Fields fields(Fields value) => value;
@cloud
Future<Fields> asyncFields(Fields value) async => value;

@cloud
Fields? nullableFields(Fields? value) => value;
@cloud
Future<Fields?> asyncNullableFields(Fields? value) async => value;

@cloud
NamedFields namedFields(NamedFields value) => value;
@cloud
Future<NamedFields> asyncNamedFields(NamedFields value) async => value;

@cloud
MixedFields mixedFields(MixedFields value) => value;
@cloud
Future<MixedFields> asyncMixedFields(MixedFields value) async => value;

@cloud
DefaultValues defaultValues(DefaultValues value) => value;
@cloud
Future<DefaultValues> asyncDefaultValues(DefaultValues value) async => value;

@cloud
NestedClass nestedClass(NestedClass value) => value;
@cloud
Future<NestedClass> asyncNestedClass(NestedClass value) async => value;

@cloud
OnlyFromJson onlyFromJson(OnlyFromJson value) => value;
@cloud
Future<OnlyFromJson> asyncOnlyFromJson(OnlyFromJson value) async => value;

@cloud
OnlyToJson onlyToJson(OnlyToJson value) => value;
@cloud
Future<OnlyToJson> asyncOnlyToJson(OnlyToJson value) async => value;

@cloud
OnlyToJsonWithDefaults onlyToJsonWithDefaults(
  OnlyToJsonWithDefaults value,
) =>
    value;
@cloud
Future<OnlyToJsonWithDefaults> asyncOnlyToJsonWithDefaults(
  OnlyToJsonWithDefaults value,
) async =>
    value;

@cloud
FromJsonAndToJson fromAndToJson(FromJsonAndToJson value) => value;
@cloud
Future<FromJsonAndToJson> asyncFromAndToJson(
  FromJsonAndToJson value,
) async =>
    value;

@cloud
NonMapToJson nonMapToJson(NonMapToJson value) => value;
@cloud
Future<NonMapToJson> asyncNonMapToJson(NonMapToJson value) async => value;

@cloud
NonMapToJsonWithDefaults nonMapToJsonWithDefaults(
  NonMapToJsonWithDefaults value,
) =>
    value;
@cloud
Future<NonMapToJsonWithDefaults> asyncNonMapToJsonWithDefaults(
  NonMapToJsonWithDefaults value,
) async =>
    value;

@cloud
NonMapFromAndToJson nonMapFromAndToJson(
  NonMapFromAndToJson value,
) =>
    value;
@cloud
Future<NonMapFromAndToJson> asyncNonMapFromAndToJson(
  NonMapFromAndToJson value,
) async =>
    value;

@cloud
FromJsonStatic fromJsonStatic(FromJsonStatic value) => value;

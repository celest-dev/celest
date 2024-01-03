import 'package:celest/celest.dart';

Future<void> optionalPositional(
  FunctionContext context, [
  String? optionalString,
  int? optionalInt,
]) async {}

Future<void> optionalNamed(
  FunctionContext context, {
  String? namedString,
  int? namedInt,
}) async {}

Future<void> requiredPositional(
  FunctionContext context,
  String requiredString,
  int requiredInt,
) async {}

Future<void> requiredNamed(
  FunctionContext context, {
  required String requiredString,
  required int requiredInt,
}) async {}

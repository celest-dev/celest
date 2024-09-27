import 'package:celest/celest.dart';
@cloud
Future<void> optionalPositional([
  String? optionalString,
  int? optionalInt,
]) async {}

@cloud
Future<void> optionalNamed({
  String? namedString,
  int? namedInt,
}) async {}

@cloud
Future<void> requiredPositional(
  String requiredString,
  int requiredInt,
) async {}

@cloud
Future<void> requiredNamed({
  required String requiredString,
  required int requiredInt,
}) async {}

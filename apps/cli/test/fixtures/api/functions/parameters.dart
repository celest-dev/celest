Future<void> optionalPositional([
  String? optionalString,
  int? optionalInt,
]) async {}

Future<void> optionalNamed({
  String? namedString,
  int? namedInt,
}) async {}

Future<void> requiredPositional(
  String requiredString,
  int requiredInt,
) async {}

Future<void> requiredNamed({
  required String requiredString,
  required int requiredInt,
}) async {}

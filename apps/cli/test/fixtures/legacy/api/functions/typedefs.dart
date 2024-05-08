/// Checks that typedefs work as expected.
library;

import 'package:celest_backend/models/typedefs.dart';

// Repro of https://github.com/celest-dev/celest/issues/53
Future<Portfolio> portfolio(Portfolio portfolio) async => portfolio;
Future<Json> json(Json json) async => json;
Future<Json?> nullableJson(Json? json) async => json;
Future<Json?> mixedJson(Json json) async => json;

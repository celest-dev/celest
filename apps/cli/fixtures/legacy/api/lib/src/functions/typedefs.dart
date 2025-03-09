/// Checks that typedefs work as expected.
library;

import 'package:celest/celest.dart';
import 'package:celest_backend/models/typedefs.dart';

// Repro of https://github.com/celest-dev/celest/issues/53
@cloud
Future<Portfolio> portfolio(Portfolio portfolio) async => portfolio;
@cloud
Future<Json> json(Json json) async => json;
@cloud
Future<Json?> nullableJson(Json? json) async => json;
@cloud
Future<Json?> mixedJson(Json json) async => json;

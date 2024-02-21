/// Tests that collections (e.g. Lists/Maps) can be used as parameter and
/// return types.
library;

import 'package:celest_backend/models.dart';

Future<List<String>> simpleList(List<String> list) async => list;
Future<List<SimpleClass>> complexList(List<SimpleClass> list) async => list;

Future<Map<String, String>> simpleMap(Map<String, String> map) async => map;
Future<Map<String, dynamic>> dynamicMap(Map<String, dynamic> map) async => map;
Future<Map<String, Object>> objectMap(Map<String, Object> map) async => map;
Future<Map<String, Object?>> objectNullableMap(
  Map<String, Object?> map,
) async =>
    map;
Future<Map<String, SimpleClass>> complexMap(
  Map<String, SimpleClass> map,
) async =>
    map;

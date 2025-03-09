/// Tests that collections (e.g. Lists/Maps) can be used as parameter and
/// return types.
library;

import 'package:celest/celest.dart';
import 'package:celest_backend/models/parameter_types.dart';

@cloud
Future<List<String>> simpleList(List<String> list) async => list;
@cloud
Future<List<SimpleClass>> complexList(List<SimpleClass> list) async => list;

@cloud
Future<Map<String, String>> simpleMap(Map<String, String> map) async => map;
@cloud
Future<Map<String, dynamic>> dynamicMap(Map<String, dynamic> map) async => map;
@cloud
Future<Map<String, Object>> objectMap(Map<String, Object> map) async => map;
@cloud
Future<Map<String, Object?>> objectNullableMap(
  Map<String, Object?> map,
) async =>
    map;
@cloud
Future<Map<String, SimpleClass>> complexMap(
  Map<String, SimpleClass> map,
) async =>
    map;

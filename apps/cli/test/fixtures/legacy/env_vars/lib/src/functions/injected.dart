import 'dart:typed_data';

import 'package:celest/celest.dart';
import 'package:celest_backend/models/person.dart';

import '../config/env.dart';

@cloud
String sayHello({
  @myName required String name,
  @myAge required int age,
}) {
  return 'Hello, $name! I am $age years old.';
}

@cloud
Person sayHelloPerson({
  @myName required String name,
  @myAge required int age,
  @myHeight required double height,
  @env('MY_WEIGHT') required num weight,
  @env('MY_WEBSITE') required Uri website,
  @env('IM_COOL') required bool isCool,
  @secret('SUPER_SECRET') required Uint8List superSecret,
  @env.environment required String currentEnvironment,
}) {
  print(
    '($currentEnvironment) $name is $age years old, ${height}ft tall, $weight lbs, '
    'and ${isCool ? 'is cool' : 'is not cool'}. Find him at $website.',
  );
  print('Super secret: ${String.fromCharCodes(superSecret)}');
  return Person(
    name: name,
    age: age,
    height: height,
    weight: weight,
    isCool: isCool,
    website: website,
  );
}

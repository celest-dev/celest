import 'package:celest/celest.dart';
import 'package:celest_backend/models/person.dart';

import '../generated/resources.dart';

@cloud
String sayHello({
  @env.myName required String name,
  @env.myAge required int age,
}) {
  return 'Hello, $name! I am $age years old.';
}

@cloud
Person sayHelloPerson({
  @env.myName required String name,
  @env.myAge required int age,
  @env.myHeight required double height,
  @env.myWeight required num weight,
  @env.imCool required bool isCool,
  @env.myWebsite required Uri website,
}) {
  print(
    '$name is $age years old, ${height}ft tall, $weight lbs, '
    'and ${isCool ? 'is cool' : 'is not cool'}. Find him at $website.',
  );
  return Person(
    name: name,
    age: age,
    height: height,
    weight: weight,
    isCool: isCool,
    website: website,
  );
}

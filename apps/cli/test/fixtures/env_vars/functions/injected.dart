import 'package:celest_backend/models.dart';

import '../resources.dart' as resources;

String sayHello({
  @resources.env.myName required String name,
  @resources.env.myAge required int age,
}) {
  return 'Hello, $name! I am $age years old.';
}

Person sayHelloPerson({
  @resources.env.myName required String name,
  @resources.env.myAge required int age,
  @resources.env.myHeight required double height,
  @resources.env.myWeight required num weight,
  @resources.env.imCool required bool isCool,
  @resources.env.myWebsite required Uri website,
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

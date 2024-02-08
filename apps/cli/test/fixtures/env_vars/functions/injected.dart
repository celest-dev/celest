import 'package:celest_backend/models.dart';

import '../resources.dart';

String sayHello({
  @Env.myName required String name,
  @Env.myAge required int age,
}) {
  return 'Hello, $name! I am $age years old.';
}

Person sayHelloPerson({
  @Env.myName required String name,
  @Env.myAge required int age,
  @Env.myHeight required double height,
  @Env.myWeight required num weight,
  @Env.imCool required bool isCool,
  @Env.myWebsite required Uri website,
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

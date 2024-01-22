import '../resources.dart' as resources;

String sayHello({
  @resources.env.myName required String name,
  @resources.env.myAge required int age,
}) {
  return 'Hello, $name! I am $age years old.';
}

class Person {
  const Person({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.isCool,
    required this.website,
  });

  final String name;
  final int age;
  final double height;
  final num weight;
  final bool isCool;
  final Uri website;
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

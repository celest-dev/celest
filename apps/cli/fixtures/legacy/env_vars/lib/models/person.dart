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

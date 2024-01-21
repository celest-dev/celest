import 'package:celest_core/celest_core.dart';

void main() {
  Serializers.instance.put(const MyClassSerializer());
  final serialized = Serializers.instance.serialize(MyClass('Celest'));
  print('Serialized: $serialized');
  final deserialized = Serializers.instance.deserialize<MyClass>(serialized);
  print('Deserialized: $deserialized');
}

final class MyClass {
  const MyClass(this.name);

  final String name;

  @override
  String toString() => 'MyClass(name: $name)';
}

final class MyClassSerializer extends Serializer<MyClass> {
  const MyClassSerializer();

  @override
  MyClass deserialize(Object? value) {
    final map = assertWireType<Map<String, Object?>>(value);
    return MyClass(map['name'] as String);
  }

  @override
  Object? serialize(MyClass value) => {'name': value.name};
}

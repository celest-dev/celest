// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart';

final class PersonSerializer extends Serializer<Person> {
  const PersonSerializer();

  @override
  Person deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Person(
      name: (serialized[r'name'] as String),
      age: (serialized[r'age'] as num).toInt(),
      height: (serialized[r'height'] as num).toDouble(),
      weight: (serialized[r'weight'] as num),
      isCool: (serialized[r'isCool'] as bool),
      website: Serializers.instance.deserialize<Uri>(serialized[r'website']),
    );
  }

  @override
  Object? serialize(Person value) => {
        r'name': value.name,
        r'age': value.age,
        r'height': value.height,
        r'weight': value.weight,
        r'isCool': value.isCool,
        r'website': Serializers.instance.serialize<Uri>(value.website),
      };
}

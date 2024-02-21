// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';

final class BadRequestExceptionSerializer
    extends Serializer<BadRequestException> {
  const BadRequestExceptionSerializer();

  @override
  BadRequestException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return BadRequestException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(BadRequestException value) => {r'message': value.message};
}

final class InternalServerExceptionSerializer
    extends Serializer<InternalServerException> {
  const InternalServerExceptionSerializer();

  @override
  InternalServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return InternalServerException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(InternalServerException value) =>
      {r'message': value.message};
}

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

final class SerializationExceptionSerializer
    extends Serializer<SerializationException> {
  const SerializationExceptionSerializer();

  @override
  SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}

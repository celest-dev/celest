// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart';
import 'package:celest_backend/models/person.dart' as _$person;

void initSerializers() {
  Serializers.instance
      .put(Serializer.define<_$person.Person, Map<String, Object?>>(
    serialize: ($value) => {
      r'name': $value.name,
      r'age': $value.age,
      r'height': $value.height,
      r'weight': $value.weight,
      r'isCool': $value.isCool,
      r'website': Serializers.instance.serialize<Uri>($value.website),
    },
    deserialize: ($serialized) {
      return _$person.Person(
        name: ($serialized[r'name'] as String),
        age: ($serialized[r'age'] as num).toInt(),
        height: ($serialized[r'height'] as num).toDouble(),
        weight: ($serialized[r'weight'] as num),
        isCool: ($serialized[r'isCool'] as bool),
        website: Serializers.instance.deserialize<Uri>($serialized[r'website']),
      );
    },
  ));
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/bad_name_exception.dart'
    as _$bad_name_exception;
import 'package:celest_backend/models/person.dart' as _$person;

void initSerializers() {
  Serializers.instance.put(Serializer.define<
      _$bad_name_exception.BadNameException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$bad_name_exception.BadNameException(
          ($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$person.Person, Map<String, Object?>>(
    serialize: ($value) => {r'name': $value.name},
    deserialize: ($serialized) {
      return _$person.Person(name: ($serialized[r'name'] as String));
    },
  ));
}

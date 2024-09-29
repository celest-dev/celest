// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:celest_backend/models/person.dart';
import 'package:celest_core/celest_core.dart' as _$celest;

void initSerializers() {
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<BadNameException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return BadNameException(($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<Person, Map<String, Object?>>(
    serialize: ($value) => {r'name': $value.name},
    deserialize: ($serialized) {
      return Person(name: ($serialized[r'name'] as String));
    },
  ));
}

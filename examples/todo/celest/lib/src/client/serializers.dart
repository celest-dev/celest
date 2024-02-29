// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart' as _$exceptions;
import 'package:celest_backend/models.dart' as _$models;

void initSerializers() {
  Serializers.instance.put(
      Serializer.define<_$exceptions.ServerException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$exceptions.ServerException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(Serializer.define<_$models.Importance, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return _$models.Importance.values.byName($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$models.Task, Map<String, Object?>>(
    serialize: ($value) => {
      r'id': $value.id,
      r'title': $value.title,
      r'importance': Serializers.instance
          .serialize<_$models.Importance>($value.importance),
      r'isCompleted': $value.isCompleted,
    },
    deserialize: ($serialized) {
      return _$models.Task(
        id: ($serialized[r'id'] as String),
        title: ($serialized[r'title'] as String),
        importance: Serializers.instance
            .deserialize<_$models.Importance>($serialized[r'importance']),
        isCompleted: (($serialized[r'isCompleted'] as bool?)) ?? false,
      );
    },
  ));
}

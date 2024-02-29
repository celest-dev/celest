// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart' as _$models;
import 'package:celest_core/src/exception/cloud_exception.dart';

void initSerializers() {
  Serializers.instance
      .put(Serializer.define<_$models.ModelParameters, Map<String, Object?>?>(
    serialize: ($value) => {
      r'temperature': $value.temperature,
      r'maxTokens': $value.maxTokens,
    },
    deserialize: ($serialized) {
      return _$models.ModelParameters(
        temperature: ($serialized?[r'temperature'] as num?)?.toDouble(),
        maxTokens: ($serialized?[r'maxTokens'] as num?)?.toInt(),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<BadRequestException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return BadRequestException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<InternalServerException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return InternalServerException(($serialized[r'message'] as String));
    },
  ));
}

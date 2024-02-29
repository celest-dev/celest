// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:google_generative_ai/src/error.dart' as _$error;
import 'package:http/src/exception.dart' as _$exception;

void initSerializers() {
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
  Serializers.instance
      .put(Serializer.define<SerializationException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'offset': $value.offset,
      r'source': $value.source,
    },
    deserialize: ($serialized) {
      return SerializationException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$error.GenerativeAIException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$error.GenerativeAIException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$error.InvalidApiKey, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$error.InvalidApiKey(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$error.ServerException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$error.ServerException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$error.UnsupportedUserLocation, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return _$error.UnsupportedUserLocation();
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exception.ClientException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'uri': Serializers.instance.serialize<Uri?>($value.uri),
    },
    deserialize: ($serialized) {
      return _$exception.ClientException(
        ($serialized[r'message'] as String),
        Serializers.instance.deserialize<Uri?>($serialized[r'uri']),
      );
    },
  ));
}

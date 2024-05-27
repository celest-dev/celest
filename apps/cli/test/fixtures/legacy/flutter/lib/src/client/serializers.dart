// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _$ui;

import 'package:celest/celest.dart';
import 'package:celest_backend/models/_overrides.dart' as _$_overrides;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:flutter/src/painting/image_provider.dart' as _$image_provider;

void initSerializers() {
  Serializers.instance.put(Serializer.define<_$ui.Color, Map<String, Object?>>(
    serialize: ($value) => {r'value': $value.value},
    deserialize: ($serialized) {
      return _$ui.Color(($serialized[r'value'] as num).toInt());
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$_overrides.LocaleOverride, List<dynamic>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$_overrides.LocaleOverride.fromJson($serialized);
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
      .put(Serializer.define<InternalServerError, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return InternalServerError(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnauthorizedException, Map<String, Object?>?>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return UnauthorizedException(
          (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
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
  Serializers.instance.put(Serializer.define<
      _$image_provider.NetworkImageLoadException, Map<String, Object?>>(
    serialize: ($value) => {
      r'statusCode': $value.statusCode,
      r'uri': Serializers.instance.serialize<Uri>($value.uri),
    },
    deserialize: ($serialized) {
      return _$image_provider.NetworkImageLoadException(
        statusCode: ($serialized[r'statusCode'] as num).toInt(),
        uri: Serializers.instance.deserialize<Uri>($serialized[r'uri']),
      );
    },
  ));
}

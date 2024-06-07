// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/available_stock.dart' as _$available_stock;
import 'package:celest/celest.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';

void initSerializers() {
  Serializers.instance.put(
      Serializer.define<_$available_stock.AvailableStock, Map<String, Object?>>(
    serialize: ($value) => {
      r'ticker': $value.ticker,
      r'name': $value.name,
      r'currentPrice': $value.currentPrice,
    },
    deserialize: ($serialized) {
      return _$available_stock.AvailableStock(
        ($serialized[r'ticker'] as String),
        name: ($serialized[r'name'] as String),
        currentPrice: ($serialized[r'currentPrice'] as num).toDouble(),
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
  Serializers.instance.put(
    Serializer.define<JsonValue, Object>(
      serialize: ($value) => $value.value,
      deserialize: ($serialized) {
        return JsonValue($serialized);
      },
    ),
    const TypeToken<JsonValue>('JsonValue'),
  );
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i2;

import '../../../functions/sealed_classes.dart' as _i4;

final class GenericResultTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'genericResult';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final $T = (request[r'$T'] as String?);
    final $types = ($T,);
    return switch ($types) {
      (r'Shape' || null,) => innerHandle<_i2.Shape>(request),
      (r'Rectangle',) => innerHandle<_i2.Rectangle>(request),
      (r'Circle',) => innerHandle<_i2.Circle>(request),
      _ =>
        throw _i3.SerializationException('Invalid type parameters: ${$types}'),
    };
  }

  Future<_i1.CelestResponse> innerHandle<T extends _i2.Shape>(
      Map<String, Object?> request) async {
    final response = _i4.genericResult<T>(
        _i3.Serializers.instance.deserialize<T>(request[r'data']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i2.OkResult<T>>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const ShapeSerializer());
    _i3.Serializers.instance.put(const RectangleSerializer());
    _i3.Serializers.instance.put(const CircleSerializer());
    _i3.Serializers.instance.put(const OkResultSerializer());
    _i3.Serializers.instance.put(const OkResultSerializer<_i2.Shape>());
    _i3.Serializers.instance.put(const OkResultSerializer<_i2.Rectangle>());
    _i3.Serializers.instance.put(const OkResultSerializer<_i2.Circle>());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': GenericResultTarget()},
  );
}

final class ShapeSerializer extends _i3.Serializer<_i2.Shape> {
  const ShapeSerializer();

  @override
  _i2.Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Rectangle') {
      return _i3.Serializers.instance.deserialize<_i2.Rectangle>(serialized);
    }
    if (serialized[r'$type'] == r'Circle') {
      return _i3.Serializers.instance.deserialize<_i2.Circle>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(_i2.Shape value) {
    if (value is _i2.Rectangle) {
      return {
        ...(_i3.Serializers.instance.serialize<_i2.Rectangle>(value)
            as Map<String, Object?>),
        r'$type': r'Rectangle',
      };
    }
    if (value is _i2.Circle) {
      return {
        ...(_i3.Serializers.instance.serialize<_i2.Circle>(value)
            as Map<String, Object?>),
        r'$type': r'Circle',
      };
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class RectangleSerializer extends _i3.Serializer<_i2.Rectangle> {
  const RectangleSerializer();

  @override
  _i2.Rectangle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Rectangle(
      (serialized[r'width'] as num).toDouble(),
      (serialized[r'height'] as num).toDouble(),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Rectangle value) => {
        r'width': value.width,
        r'height': value.height,
      };
}

final class CircleSerializer extends _i3.Serializer<_i2.Circle> {
  const CircleSerializer();

  @override
  _i2.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Map<String, Object?> serialize(_i2.Circle value) => {r'radius': value.radius};
}

final class OkResultSerializer<T extends _i2.Shape>
    extends _i3.Serializer<_i2.OkResult<T>> {
  const OkResultSerializer();

  @override
  _i2.OkResult<T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.OkResult<T>(
        _i3.Serializers.instance.deserialize<T>(serialized[r'data']));
  }

  @override
  Map<String, Object?> serialize(_i2.OkResult<T> value) =>
      {r'data': _i3.Serializers.instance.serialize<T>(value.data)};
}

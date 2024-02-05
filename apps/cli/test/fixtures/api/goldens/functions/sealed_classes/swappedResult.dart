// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;

import '../../../functions/sealed_classes.dart' as _i2;

final class SwappedResultTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'swappedResult';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.swappedResult(_i3.Serializers.instance
        .deserialize<_i4.Result<_i4.Shape, String>>(request[r'result']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance
            .serialize<_i4.SwappedResult<_i4.Shape, String>>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const ShapeSerializer());
    _i3.Serializers.instance.put(const RectangleSerializer());
    _i3.Serializers.instance.put(const CircleSerializer());
    _i3.Serializers.instance.put(const SwappedResultShapeStringSerializer());
    _i3.Serializers.instance.put(const ResultShapeStringSerializer());
    _i3.Serializers.instance.put(const OkResultShapeSerializer());
    _i3.Serializers.instance.put(const ErrResultStringSerializer());
    _i3.Serializers.instance.put(const SwappedResultStringShapeSerializer());
    _i3.Serializers.instance.put(const ResultStringShapeSerializer());
    _i3.Serializers.instance.put(const OkResultStringSerializer());
    _i3.Serializers.instance.put(const ErrResultShapeSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SwappedResultTarget()},
  );
}

final class ShapeSerializer extends _i3.Serializer<_i4.Shape> {
  const ShapeSerializer();

  @override
  _i4.Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Rectangle') {
      return _i3.Serializers.instance.deserialize<_i4.Rectangle>(serialized);
    }
    if (serialized[r'$type'] == r'Circle') {
      return _i3.Serializers.instance.deserialize<_i4.Circle>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(_i4.Shape value) {
    if (value is _i4.Rectangle) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.Rectangle>(value)
            as Map<String, Object?>),
        r'$type': r'Rectangle',
      };
    }
    if (value is _i4.Circle) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.Circle>(value)
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

final class RectangleSerializer extends _i3.Serializer<_i4.Rectangle> {
  const RectangleSerializer();

  @override
  _i4.Rectangle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Rectangle(
      (serialized[r'width'] as num).toDouble(),
      (serialized[r'height'] as num).toDouble(),
    );
  }

  @override
  Map<String, Object?> serialize(_i4.Rectangle value) => {
        r'width': value.width,
        r'height': value.height,
      };
}

final class CircleSerializer extends _i3.Serializer<_i4.Circle> {
  const CircleSerializer();

  @override
  _i4.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Map<String, Object?> serialize(_i4.Circle value) => {r'radius': value.radius};
}

final class SwappedResultShapeStringSerializer
    extends _i3.Serializer<_i4.SwappedResult<_i4.Shape, String>> {
  const SwappedResultShapeStringSerializer();

  @override
  _i4.SwappedResult<_i4.Shape, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.SwappedResult<_i4.Shape, String>(_i3.Serializers.instance
        .deserialize<_i4.Result<_i4.Shape, String>>(serialized[r'result']));
  }

  @override
  Map<String, Object?> serialize(_i4.SwappedResult<_i4.Shape, String> value) =>
      {
        r'result': _i3.Serializers.instance
            .serialize<_i4.Result<_i4.Shape, String>>(value.result)
      };
}

final class ResultShapeStringSerializer
    extends _i3.Serializer<_i4.Result<_i4.Shape, String>> {
  const ResultShapeStringSerializer();

  @override
  _i4.Result<_i4.Shape, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return _i3.Serializers.instance
          .deserialize<_i4.OkResult<_i4.Shape>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return _i3.Serializers.instance
          .deserialize<_i4.ErrResult<String>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return _i3.Serializers.instance
          .deserialize<_i4.SwappedResult<String, _i4.Shape>>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(_i4.Result<_i4.Shape, String> value) {
    if (value is _i4.OkResult<_i4.Shape>) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.OkResult<_i4.Shape>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is _i4.ErrResult<String>) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.ErrResult<String>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value is _i4.SwappedResult<String, _i4.Shape>) {
      return {
        ...(_i3.Serializers.instance
                .serialize<_i4.SwappedResult<String, _i4.Shape>>(value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class OkResultShapeSerializer
    extends _i3.Serializer<_i4.OkResult<_i4.Shape>> {
  const OkResultShapeSerializer();

  @override
  _i4.OkResult<_i4.Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.OkResult<_i4.Shape>(
        _i3.Serializers.instance.deserialize<_i4.Shape>(serialized[r'data']));
  }

  @override
  Map<String, Object?> serialize(_i4.OkResult<_i4.Shape> value) =>
      {r'data': _i3.Serializers.instance.serialize<_i4.Shape>(value.data)};
}

final class ErrResultStringSerializer
    extends _i3.Serializer<_i4.ErrResult<String>> {
  const ErrResultStringSerializer();

  @override
  _i4.ErrResult<String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ErrResult<String>((serialized[r'error'] as String));
  }

  @override
  Map<String, Object?> serialize(_i4.ErrResult<String> value) =>
      {r'error': value.error};
}

final class SwappedResultStringShapeSerializer
    extends _i3.Serializer<_i4.SwappedResult<String, _i4.Shape>> {
  const SwappedResultStringShapeSerializer();

  @override
  _i4.SwappedResult<String, _i4.Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.SwappedResult<String, _i4.Shape>(_i3.Serializers.instance
        .deserialize<_i4.Result<String, _i4.Shape>>(serialized[r'result']));
  }

  @override
  Map<String, Object?> serialize(_i4.SwappedResult<String, _i4.Shape> value) =>
      {
        r'result': _i3.Serializers.instance
            .serialize<_i4.Result<String, _i4.Shape>>(value.result)
      };
}

final class ResultStringShapeSerializer
    extends _i3.Serializer<_i4.Result<String, _i4.Shape>> {
  const ResultStringShapeSerializer();

  @override
  _i4.Result<String, _i4.Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return _i3.Serializers.instance
          .deserialize<_i4.OkResult<String>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return _i3.Serializers.instance
          .deserialize<_i4.ErrResult<_i4.Shape>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return _i3.Serializers.instance
          .deserialize<_i4.SwappedResult<_i4.Shape, String>>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(_i4.Result<String, _i4.Shape> value) {
    if (value is _i4.OkResult<String>) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.OkResult<String>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is _i4.ErrResult<_i4.Shape>) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.ErrResult<_i4.Shape>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value is _i4.SwappedResult<_i4.Shape, String>) {
      return {
        ...(_i3.Serializers.instance
                .serialize<_i4.SwappedResult<_i4.Shape, String>>(value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class OkResultStringSerializer
    extends _i3.Serializer<_i4.OkResult<String>> {
  const OkResultStringSerializer();

  @override
  _i4.OkResult<String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.OkResult<String>((serialized[r'data'] as String));
  }

  @override
  Map<String, Object?> serialize(_i4.OkResult<String> value) =>
      {r'data': value.data};
}

final class ErrResultShapeSerializer
    extends _i3.Serializer<_i4.ErrResult<_i4.Shape>> {
  const ErrResultShapeSerializer();

  @override
  _i4.ErrResult<_i4.Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ErrResult<_i4.Shape>(
        _i3.Serializers.instance.deserialize<_i4.Shape>(serialized[r'error']));
  }

  @override
  Map<String, Object?> serialize(_i4.ErrResult<_i4.Shape> value) =>
      {r'error': _i3.Serializers.instance.serialize<_i4.Shape>(value.error)};
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;

import '../../../functions/sealed_classes.dart' as _i2;

final class SealedClassWithCustomJsonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sealedClassWithCustomJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.sealedClassWithCustomJson(
        shapes: (request[r'shapes'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance
                .deserialize<_i4.ShapeWithCustomJson>(el))
            .toList());
    return (
      statusCode: 200,
      body: {
        'response': response
            .map((el) =>
                _i3.Serializers.instance.serialize<_i4.ShapeWithCustomJson>(el))
            .toList()
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const ShapeWithCustomJsonSerializer());
    _i3.Serializers.instance.put(const CircleWithCustomJsonSerializer());
    _i3.Serializers.instance.put(const RectangleWithCustomJsonSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SealedClassWithCustomJsonTarget()},
  );
}

final class CircleWithCustomJsonSerializer
    extends _i3.Serializer<_i4.CircleWithCustomJson> {
  const CircleWithCustomJsonSerializer();

  @override
  _i4.CircleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.CircleWithCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.CircleWithCustomJson value) => value.toJson();
}

final class RectangleWithCustomJsonSerializer
    extends _i3.Serializer<_i4.RectangleWithCustomJson> {
  const RectangleWithCustomJsonSerializer();

  @override
  _i4.RectangleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.RectangleWithCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.RectangleWithCustomJson value) => value.toJson();
}

final class ShapeWithCustomJsonSerializer
    extends _i3.Serializer<_i4.ShapeWithCustomJson> {
  const ShapeWithCustomJsonSerializer();

  @override
  _i4.ShapeWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'CircleWithCustomJson') {
      return _i3.Serializers.instance
          .deserialize<_i4.CircleWithCustomJson>(serialized);
    }
    if (serialized[r'$type'] == r'RectangleWithCustomJson') {
      return _i3.Serializers.instance
          .deserialize<_i4.RectangleWithCustomJson>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeWithCustomJson')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_i4.ShapeWithCustomJson value) {
    if (value is _i4.CircleWithCustomJson) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.CircleWithCustomJson>(value)
            as Map<String, Object?>),
        r'$type': r'CircleWithCustomJson',
      };
    }
    if (value is _i4.RectangleWithCustomJson) {
      return {
        ...(_i3.Serializers.instance
                .serialize<_i4.RectangleWithCustomJson>(value)
            as Map<String, Object?>),
        r'$type': r'RectangleWithCustomJson',
      };
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeWithCustomJson')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

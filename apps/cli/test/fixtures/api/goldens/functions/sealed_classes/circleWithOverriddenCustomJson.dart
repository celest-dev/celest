// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;

import '../../../functions/sealed_classes.dart' as _i2;

final class CircleWithOverriddenCustomJsonTarget
    extends _i1.CloudFunctionTarget {
  @override
  String get name => 'circleWithOverriddenCustomJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.circleWithOverriddenCustomJson(_i3.Serializers.instance
        .deserialize<_i4.ShapeWithOverriddenCustomJson>(request[r'circle']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance
            .serialize<_i4.CircleWithOverriddenCustomJson>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(const CircleWithOverriddenCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const ShapeWithOverriddenCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const RectangleWithOverriddenCustomJsonSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': CircleWithOverriddenCustomJsonTarget()},
  );
}

final class CircleWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i4.CircleWithOverriddenCustomJson> {
  const CircleWithOverriddenCustomJsonSerializer();

  @override
  _i4.CircleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.CircleWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i4.CircleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class ShapeWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i4.ShapeWithOverriddenCustomJson> {
  const ShapeWithOverriddenCustomJsonSerializer();

  @override
  _i4.ShapeWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ShapeWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i4.ShapeWithOverriddenCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i4.RectangleWithOverriddenCustomJson() =>
            r'RectangleWithOverriddenCustomJson',
          _i4.CircleWithOverriddenCustomJson() =>
            r'CircleWithOverriddenCustomJson',
        },
      };
}

final class RectangleWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i4.RectangleWithOverriddenCustomJson> {
  const RectangleWithOverriddenCustomJsonSerializer();

  @override
  _i4.RectangleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i4.ShapeWithOverriddenCustomJson.fromJson({
      r'$type': r'RectangleWithOverriddenCustomJson',
      ...serialized,
    }) as _i4.RectangleWithOverriddenCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i4.RectangleWithOverriddenCustomJson value) =>
      value.toJson();
}

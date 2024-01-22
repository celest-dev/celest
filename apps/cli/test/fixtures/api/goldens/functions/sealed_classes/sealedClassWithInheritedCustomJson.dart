// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;

import '../../../functions/sealed_classes.dart' as _i2;

final class SealedClassWithInheritedCustomJsonTarget
    extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sealedClassWithInheritedCustomJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.sealedClassWithInheritedCustomJson(
        shapes: (request[r'shapes'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance
                .deserialize<_i4.ShapeWithInheritedCustomJson>(el))
            .toList());
    return (
      statusCode: 200,
      body: {
        'response': response
            .map((el) => _i3.Serializers.instance
                .serialize<_i4.ShapeWithInheritedCustomJson>(el))
            .toList()
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(const ShapeWithInheritedCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const CircleWithInheritedCustomJsonSerializer());
    _i3.Serializers.instance
        .put(const RectangleWithInheritedCustomJsonSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SealedClassWithInheritedCustomJsonTarget()},
  );
}

final class ShapeWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i4.ShapeWithInheritedCustomJson> {
  const ShapeWithInheritedCustomJsonSerializer();

  @override
  _i4.ShapeWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ShapeWithInheritedCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i4.ShapeWithInheritedCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i4.CircleWithInheritedCustomJson() =>
            r'CircleWithInheritedCustomJson',
          _i4.RectangleWithInheritedCustomJson() =>
            r'RectangleWithInheritedCustomJson',
        },
      };
}

final class CircleWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i4.CircleWithInheritedCustomJson> {
  const CircleWithInheritedCustomJsonSerializer();

  @override
  _i4.CircleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i4.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'CircleWithInheritedCustomJson',
      ...serialized,
    }) as _i4.CircleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i4.CircleWithInheritedCustomJson value) =>
      value.toJson();
}

final class RectangleWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i4.RectangleWithInheritedCustomJson> {
  const RectangleWithInheritedCustomJsonSerializer();

  @override
  _i4.RectangleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i4.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'RectangleWithInheritedCustomJson',
      ...serialized,
    }) as _i4.RectangleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i4.RectangleWithInheritedCustomJson value) =>
      value.toJson();
}

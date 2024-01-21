// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/sealed_classes.dart' as _i2;

final class SealedClassWithOverriddenCustomJsonTarget
    extends _i1.CloudFunctionTarget {
  SealedClassWithOverriddenCustomJsonTarget()
      : super(
          (request) async {
            final response = _i2.sealedClassWithOverriddenCustomJson(
              circle: _i3.Serializers.scoped
                  .deserialize<_i2.CircleWithOverriddenCustomJson>(
                      request[r'circle']),
              rectangle: _i3.Serializers.scoped
                  .deserialize<_i2.RectangleWithOverriddenCustomJson>(
                      request[r'rectangle']),
              other: (request[r'other'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped
                      .deserialize<_i2.ShapeWithOverriddenCustomJson>(el))
                  .toList(),
            );
            return (
              statusCode: 200,
              body: {
                'response': response
                    .map((el) => _i3.Serializers.scoped
                        .serialize<_i2.ShapeWithOverriddenCustomJson>(el))
                    .toList()
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const ShapeWithOverriddenCustomJsonSerializer());
            serializers
                .put(const RectangleWithOverriddenCustomJsonSerializer());
            serializers.put(const CircleWithOverriddenCustomJsonSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SealedClassWithOverriddenCustomJsonTarget()},
  );
}

final class ShapeWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i2.ShapeWithOverriddenCustomJson> {
  const ShapeWithOverriddenCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#ShapeWithOverriddenCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.ShapeWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.ShapeWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.ShapeWithOverriddenCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i2.RectangleWithOverriddenCustomJson() =>
            r'RectangleWithOverriddenCustomJson',
          _i2.CircleWithOverriddenCustomJson() =>
            r'CircleWithOverriddenCustomJson',
        },
      };
}

final class RectangleWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i2.RectangleWithOverriddenCustomJson> {
  const RectangleWithOverriddenCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#RectangleWithOverriddenCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.RectangleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i2.ShapeWithOverriddenCustomJson.fromJson({
      r'$type': r'RectangleWithOverriddenCustomJson',
      ...serialized,
    }) as _i2.RectangleWithOverriddenCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i2.RectangleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class CircleWithOverriddenCustomJsonSerializer
    extends _i3.Serializer<_i2.CircleWithOverriddenCustomJson> {
  const CircleWithOverriddenCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#CircleWithOverriddenCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.CircleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.CircleWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.CircleWithOverriddenCustomJson value) =>
      value.toJson();
}

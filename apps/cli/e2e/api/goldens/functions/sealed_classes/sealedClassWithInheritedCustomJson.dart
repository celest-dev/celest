// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/sealed_classes.dart' as _i2;

final class SealedClassWithInheritedCustomJsonTarget
    extends _i1.CelestFunctionTarget {
  SealedClassWithInheritedCustomJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.sealedClassWithInheritedCustomJson(
                shapes: (request[r'shapes'] as Iterable<Object?>)
                    .map((el) => _i3.Serializers.scoped
                        .deserialize<_i2.ShapeWithInheritedCustomJson>(el))
                    .toList());
            return (
              statusCode: 200,
              body: response
                  .map((el) => _i3.Serializers.scoped
                      .serialize<_i2.ShapeWithInheritedCustomJson>(el))
                  .toList()
            );
          },
          installSerializers: (serializers) {
            serializers.put(const ShapeWithInheritedCustomJsonSerializer());
            serializers.put(const RectangleWithInheritedCustomJsonSerializer());
            serializers.put(const CircleWithInheritedCustomJsonSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => SealedClassWithInheritedCustomJsonTarget(),
  );
}

final class ShapeWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i2.ShapeWithInheritedCustomJson> {
  const ShapeWithInheritedCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#ShapeWithInheritedCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.ShapeWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.ShapeWithInheritedCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.ShapeWithInheritedCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i2.RectangleWithInheritedCustomJson() =>
            r'RectangleWithInheritedCustomJson',
          _i2.CircleWithInheritedCustomJson() =>
            r'CircleWithInheritedCustomJson',
        },
      };
}

final class RectangleWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i2.RectangleWithInheritedCustomJson> {
  const RectangleWithInheritedCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#RectangleWithInheritedCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.RectangleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i2.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'RectangleWithInheritedCustomJson',
      ...serialized,
    }) as _i2.RectangleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i2.RectangleWithInheritedCustomJson value) =>
      value.toJson();
}

final class CircleWithInheritedCustomJsonSerializer
    extends _i3.Serializer<_i2.CircleWithInheritedCustomJson> {
  const CircleWithInheritedCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#CircleWithInheritedCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.CircleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i2.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'CircleWithInheritedCustomJson',
      ...serialized,
    }) as _i2.CircleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i2.CircleWithInheritedCustomJson value) =>
      value.toJson();
}

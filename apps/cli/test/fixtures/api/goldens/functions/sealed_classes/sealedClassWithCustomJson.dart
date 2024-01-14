// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/sealed_classes.dart' as _i2;

final class SealedClassWithCustomJsonTarget extends _i1.CelestFunctionTarget {
  SealedClassWithCustomJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.sealedClassWithCustomJson(
                shapes: (request[r'shapes'] as Iterable<Object?>)
                    .map((el) => _i3.Serializers.scoped
                        .deserialize<_i2.ShapeWithCustomJson>(el))
                    .toList());
            return (
              statusCode: 200,
              body: response
                  .map((el) => _i3.Serializers.scoped
                      .serialize<_i2.ShapeWithCustomJson>(el))
                  .toList()
            );
          },
          installSerializers: (serializers) {
            serializers.put(const ShapeWithCustomJsonSerializer());
            serializers.put(const CircleWithCustomJsonSerializer());
            serializers.put(const RectangleWithCustomJsonSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => SealedClassWithCustomJsonTarget(),
  );
}

final class ShapeWithCustomJsonSerializer
    extends _i3.Serializer<_i2.ShapeWithCustomJson> {
  const ShapeWithCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#ShapeWithCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.ShapeWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return switch (serialized[r'$type']) {
      r'CircleWithCustomJson' => _i3.Serializers.scoped
          .deserialize<_i2.CircleWithCustomJson>(serialized),
      r'RectangleWithCustomJson' => _i3.Serializers.scoped
          .deserialize<_i2.RectangleWithCustomJson>(serialized),
      final unknownType =>
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'ShapeWithCustomJson')
              ..write(': $unknownType'))
            .toString()),
    };
  }

  @override
  Map<String, Object?> serialize(_i2.ShapeWithCustomJson value) =>
      switch (value) {
        _i2.CircleWithCustomJson() => {
            ...(_i3.Serializers.scoped
                    .serialize<_i2.CircleWithCustomJson>(value)
                as Map<String, Object?>),
            r'$type': r'CircleWithCustomJson',
          },
        _i2.RectangleWithCustomJson() => {
            ...(_i3.Serializers.scoped
                    .serialize<_i2.RectangleWithCustomJson>(value)
                as Map<String, Object?>),
            r'$type': r'RectangleWithCustomJson',
          },
      };
}

final class CircleWithCustomJsonSerializer
    extends _i3.Serializer<_i2.CircleWithCustomJson> {
  const CircleWithCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#CircleWithCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.CircleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.CircleWithCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.CircleWithCustomJson value) =>
      value.toJson();
}

final class RectangleWithCustomJsonSerializer
    extends _i3.Serializer<_i2.RectangleWithCustomJson> {
  const RectangleWithCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#RectangleWithCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.RectangleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.RectangleWithCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.RectangleWithCustomJson value) =>
      value.toJson();
}

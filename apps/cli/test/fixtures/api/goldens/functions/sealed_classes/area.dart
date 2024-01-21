// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/sealed_classes.dart' as _i2;

final class AreaTarget extends _i1.CloudFunctionTarget {
  AreaTarget()
      : super(
          (request) async {
            final response = _i2.area(_i3.Serializers.scoped
                .deserialize<_i2.Shape>(request[r'shape']));
            return (statusCode: 200, body: {'response': response});
          },
          installSerializers: (serializers) {
            serializers.put(const ShapeSerializer());
            serializers.put(const RectangleSerializer());
            serializers.put(const CircleSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AreaTarget()},
  );
}

final class ShapeSerializer extends _i3.Serializer<_i2.Shape> {
  const ShapeSerializer();

  @override
  String get dartType => r'project:functions/sealed_classes.dart#Shape';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return switch (serialized[r'$type']) {
      r'Rectangle' =>
        _i3.Serializers.scoped.deserialize<_i2.Rectangle>(serialized),
      r'Circle' => _i3.Serializers.scoped.deserialize<_i2.Circle>(serialized),
      final unknownType =>
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Shape')
              ..write(': $unknownType'))
            .toString()),
    };
  }

  @override
  Map<String, Object?> serialize(_i2.Shape value) => switch (value) {
        _i2.Rectangle() => {
            ...(_i3.Serializers.scoped.serialize<_i2.Rectangle>(value)
                as Map<String, Object?>),
            r'$type': r'Rectangle',
          },
        _i2.Circle() => {
            ...(_i3.Serializers.scoped.serialize<_i2.Circle>(value)
                as Map<String, Object?>),
            r'$type': r'Circle',
          },
      };
}

final class RectangleSerializer extends _i3.Serializer<_i2.Rectangle> {
  const RectangleSerializer();

  @override
  String get dartType => r'project:functions/sealed_classes.dart#Rectangle';

  @override
  String get wireType => r'dart:core#Map';

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
  String get dartType => r'project:functions/sealed_classes.dart#Circle';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Map<String, Object?> serialize(_i2.Circle value) => {r'radius': value.radius};
}

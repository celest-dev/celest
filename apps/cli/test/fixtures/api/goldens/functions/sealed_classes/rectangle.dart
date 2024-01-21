// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/sealed_classes.dart' as _i2;

final class RectangleTarget extends _i1.CloudFunctionTarget {
  RectangleTarget()
      : super(
          (request) async {
            final response = _i2.rectangle(_i3.Serializers.scoped
                .deserialize<_i2.Rectangle>(request[r'rectangle']));
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i2.Rectangle>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const RectangleSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': RectangleTarget()},
  );
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

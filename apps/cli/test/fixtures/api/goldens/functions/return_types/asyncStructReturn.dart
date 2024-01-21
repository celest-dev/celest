// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/parameter_types.dart' as _i4;
import '../../../functions/return_types.dart' as _i2;

final class AsyncStructReturnTarget extends _i1.CloudFunctionTarget {
  AsyncStructReturnTarget()
      : super(
          (request) async {
            final response = await _i2.asyncStructReturn();
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i4.SimpleStruct>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const SimpleStructSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncStructReturnTarget()},
  );
}

final class SimpleStructSerializer extends _i3.Serializer<_i4.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(_i4.SimpleStruct value) => {};
}

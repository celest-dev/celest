// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i6;

import '../../../functions/parameter_types.dart' as _i4;
import '../../../functions/return_types.dart' as _i2;

final class AsyncClassReturnNullableTarget extends _i1.CelestFunctionTarget {
  AsyncClassReturnNullableTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncClassReturnNullable();
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped.serialize<_i4.SimpleClass?>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const SimpleClassSerializer());
          },
          middleware: [],
        );
}

_i5.Future<void> main(List<String> args) async {
  await _i6.serve(
    args,
    (_) => AsyncClassReturnNullableTarget(),
  );
}

final class SimpleClassSerializer extends _i3.Serializer<_i4.SimpleClass> {
  const SimpleClassSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i4.SimpleClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i4.SimpleClass value) => value.toJson();
}

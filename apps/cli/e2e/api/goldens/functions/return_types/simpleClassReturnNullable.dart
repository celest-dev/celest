// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/parameter_types.dart' as _i4;
import '../../../functions/return_types.dart' as _i2;

final class SimpleClassReturnNullableTarget extends _i1.CelestFunctionTarget {
  SimpleClassReturnNullableTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.simpleClassReturnNullable();
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

Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => SimpleClassReturnNullableTarget(),
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

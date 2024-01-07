// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:celest/celest.dart' as _i2;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:functions_framework/serve.dart' as _i7;

import '../../../functions/parameter_types.dart' as _i5;
import '../../../functions/return_types.dart' as _i3;

final class SimpleClassReturnTarget extends _i1.CelestFunctionTarget {
  SimpleClassReturnTarget()
      : super(
          (
            request,
            context,
          ) async {
            final celestContext = _i2.FunctionContext();
            final response = _i3.simpleClassReturn(celestContext);
            return (
              statusCode: 200,
              body:
                  _i4.Serializers.instance.serialize<_i5.SimpleClass>(response)
            );
          },
          middleware: [],
        );
}

_i6.Future<void> main(List<String> args) async {
  _i4.Serializers.instance.put(const SimpleClassSerializer());
  await _i7.serve(
    args,
    (_) => SimpleClassReturnTarget(),
  );
}

final class SimpleClassSerializer extends _i4.Serializer<_i5.SimpleClass> {
  const SimpleClassSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i5.SimpleClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i5.SimpleClass value) => value.toJson();
}

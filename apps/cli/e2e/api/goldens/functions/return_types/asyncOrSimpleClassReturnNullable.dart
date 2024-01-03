// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:celest/celest.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i7;

import '../../../functions/parameter_types.dart' as _i5;
import '../../../functions/return_types.dart' as _i3;

class AsyncOrSimpleClassReturnNullableTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
      final response =
          await _i3.asyncOrSimpleClassReturnNullable(celestContext);
      return _i4.Serializers.instance.serialize<_i5.SimpleClass?>(response);
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i6.FutureOr<_i7.Response> handler(_i7.Request request) {
    final handler = _i7.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i6.Future<void> main(List<String> args) async {
  _i4.Serializers.instance.put(const SimpleClassSerializer());
  await _i1.serve(
    args,
    (_) => AsyncOrSimpleClassReturnNullableTarget(),
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

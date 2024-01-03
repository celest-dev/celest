// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:celest/celest.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i7;

import '../../../functions/parameter_types.dart' as _i5;
import '../../../functions/return_types.dart' as _i3;

class AsyncOrStructReturnTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
      final response = await _i3.asyncOrStructReturn(celestContext);
      return _i4.Serializers.instance.serialize<_i5.SimpleStruct>(response);
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
  _i4.Serializers.instance.put(const SimpleStructSerializer());
  await _i1.serve(
    args,
    (_) => AsyncOrStructReturnTarget(),
  );
}

final class SimpleStructSerializer extends _i4.Serializer<_i5.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(_i5.SimpleStruct value) => {};
}

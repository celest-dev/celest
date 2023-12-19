// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../apis/classes.dart' as _i2;

class AsyncEmptySuperTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = await _i2.asyncEmptySuper(_i3.Serializers.instance
          .deserialize<_i2.EmptySuper>(request[r'value']));
      return _i3.Serializers.instance.serialize<_i2.EmptySuper>(response);
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i4.FutureOr<_i5.Response> handler(_i5.Request request) {
    final handler = _i5.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const EmptySuperSerializer());
  await _i1.serve(
    args,
    (_) => AsyncEmptySuperTarget(),
  );
}

final class EmptySuperSerializer extends _i3.Serializer<_i2.EmptySuper> {
  const EmptySuperSerializer();

  @override
  String get dartType => r'project:apis/classes.dart#EmptySuper';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.EmptySuper deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.EmptySuper();
  }

  @override
  Map<String, Object?> serialize(_i2.EmptySuper value) => {};
}

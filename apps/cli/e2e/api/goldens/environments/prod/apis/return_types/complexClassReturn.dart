// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:celest/celest.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i7;

import '../../../../../apis/parameter_types.dart' as _i5;
import '../../../../../apis/return_types.dart' as _i3;

class ComplexClassReturnTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
      final response = _i3.complexClassReturn(celestContext);
      return _i4.Serializers.instance.serializeWithType<_i5.ComplexClass>(
        r'project:apis/parameter_types.dart#ComplexClass',
        response,
      );
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
  _i4.Serializers.instance.put(const ComplexClassSerializer());
  await _i1.serve(
    args,
    (_) => ComplexClassReturnTarget(),
  );
}

final class ComplexClassSerializer extends _i4.Serializer<_i5.ComplexClass> {
  const ComplexClassSerializer();

  @override
  String get dartType => r'project:apis/parameter_types.dart#ComplexClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.ComplexClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i5.ComplexClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i5.ComplexClass value) => value.toJson();
}

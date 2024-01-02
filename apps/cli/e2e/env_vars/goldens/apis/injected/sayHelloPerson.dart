// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:io' as _i3;

import 'package:celest_core/celest_core.dart' as _i4;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i6;

import '../../../apis/injected.dart' as _i2;

class SayHelloPersonTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = _i2.sayHelloPerson(
        name: _i3.Platform.environment[r'MY_NAME']!,
        age: int.parse(_i3.Platform.environment[r'MY_AGE']!),
        height: double.parse(_i3.Platform.environment[r'MY_HEIGHT']!),
        weight: num.parse(_i3.Platform.environment[r'MY_WEIGHT']!),
        isCool: bool.parse(_i3.Platform.environment[r'IM_COOL']!),
      );
      return _i4.Serializers.instance.serialize<_i2.Person>(response);
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i5.FutureOr<_i6.Response> handler(_i6.Request request) {
    final handler = _i6.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i5.Future<void> main(List<String> args) async {
  _i4.Serializers.instance.put(const PersonSerializer());
  await _i1.serve(
    args,
    (_) => SayHelloPersonTarget(),
  );
}

final class PersonSerializer extends _i4.Serializer<_i2.Person> {
  const PersonSerializer();

  @override
  String get dartType => r'project:apis/injected.dart#Person';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Person deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Person(
      name: (serialized[r'name'] as String),
      age: (serialized[r'age'] as int),
      height: (serialized[r'height'] as double),
      weight: (serialized[r'weight'] as num),
      isCool: (serialized[r'isCool'] as bool),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Person value) => {
        r'name': value.name,
        r'age': value.age,
        r'height': value.height,
        r'weight': value.weight,
        r'isCool': value.isCool,
      };
}

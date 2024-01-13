// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsExceptionTarget extends _i1.CelestFunctionTarget {
  ThrowsExceptionTarget()
      : super(
          (
            request,
            context,
          ) async {
            _i2.throwsException(
                type: _i3.Serializers.scoped
                    .deserialize<_i2.SupportedExceptionType>(request[r'type']));
            return (statusCode: 200, body: null);
          },
          installSerializers: (serializers) {
            serializers.put(const SupportedExceptionTypeSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => ThrowsExceptionTarget(),
  );
}

final class SupportedExceptionTypeSerializer
    extends _i3.Serializer<_i2.SupportedExceptionType> {
  const SupportedExceptionTypeSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#SupportedExceptionType';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SupportedExceptionType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.SupportedExceptionType.values.byName(serialized);
  }

  @override
  String serialize(_i2.SupportedExceptionType value) => value.name;
}

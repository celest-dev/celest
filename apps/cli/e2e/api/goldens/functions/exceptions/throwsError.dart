// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsErrorTarget extends _i1.CelestFunctionTarget {
  ThrowsErrorTarget()
      : super(
          (
            request,
            context,
          ) async {
            _i2.throwsError(
                type: _i3.Serializers.scoped
                    .deserialize<_i2.SupportedErrorType>(request[r'type']));
            return (statusCode: 200, body: null);
          },
          installSerializers: (serializers) {
            serializers.put(const SupportedErrorTypeSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => ThrowsErrorTarget(),
  );
}

final class SupportedErrorTypeSerializer
    extends _i3.Serializer<_i2.SupportedErrorType> {
  const SupportedErrorTypeSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#SupportedErrorType';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SupportedErrorType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.SupportedErrorType.values.byName(serialized);
  }

  @override
  String serialize(_i2.SupportedErrorType value) => value.name;
}

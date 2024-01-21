// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomErrorWithStackTraceTarget
    extends _i1.CloudFunctionTarget {
  ThrowsCustomErrorWithStackTraceTarget()
      : super(
          (request) async {
            try {
              _i2.throwsCustomErrorWithStackTrace();
              return (statusCode: 200, body: {'response': null});
            } on _i2.CustomErrorWithStackTrace catch (e, st) {
              print('$e\n$st');
              final error = _i3.Serializers.scoped
                  .serialize<_i2.CustomErrorWithStackTrace>(e);
              return (
                statusCode: 500,
                body: {
                  'error': {
                    'code': r'CustomErrorWithStackTrace',
                    'message': e.toString(),
                    'details': error,
                  }
                }
              );
            }
          },
          installSerializers: (serializers) {
            serializers.put(const CustomErrorWithStackTraceSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomErrorWithStackTraceTarget()},
  );
}

final class CustomErrorWithStackTraceSerializer
    extends _i3.Serializer<_i2.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#CustomErrorWithStackTrace';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.CustomErrorWithStackTrace(
        stackTrace: (_i3.Serializers.scoped
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Map<String, Object?> serialize(_i2.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            _i3.Serializers.scoped.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

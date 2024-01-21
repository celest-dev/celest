// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/exceptions.dart' as _i3;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i4;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomErrorWithStackTraceTarget
    extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomErrorWithStackTrace();
      return (statusCode: 200, body: {'response': null});
    } on _i3.CustomErrorWithStackTrace catch (e, st) {
      print('$e\n$st');
      final error =
          _i4.Serializers.instance.serialize<_i3.CustomErrorWithStackTrace>(e);
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
  }

  @override
  void init() {
    _i4.Serializers.instance.put(const CustomErrorWithStackTraceSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomErrorWithStackTraceTarget()},
  );
}

final class CustomErrorWithStackTraceSerializer
    extends _i4.Serializer<_i3.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  _i3.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i3.CustomErrorWithStackTrace(
        stackTrace: (_i4.Serializers.instance
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Map<String, Object?> serialize(_i3.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

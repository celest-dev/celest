// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _i3;
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/external.dart' as _i2;

final class CallsThrowsCommonExceptionTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'callsThrowsCommonException';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.callsThrowsCommonException();
      return (statusCode: 200, body: {'response': null});
    } on _i3.CommonException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CommonException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CommonException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(const CommonExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': CallsThrowsCommonExceptionTarget()},
  );
}

final class CommonExceptionSerializer
    extends _i4.Serializer<_i3.CommonException> {
  const CommonExceptionSerializer();

  @override
  _i3.CommonException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.CommonException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i3.CommonException value) => {r'message': value.message};
}

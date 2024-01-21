// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomExceptionTarget extends _i1.CloudFunctionTarget {
  ThrowsCustomExceptionTarget()
      : super(
          (request) async {
            try {
              _i2.throwsCustomException();
              return (statusCode: 200, body: {'response': null});
            } on _i2.CustomException catch (e, st) {
              print('$e\n$st');
              final error =
                  _i3.Serializers.scoped.serialize<_i2.CustomException>(e);
              return (
                statusCode: 400,
                body: {
                  'error': {
                    'code': r'CustomException',
                    'message': e.toString(),
                    'details': error,
                  }
                }
              );
            }
          },
          installSerializers: (serializers) {
            serializers.put(const CustomExceptionSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomExceptionTarget()},
  );
}

final class CustomExceptionSerializer
    extends _i3.Serializer<_i2.CustomException> {
  const CustomExceptionSerializer();

  @override
  String get dartType => r'project:functions/exceptions.dart#CustomException';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.CustomException();
  }

  @override
  Map<String, Object?> serialize(_i2.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

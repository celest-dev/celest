// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomErrorToFromJsonTarget extends _i1.CloudFunctionTarget {
  ThrowsCustomErrorToFromJsonTarget()
      : super(
          (request) async {
            try {
              _i2.throwsCustomErrorToFromJson();
              return (statusCode: 200, body: {'response': null});
            } on _i2.CustomErrorToFromJson catch (e, st) {
              print('$e\n$st');
              final error = _i3.Serializers.scoped
                  .serialize<_i2.CustomErrorToFromJson>(e);
              return (
                statusCode: 500,
                body: {
                  'error': {
                    'code': r'CustomErrorToFromJson',
                    'message': e.toString(),
                    'details': error,
                  }
                }
              );
            }
          },
          installSerializers: (serializers) {
            serializers.put(const CustomErrorToFromJsonSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomErrorToFromJsonTarget()},
  );
}

final class CustomErrorToFromJsonSerializer
    extends _i3.Serializer<_i2.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#CustomErrorToFromJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.CustomErrorToFromJson value) =>
      value.toJson();
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomExceptionToFromJsonTarget
    extends _i1.CelestFunctionTarget {
  ThrowsCustomExceptionToFromJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            try {
              _i2.throwsCustomExceptionToFromJson();
              return (statusCode: 200, body: null);
            } on _i2.CustomExceptionToFromJson catch (e, st) {
              print('$e\n$st');
              final error = _i3.Serializers.instance
                  .serialize<_i2.CustomExceptionToFromJson>(e);
              return (
                statusCode: 400,
                body: {
                  'error': {
                    'code': r'CustomExceptionToFromJson',
                    'message': e.toString(),
                    'details': error,
                  }
                }
              );
            }
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const CustomExceptionToFromJsonSerializer());
  await _i5.serve(
    args,
    (_) => ThrowsCustomExceptionToFromJsonTarget(),
  );
}

final class CustomExceptionToFromJsonSerializer
    extends _i3.Serializer<_i2.CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#CustomExceptionToFromJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.CustomExceptionToFromJson value) =>
      value.toJson();
}

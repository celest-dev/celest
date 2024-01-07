// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/classes.dart' as _i2;

final class DefaultValuesTarget extends _i1.CelestFunctionTarget {
  DefaultValuesTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.defaultValues(_i3.Serializers.instance
                .deserialize<_i2.DefaultValues>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.instance
                  .serialize<_i2.DefaultValues>(response)
            );
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const DefaultValuesSerializer());
  await _i5.serve(
    args,
    (_) => DefaultValuesTarget(),
  );
}

final class DefaultValuesSerializer extends _i3.Serializer<_i2.DefaultValues> {
  const DefaultValuesSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#DefaultValues';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.DefaultValues deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.DefaultValues(
      field: ((serialized?[r'field'] as String?)) ?? 'default',
      nullableField: (serialized?[r'nullableField'] as String?),
      nullableFieldWithDefault:
          ((serialized?[r'nullableFieldWithDefault'] as String?)) ?? 'default',
    );
  }

  @override
  Map<String, Object?> serialize(_i2.DefaultValues value) => {
        r'field': value.field,
        r'nullableField': value.nullableField,
        r'nullableFieldWithDefault': value.nullableFieldWithDefault,
        r'fieldWithoutInitializer': value.fieldWithoutInitializer,
      };
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/classes.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime.dart' as _i1;

import '../../../functions/classes.dart' as _i2;

final class AsyncDefaultValuesTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'asyncDefaultValues';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.asyncDefaultValues(_i3.Serializers.instance
        .deserialize<_i4.DefaultValues>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.DefaultValues>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const DefaultValuesSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncDefaultValuesTarget()},
  );
}

final class DefaultValuesSerializer extends _i3.Serializer<_i4.DefaultValues> {
  const DefaultValuesSerializer();

  @override
  _i4.DefaultValues deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.DefaultValues(
      field: ((serialized?[r'field'] as String?)) ?? 'default',
      nullableField: ((serialized?[r'nullableField'] as String?)) ?? null,
      nullableFieldWithDefault:
          ((serialized?[r'nullableFieldWithDefault'] as String?)) ?? 'default',
    );
  }

  @override
  Map<String, Object?> serialize(_i4.DefaultValues value) => {
        r'field': value.field,
        r'nullableField': value.nullableField,
        r'nullableFieldWithDefault': value.nullableFieldWithDefault,
        r'fieldWithoutInitializer': value.fieldWithoutInitializer,
      };
}

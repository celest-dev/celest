// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/records.dart' as _i4;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/records.dart' as _i2;

final class AsyncNullableNestedTarget extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.asyncNullableNested(_i3.Serializers.instance
        .deserialize<_i4.NullableNested?>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.NullableNested?>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const NamedFieldsRecordSerializer());
    _i3.Serializers.instance.put(const NullableNestedSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncNullableNestedTarget()},
  );
}

final class NamedFieldsRecordSerializer
    extends _i3.Serializer<_i4.NamedFieldsRecord> {
  const NamedFieldsRecordSerializer();

  @override
  _i4.NamedFieldsRecord deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(_i4.NamedFieldsRecord value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

final class NullableNestedSerializer
    extends _i3.Serializer<_i4.NullableNested> {
  const NullableNestedSerializer();

  @override
  _i4.NullableNested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: _i3.Serializers.instance
          .deserialize<_i4.NamedFieldsRecord?>(serialized[r'namedFields'])
    );
  }

  @override
  Map<String, Object?> serialize(_i4.NullableNested value) => {
        r'namedFields': _i3.Serializers.instance
            .serialize<_i4.NamedFieldsRecord?>(value.namedFields)
      };
}

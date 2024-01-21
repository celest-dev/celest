// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/records.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime.dart' as _i1;

import '../../../functions/records.dart' as _i2;

final class AliasedNamedFieldsTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'aliasedNamedFields';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.aliasedNamedFields(
        value: _i3.Serializers.instance
            .deserialize<_i4.NamedFieldsRecord>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.NamedFieldsRecord>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const NamedFieldsRecordSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AliasedNamedFieldsTarget()},
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

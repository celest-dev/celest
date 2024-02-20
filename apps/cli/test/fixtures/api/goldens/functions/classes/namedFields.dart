// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/classes.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class NamedFieldsTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'namedFields';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.namedFields(_i3.Serializers.instance
        .deserialize<_i4.NamedFields>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.NamedFields>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const NamedFieldsSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NamedFieldsTarget()},
  );
}

final class NamedFieldsSerializer extends _i3.Serializer<_i4.NamedFields> {
  const NamedFieldsSerializer();

  @override
  _i4.NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.NamedFields(
      superField: (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Object? serialize(_i4.NamedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

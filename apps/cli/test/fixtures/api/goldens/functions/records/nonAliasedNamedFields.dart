// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/records.dart' as _i2;

final class NonAliasedNamedFieldsTarget extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.nonAliasedNamedFields(
        value: _i3.Serializers.instance
            .deserialize<({String anotherField, String field})>(
                request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance
            .serialize<({String anotherField, String field})>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const Record$rmm4wtSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NonAliasedNamedFieldsTarget()},
  );
}

typedef Record$rmm4wt = ({String anotherField, String field});

final class Record$rmm4wtSerializer extends _i3.Serializer<Record$rmm4wt> {
  const Record$rmm4wtSerializer();

  @override
  Record$rmm4wt deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$rmm4wt value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

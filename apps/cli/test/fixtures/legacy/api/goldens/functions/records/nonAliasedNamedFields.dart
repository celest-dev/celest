// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/records.dart' as _i2;

final class NonAliasedNamedFieldsTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'nonAliasedNamedFields';

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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<Record$rmm4wt, Map<String, Object?>>(
      serialize: ($value) => {
        r'anotherField': $value.anotherField,
        r'field': $value.field,
      },
      deserialize: ($serialized) {
        return (
          anotherField: ($serialized[r'anotherField'] as String),
          field: ($serialized[r'field'] as String)
        );
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NonAliasedNamedFieldsTarget()},
  );
}

typedef Record$rmm4wt = ({String anotherField, String field});

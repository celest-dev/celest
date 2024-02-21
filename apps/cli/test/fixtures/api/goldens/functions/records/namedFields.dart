// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/records.dart' as _i4;

import '../../../functions/records.dart' as _i2;

final class NamedFieldsTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'namedFields';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.namedFields(
      nonAliased: _i3.Serializers.instance
          .deserialize<({String anotherField, String field})>(
              request[r'nonAliased']),
      aliased: _i3.Serializers.instance
          .deserialize<_i4.NamedFieldsRecord>(request[r'aliased']),
    );
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<
            ({
              _i4.NamedFieldsRecord aliased,
              ({String anotherField, String field}) nonAliased
            })>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<Record$k2phuz, Map<String, Object?>>(
      serialize: ($value) => {
        r'aliased': _i3.Serializers.instance
            .serialize<_i4.NamedFieldsRecord>($value.aliased),
        r'nonAliased': _i3.Serializers.instance
            .serialize<({String anotherField, String field})>(
                $value.nonAliased),
      },
      deserialize: ($serialized) {
        return (
          aliased: _i3.Serializers.instance
              .deserialize<_i4.NamedFieldsRecord>($serialized[r'aliased']),
          nonAliased: _i3.Serializers.instance
              .deserialize<({String anotherField, String field})>(
                  $serialized[r'nonAliased'])
        );
      },
    ));
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.NamedFieldsRecord, Map<String, Object?>>(
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
    targets: {'/': NamedFieldsTarget()},
  );
}

typedef Record$k2phuz = ({
  _i4.NamedFieldsRecord aliased,
  ({String anotherField, String field}) nonAliased
});
typedef Record$rmm4wt = ({String anotherField, String field});

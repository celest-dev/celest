// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/records.dart' as _i4;

import '../../../functions/records.dart' as _i2;

final class AsyncNestedTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'asyncNested';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.asyncNested(
        _i3.Serializers.instance.deserialize<_i4.Nested>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.Nested>(response)
      }
    );
  }

  @override
  void init() {
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Nested, Map<String, Object?>>(
      serialize: ($value) => {
        r'namedFields': _i3.Serializers.instance
            .serialize<_i4.NamedFieldsRecord>($value.namedFields)
      },
      deserialize: ($serialized) {
        return (
          namedFields: _i3.Serializers.instance
              .deserialize<_i4.NamedFieldsRecord>($serialized[r'namedFields'])
        );
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncNestedTarget()},
  );
}

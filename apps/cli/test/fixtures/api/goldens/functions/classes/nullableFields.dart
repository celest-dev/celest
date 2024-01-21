// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/classes.dart' as _i2;

final class NullableFieldsTarget extends _i1.CloudFunctionTarget {
  NullableFieldsTarget()
      : super(
          (request) async {
            final response = _i2.nullableFields(_i3.Serializers.scoped
                .deserialize<_i2.Fields?>(request[r'value']));
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i2.Fields?>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const FieldsSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NullableFieldsTarget()},
  );
}

final class FieldsSerializer extends _i3.Serializer<_i2.Fields> {
  const FieldsSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#Fields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Fields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Fields(
      (serialized[r'superField'] as String),
      (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Fields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

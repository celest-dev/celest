// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/classes.dart' as _i2;

final class AsyncNamedFieldsTarget extends _i1.CloudFunctionTarget {
  AsyncNamedFieldsTarget()
      : super(
          (request) async {
            final response = await _i2.asyncNamedFields(_i3.Serializers.scoped
                .deserialize<_i2.NamedFields>(request[r'value']));
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i2.NamedFields>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const NamedFieldsSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncNamedFieldsTarget()},
  );
}

final class NamedFieldsSerializer extends _i3.Serializer<_i2.NamedFields> {
  const NamedFieldsSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NamedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.NamedFields(
      superField: (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NamedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

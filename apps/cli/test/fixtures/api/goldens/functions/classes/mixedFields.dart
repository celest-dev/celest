// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/classes.dart' as _i2;

final class MixedFieldsTarget extends _i1.CloudFunctionTarget {
  MixedFieldsTarget()
      : super(
          (request) async {
            final response = _i2.mixedFields(_i3.Serializers.scoped
                .deserialize<_i2.MixedFields>(request[r'value']));
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i2.MixedFields>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const MixedFieldsSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': MixedFieldsTarget()},
  );
}

final class MixedFieldsSerializer extends _i3.Serializer<_i2.MixedFields> {
  const MixedFieldsSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#MixedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.MixedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.MixedFields(
      (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.MixedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

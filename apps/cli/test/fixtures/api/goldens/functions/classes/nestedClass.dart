// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/classes.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class NestedClassTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'nestedClass';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.nestedClass(_i3.Serializers.instance
        .deserialize<_i4.NestedClass>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.NestedClass>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const FieldsSerializer());
    _i3.Serializers.instance.put(const NestedClassSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NestedClassTarget()},
  );
}

final class FieldsSerializer extends _i3.Serializer<_i4.Fields> {
  const FieldsSerializer();

  @override
  _i4.Fields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Fields(
      (serialized[r'superField'] as String),
      (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i4.Fields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class NestedClassSerializer extends _i3.Serializer<_i4.NestedClass> {
  const NestedClassSerializer();

  @override
  _i4.NestedClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.NestedClass(
      _i3.Serializers.instance.deserialize<_i4.Fields>(serialized[r'fields']),
      _i3.Serializers.instance
          .deserialize<_i4.Fields?>(serialized[r'nullableFields']),
    );
  }

  @override
  Map<String, Object?> serialize(_i4.NestedClass value) => {
        r'fields': _i3.Serializers.instance.serialize<_i4.Fields>(value.fields),
        r'nullableFields': _i3.Serializers.instance
            .serialize<_i4.Fields?>(value.nullableFields),
      };
}

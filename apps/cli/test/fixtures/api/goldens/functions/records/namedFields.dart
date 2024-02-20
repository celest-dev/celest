// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/records.dart' as _i4;

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
    _i3.Serializers.instance.put(const Record$wkpf9qSerializer());
    _i3.Serializers.instance.put(const Record$rmm4wtSerializer());
    _i3.Serializers.instance.put(const NamedFieldsRecordSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NamedFieldsTarget()},
  );
}

typedef Record$rmm4wt = ({String anotherField, String field});
typedef Record$wkpf9q = ({
  _i4.NamedFieldsRecord aliased,
  ({String anotherField, String field}) nonAliased
});

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

final class Record$wkpf9qSerializer extends _i3.Serializer<Record$wkpf9q> {
  const Record$wkpf9qSerializer();

  @override
  Record$wkpf9q deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aliased: _i3.Serializers.instance
          .deserialize<_i4.NamedFieldsRecord>(serialized[r'aliased']),
      nonAliased: _i3.Serializers.instance
          .deserialize<({String anotherField, String field})>(
              serialized[r'nonAliased'])
    );
  }

  @override
  Map<String, Object?> serialize(Record$wkpf9q value) => {
        r'aliased': _i3.Serializers.instance
            .serialize<_i4.NamedFieldsRecord>(value.aliased),
        r'nonAliased': _i3.Serializers.instance
            .serialize<({String anotherField, String field})>(value.nonAliased),
      };
}

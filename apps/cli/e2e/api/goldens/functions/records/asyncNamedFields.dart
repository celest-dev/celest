// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/records.dart' as _i2;

final class AsyncNamedFieldsTarget extends _i1.CelestFunctionTarget {
  AsyncNamedFieldsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncNamedFields(
              nonAliased: _i3.Serializers.instance
                  .deserialize<({String anotherField, String field})>(
                      request[r'nonAliased']),
              aliased: _i3.Serializers.instance
                  .deserialize<_i2.NamedFields>(request[r'aliased']),
            );
            return (
              statusCode: 200,
              body: _i3.Serializers.instance.serialize<
                  ({
                    _i2.NamedFields aliased,
                    ({String anotherField, String field}) nonAliased
                  })>(response)
            );
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const NamedFieldsSerializer());
  _i3.Serializers.instance.put(const Record$rmm4wtSerializer());
  _i3.Serializers.instance.put(const Record$sxv9hgSerializer());
  await _i5.serve(
    args,
    (_) => AsyncNamedFieldsTarget(),
  );
}

typedef Record$sxv9hg = ({
  _i2.NamedFields aliased,
  ({String anotherField, String field}) nonAliased
});
typedef Record$rmm4wt = ({String anotherField, String field});

final class NamedFieldsSerializer extends _i3.Serializer<_i2.NamedFields> {
  const NamedFieldsSerializer();

  @override
  String get dartType => r'project:functions/records.dart#NamedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NamedFields value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

final class Record$rmm4wtSerializer extends _i3.Serializer<Record$rmm4wt> {
  const Record$rmm4wtSerializer();

  @override
  String get dartType => r'#Record$rmm4wt';

  @override
  String get wireType => r'dart:core#Map';

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

final class Record$sxv9hgSerializer extends _i3.Serializer<Record$sxv9hg> {
  const Record$sxv9hgSerializer();

  @override
  String get dartType => r'#Record$sxv9hg';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$sxv9hg deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aliased: _i3.Serializers.instance
          .deserialize<_i2.NamedFields>(serialized[r'aliased']),
      nonAliased: _i3.Serializers.instance
          .deserialize<Record$rmm4wt>(serialized[r'nonAliased'])
    );
  }

  @override
  Map<String, Object?> serialize(Record$sxv9hg value) => {
        r'aliased':
            _i3.Serializers.instance.serialize<_i2.NamedFields>(value.aliased),
        r'nonAliased': _i3.Serializers.instance
            .serialize<({String anotherField, String field})>(value.nonAliased),
      };
}

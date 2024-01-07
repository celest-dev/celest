// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/records.dart' as _i2;

final class MixedFieldsTarget extends _i1.CelestFunctionTarget {
  MixedFieldsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.mixedFields(
              _i3.Serializers.instance
                  .deserialize<(String, {String anotherField})>(
                      request[r'nonAliased']),
              aliased: _i3.Serializers.instance
                  .deserialize<_i2.MixedFields>(request[r'aliased']),
            );
            return (
              statusCode: 200,
              body: _i3.Serializers.instance.serialize<
                  (
                    (String, {String anotherField}), {
                    _i2.MixedFields aliased
                  })>(response)
            );
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const Record$4z6fldSerializer());
  _i3.Serializers.instance.put(const MixedFieldsSerializer());
  _i3.Serializers.instance.put(const Record$ag2zgiSerializer());
  await _i5.serve(
    args,
    (_) => MixedFieldsTarget(),
  );
}

typedef Record$ag2zgi = (
  (String, {String anotherField}), {
  _i2.MixedFields aliased
});
typedef Record$4z6fld = (String, {String anotherField});

final class Record$4z6fldSerializer extends _i3.Serializer<Record$4z6fld> {
  const Record$4z6fldSerializer();

  @override
  String get dartType => r'#Record$4z6fld';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$4z6fld deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      (serialized[r'$1'] as String),
      anotherField: (serialized[r'anotherField'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$4z6fld value) => {
        r'$1': value.$1,
        r'anotherField': value.anotherField,
      };
}

final class MixedFieldsSerializer extends _i3.Serializer<_i2.MixedFields> {
  const MixedFieldsSerializer();

  @override
  String get dartType => r'project:functions/records.dart#MixedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.MixedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      (serialized[r'$1'] as String),
      anotherField: (serialized[r'anotherField'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(_i2.MixedFields value) => {
        r'$1': value.$1,
        r'anotherField': value.anotherField,
      };
}

final class Record$ag2zgiSerializer extends _i3.Serializer<Record$ag2zgi> {
  const Record$ag2zgiSerializer();

  @override
  String get dartType => r'#Record$ag2zgi';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$ag2zgi deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      _i3.Serializers.instance.deserialize<Record$4z6fld>(serialized[r'$1']),
      aliased: _i3.Serializers.instance
          .deserialize<_i2.MixedFields>(serialized[r'aliased'])
    );
  }

  @override
  Map<String, Object?> serialize(Record$ag2zgi value) => {
        r'$1': _i3.Serializers.instance
            .serialize<(String, {String anotherField})>(value.$1),
        r'aliased':
            _i3.Serializers.instance.serialize<_i2.MixedFields>(value.aliased),
      };
}

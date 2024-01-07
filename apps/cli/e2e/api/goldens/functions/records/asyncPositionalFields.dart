// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/records.dart' as _i2;

final class AsyncPositionalFieldsTarget extends _i1.CelestFunctionTarget {
  AsyncPositionalFieldsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncPositionalFields(
              _i3.Serializers.instance
                  .deserialize<(String, String)>(request[r'nonAliased']),
              _i3.Serializers.instance
                  .deserialize<_i2.PositionalFields>(request[r'aliased']),
            );
            return (
              statusCode: 200,
              body: _i3.Serializers.instance
                  .serialize<((String, String), _i2.PositionalFields)>(response)
            );
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const Record$rh3gkzSerializer());
  _i3.Serializers.instance.put(const PositionalFieldsSerializer());
  _i3.Serializers.instance.put(const Record$sh7p4bSerializer());
  await _i5.serve(
    args,
    (_) => AsyncPositionalFieldsTarget(),
  );
}

typedef Record$sh7p4b = ((String, String), _i2.PositionalFields);
typedef Record$rh3gkz = (String, String);

final class Record$rh3gkzSerializer extends _i3.Serializer<Record$rh3gkz> {
  const Record$rh3gkzSerializer();

  @override
  String get dartType => r'#Record$rh3gkz';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$rh3gkz deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ((serialized[r'$1'] as String), (serialized[r'$2'] as String));
  }

  @override
  Map<String, Object?> serialize(Record$rh3gkz value) => {
        r'$1': value.$1,
        r'$2': value.$2,
      };
}

final class PositionalFieldsSerializer
    extends _i3.Serializer<_i2.PositionalFields> {
  const PositionalFieldsSerializer();

  @override
  String get dartType => r'project:functions/records.dart#PositionalFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.PositionalFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ((serialized[r'$1'] as String), (serialized[r'$2'] as String));
  }

  @override
  Map<String, Object?> serialize(_i2.PositionalFields value) => {
        r'$1': value.$1,
        r'$2': value.$2,
      };
}

final class Record$sh7p4bSerializer extends _i3.Serializer<Record$sh7p4b> {
  const Record$sh7p4bSerializer();

  @override
  String get dartType => r'#Record$sh7p4b';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$sh7p4b deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      _i3.Serializers.instance.deserialize<Record$rh3gkz>(serialized[r'$1']),
      _i3.Serializers.instance
          .deserialize<_i2.PositionalFields>(serialized[r'$2'])
    );
  }

  @override
  Map<String, Object?> serialize(Record$sh7p4b value) => {
        r'$1': _i3.Serializers.instance.serialize<(String, String)>(value.$1),
        r'$2':
            _i3.Serializers.instance.serialize<_i2.PositionalFields>(value.$2),
      };
}

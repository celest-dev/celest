// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i6;

import '../../../functions/parameter_types.dart' as _i2;

final class SimpleTarget extends _i1.CelestFunctionTarget {
  SimpleTarget()
      : super(
          (
            request,
            context,
          ) async {
            _i2.simple(
              (request[r'aString'] as String),
              (request[r'anInt'] as num).toInt(),
              (request[r'aDouble'] as num).toDouble(),
              (request[r'aBool'] as bool),
              _i3.Serializers.scoped
                  .deserialize<_i2.MyEnum>(request[r'anEnum']),
              (request[r'aNull'] as Null),
              _i3.Serializers.scoped.deserialize<BigInt>(request[r'aBigInt']),
              _i3.Serializers.scoped
                  .deserialize<DateTime>(request[r'aDateTime']),
              _i3.Serializers.scoped
                  .deserialize<Duration>(request[r'aDuration']),
              _i3.Serializers.scoped.deserialize<RegExp>(request[r'aRegExp']),
              _i3.Serializers.scoped
                  .deserialize<StackTrace>(request[r'aStackTrace']),
              _i3.Serializers.scoped.deserialize<Uri>(request[r'aUri']),
              _i3.Serializers.scoped.deserialize<UriData>(request[r'aUriData']),
              _i3.Serializers.scoped
                  .deserialize<_i4.Uint8List>(request[r'aUint8List']),
              (request[r'anIterableOfString'] as Iterable<Object?>)
                  .map((el) => (el as String))
                  .toList(),
              (request[r'anIterableOfUint8List'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i4.Uint8List>(el))
                  .toList(),
              (request[r'aListOfString'] as Iterable<Object?>)
                  .map((el) => (el as String))
                  .toList(),
              (request[r'aListOfInt'] as Iterable<Object?>)
                  .map((el) => (el as num).toInt())
                  .toList(),
              (request[r'aListOfDouble'] as Iterable<Object?>)
                  .map((el) => (el as num).toDouble())
                  .toList(),
              (request[r'aListOfBool'] as Iterable<Object?>)
                  .map((el) => (el as bool))
                  .toList(),
              (request[r'aListOfEnum'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.MyEnum>(el))
                  .toList(),
              (request[r'aListOfNull'] as Iterable<Object?>)
                  .map((el) => (el as Null))
                  .toList(),
              (request[r'aListOfBigInt'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped.deserialize<BigInt>(el))
                  .toList(),
              (request[r'aListOfDateTime'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped.deserialize<DateTime>(el))
                  .toList(),
              (request[r'aListOfDuration'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped.deserialize<Duration>(el))
                  .toList(),
              (request[r'aListOfRegExp'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped.deserialize<RegExp>(el))
                  .toList(),
              (request[r'aListOfStackTrace'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<StackTrace>(el))
                  .toList(),
              (request[r'aListOfUri'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped.deserialize<Uri>(el))
                  .toList(),
              (request[r'aListOfUriData'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped.deserialize<UriData>(el))
                  .toList(),
              (request[r'aListOfUint8List'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i4.Uint8List>(el))
                  .toList(),
              (request[r'aMapOfString'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    (value as String),
                  )),
              (request[r'aMapOfInt'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    (value as num).toInt(),
                  )),
              (request[r'aMapOfDouble'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    (value as num).toDouble(),
                  )),
              (request[r'aMapOfBool'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    (value as bool),
                  )),
              (request[r'aMapOfEnum'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<_i2.MyEnum>(value),
                  )),
              (request[r'aMapOfNull'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    (value as Null),
                  )),
              (request[r'aMapOfBigInt'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<BigInt>(value),
                  )),
              (request[r'aMapOfDateTime'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<DateTime>(value),
                  )),
              (request[r'aMapOfDuration'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<Duration>(value),
                  )),
              (request[r'aMapOfRegExp'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<RegExp>(value),
                  )),
              (request[r'aMapOfStackTrace'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<StackTrace>(value),
                  )),
              (request[r'aMapOfUri'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<Uri>(value),
                  )),
              (request[r'aMapOfUriData'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<UriData>(value),
                  )),
              (request[r'aMapOfUint8List'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<_i4.Uint8List>(value),
                  )),
            );
            return (statusCode: 200, body: null);
          },
          installSerializers: (serializers) {
            serializers.put(const MyEnumSerializer());
          },
          middleware: [],
        );
}

_i5.Future<void> main(List<String> args) async {
  await _i6.serve(
    args,
    (_) => SimpleTarget(),
  );
}

final class MyEnumSerializer extends _i3.Serializer<_i2.MyEnum> {
  const MyEnumSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#MyEnum';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.MyEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.MyEnum.values.byName(serialized);
  }

  @override
  String serialize(_i2.MyEnum value) => value.name;
}

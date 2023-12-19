// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i6;

import '../../../apis/parameter_types.dart' as _i2;

class SimpleOptionalTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.simpleOptional(
        (request[r'aString'] as String?),
        (request[r'anInt'] as int?),
        (request[r'aDouble'] as double?),
        (request[r'aBool'] as bool?),
        _i3.Serializers.instance.deserialize<_i2.MyEnum?>(request[r'anEnum']),
        (request[r'aNull'] as Null),
        _i3.Serializers.instance.deserialize<BigInt?>(request[r'aBigInt']),
        _i3.Serializers.instance.deserialize<DateTime?>(request[r'aDateTime']),
        _i3.Serializers.instance.deserialize<Duration?>(request[r'aDuration']),
        _i3.Serializers.instance.deserialize<RegExp?>(request[r'aRegExp']),
        _i3.Serializers.instance
            .deserialize<StackTrace?>(request[r'aStackTrace']),
        _i3.Serializers.instance.deserialize<Uri?>(request[r'aUri']),
        _i3.Serializers.instance.deserialize<UriData?>(request[r'aUriData']),
        _i3.Serializers.instance
            .deserialize<_i4.Uint8List?>(request[r'aUint8List']),
        (request[r'anIterableOfString'] as Iterable<Object?>?)
            ?.map((el) => (el as String))
            .toList(),
        (request[r'anIterableOfUint8List'] as Iterable<Object?>?)
            ?.map(
                (el) => _i3.Serializers.instance.deserialize<_i4.Uint8List>(el))
            .toList(),
        (request[r'aListOfString'] as Iterable<Object?>?)
            ?.map((el) => (el as String))
            .toList(),
        (request[r'aListOfInt'] as Iterable<Object?>?)
            ?.map((el) => (el as int))
            .toList(),
        (request[r'aListOfDouble'] as Iterable<Object?>?)
            ?.map((el) => (el as double))
            .toList(),
        (request[r'aListOfBool'] as Iterable<Object?>?)
            ?.map((el) => (el as bool))
            .toList(),
        (request[r'aListOfEnum'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<_i2.MyEnum>(el))
            .toList(),
        (request[r'aListOfNull'] as Iterable<Object?>?)
            ?.map((el) => (el as Null))
            .toList(),
        (request[r'aListOfBigInt'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<BigInt>(el))
            .toList(),
        (request[r'aListOfDateTime'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<DateTime>(el))
            .toList(),
        (request[r'aListOfDuration'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<Duration>(el))
            .toList(),
        (request[r'aListOfRegExp'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<RegExp>(el))
            .toList(),
        (request[r'aListOfStackTrace'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<StackTrace>(el))
            .toList(),
        (request[r'aListOfUri'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<Uri>(el))
            .toList(),
        (request[r'aListOfUriData'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<UriData>(el))
            .toList(),
        (request[r'aListOfUint8List'] as Iterable<Object?>?)
            ?.map(
                (el) => _i3.Serializers.instance.deserialize<_i4.Uint8List>(el))
            .toList(),
        (request[r'aMapOfString'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as String),
            )),
        (request[r'aMapOfInt'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as int),
            )),
        (request[r'aMapOfDouble'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as double),
            )),
        (request[r'aMapOfBool'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as bool),
            )),
        (request[r'aMapOfEnum'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<_i2.MyEnum>(value),
            )),
        (request[r'aMapOfNull'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as Null),
            )),
        (request[r'aMapOfBigInt'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<BigInt>(value),
            )),
        (request[r'aMapOfDateTime'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<DateTime>(value),
            )),
        (request[r'aMapOfDuration'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<Duration>(value),
            )),
        (request[r'aMapOfRegExp'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<RegExp>(value),
            )),
        (request[r'aMapOfStackTrace'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<StackTrace>(value),
            )),
        (request[r'aMapOfUri'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<Uri>(value),
            )),
        (request[r'aMapOfUriData'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<UriData>(value),
            )),
        (request[r'aMapOfUint8List'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<_i4.Uint8List>(value),
            )),
      );
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i5.FutureOr<_i6.Response> handler(_i6.Request request) {
    final handler = _i6.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i5.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const MyEnumSerializer());
  await _i1.serve(
    args,
    (_) => SimpleOptionalTarget(),
  );
}

final class MyEnumSerializer extends _i3.Serializer<_i2.MyEnum> {
  const MyEnumSerializer();

  @override
  String get dartType => r'project:apis/parameter_types.dart#MyEnum';

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

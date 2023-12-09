// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i6;

import '../../../../../apis/parameter_types.dart' as _i2;

class SimpleTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.simple(
        (request[r'aString'] as String),
        (request[r'anInt'] as int),
        (request[r'aDouble'] as double),
        (request[r'aBool'] as bool),
        _i2.MyEnum.values.byName((request[r'anEnum'] as String)),
        (request[r'aNull'] as Null),
        _i3.Serializers.instance.deserialize<BigInt>(
          'dart:core#BigInt',
          request[r'aBigInt'],
        ),
        _i3.Serializers.instance.deserialize<DateTime>(
          'dart:core#DateTime',
          request[r'aDateTime'],
        ),
        _i3.Serializers.instance.deserialize<Duration>(
          'dart:core#Duration',
          request[r'aDuration'],
        ),
        _i3.Serializers.instance.deserialize<RegExp>(
          'dart:core#RegExp',
          request[r'aRegExp'],
        ),
        _i3.Serializers.instance.deserialize<StackTrace>(
          'dart:core#StackTrace',
          request[r'aStackTrace'],
        ),
        _i3.Serializers.instance.deserialize<Uri>(
          'dart:core#Uri',
          request[r'aUri'],
        ),
        _i3.Serializers.instance.deserialize<UriData>(
          'dart:core#UriData',
          request[r'aUriData'],
        ),
        _i3.Serializers.instance.deserialize<_i4.Uint8List>(
          'dart:typed_data#Uint8List',
          request[r'aUint8List'],
        ),
        (request[r'anIterableOfString'] as Iterable<Object?>).map((el) {
          return (el as String);
        }).toList(),
        (request[r'anIterableOfUint8List'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
            'dart:typed_data#Uint8List',
            el,
          );
        }).toList(),
        (request[r'aListOfString'] as Iterable<Object?>).map((el) {
          return (el as String);
        }).toList(),
        (request[r'aListOfInt'] as Iterable<Object?>).map((el) {
          return (el as int);
        }).toList(),
        (request[r'aListOfDouble'] as Iterable<Object?>).map((el) {
          return (el as double);
        }).toList(),
        (request[r'aListOfBool'] as Iterable<Object?>).map((el) {
          return (el as bool);
        }).toList(),
        (request[r'aListOfEnum'] as Iterable<Object?>).map((el) {
          return _i2.MyEnum.values.byName((el as String));
        }).toList(),
        (request[r'aListOfNull'] as Iterable<Object?>).map((el) {
          return (el as Null);
        }).toList(),
        (request[r'aListOfBigInt'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<BigInt>(
            'dart:core#BigInt',
            el,
          );
        }).toList(),
        (request[r'aListOfDateTime'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<DateTime>(
            'dart:core#DateTime',
            el,
          );
        }).toList(),
        (request[r'aListOfDuration'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<Duration>(
            'dart:core#Duration',
            el,
          );
        }).toList(),
        (request[r'aListOfRegExp'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<RegExp>(
            'dart:core#RegExp',
            el,
          );
        }).toList(),
        (request[r'aListOfStackTrace'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<StackTrace>(
            'dart:core#StackTrace',
            el,
          );
        }).toList(),
        (request[r'aListOfUri'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<Uri>(
            'dart:core#Uri',
            el,
          );
        }).toList(),
        (request[r'aListOfUriData'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<UriData>(
            'dart:core#UriData',
            el,
          );
        }).toList(),
        (request[r'aListOfUint8List'] as Iterable<Object?>).map((el) {
          return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
            'dart:typed_data#Uint8List',
            el,
          );
        }).toList(),
        (request[r'aMapOfString'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            (value as String),
          );
        }),
        (request[r'aMapOfInt'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            (value as int),
          );
        }),
        (request[r'aMapOfDouble'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            (value as double),
          );
        }),
        (request[r'aMapOfBool'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            (value as bool),
          );
        }),
        (request[r'aMapOfEnum'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i2.MyEnum.values.byName((value as String)),
          );
        }),
        (request[r'aMapOfNull'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            (value as Null),
          );
        }),
        (request[r'aMapOfBigInt'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<BigInt>(
              'dart:core#BigInt',
              value,
            ),
          );
        }),
        (request[r'aMapOfDateTime'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<DateTime>(
              'dart:core#DateTime',
              value,
            ),
          );
        }),
        (request[r'aMapOfDuration'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<Duration>(
              'dart:core#Duration',
              value,
            ),
          );
        }),
        (request[r'aMapOfRegExp'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<RegExp>(
              'dart:core#RegExp',
              value,
            ),
          );
        }),
        (request[r'aMapOfStackTrace'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<StackTrace>(
              'dart:core#StackTrace',
              value,
            ),
          );
        }),
        (request[r'aMapOfUri'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<Uri>(
              'dart:core#Uri',
              value,
            ),
          );
        }),
        (request[r'aMapOfUriData'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<UriData>(
              'dart:core#UriData',
              value,
            ),
          );
        }),
        (request[r'aMapOfUint8List'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          return MapEntry(
            key,
            _i3.Serializers.instance.deserialize<_i4.Uint8List>(
              'dart:typed_data#Uint8List',
              value,
            ),
          );
        }),
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
  await _i1.serve(
    args,
    (_) => SimpleTarget(),
  );
}

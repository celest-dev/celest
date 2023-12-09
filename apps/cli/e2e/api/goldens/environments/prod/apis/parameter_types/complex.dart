// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i6;

import '../../../../../apis/parameter_types.dart' as _i2;

class ComplexTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.complex(
        (),
        (
          aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
            'dart:core#BigInt',
            request[r'aComplexStruct']['aBigInt'],
          ),
          aBool: (request[r'aComplexStruct']['aBool'] as bool),
          aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
            'dart:core#DateTime',
            request[r'aComplexStruct']['aDateTime'],
          ),
          aDouble: (request[r'aComplexStruct']['aDouble'] as double),
          aDuration: _i3.Serializers.instance.deserialize<Duration>(
            'dart:core#Duration',
            request[r'aComplexStruct']['aDuration'],
          ),
          aListOfBigInt:
              (request[r'aComplexStruct']['aListOfBigInt'] as Iterable<Object?>)
                  .map((el) {
            return _i3.Serializers.instance.deserialize<BigInt>(
              'dart:core#BigInt',
              el,
            );
          }).toList(),
          aListOfBool:
              (request[r'aComplexStruct']['aListOfBool'] as Iterable<Object?>)
                  .map((el) {
            return (el as bool);
          }).toList(),
          aListOfDateTime: (request[r'aComplexStruct']['aListOfDateTime']
                  as Iterable<Object?>)
              .map((el) {
            return _i3.Serializers.instance.deserialize<DateTime>(
              'dart:core#DateTime',
              el,
            );
          }).toList(),
          aListOfDouble:
              (request[r'aComplexStruct']['aListOfDouble'] as Iterable<Object?>)
                  .map((el) {
            return (el as double);
          }).toList(),
          aListOfDuration: (request[r'aComplexStruct']['aListOfDuration']
                  as Iterable<Object?>)
              .map((el) {
            return _i3.Serializers.instance.deserialize<Duration>(
              'dart:core#Duration',
              el,
            );
          }).toList(),
          aListOfEnum:
              (request[r'aComplexStruct']['aListOfEnum'] as Iterable<Object?>)
                  .map((el) {
            return _i2.MyEnum.values.byName((el as String));
          }).toList(),
          aListOfInt:
              (request[r'aComplexStruct']['aListOfInt'] as Iterable<Object?>)
                  .map((el) {
            return (el as int);
          }).toList(),
          aListOfNull:
              (request[r'aComplexStruct']['aListOfNull'] as Iterable<Object?>)
                  .map((el) {
            return (el as Null);
          }).toList(),
          aListOfRegExp:
              (request[r'aComplexStruct']['aListOfRegExp'] as Iterable<Object?>)
                  .map((el) {
            return _i3.Serializers.instance.deserialize<RegExp>(
              'dart:core#RegExp',
              el,
            );
          }).toList(),
          aListOfSimpleClass: (request[r'aComplexStruct']['aListOfSimpleClass']
                  as Iterable<Object?>)
              .map((el) {
            (el as Map<String, Object?>);
            return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
          }).toList(),
          aListOfSimpleStruct: (request[r'aComplexStruct']
                  ['aListOfSimpleStruct'] as Iterable<Object?>)
              .map((el) {
            (el as Map<String, Object?>);
            return ();
          }).toList(),
          aListOfStackTrace: (request[r'aComplexStruct']['aListOfStackTrace']
                  as Iterable<Object?>)
              .map((el) {
            return _i3.Serializers.instance.deserialize<StackTrace>(
              'dart:core#StackTrace',
              el,
            );
          }).toList(),
          aListOfString:
              (request[r'aComplexStruct']['aListOfString'] as Iterable<Object?>)
                  .map((el) {
            return (el as String);
          }).toList(),
          aListOfUint8List: (request[r'aComplexStruct']['aListOfUint8List']
                  as Iterable<Object?>)
              .map((el) {
            return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
              'dart:typed_data#Uint8List',
              el,
            );
          }).toList(),
          aListOfUri:
              (request[r'aComplexStruct']['aListOfUri'] as Iterable<Object?>)
                  .map((el) {
            return _i3.Serializers.instance.deserialize<Uri>(
              'dart:core#Uri',
              el,
            );
          }).toList(),
          aListOfUriData: (request[r'aComplexStruct']['aListOfUriData']
                  as Iterable<Object?>)
              .map((el) {
            return _i3.Serializers.instance.deserialize<UriData>(
              'dart:core#UriData',
              el,
            );
          }).toList(),
          aMapOfBigInt: (request[r'aComplexStruct']['aMapOfBigInt']
                  as Map<String, Object?>)
              .map((
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
          aMapOfBool:
              (request[r'aComplexStruct']['aMapOfBool'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as bool),
            );
          }),
          aMapOfDateTime: (request[r'aComplexStruct']['aMapOfDateTime']
                  as Map<String, Object?>)
              .map((
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
          aMapOfDouble: (request[r'aComplexStruct']['aMapOfDouble']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as double),
            );
          }),
          aMapOfDuration: (request[r'aComplexStruct']['aMapOfDuration']
                  as Map<String, Object?>)
              .map((
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
          aMapOfEnum:
              (request[r'aComplexStruct']['aMapOfEnum'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              _i2.MyEnum.values.byName((value as String)),
            );
          }),
          aMapOfInt:
              (request[r'aComplexStruct']['aMapOfInt'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as int),
            );
          }),
          aMapOfNull:
              (request[r'aComplexStruct']['aMapOfNull'] as Map<String, Object?>)
                  .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as Null),
            );
          }),
          aMapOfRegExp: (request[r'aComplexStruct']['aMapOfRegExp']
                  as Map<String, Object?>)
              .map((
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
          aMapOfSimpleClass: (request[r'aComplexStruct']['aMapOfSimpleClass']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            (value as Map<String, Object?>);
            return MapEntry(
              key,
              _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
            );
          }),
          aMapOfSimpleStruct: (request[r'aComplexStruct']['aMapOfSimpleStruct']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            (value as Map<String, Object?>);
            return MapEntry(
              key,
              (),
            );
          }),
          aMapOfStackTrace: (request[r'aComplexStruct']['aMapOfStackTrace']
                  as Map<String, Object?>)
              .map((
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
          aMapOfString: (request[r'aComplexStruct']['aMapOfString']
                  as Map<String, Object?>)
              .map((
            key,
            value,
          ) {
            return MapEntry(
              key,
              (value as String),
            );
          }),
          aMapOfUint8List: (request[r'aComplexStruct']['aMapOfUint8List']
                  as Map<String, Object?>)
              .map((
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
          aMapOfUri:
              (request[r'aComplexStruct']['aMapOfUri'] as Map<String, Object?>)
                  .map((
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
          aMapOfUriData: (request[r'aComplexStruct']['aMapOfUriData']
                  as Map<String, Object?>)
              .map((
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
          aNull: (request[r'aComplexStruct']['aNull'] as Null),
          aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
            'dart:core#RegExp',
            request[r'aComplexStruct']['aRegExp'],
          ),
          aSimpleClass: _i2.SimpleClass.fromJson((request[r'aComplexStruct']
              ['aSimpleClass'] as Map<String, dynamic>)),
          aSimpleStruct: (),
          aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
            'dart:core#StackTrace',
            request[r'aComplexStruct']['aStackTrace'],
          ),
          aString: (request[r'aComplexStruct']['aString'] as String),
          aUint8List: _i3.Serializers.instance.deserialize<_i4.Uint8List>(
            'dart:typed_data#Uint8List',
            request[r'aComplexStruct']['aUint8List'],
          ),
          aUri: _i3.Serializers.instance.deserialize<Uri>(
            'dart:core#Uri',
            request[r'aComplexStruct']['aUri'],
          ),
          aUriData: _i3.Serializers.instance.deserialize<UriData>(
            'dart:core#UriData',
            request[r'aComplexStruct']['aUriData'],
          ),
          anEnum: _i2.MyEnum.values
              .byName((request[r'aComplexStruct']['anEnum'] as String)),
          anInt: (request[r'aComplexStruct']['anInt'] as int),
          anIterableOfSimpleClass: (request[r'aComplexStruct']
                  ['anIterableOfSimpleClass'] as Iterable<Object?>)
              .map((el) {
            (el as Map<String, Object?>);
            return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
          }).toList()
        ),
        _i2.SimpleClass.fromJson(
            (request[r'aSimpleClass'] as Map<String, dynamic>)),
        _i2.ComplexClass.fromJson(
            (request[r'aComplexClass'] as Map<String, dynamic>)),
        request[r'aNullableSimpleStruct'] == null ? null : (),
        request[r'aNullableComplexStruct'] == null
            ? null
            : (
                aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                  'dart:core#BigInt',
                  request[r'aNullableComplexStruct']['aBigInt'],
                ),
                aBool: (request[r'aNullableComplexStruct']['aBool'] as bool),
                aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                  'dart:core#DateTime',
                  request[r'aNullableComplexStruct']['aDateTime'],
                ),
                aDouble:
                    (request[r'aNullableComplexStruct']['aDouble'] as double),
                aDuration: _i3.Serializers.instance.deserialize<Duration>(
                  'dart:core#Duration',
                  request[r'aNullableComplexStruct']['aDuration'],
                ),
                aListOfBigInt: (request[r'aNullableComplexStruct']
                        ['aListOfBigInt'] as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<BigInt>(
                    'dart:core#BigInt',
                    el,
                  );
                }).toList(),
                aListOfBool: (request[r'aNullableComplexStruct']['aListOfBool']
                        as Iterable<Object?>)
                    .map((el) {
                  return (el as bool);
                }).toList(),
                aListOfDateTime: (request[r'aNullableComplexStruct']
                        ['aListOfDateTime'] as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<DateTime>(
                    'dart:core#DateTime',
                    el,
                  );
                }).toList(),
                aListOfDouble: (request[r'aNullableComplexStruct']
                        ['aListOfDouble'] as Iterable<Object?>)
                    .map((el) {
                  return (el as double);
                }).toList(),
                aListOfDuration: (request[r'aNullableComplexStruct']
                        ['aListOfDuration'] as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<Duration>(
                    'dart:core#Duration',
                    el,
                  );
                }).toList(),
                aListOfEnum: (request[r'aNullableComplexStruct']['aListOfEnum']
                        as Iterable<Object?>)
                    .map((el) {
                  return _i2.MyEnum.values.byName((el as String));
                }).toList(),
                aListOfInt: (request[r'aNullableComplexStruct']['aListOfInt']
                        as Iterable<Object?>)
                    .map((el) {
                  return (el as int);
                }).toList(),
                aListOfNull: (request[r'aNullableComplexStruct']['aListOfNull']
                        as Iterable<Object?>)
                    .map((el) {
                  return (el as Null);
                }).toList(),
                aListOfRegExp: (request[r'aNullableComplexStruct']
                        ['aListOfRegExp'] as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<RegExp>(
                    'dart:core#RegExp',
                    el,
                  );
                }).toList(),
                aListOfSimpleClass: (request[r'aNullableComplexStruct']
                        ['aListOfSimpleClass'] as Iterable<Object?>)
                    .map((el) {
                  (el as Map<String, Object?>);
                  return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
                }).toList(),
                aListOfSimpleStruct: (request[r'aNullableComplexStruct']
                        ['aListOfSimpleStruct'] as Iterable<Object?>)
                    .map((el) {
                  (el as Map<String, Object?>);
                  return ();
                }).toList(),
                aListOfStackTrace: (request[r'aNullableComplexStruct']
                        ['aListOfStackTrace'] as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<StackTrace>(
                    'dart:core#StackTrace',
                    el,
                  );
                }).toList(),
                aListOfString: (request[r'aNullableComplexStruct']
                        ['aListOfString'] as Iterable<Object?>)
                    .map((el) {
                  return (el as String);
                }).toList(),
                aListOfUint8List: (request[r'aNullableComplexStruct']
                        ['aListOfUint8List'] as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                    'dart:typed_data#Uint8List',
                    el,
                  );
                }).toList(),
                aListOfUri: (request[r'aNullableComplexStruct']['aListOfUri']
                        as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<Uri>(
                    'dart:core#Uri',
                    el,
                  );
                }).toList(),
                aListOfUriData: (request[r'aNullableComplexStruct']
                        ['aListOfUriData'] as Iterable<Object?>)
                    .map((el) {
                  return _i3.Serializers.instance.deserialize<UriData>(
                    'dart:core#UriData',
                    el,
                  );
                }).toList(),
                aMapOfBigInt: (request[r'aNullableComplexStruct']
                        ['aMapOfBigInt'] as Map<String, Object?>)
                    .map((
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
                aMapOfBool: (request[r'aNullableComplexStruct']['aMapOfBool']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as bool),
                  );
                }),
                aMapOfDateTime: (request[r'aNullableComplexStruct']
                        ['aMapOfDateTime'] as Map<String, Object?>)
                    .map((
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
                aMapOfDouble: (request[r'aNullableComplexStruct']
                        ['aMapOfDouble'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as double),
                  );
                }),
                aMapOfDuration: (request[r'aNullableComplexStruct']
                        ['aMapOfDuration'] as Map<String, Object?>)
                    .map((
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
                aMapOfEnum: (request[r'aNullableComplexStruct']['aMapOfEnum']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    _i2.MyEnum.values.byName((value as String)),
                  );
                }),
                aMapOfInt: (request[r'aNullableComplexStruct']['aMapOfInt']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as int),
                  );
                }),
                aMapOfNull: (request[r'aNullableComplexStruct']['aMapOfNull']
                        as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as Null),
                  );
                }),
                aMapOfRegExp: (request[r'aNullableComplexStruct']
                        ['aMapOfRegExp'] as Map<String, Object?>)
                    .map((
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
                aMapOfSimpleClass: (request[r'aNullableComplexStruct']
                        ['aMapOfSimpleClass'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  (value as Map<String, Object?>);
                  return MapEntry(
                    key,
                    _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                  );
                }),
                aMapOfSimpleStruct: (request[r'aNullableComplexStruct']
                        ['aMapOfSimpleStruct'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  (value as Map<String, Object?>);
                  return MapEntry(
                    key,
                    (),
                  );
                }),
                aMapOfStackTrace: (request[r'aNullableComplexStruct']
                        ['aMapOfStackTrace'] as Map<String, Object?>)
                    .map((
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
                aMapOfString: (request[r'aNullableComplexStruct']
                        ['aMapOfString'] as Map<String, Object?>)
                    .map((
                  key,
                  value,
                ) {
                  return MapEntry(
                    key,
                    (value as String),
                  );
                }),
                aMapOfUint8List: (request[r'aNullableComplexStruct']
                        ['aMapOfUint8List'] as Map<String, Object?>)
                    .map((
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
                aMapOfUri: (request[r'aNullableComplexStruct']['aMapOfUri']
                        as Map<String, Object?>)
                    .map((
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
                aMapOfUriData: (request[r'aNullableComplexStruct']
                        ['aMapOfUriData'] as Map<String, Object?>)
                    .map((
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
                aNull: (request[r'aNullableComplexStruct']['aNull'] as Null),
                aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                  'dart:core#RegExp',
                  request[r'aNullableComplexStruct']['aRegExp'],
                ),
                aSimpleClass: _i2.SimpleClass.fromJson(
                    (request[r'aNullableComplexStruct']['aSimpleClass']
                        as Map<String, dynamic>)),
                aSimpleStruct: (),
                aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
                  'dart:core#StackTrace',
                  request[r'aNullableComplexStruct']['aStackTrace'],
                ),
                aString:
                    (request[r'aNullableComplexStruct']['aString'] as String),
                aUint8List: _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                  'dart:typed_data#Uint8List',
                  request[r'aNullableComplexStruct']['aUint8List'],
                ),
                aUri: _i3.Serializers.instance.deserialize<Uri>(
                  'dart:core#Uri',
                  request[r'aNullableComplexStruct']['aUri'],
                ),
                aUriData: _i3.Serializers.instance.deserialize<UriData>(
                  'dart:core#UriData',
                  request[r'aNullableComplexStruct']['aUriData'],
                ),
                anEnum: _i2.MyEnum.values.byName(
                    (request[r'aNullableComplexStruct']['anEnum'] as String)),
                anInt: (request[r'aNullableComplexStruct']['anInt'] as int),
                anIterableOfSimpleClass: (request[r'aNullableComplexStruct']
                        ['anIterableOfSimpleClass'] as Iterable<Object?>)
                    .map((el) {
                  (el as Map<String, Object?>);
                  return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
                }).toList()
              ),
        request[r'aNullableSimpleClass'] == null
            ? null
            : _i2.SimpleClass?.fromJson(
                (request[r'aNullableSimpleClass'] as Map<String, dynamic>)),
        request[r'aNullableComplexClass'] == null
            ? null
            : _i2.ComplexClass?.fromJson(
                (request[r'aNullableComplexClass'] as Map<String, dynamic>)),
        (request[r'anIterableOfSimpleStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return ();
        }).toList(),
        (request[r'anIterableOfComplexStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return (
            aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
              'dart:core#BigInt',
              el['aBigInt'],
            ),
            aBool: (el['aBool'] as bool),
            aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
              'dart:core#DateTime',
              el['aDateTime'],
            ),
            aDouble: (el['aDouble'] as double),
            aDuration: _i3.Serializers.instance.deserialize<Duration>(
              'dart:core#Duration',
              el['aDuration'],
            ),
            aListOfBigInt: (el['aListOfBigInt'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<BigInt>(
                'dart:core#BigInt',
                el,
              );
            }).toList(),
            aListOfBool: (el['aListOfBool'] as Iterable<Object?>).map((el) {
              return (el as bool);
            }).toList(),
            aListOfDateTime:
                (el['aListOfDateTime'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<DateTime>(
                'dart:core#DateTime',
                el,
              );
            }).toList(),
            aListOfDouble: (el['aListOfDouble'] as Iterable<Object?>).map((el) {
              return (el as double);
            }).toList(),
            aListOfDuration:
                (el['aListOfDuration'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<Duration>(
                'dart:core#Duration',
                el,
              );
            }).toList(),
            aListOfEnum: (el['aListOfEnum'] as Iterable<Object?>).map((el) {
              return _i2.MyEnum.values.byName((el as String));
            }).toList(),
            aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
              return (el as int);
            }).toList(),
            aListOfNull: (el['aListOfNull'] as Iterable<Object?>).map((el) {
              return (el as Null);
            }).toList(),
            aListOfRegExp: (el['aListOfRegExp'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<RegExp>(
                'dart:core#RegExp',
                el,
              );
            }).toList(),
            aListOfSimpleClass:
                (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList(),
            aListOfSimpleStruct:
                (el['aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return ();
            }).toList(),
            aListOfStackTrace:
                (el['aListOfStackTrace'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<StackTrace>(
                'dart:core#StackTrace',
                el,
              );
            }).toList(),
            aListOfString: (el['aListOfString'] as Iterable<Object?>).map((el) {
              return (el as String);
            }).toList(),
            aListOfUint8List:
                (el['aListOfUint8List'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                'dart:typed_data#Uint8List',
                el,
              );
            }).toList(),
            aListOfUri: (el['aListOfUri'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<Uri>(
                'dart:core#Uri',
                el,
              );
            }).toList(),
            aListOfUriData:
                (el['aListOfUriData'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<UriData>(
                'dart:core#UriData',
                el,
              );
            }).toList(),
            aMapOfBigInt: (el['aMapOfBigInt'] as Map<String, Object?>).map((
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
            aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as bool),
              );
            }),
            aMapOfDateTime: (el['aMapOfDateTime'] as Map<String, Object?>).map((
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
            aMapOfDouble: (el['aMapOfDouble'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as double),
              );
            }),
            aMapOfDuration: (el['aMapOfDuration'] as Map<String, Object?>).map((
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
            aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                _i2.MyEnum.values.byName((value as String)),
              );
            }),
            aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as int),
              );
            }),
            aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as Null),
              );
            }),
            aMapOfRegExp: (el['aMapOfRegExp'] as Map<String, Object?>).map((
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
            aMapOfSimpleClass:
                (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
              );
            }),
            aMapOfSimpleStruct:
                (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                (),
              );
            }),
            aMapOfStackTrace:
                (el['aMapOfStackTrace'] as Map<String, Object?>).map((
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
            aMapOfString: (el['aMapOfString'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as String),
              );
            }),
            aMapOfUint8List:
                (el['aMapOfUint8List'] as Map<String, Object?>).map((
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
            aMapOfUri: (el['aMapOfUri'] as Map<String, Object?>).map((
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
            aMapOfUriData: (el['aMapOfUriData'] as Map<String, Object?>).map((
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
            aNull: (el['aNull'] as Null),
            aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
              'dart:core#RegExp',
              el['aRegExp'],
            ),
            aSimpleClass: _i2.SimpleClass.fromJson(
                (el['aSimpleClass'] as Map<String, dynamic>)),
            aSimpleStruct: (),
            aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
              'dart:core#StackTrace',
              el['aStackTrace'],
            ),
            aString: (el['aString'] as String),
            aUint8List: _i3.Serializers.instance.deserialize<_i4.Uint8List>(
              'dart:typed_data#Uint8List',
              el['aUint8List'],
            ),
            aUri: _i3.Serializers.instance.deserialize<Uri>(
              'dart:core#Uri',
              el['aUri'],
            ),
            aUriData: _i3.Serializers.instance.deserialize<UriData>(
              'dart:core#UriData',
              el['aUriData'],
            ),
            anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
            anInt: (el['anInt'] as int),
            anIterableOfSimpleClass:
                (el['anIterableOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList()
          );
        }).toList(),
        (request[r'anIterableOfSimpleClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'anIterableOfComplexClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        request[r'aNullableIterableOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableIterableOfSimpleStruct'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return ();
              }).toList(),
        request[r'aNullableIterableOfComplexStruct'] == null
            ? null
            : (request[r'aNullableIterableOfComplexStruct']
                    as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return (
                  aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                    'dart:core#BigInt',
                    el['aBigInt'],
                  ),
                  aBool: (el['aBool'] as bool),
                  aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                    'dart:core#DateTime',
                    el['aDateTime'],
                  ),
                  aDouble: (el['aDouble'] as double),
                  aDuration: _i3.Serializers.instance.deserialize<Duration>(
                    'dart:core#Duration',
                    el['aDuration'],
                  ),
                  aListOfBigInt:
                      (el['aListOfBigInt'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<BigInt>(
                      'dart:core#BigInt',
                      el,
                    );
                  }).toList(),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDateTime:
                      (el['aListOfDateTime'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<DateTime>(
                      'dart:core#DateTime',
                      el,
                    );
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfDuration:
                      (el['aListOfDuration'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Duration>(
                      'dart:core#Duration',
                      el,
                    );
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfRegExp:
                      (el['aListOfRegExp'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<RegExp>(
                      'dart:core#RegExp',
                      el,
                    );
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfStackTrace:
                      (el['aListOfStackTrace'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<StackTrace>(
                      'dart:core#StackTrace',
                      el,
                    );
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aListOfUint8List:
                      (el['aListOfUint8List'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                      'dart:typed_data#Uint8List',
                      el,
                    );
                  }).toList(),
                  aListOfUri: (el['aListOfUri'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Uri>(
                      'dart:core#Uri',
                      el,
                    );
                  }).toList(),
                  aListOfUriData:
                      (el['aListOfUriData'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<UriData>(
                      'dart:core#UriData',
                      el,
                    );
                  }).toList(),
                  aMapOfBigInt:
                      (el['aMapOfBigInt'] as Map<String, Object?>).map((
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
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDateTime:
                      (el['aMapOfDateTime'] as Map<String, Object?>).map((
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
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfDuration:
                      (el['aMapOfDuration'] as Map<String, Object?>).map((
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
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfRegExp:
                      (el['aMapOfRegExp'] as Map<String, Object?>).map((
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
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfStackTrace:
                      (el['aMapOfStackTrace'] as Map<String, Object?>).map((
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
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aMapOfUint8List:
                      (el['aMapOfUint8List'] as Map<String, Object?>).map((
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
                  aMapOfUri: (el['aMapOfUri'] as Map<String, Object?>).map((
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
                  aMapOfUriData:
                      (el['aMapOfUriData'] as Map<String, Object?>).map((
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
                  aNull: (el['aNull'] as Null),
                  aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                    'dart:core#RegExp',
                    el['aRegExp'],
                  ),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
                    'dart:core#StackTrace',
                    el['aStackTrace'],
                  ),
                  aString: (el['aString'] as String),
                  aUint8List:
                      _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                    'dart:typed_data#Uint8List',
                    el['aUint8List'],
                  ),
                  aUri: _i3.Serializers.instance.deserialize<Uri>(
                    'dart:core#Uri',
                    el['aUri'],
                  ),
                  aUriData: _i3.Serializers.instance.deserialize<UriData>(
                    'dart:core#UriData',
                    el['aUriData'],
                  ),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList()
                );
              }).toList(),
        request[r'aNullableIterableOfSimpleClass'] == null
            ? null
            : (request[r'aNullableIterableOfSimpleClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        request[r'aNullableIterableOfComplexClass'] == null
            ? null
            : (request[r'aNullableIterableOfComplexClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        (request[r'anIterableOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null ? null : ();
        }).toList(),
        (request[r'anIterableOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : (
                  aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                    'dart:core#BigInt',
                    el['aBigInt'],
                  ),
                  aBool: (el['aBool'] as bool),
                  aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                    'dart:core#DateTime',
                    el['aDateTime'],
                  ),
                  aDouble: (el['aDouble'] as double),
                  aDuration: _i3.Serializers.instance.deserialize<Duration>(
                    'dart:core#Duration',
                    el['aDuration'],
                  ),
                  aListOfBigInt:
                      (el['aListOfBigInt'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<BigInt>(
                      'dart:core#BigInt',
                      el,
                    );
                  }).toList(),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDateTime:
                      (el['aListOfDateTime'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<DateTime>(
                      'dart:core#DateTime',
                      el,
                    );
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfDuration:
                      (el['aListOfDuration'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Duration>(
                      'dart:core#Duration',
                      el,
                    );
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfRegExp:
                      (el['aListOfRegExp'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<RegExp>(
                      'dart:core#RegExp',
                      el,
                    );
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfStackTrace:
                      (el['aListOfStackTrace'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<StackTrace>(
                      'dart:core#StackTrace',
                      el,
                    );
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aListOfUint8List:
                      (el['aListOfUint8List'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                      'dart:typed_data#Uint8List',
                      el,
                    );
                  }).toList(),
                  aListOfUri: (el['aListOfUri'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Uri>(
                      'dart:core#Uri',
                      el,
                    );
                  }).toList(),
                  aListOfUriData:
                      (el['aListOfUriData'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<UriData>(
                      'dart:core#UriData',
                      el,
                    );
                  }).toList(),
                  aMapOfBigInt:
                      (el['aMapOfBigInt'] as Map<String, Object?>).map((
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
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDateTime:
                      (el['aMapOfDateTime'] as Map<String, Object?>).map((
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
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfDuration:
                      (el['aMapOfDuration'] as Map<String, Object?>).map((
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
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfRegExp:
                      (el['aMapOfRegExp'] as Map<String, Object?>).map((
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
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfStackTrace:
                      (el['aMapOfStackTrace'] as Map<String, Object?>).map((
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
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aMapOfUint8List:
                      (el['aMapOfUint8List'] as Map<String, Object?>).map((
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
                  aMapOfUri: (el['aMapOfUri'] as Map<String, Object?>).map((
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
                  aMapOfUriData:
                      (el['aMapOfUriData'] as Map<String, Object?>).map((
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
                  aNull: (el['aNull'] as Null),
                  aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                    'dart:core#RegExp',
                    el['aRegExp'],
                  ),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
                    'dart:core#StackTrace',
                    el['aStackTrace'],
                  ),
                  aString: (el['aString'] as String),
                  aUint8List:
                      _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                    'dart:typed_data#Uint8List',
                    el['aUint8List'],
                  ),
                  aUri: _i3.Serializers.instance.deserialize<Uri>(
                    'dart:core#Uri',
                    el['aUri'],
                  ),
                  aUriData: _i3.Serializers.instance.deserialize<UriData>(
                    'dart:core#UriData',
                    el['aUriData'],
                  ),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList()
                );
        }).toList(),
        (request[r'anIterableOfNullableSimpleClass'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.SimpleClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'anIterableOfNullableComplexClass'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.ComplexClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return ();
        }).toList(),
        (request[r'aListOfComplexStruct'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return (
            aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
              'dart:core#BigInt',
              el['aBigInt'],
            ),
            aBool: (el['aBool'] as bool),
            aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
              'dart:core#DateTime',
              el['aDateTime'],
            ),
            aDouble: (el['aDouble'] as double),
            aDuration: _i3.Serializers.instance.deserialize<Duration>(
              'dart:core#Duration',
              el['aDuration'],
            ),
            aListOfBigInt: (el['aListOfBigInt'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<BigInt>(
                'dart:core#BigInt',
                el,
              );
            }).toList(),
            aListOfBool: (el['aListOfBool'] as Iterable<Object?>).map((el) {
              return (el as bool);
            }).toList(),
            aListOfDateTime:
                (el['aListOfDateTime'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<DateTime>(
                'dart:core#DateTime',
                el,
              );
            }).toList(),
            aListOfDouble: (el['aListOfDouble'] as Iterable<Object?>).map((el) {
              return (el as double);
            }).toList(),
            aListOfDuration:
                (el['aListOfDuration'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<Duration>(
                'dart:core#Duration',
                el,
              );
            }).toList(),
            aListOfEnum: (el['aListOfEnum'] as Iterable<Object?>).map((el) {
              return _i2.MyEnum.values.byName((el as String));
            }).toList(),
            aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
              return (el as int);
            }).toList(),
            aListOfNull: (el['aListOfNull'] as Iterable<Object?>).map((el) {
              return (el as Null);
            }).toList(),
            aListOfRegExp: (el['aListOfRegExp'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<RegExp>(
                'dart:core#RegExp',
                el,
              );
            }).toList(),
            aListOfSimpleClass:
                (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList(),
            aListOfSimpleStruct:
                (el['aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return ();
            }).toList(),
            aListOfStackTrace:
                (el['aListOfStackTrace'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<StackTrace>(
                'dart:core#StackTrace',
                el,
              );
            }).toList(),
            aListOfString: (el['aListOfString'] as Iterable<Object?>).map((el) {
              return (el as String);
            }).toList(),
            aListOfUint8List:
                (el['aListOfUint8List'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                'dart:typed_data#Uint8List',
                el,
              );
            }).toList(),
            aListOfUri: (el['aListOfUri'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<Uri>(
                'dart:core#Uri',
                el,
              );
            }).toList(),
            aListOfUriData:
                (el['aListOfUriData'] as Iterable<Object?>).map((el) {
              return _i3.Serializers.instance.deserialize<UriData>(
                'dart:core#UriData',
                el,
              );
            }).toList(),
            aMapOfBigInt: (el['aMapOfBigInt'] as Map<String, Object?>).map((
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
            aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as bool),
              );
            }),
            aMapOfDateTime: (el['aMapOfDateTime'] as Map<String, Object?>).map((
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
            aMapOfDouble: (el['aMapOfDouble'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as double),
              );
            }),
            aMapOfDuration: (el['aMapOfDuration'] as Map<String, Object?>).map((
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
            aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                _i2.MyEnum.values.byName((value as String)),
              );
            }),
            aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as int),
              );
            }),
            aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as Null),
              );
            }),
            aMapOfRegExp: (el['aMapOfRegExp'] as Map<String, Object?>).map((
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
            aMapOfSimpleClass:
                (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
              );
            }),
            aMapOfSimpleStruct:
                (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              (value as Map<String, Object?>);
              return MapEntry(
                key,
                (),
              );
            }),
            aMapOfStackTrace:
                (el['aMapOfStackTrace'] as Map<String, Object?>).map((
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
            aMapOfString: (el['aMapOfString'] as Map<String, Object?>).map((
              key,
              value,
            ) {
              return MapEntry(
                key,
                (value as String),
              );
            }),
            aMapOfUint8List:
                (el['aMapOfUint8List'] as Map<String, Object?>).map((
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
            aMapOfUri: (el['aMapOfUri'] as Map<String, Object?>).map((
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
            aMapOfUriData: (el['aMapOfUriData'] as Map<String, Object?>).map((
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
            aNull: (el['aNull'] as Null),
            aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
              'dart:core#RegExp',
              el['aRegExp'],
            ),
            aSimpleClass: _i2.SimpleClass.fromJson(
                (el['aSimpleClass'] as Map<String, dynamic>)),
            aSimpleStruct: (),
            aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
              'dart:core#StackTrace',
              el['aStackTrace'],
            ),
            aString: (el['aString'] as String),
            aUint8List: _i3.Serializers.instance.deserialize<_i4.Uint8List>(
              'dart:typed_data#Uint8List',
              el['aUint8List'],
            ),
            aUri: _i3.Serializers.instance.deserialize<Uri>(
              'dart:core#Uri',
              el['aUri'],
            ),
            aUriData: _i3.Serializers.instance.deserialize<UriData>(
              'dart:core#UriData',
              el['aUriData'],
            ),
            anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
            anInt: (el['anInt'] as int),
            anIterableOfSimpleClass:
                (el['anIterableOfSimpleClass'] as Iterable<Object?>).map((el) {
              (el as Map<String, Object?>);
              return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
            }).toList()
          );
        }).toList(),
        (request[r'aListOfSimpleClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aListOfComplexClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>);
          return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
        }).toList(),
        request[r'aNullableListOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableListOfSimpleStruct'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return ();
              }).toList(),
        request[r'aNullableListOfComplexStruct'] == null
            ? null
            : (request[r'aNullableListOfComplexStruct'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return (
                  aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                    'dart:core#BigInt',
                    el['aBigInt'],
                  ),
                  aBool: (el['aBool'] as bool),
                  aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                    'dart:core#DateTime',
                    el['aDateTime'],
                  ),
                  aDouble: (el['aDouble'] as double),
                  aDuration: _i3.Serializers.instance.deserialize<Duration>(
                    'dart:core#Duration',
                    el['aDuration'],
                  ),
                  aListOfBigInt:
                      (el['aListOfBigInt'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<BigInt>(
                      'dart:core#BigInt',
                      el,
                    );
                  }).toList(),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDateTime:
                      (el['aListOfDateTime'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<DateTime>(
                      'dart:core#DateTime',
                      el,
                    );
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfDuration:
                      (el['aListOfDuration'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Duration>(
                      'dart:core#Duration',
                      el,
                    );
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfRegExp:
                      (el['aListOfRegExp'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<RegExp>(
                      'dart:core#RegExp',
                      el,
                    );
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfStackTrace:
                      (el['aListOfStackTrace'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<StackTrace>(
                      'dart:core#StackTrace',
                      el,
                    );
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aListOfUint8List:
                      (el['aListOfUint8List'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                      'dart:typed_data#Uint8List',
                      el,
                    );
                  }).toList(),
                  aListOfUri: (el['aListOfUri'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Uri>(
                      'dart:core#Uri',
                      el,
                    );
                  }).toList(),
                  aListOfUriData:
                      (el['aListOfUriData'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<UriData>(
                      'dart:core#UriData',
                      el,
                    );
                  }).toList(),
                  aMapOfBigInt:
                      (el['aMapOfBigInt'] as Map<String, Object?>).map((
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
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDateTime:
                      (el['aMapOfDateTime'] as Map<String, Object?>).map((
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
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfDuration:
                      (el['aMapOfDuration'] as Map<String, Object?>).map((
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
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfRegExp:
                      (el['aMapOfRegExp'] as Map<String, Object?>).map((
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
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfStackTrace:
                      (el['aMapOfStackTrace'] as Map<String, Object?>).map((
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
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aMapOfUint8List:
                      (el['aMapOfUint8List'] as Map<String, Object?>).map((
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
                  aMapOfUri: (el['aMapOfUri'] as Map<String, Object?>).map((
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
                  aMapOfUriData:
                      (el['aMapOfUriData'] as Map<String, Object?>).map((
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
                  aNull: (el['aNull'] as Null),
                  aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                    'dart:core#RegExp',
                    el['aRegExp'],
                  ),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
                    'dart:core#StackTrace',
                    el['aStackTrace'],
                  ),
                  aString: (el['aString'] as String),
                  aUint8List:
                      _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                    'dart:typed_data#Uint8List',
                    el['aUint8List'],
                  ),
                  aUri: _i3.Serializers.instance.deserialize<Uri>(
                    'dart:core#Uri',
                    el['aUri'],
                  ),
                  aUriData: _i3.Serializers.instance.deserialize<UriData>(
                    'dart:core#UriData',
                    el['aUriData'],
                  ),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList()
                );
              }).toList(),
        request[r'aNullableListOfSimpleClass'] == null
            ? null
            : (request[r'aNullableListOfSimpleClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        request[r'aNullableListOfComplexClass'] == null
            ? null
            : (request[r'aNullableListOfComplexClass'] as Iterable<Object?>)
                .map((el) {
                (el as Map<String, Object?>);
                return _i2.ComplexClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
        (request[r'aListOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null ? null : ();
        }).toList(),
        (request[r'aListOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : (
                  aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                    'dart:core#BigInt',
                    el['aBigInt'],
                  ),
                  aBool: (el['aBool'] as bool),
                  aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                    'dart:core#DateTime',
                    el['aDateTime'],
                  ),
                  aDouble: (el['aDouble'] as double),
                  aDuration: _i3.Serializers.instance.deserialize<Duration>(
                    'dart:core#Duration',
                    el['aDuration'],
                  ),
                  aListOfBigInt:
                      (el['aListOfBigInt'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<BigInt>(
                      'dart:core#BigInt',
                      el,
                    );
                  }).toList(),
                  aListOfBool:
                      (el['aListOfBool'] as Iterable<Object?>).map((el) {
                    return (el as bool);
                  }).toList(),
                  aListOfDateTime:
                      (el['aListOfDateTime'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<DateTime>(
                      'dart:core#DateTime',
                      el,
                    );
                  }).toList(),
                  aListOfDouble:
                      (el['aListOfDouble'] as Iterable<Object?>).map((el) {
                    return (el as double);
                  }).toList(),
                  aListOfDuration:
                      (el['aListOfDuration'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Duration>(
                      'dart:core#Duration',
                      el,
                    );
                  }).toList(),
                  aListOfEnum:
                      (el['aListOfEnum'] as Iterable<Object?>).map((el) {
                    return _i2.MyEnum.values.byName((el as String));
                  }).toList(),
                  aListOfInt: (el['aListOfInt'] as Iterable<Object?>).map((el) {
                    return (el as int);
                  }).toList(),
                  aListOfNull:
                      (el['aListOfNull'] as Iterable<Object?>).map((el) {
                    return (el as Null);
                  }).toList(),
                  aListOfRegExp:
                      (el['aListOfRegExp'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<RegExp>(
                      'dart:core#RegExp',
                      el,
                    );
                  }).toList(),
                  aListOfSimpleClass:
                      (el['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList(),
                  aListOfSimpleStruct:
                      (el['aListOfSimpleStruct'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return ();
                  }).toList(),
                  aListOfStackTrace:
                      (el['aListOfStackTrace'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<StackTrace>(
                      'dart:core#StackTrace',
                      el,
                    );
                  }).toList(),
                  aListOfString:
                      (el['aListOfString'] as Iterable<Object?>).map((el) {
                    return (el as String);
                  }).toList(),
                  aListOfUint8List:
                      (el['aListOfUint8List'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                      'dart:typed_data#Uint8List',
                      el,
                    );
                  }).toList(),
                  aListOfUri: (el['aListOfUri'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<Uri>(
                      'dart:core#Uri',
                      el,
                    );
                  }).toList(),
                  aListOfUriData:
                      (el['aListOfUriData'] as Iterable<Object?>).map((el) {
                    return _i3.Serializers.instance.deserialize<UriData>(
                      'dart:core#UriData',
                      el,
                    );
                  }).toList(),
                  aMapOfBigInt:
                      (el['aMapOfBigInt'] as Map<String, Object?>).map((
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
                  aMapOfBool: (el['aMapOfBool'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as bool),
                    );
                  }),
                  aMapOfDateTime:
                      (el['aMapOfDateTime'] as Map<String, Object?>).map((
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
                  aMapOfDouble:
                      (el['aMapOfDouble'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as double),
                    );
                  }),
                  aMapOfDuration:
                      (el['aMapOfDuration'] as Map<String, Object?>).map((
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
                  aMapOfEnum: (el['aMapOfEnum'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      _i2.MyEnum.values.byName((value as String)),
                    );
                  }),
                  aMapOfInt: (el['aMapOfInt'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as int),
                    );
                  }),
                  aMapOfNull: (el['aMapOfNull'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as Null),
                    );
                  }),
                  aMapOfRegExp:
                      (el['aMapOfRegExp'] as Map<String, Object?>).map((
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
                  aMapOfSimpleClass:
                      (el['aMapOfSimpleClass'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                    );
                  }),
                  aMapOfSimpleStruct:
                      (el['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    (value as Map<String, Object?>);
                    return MapEntry(
                      key,
                      (),
                    );
                  }),
                  aMapOfStackTrace:
                      (el['aMapOfStackTrace'] as Map<String, Object?>).map((
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
                  aMapOfString:
                      (el['aMapOfString'] as Map<String, Object?>).map((
                    key,
                    value,
                  ) {
                    return MapEntry(
                      key,
                      (value as String),
                    );
                  }),
                  aMapOfUint8List:
                      (el['aMapOfUint8List'] as Map<String, Object?>).map((
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
                  aMapOfUri: (el['aMapOfUri'] as Map<String, Object?>).map((
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
                  aMapOfUriData:
                      (el['aMapOfUriData'] as Map<String, Object?>).map((
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
                  aNull: (el['aNull'] as Null),
                  aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                    'dart:core#RegExp',
                    el['aRegExp'],
                  ),
                  aSimpleClass: _i2.SimpleClass.fromJson(
                      (el['aSimpleClass'] as Map<String, dynamic>)),
                  aSimpleStruct: (),
                  aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
                    'dart:core#StackTrace',
                    el['aStackTrace'],
                  ),
                  aString: (el['aString'] as String),
                  aUint8List:
                      _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                    'dart:typed_data#Uint8List',
                    el['aUint8List'],
                  ),
                  aUri: _i3.Serializers.instance.deserialize<Uri>(
                    'dart:core#Uri',
                    el['aUri'],
                  ),
                  aUriData: _i3.Serializers.instance.deserialize<UriData>(
                    'dart:core#UriData',
                    el['aUriData'],
                  ),
                  anEnum: _i2.MyEnum.values.byName((el['anEnum'] as String)),
                  anInt: (el['anInt'] as int),
                  anIterableOfSimpleClass:
                      (el['anIterableOfSimpleClass'] as Iterable<Object?>)
                          .map((el) {
                    (el as Map<String, Object?>);
                    return _i2.SimpleClass.fromJson(
                        (el as Map<String, dynamic>));
                  }).toList()
                );
        }).toList(),
        (request[r'aListOfNullableSimpleClass'] as Iterable<Object?>).map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.SimpleClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aListOfNullableComplexClass'] as Iterable<Object?>)
            .map((el) {
          (el as Map<String, Object?>?);
          return el == null
              ? null
              : _i2.ComplexClass?.fromJson((el as Map<String, dynamic>));
        }).toList(),
        (request[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            (),
          );
        }),
        (request[r'aMapOfComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            (
              aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                'dart:core#BigInt',
                value['aBigInt'],
              ),
              aBool: (value['aBool'] as bool),
              aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                'dart:core#DateTime',
                value['aDateTime'],
              ),
              aDouble: (value['aDouble'] as double),
              aDuration: _i3.Serializers.instance.deserialize<Duration>(
                'dart:core#Duration',
                value['aDuration'],
              ),
              aListOfBigInt:
                  (value['aListOfBigInt'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<BigInt>(
                  'dart:core#BigInt',
                  el,
                );
              }).toList(),
              aListOfBool:
                  (value['aListOfBool'] as Iterable<Object?>).map((el) {
                return (el as bool);
              }).toList(),
              aListOfDateTime:
                  (value['aListOfDateTime'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<DateTime>(
                  'dart:core#DateTime',
                  el,
                );
              }).toList(),
              aListOfDouble:
                  (value['aListOfDouble'] as Iterable<Object?>).map((el) {
                return (el as double);
              }).toList(),
              aListOfDuration:
                  (value['aListOfDuration'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<Duration>(
                  'dart:core#Duration',
                  el,
                );
              }).toList(),
              aListOfEnum:
                  (value['aListOfEnum'] as Iterable<Object?>).map((el) {
                return _i2.MyEnum.values.byName((el as String));
              }).toList(),
              aListOfInt: (value['aListOfInt'] as Iterable<Object?>).map((el) {
                return (el as int);
              }).toList(),
              aListOfNull:
                  (value['aListOfNull'] as Iterable<Object?>).map((el) {
                return (el as Null);
              }).toList(),
              aListOfRegExp:
                  (value['aListOfRegExp'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<RegExp>(
                  'dart:core#RegExp',
                  el,
                );
              }).toList(),
              aListOfSimpleClass:
                  (value['aListOfSimpleClass'] as Iterable<Object?>).map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList(),
              aListOfSimpleStruct:
                  (value['aListOfSimpleStruct'] as Iterable<Object?>).map((el) {
                (el as Map<String, Object?>);
                return ();
              }).toList(),
              aListOfStackTrace:
                  (value['aListOfStackTrace'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<StackTrace>(
                  'dart:core#StackTrace',
                  el,
                );
              }).toList(),
              aListOfString:
                  (value['aListOfString'] as Iterable<Object?>).map((el) {
                return (el as String);
              }).toList(),
              aListOfUint8List:
                  (value['aListOfUint8List'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                  'dart:typed_data#Uint8List',
                  el,
                );
              }).toList(),
              aListOfUri: (value['aListOfUri'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<Uri>(
                  'dart:core#Uri',
                  el,
                );
              }).toList(),
              aListOfUriData:
                  (value['aListOfUriData'] as Iterable<Object?>).map((el) {
                return _i3.Serializers.instance.deserialize<UriData>(
                  'dart:core#UriData',
                  el,
                );
              }).toList(),
              aMapOfBigInt:
                  (value['aMapOfBigInt'] as Map<String, Object?>).map((
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
              aMapOfBool: (value['aMapOfBool'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as bool),
                );
              }),
              aMapOfDateTime:
                  (value['aMapOfDateTime'] as Map<String, Object?>).map((
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
              aMapOfDouble:
                  (value['aMapOfDouble'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as double),
                );
              }),
              aMapOfDuration:
                  (value['aMapOfDuration'] as Map<String, Object?>).map((
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
              aMapOfEnum: (value['aMapOfEnum'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  _i2.MyEnum.values.byName((value as String)),
                );
              }),
              aMapOfInt: (value['aMapOfInt'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as int),
                );
              }),
              aMapOfNull: (value['aMapOfNull'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as Null),
                );
              }),
              aMapOfRegExp:
                  (value['aMapOfRegExp'] as Map<String, Object?>).map((
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
              aMapOfSimpleClass:
                  (value['aMapOfSimpleClass'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                );
              }),
              aMapOfSimpleStruct:
                  (value['aMapOfSimpleStruct'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  (),
                );
              }),
              aMapOfStackTrace:
                  (value['aMapOfStackTrace'] as Map<String, Object?>).map((
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
              aMapOfString:
                  (value['aMapOfString'] as Map<String, Object?>).map((
                key,
                value,
              ) {
                return MapEntry(
                  key,
                  (value as String),
                );
              }),
              aMapOfUint8List:
                  (value['aMapOfUint8List'] as Map<String, Object?>).map((
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
              aMapOfUri: (value['aMapOfUri'] as Map<String, Object?>).map((
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
              aMapOfUriData:
                  (value['aMapOfUriData'] as Map<String, Object?>).map((
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
              aNull: (value['aNull'] as Null),
              aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                'dart:core#RegExp',
                value['aRegExp'],
              ),
              aSimpleClass: _i2.SimpleClass.fromJson(
                  (value['aSimpleClass'] as Map<String, dynamic>)),
              aSimpleStruct: (),
              aStackTrace: _i3.Serializers.instance.deserialize<StackTrace>(
                'dart:core#StackTrace',
                value['aStackTrace'],
              ),
              aString: (value['aString'] as String),
              aUint8List: _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                'dart:typed_data#Uint8List',
                value['aUint8List'],
              ),
              aUri: _i3.Serializers.instance.deserialize<Uri>(
                'dart:core#Uri',
                value['aUri'],
              ),
              aUriData: _i3.Serializers.instance.deserialize<UriData>(
                'dart:core#UriData',
                value['aUriData'],
              ),
              anEnum: _i2.MyEnum.values.byName((value['anEnum'] as String)),
              anInt: (value['anInt'] as int),
              anIterableOfSimpleClass:
                  (value['anIterableOfSimpleClass'] as Iterable<Object?>)
                      .map((el) {
                (el as Map<String, Object?>);
                return _i2.SimpleClass.fromJson((el as Map<String, dynamic>));
              }).toList()
            ),
          );
        }),
        (request[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
        (request[r'aMapOfComplexClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i2.ComplexClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
        request[r'aNullableMapOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableMapOfSimpleStruct'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  (),
                );
              }),
        request[r'aNullableMapOfComplexStruct'] == null
            ? null
            : (request[r'aNullableMapOfComplexStruct'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  (
                    aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                      'dart:core#BigInt',
                      value['aBigInt'],
                    ),
                    aBool: (value['aBool'] as bool),
                    aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                      'dart:core#DateTime',
                      value['aDateTime'],
                    ),
                    aDouble: (value['aDouble'] as double),
                    aDuration: _i3.Serializers.instance.deserialize<Duration>(
                      'dart:core#Duration',
                      value['aDuration'],
                    ),
                    aListOfBigInt:
                        (value['aListOfBigInt'] as Iterable<Object?>).map((el) {
                      return _i3.Serializers.instance.deserialize<BigInt>(
                        'dart:core#BigInt',
                        el,
                      );
                    }).toList(),
                    aListOfBool:
                        (value['aListOfBool'] as Iterable<Object?>).map((el) {
                      return (el as bool);
                    }).toList(),
                    aListOfDateTime:
                        (value['aListOfDateTime'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<DateTime>(
                        'dart:core#DateTime',
                        el,
                      );
                    }).toList(),
                    aListOfDouble:
                        (value['aListOfDouble'] as Iterable<Object?>).map((el) {
                      return (el as double);
                    }).toList(),
                    aListOfDuration:
                        (value['aListOfDuration'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<Duration>(
                        'dart:core#Duration',
                        el,
                      );
                    }).toList(),
                    aListOfEnum:
                        (value['aListOfEnum'] as Iterable<Object?>).map((el) {
                      return _i2.MyEnum.values.byName((el as String));
                    }).toList(),
                    aListOfInt:
                        (value['aListOfInt'] as Iterable<Object?>).map((el) {
                      return (el as int);
                    }).toList(),
                    aListOfNull:
                        (value['aListOfNull'] as Iterable<Object?>).map((el) {
                      return (el as Null);
                    }).toList(),
                    aListOfRegExp:
                        (value['aListOfRegExp'] as Iterable<Object?>).map((el) {
                      return _i3.Serializers.instance.deserialize<RegExp>(
                        'dart:core#RegExp',
                        el,
                      );
                    }).toList(),
                    aListOfSimpleClass:
                        (value['aListOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList(),
                    aListOfSimpleStruct:
                        (value['aListOfSimpleStruct'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return ();
                    }).toList(),
                    aListOfStackTrace:
                        (value['aListOfStackTrace'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<StackTrace>(
                        'dart:core#StackTrace',
                        el,
                      );
                    }).toList(),
                    aListOfString:
                        (value['aListOfString'] as Iterable<Object?>).map((el) {
                      return (el as String);
                    }).toList(),
                    aListOfUint8List:
                        (value['aListOfUint8List'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance
                          .deserialize<_i4.Uint8List>(
                        'dart:typed_data#Uint8List',
                        el,
                      );
                    }).toList(),
                    aListOfUri:
                        (value['aListOfUri'] as Iterable<Object?>).map((el) {
                      return _i3.Serializers.instance.deserialize<Uri>(
                        'dart:core#Uri',
                        el,
                      );
                    }).toList(),
                    aListOfUriData:
                        (value['aListOfUriData'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<UriData>(
                        'dart:core#UriData',
                        el,
                      );
                    }).toList(),
                    aMapOfBigInt:
                        (value['aMapOfBigInt'] as Map<String, Object?>).map((
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
                    aMapOfBool:
                        (value['aMapOfBool'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as bool),
                      );
                    }),
                    aMapOfDateTime:
                        (value['aMapOfDateTime'] as Map<String, Object?>).map((
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
                    aMapOfDouble:
                        (value['aMapOfDouble'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as double),
                      );
                    }),
                    aMapOfDuration:
                        (value['aMapOfDuration'] as Map<String, Object?>).map((
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
                    aMapOfEnum:
                        (value['aMapOfEnum'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        _i2.MyEnum.values.byName((value as String)),
                      );
                    }),
                    aMapOfInt:
                        (value['aMapOfInt'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as int),
                      );
                    }),
                    aMapOfNull:
                        (value['aMapOfNull'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as Null),
                      );
                    }),
                    aMapOfRegExp:
                        (value['aMapOfRegExp'] as Map<String, Object?>).map((
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
                    aMapOfSimpleClass:
                        (value['aMapOfSimpleClass'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        _i2.SimpleClass.fromJson(
                            (value as Map<String, dynamic>)),
                      );
                    }),
                    aMapOfSimpleStruct:
                        (value['aMapOfSimpleStruct'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        (),
                      );
                    }),
                    aMapOfStackTrace:
                        (value['aMapOfStackTrace'] as Map<String, Object?>)
                            .map((
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
                    aMapOfString:
                        (value['aMapOfString'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as String),
                      );
                    }),
                    aMapOfUint8List:
                        (value['aMapOfUint8List'] as Map<String, Object?>).map((
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
                    aMapOfUri:
                        (value['aMapOfUri'] as Map<String, Object?>).map((
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
                    aMapOfUriData:
                        (value['aMapOfUriData'] as Map<String, Object?>).map((
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
                    aNull: (value['aNull'] as Null),
                    aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                      'dart:core#RegExp',
                      value['aRegExp'],
                    ),
                    aSimpleClass: _i2.SimpleClass.fromJson(
                        (value['aSimpleClass'] as Map<String, dynamic>)),
                    aSimpleStruct: (),
                    aStackTrace:
                        _i3.Serializers.instance.deserialize<StackTrace>(
                      'dart:core#StackTrace',
                      value['aStackTrace'],
                    ),
                    aString: (value['aString'] as String),
                    aUint8List:
                        _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                      'dart:typed_data#Uint8List',
                      value['aUint8List'],
                    ),
                    aUri: _i3.Serializers.instance.deserialize<Uri>(
                      'dart:core#Uri',
                      value['aUri'],
                    ),
                    aUriData: _i3.Serializers.instance.deserialize<UriData>(
                      'dart:core#UriData',
                      value['aUriData'],
                    ),
                    anEnum:
                        _i2.MyEnum.values.byName((value['anEnum'] as String)),
                    anInt: (value['anInt'] as int),
                    anIterableOfSimpleClass:
                        (value['anIterableOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList()
                  ),
                );
              }),
        request[r'aNullableMapOfSimpleClass'] == null
            ? null
            : (request[r'aNullableMapOfSimpleClass'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
                );
              }),
        request[r'aNullableMapOfComplexClass'] == null
            ? null
            : (request[r'aNullableMapOfComplexClass'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>);
                return MapEntry(
                  key,
                  _i2.ComplexClass.fromJson((value as Map<String, dynamic>)),
                );
              }),
        (request[r'aMapOfNullableSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null ? null : (),
          );
        }),
        (request[r'aMapOfNullableComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : (
                    aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                      'dart:core#BigInt',
                      value['aBigInt'],
                    ),
                    aBool: (value['aBool'] as bool),
                    aDateTime: _i3.Serializers.instance.deserialize<DateTime>(
                      'dart:core#DateTime',
                      value['aDateTime'],
                    ),
                    aDouble: (value['aDouble'] as double),
                    aDuration: _i3.Serializers.instance.deserialize<Duration>(
                      'dart:core#Duration',
                      value['aDuration'],
                    ),
                    aListOfBigInt:
                        (value['aListOfBigInt'] as Iterable<Object?>).map((el) {
                      return _i3.Serializers.instance.deserialize<BigInt>(
                        'dart:core#BigInt',
                        el,
                      );
                    }).toList(),
                    aListOfBool:
                        (value['aListOfBool'] as Iterable<Object?>).map((el) {
                      return (el as bool);
                    }).toList(),
                    aListOfDateTime:
                        (value['aListOfDateTime'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<DateTime>(
                        'dart:core#DateTime',
                        el,
                      );
                    }).toList(),
                    aListOfDouble:
                        (value['aListOfDouble'] as Iterable<Object?>).map((el) {
                      return (el as double);
                    }).toList(),
                    aListOfDuration:
                        (value['aListOfDuration'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<Duration>(
                        'dart:core#Duration',
                        el,
                      );
                    }).toList(),
                    aListOfEnum:
                        (value['aListOfEnum'] as Iterable<Object?>).map((el) {
                      return _i2.MyEnum.values.byName((el as String));
                    }).toList(),
                    aListOfInt:
                        (value['aListOfInt'] as Iterable<Object?>).map((el) {
                      return (el as int);
                    }).toList(),
                    aListOfNull:
                        (value['aListOfNull'] as Iterable<Object?>).map((el) {
                      return (el as Null);
                    }).toList(),
                    aListOfRegExp:
                        (value['aListOfRegExp'] as Iterable<Object?>).map((el) {
                      return _i3.Serializers.instance.deserialize<RegExp>(
                        'dart:core#RegExp',
                        el,
                      );
                    }).toList(),
                    aListOfSimpleClass:
                        (value['aListOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList(),
                    aListOfSimpleStruct:
                        (value['aListOfSimpleStruct'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return ();
                    }).toList(),
                    aListOfStackTrace:
                        (value['aListOfStackTrace'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<StackTrace>(
                        'dart:core#StackTrace',
                        el,
                      );
                    }).toList(),
                    aListOfString:
                        (value['aListOfString'] as Iterable<Object?>).map((el) {
                      return (el as String);
                    }).toList(),
                    aListOfUint8List:
                        (value['aListOfUint8List'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance
                          .deserialize<_i4.Uint8List>(
                        'dart:typed_data#Uint8List',
                        el,
                      );
                    }).toList(),
                    aListOfUri:
                        (value['aListOfUri'] as Iterable<Object?>).map((el) {
                      return _i3.Serializers.instance.deserialize<Uri>(
                        'dart:core#Uri',
                        el,
                      );
                    }).toList(),
                    aListOfUriData:
                        (value['aListOfUriData'] as Iterable<Object?>)
                            .map((el) {
                      return _i3.Serializers.instance.deserialize<UriData>(
                        'dart:core#UriData',
                        el,
                      );
                    }).toList(),
                    aMapOfBigInt:
                        (value['aMapOfBigInt'] as Map<String, Object?>).map((
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
                    aMapOfBool:
                        (value['aMapOfBool'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as bool),
                      );
                    }),
                    aMapOfDateTime:
                        (value['aMapOfDateTime'] as Map<String, Object?>).map((
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
                    aMapOfDouble:
                        (value['aMapOfDouble'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as double),
                      );
                    }),
                    aMapOfDuration:
                        (value['aMapOfDuration'] as Map<String, Object?>).map((
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
                    aMapOfEnum:
                        (value['aMapOfEnum'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        _i2.MyEnum.values.byName((value as String)),
                      );
                    }),
                    aMapOfInt:
                        (value['aMapOfInt'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as int),
                      );
                    }),
                    aMapOfNull:
                        (value['aMapOfNull'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as Null),
                      );
                    }),
                    aMapOfRegExp:
                        (value['aMapOfRegExp'] as Map<String, Object?>).map((
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
                    aMapOfSimpleClass:
                        (value['aMapOfSimpleClass'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        _i2.SimpleClass.fromJson(
                            (value as Map<String, dynamic>)),
                      );
                    }),
                    aMapOfSimpleStruct:
                        (value['aMapOfSimpleStruct'] as Map<String, Object?>)
                            .map((
                      key,
                      value,
                    ) {
                      (value as Map<String, Object?>);
                      return MapEntry(
                        key,
                        (),
                      );
                    }),
                    aMapOfStackTrace:
                        (value['aMapOfStackTrace'] as Map<String, Object?>)
                            .map((
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
                    aMapOfString:
                        (value['aMapOfString'] as Map<String, Object?>).map((
                      key,
                      value,
                    ) {
                      return MapEntry(
                        key,
                        (value as String),
                      );
                    }),
                    aMapOfUint8List:
                        (value['aMapOfUint8List'] as Map<String, Object?>).map((
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
                    aMapOfUri:
                        (value['aMapOfUri'] as Map<String, Object?>).map((
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
                    aMapOfUriData:
                        (value['aMapOfUriData'] as Map<String, Object?>).map((
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
                    aNull: (value['aNull'] as Null),
                    aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                      'dart:core#RegExp',
                      value['aRegExp'],
                    ),
                    aSimpleClass: _i2.SimpleClass.fromJson(
                        (value['aSimpleClass'] as Map<String, dynamic>)),
                    aSimpleStruct: (),
                    aStackTrace:
                        _i3.Serializers.instance.deserialize<StackTrace>(
                      'dart:core#StackTrace',
                      value['aStackTrace'],
                    ),
                    aString: (value['aString'] as String),
                    aUint8List:
                        _i3.Serializers.instance.deserialize<_i4.Uint8List>(
                      'dart:typed_data#Uint8List',
                      value['aUint8List'],
                    ),
                    aUri: _i3.Serializers.instance.deserialize<Uri>(
                      'dart:core#Uri',
                      value['aUri'],
                    ),
                    aUriData: _i3.Serializers.instance.deserialize<UriData>(
                      'dart:core#UriData',
                      value['aUriData'],
                    ),
                    anEnum:
                        _i2.MyEnum.values.byName((value['anEnum'] as String)),
                    anInt: (value['anInt'] as int),
                    anIterableOfSimpleClass:
                        (value['anIterableOfSimpleClass'] as Iterable<Object?>)
                            .map((el) {
                      (el as Map<String, Object?>);
                      return _i2.SimpleClass.fromJson(
                          (el as Map<String, dynamic>));
                    }).toList()
                  ),
          );
        }),
        (request[r'aMapOfNullableSimpleClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : _i2.SimpleClass?.fromJson((value as Map<String, dynamic>)),
          );
        }),
        (request[r'aMapOfNullableComplexClass'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : _i2.ComplexClass?.fromJson((value as Map<String, dynamic>)),
          );
        }),
        request[r'aNullableMapOfNullableSimpleStruct'] == null
            ? null
            : (request[r'aNullableMapOfNullableSimpleStruct']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null ? null : (),
                );
              }),
        request[r'aNullableMapOfNullableComplexStruct'] == null
            ? null
            : (request[r'aNullableMapOfNullableComplexStruct']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null
                      ? null
                      : (
                          aBigInt: _i3.Serializers.instance.deserialize<BigInt>(
                            'dart:core#BigInt',
                            value['aBigInt'],
                          ),
                          aBool: (value['aBool'] as bool),
                          aDateTime:
                              _i3.Serializers.instance.deserialize<DateTime>(
                            'dart:core#DateTime',
                            value['aDateTime'],
                          ),
                          aDouble: (value['aDouble'] as double),
                          aDuration:
                              _i3.Serializers.instance.deserialize<Duration>(
                            'dart:core#Duration',
                            value['aDuration'],
                          ),
                          aListOfBigInt:
                              (value['aListOfBigInt'] as Iterable<Object?>)
                                  .map((el) {
                            return _i3.Serializers.instance.deserialize<BigInt>(
                              'dart:core#BigInt',
                              el,
                            );
                          }).toList(),
                          aListOfBool:
                              (value['aListOfBool'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as bool);
                          }).toList(),
                          aListOfDateTime:
                              (value['aListOfDateTime'] as Iterable<Object?>)
                                  .map((el) {
                            return _i3.Serializers.instance
                                .deserialize<DateTime>(
                              'dart:core#DateTime',
                              el,
                            );
                          }).toList(),
                          aListOfDouble:
                              (value['aListOfDouble'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as double);
                          }).toList(),
                          aListOfDuration:
                              (value['aListOfDuration'] as Iterable<Object?>)
                                  .map((el) {
                            return _i3.Serializers.instance
                                .deserialize<Duration>(
                              'dart:core#Duration',
                              el,
                            );
                          }).toList(),
                          aListOfEnum:
                              (value['aListOfEnum'] as Iterable<Object?>)
                                  .map((el) {
                            return _i2.MyEnum.values.byName((el as String));
                          }).toList(),
                          aListOfInt: (value['aListOfInt'] as Iterable<Object?>)
                              .map((el) {
                            return (el as int);
                          }).toList(),
                          aListOfNull:
                              (value['aListOfNull'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as Null);
                          }).toList(),
                          aListOfRegExp:
                              (value['aListOfRegExp'] as Iterable<Object?>)
                                  .map((el) {
                            return _i3.Serializers.instance.deserialize<RegExp>(
                              'dart:core#RegExp',
                              el,
                            );
                          }).toList(),
                          aListOfSimpleClass:
                              (value['aListOfSimpleClass'] as Iterable<Object?>)
                                  .map((el) {
                            (el as Map<String, Object?>);
                            return _i2.SimpleClass.fromJson(
                                (el as Map<String, dynamic>));
                          }).toList(),
                          aListOfSimpleStruct: (value['aListOfSimpleStruct']
                                  as Iterable<Object?>)
                              .map((el) {
                            (el as Map<String, Object?>);
                            return ();
                          }).toList(),
                          aListOfStackTrace:
                              (value['aListOfStackTrace'] as Iterable<Object?>)
                                  .map((el) {
                            return _i3.Serializers.instance
                                .deserialize<StackTrace>(
                              'dart:core#StackTrace',
                              el,
                            );
                          }).toList(),
                          aListOfString:
                              (value['aListOfString'] as Iterable<Object?>)
                                  .map((el) {
                            return (el as String);
                          }).toList(),
                          aListOfUint8List:
                              (value['aListOfUint8List'] as Iterable<Object?>)
                                  .map((el) {
                            return _i3.Serializers.instance
                                .deserialize<_i4.Uint8List>(
                              'dart:typed_data#Uint8List',
                              el,
                            );
                          }).toList(),
                          aListOfUri: (value['aListOfUri'] as Iterable<Object?>)
                              .map((el) {
                            return _i3.Serializers.instance.deserialize<Uri>(
                              'dart:core#Uri',
                              el,
                            );
                          }).toList(),
                          aListOfUriData:
                              (value['aListOfUriData'] as Iterable<Object?>)
                                  .map((el) {
                            return _i3.Serializers.instance
                                .deserialize<UriData>(
                              'dart:core#UriData',
                              el,
                            );
                          }).toList(),
                          aMapOfBigInt:
                              (value['aMapOfBigInt'] as Map<String, Object?>)
                                  .map((
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
                          aMapOfBool:
                              (value['aMapOfBool'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as bool),
                            );
                          }),
                          aMapOfDateTime:
                              (value['aMapOfDateTime'] as Map<String, Object?>)
                                  .map((
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
                          aMapOfDouble:
                              (value['aMapOfDouble'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as double),
                            );
                          }),
                          aMapOfDuration:
                              (value['aMapOfDuration'] as Map<String, Object?>)
                                  .map((
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
                          aMapOfEnum:
                              (value['aMapOfEnum'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              _i2.MyEnum.values.byName((value as String)),
                            );
                          }),
                          aMapOfInt:
                              (value['aMapOfInt'] as Map<String, Object?>).map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as int),
                            );
                          }),
                          aMapOfNull:
                              (value['aMapOfNull'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as Null),
                            );
                          }),
                          aMapOfRegExp:
                              (value['aMapOfRegExp'] as Map<String, Object?>)
                                  .map((
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
                          aMapOfSimpleClass: (value['aMapOfSimpleClass']
                                  as Map<String, Object?>)
                              .map((
                            key,
                            value,
                          ) {
                            (value as Map<String, Object?>);
                            return MapEntry(
                              key,
                              _i2.SimpleClass.fromJson(
                                  (value as Map<String, dynamic>)),
                            );
                          }),
                          aMapOfSimpleStruct: (value['aMapOfSimpleStruct']
                                  as Map<String, Object?>)
                              .map((
                            key,
                            value,
                          ) {
                            (value as Map<String, Object?>);
                            return MapEntry(
                              key,
                              (),
                            );
                          }),
                          aMapOfStackTrace: (value['aMapOfStackTrace']
                                  as Map<String, Object?>)
                              .map((
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
                          aMapOfString:
                              (value['aMapOfString'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              (value as String),
                            );
                          }),
                          aMapOfUint8List:
                              (value['aMapOfUint8List'] as Map<String, Object?>)
                                  .map((
                            key,
                            value,
                          ) {
                            return MapEntry(
                              key,
                              _i3.Serializers.instance
                                  .deserialize<_i4.Uint8List>(
                                'dart:typed_data#Uint8List',
                                value,
                              ),
                            );
                          }),
                          aMapOfUri:
                              (value['aMapOfUri'] as Map<String, Object?>).map((
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
                          aMapOfUriData:
                              (value['aMapOfUriData'] as Map<String, Object?>)
                                  .map((
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
                          aNull: (value['aNull'] as Null),
                          aRegExp: _i3.Serializers.instance.deserialize<RegExp>(
                            'dart:core#RegExp',
                            value['aRegExp'],
                          ),
                          aSimpleClass: _i2.SimpleClass.fromJson(
                              (value['aSimpleClass'] as Map<String, dynamic>)),
                          aSimpleStruct: (),
                          aStackTrace:
                              _i3.Serializers.instance.deserialize<StackTrace>(
                            'dart:core#StackTrace',
                            value['aStackTrace'],
                          ),
                          aString: (value['aString'] as String),
                          aUint8List: _i3.Serializers.instance
                              .deserialize<_i4.Uint8List>(
                            'dart:typed_data#Uint8List',
                            value['aUint8List'],
                          ),
                          aUri: _i3.Serializers.instance.deserialize<Uri>(
                            'dart:core#Uri',
                            value['aUri'],
                          ),
                          aUriData:
                              _i3.Serializers.instance.deserialize<UriData>(
                            'dart:core#UriData',
                            value['aUriData'],
                          ),
                          anEnum: _i2.MyEnum.values
                              .byName((value['anEnum'] as String)),
                          anInt: (value['anInt'] as int),
                          anIterableOfSimpleClass:
                              (value['anIterableOfSimpleClass']
                                      as Iterable<Object?>)
                                  .map((el) {
                            (el as Map<String, Object?>);
                            return _i2.SimpleClass.fromJson(
                                (el as Map<String, dynamic>));
                          }).toList()
                        ),
                );
              }),
        request[r'aNullableMapOfNullableSimpleClass'] == null
            ? null
            : (request[r'aNullableMapOfNullableSimpleClass']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null
                      ? null
                      : _i2.SimpleClass?.fromJson(
                          (value as Map<String, dynamic>)),
                );
              }),
        request[r'aNullableMapOfNullableComplexClass'] == null
            ? null
            : (request[r'aNullableMapOfNullableComplexClass']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) {
                (value as Map<String, Object?>?);
                return MapEntry(
                  key,
                  value == null
                      ? null
                      : _i2.ComplexClass?.fromJson(
                          (value as Map<String, dynamic>)),
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
    (_) => ComplexTarget(),
  );
}

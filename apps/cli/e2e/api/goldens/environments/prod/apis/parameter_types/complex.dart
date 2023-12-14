// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i6;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/parameter_types.dart' as _i2;

class ComplexTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.complex(
        _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
          r'project:apis/parameter_types.dart#SimpleStruct',
          request[r'aSimpleStruct'],
        ),
        _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct>(
          r'project:apis/parameter_types.dart#ComplexStruct',
          request[r'aComplexStruct'],
        ),
        _i2.SimpleClass.fromJson(
            (request[r'aSimpleClass'] as Map<String, dynamic>)),
        _i2.ComplexClass.fromJson(
            (request[r'aComplexClass'] as Map<String, dynamic>)),
        _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct?>(
          r'project:apis/parameter_types.dart#SimpleStruct',
          request[r'aNullableSimpleStruct'],
        ),
        _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct?>(
          r'project:apis/parameter_types.dart#ComplexStruct',
          request[r'aNullableComplexStruct'],
        ),
        request[r'aNullableSimpleClass'] == null
            ? null
            : _i2.SimpleClass.fromJson(
                (request[r'aNullableSimpleClass'] as Map<String, dynamic>)),
        request[r'aNullableComplexClass'] == null
            ? null
            : _i2.ComplexClass.fromJson(
                (request[r'aNullableComplexClass'] as Map<String, dynamic>)),
        (request[r'anIterableOfSimpleStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
                  r'project:apis/parameter_types.dart#SimpleStruct',
                  el,
                ))
            .toList(),
        (request[r'anIterableOfComplexStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct>(
                  r'project:apis/parameter_types.dart#ComplexStruct',
                  el,
                ))
            .toList(),
        (request[r'anIterableOfSimpleClass'] as Iterable<Object?>)
            .map((el) => _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'anIterableOfComplexClass'] as Iterable<Object?>)
            .map(
                (el) => _i2.ComplexClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aNullableIterableOfSimpleStruct'] as Iterable<Object?>?)
            ?.map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
                  r'project:apis/parameter_types.dart#SimpleStruct',
                  el,
                ))
            .toList(),
        (request[r'aNullableIterableOfComplexStruct'] as Iterable<Object?>?)
            ?.map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct>(
                  r'project:apis/parameter_types.dart#ComplexStruct',
                  el,
                ))
            .toList(),
        (request[r'aNullableIterableOfSimpleClass'] as Iterable<Object?>?)
            ?.map(
                (el) => _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aNullableIterableOfComplexClass'] as Iterable<Object?>?)
            ?.map(
                (el) => _i2.ComplexClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'anIterableOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct?>(
                  r'project:apis/parameter_types.dart#SimpleStruct',
                  el,
                ))
            .toList(),
        (request[r'anIterableOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance
                    .deserializeWithType<_i2.ComplexStruct?>(
                  r'project:apis/parameter_types.dart#ComplexStruct',
                  el,
                ))
            .toList(),
        (request[r'anIterableOfNullableSimpleClass'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'anIterableOfNullableComplexClass'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i2.ComplexClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aListOfSimpleStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
                  r'project:apis/parameter_types.dart#SimpleStruct',
                  el,
                ))
            .toList(),
        (request[r'aListOfComplexStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct>(
                  r'project:apis/parameter_types.dart#ComplexStruct',
                  el,
                ))
            .toList(),
        (request[r'aListOfSimpleClass'] as Iterable<Object?>)
            .map((el) => _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aListOfComplexClass'] as Iterable<Object?>)
            .map(
                (el) => _i2.ComplexClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aNullableListOfSimpleStruct'] as Iterable<Object?>?)
            ?.map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
                  r'project:apis/parameter_types.dart#SimpleStruct',
                  el,
                ))
            .toList(),
        (request[r'aNullableListOfComplexStruct'] as Iterable<Object?>?)
            ?.map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct>(
                  r'project:apis/parameter_types.dart#ComplexStruct',
                  el,
                ))
            .toList(),
        (request[r'aNullableListOfSimpleClass'] as Iterable<Object?>?)
            ?.map(
                (el) => _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aNullableListOfComplexClass'] as Iterable<Object?>?)
            ?.map(
                (el) => _i2.ComplexClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aListOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct?>(
                  r'project:apis/parameter_types.dart#SimpleStruct',
                  el,
                ))
            .toList(),
        (request[r'aListOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance
                    .deserializeWithType<_i2.ComplexStruct?>(
                  r'project:apis/parameter_types.dart#ComplexStruct',
                  el,
                ))
            .toList(),
        (request[r'aListOfNullableSimpleClass'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aListOfNullableComplexClass'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i2.ComplexClass.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
              r'project:apis/parameter_types.dart#SimpleStruct',
              value,
            ),
          );
        }),
        (request[r'aMapOfComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct>(
              r'project:apis/parameter_types.dart#ComplexStruct',
              value,
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
        (request[r'aNullableMapOfSimpleStruct'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
              r'project:apis/parameter_types.dart#SimpleStruct',
              value,
            ),
          );
        }),
        (request[r'aNullableMapOfComplexStruct'] as Map<String, Object?>?)
            ?.map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct>(
              r'project:apis/parameter_types.dart#ComplexStruct',
              value,
            ),
          );
        }),
        (request[r'aNullableMapOfSimpleClass'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) {
          (value as Map<String, Object?>);
          return MapEntry(
            key,
            _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
        (request[r'aNullableMapOfComplexClass'] as Map<String, Object?>?)?.map((
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
            _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct?>(
              r'project:apis/parameter_types.dart#SimpleStruct',
              value,
            ),
          );
        }),
        (request[r'aMapOfNullableComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct?>(
              r'project:apis/parameter_types.dart#ComplexStruct',
              value,
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
                : _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
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
                : _i2.ComplexClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
        (request[r'aNullableMapOfNullableSimpleStruct']
                as Map<String, Object?>?)
            ?.map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct?>(
              r'project:apis/parameter_types.dart#SimpleStruct',
              value,
            ),
          );
        }),
        (request[r'aNullableMapOfNullableComplexStruct']
                as Map<String, Object?>?)
            ?.map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            _i3.Serializers.instance.deserializeWithType<_i2.ComplexStruct?>(
              r'project:apis/parameter_types.dart#ComplexStruct',
              value,
            ),
          );
        }),
        (request[r'aNullableMapOfNullableSimpleClass'] as Map<String, Object?>?)
            ?.map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : _i2.SimpleClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
        (request[r'aNullableMapOfNullableComplexClass']
                as Map<String, Object?>?)
            ?.map((
          key,
          value,
        ) {
          (value as Map<String, Object?>?);
          return MapEntry(
            key,
            value == null
                ? null
                : _i2.ComplexClass.fromJson((value as Map<String, dynamic>)),
          );
        }),
      );
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i4.FutureOr<_i5.Response> handler(_i5.Request request) {
    final handler = _i5.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const SimpleStructSerializer());
  _i3.Serializers.instance.put(const ComplexStructSerializer());
  await _i1.serve(
    args,
    (_) => ComplexTarget(),
  );
}

final class SimpleStructSerializer extends _i3.Serializer<_i2.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  String get dartType => r'project:apis/parameter_types.dart#SimpleStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SimpleStruct deserialize(Object? value) {
    // ignore: unused_local_variable
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(_i2.SimpleStruct value) => {};
}

final class ComplexStructSerializer extends _i3.Serializer<_i2.ComplexStruct> {
  const ComplexStructSerializer();

  @override
  String get dartType => r'project:apis/parameter_types.dart#ComplexStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.ComplexStruct deserialize(Object? value) {
    // ignore: unused_local_variable
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return (
      aBigInt: _i3.Serializers.instance.deserializeWithType<BigInt>(
        'dart:core#BigInt',
        serialized?[r'aBigInt'],
      ),
      aBool: (serialized?[r'aBool'] as bool),
      aDateTime: _i3.Serializers.instance.deserializeWithType<DateTime>(
        'dart:core#DateTime',
        serialized?[r'aDateTime'],
      ),
      aDouble: (serialized?[r'aDouble'] as double),
      aDuration: _i3.Serializers.instance.deserializeWithType<Duration>(
        'dart:core#Duration',
        serialized?[r'aDuration'],
      ),
      aListOfBigInt: (serialized?[r'aListOfBigInt'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserializeWithType<BigInt>(
                'dart:core#BigInt',
                el,
              ))
          .toList(),
      aListOfBool: (serialized?[r'aListOfBool'] as Iterable<Object?>)
          .map((el) => (el as bool))
          .toList(),
      aListOfDateTime: (serialized?[r'aListOfDateTime'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserializeWithType<DateTime>(
                'dart:core#DateTime',
                el,
              ))
          .toList(),
      aListOfDouble: (serialized?[r'aListOfDouble'] as Iterable<Object?>)
          .map((el) => (el as double))
          .toList(),
      aListOfDuration: (serialized?[r'aListOfDuration'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserializeWithType<Duration>(
                'dart:core#Duration',
                el,
              ))
          .toList(),
      aListOfEnum: (serialized?[r'aListOfEnum'] as Iterable<Object?>)
          .map((el) => _i2.MyEnum.values.byName((el as String)))
          .toList(),
      aListOfInt: (serialized?[r'aListOfInt'] as Iterable<Object?>)
          .map((el) => (el as int))
          .toList(),
      aListOfNull: (serialized?[r'aListOfNull'] as Iterable<Object?>)
          .map((el) => (el as Null))
          .toList(),
      aListOfRegExp: (serialized?[r'aListOfRegExp'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserializeWithType<RegExp>(
                'dart:core#RegExp',
                el,
              ))
          .toList(),
      aListOfSimpleClass: (serialized?[r'aListOfSimpleClass']
              as Iterable<Object?>)
          .map((el) => _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
          .toList(),
      aListOfSimpleStruct: (serialized?[r'aListOfSimpleStruct']
              as Iterable<Object?>)
          .map((el) =>
              _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
                r'project:apis/parameter_types.dart#SimpleStruct',
                el,
              ))
          .toList(),
      aListOfStackTrace: (serialized?[r'aListOfStackTrace']
              as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserializeWithType<StackTrace>(
                'dart:core#StackTrace',
                el,
              ))
          .toList(),
      aListOfString: (serialized?[r'aListOfString'] as Iterable<Object?>)
          .map((el) => (el as String))
          .toList(),
      aListOfUint8List: (serialized?[r'aListOfUint8List'] as Iterable<Object?>)
          .map((el) =>
              _i3.Serializers.instance.deserializeWithType<_i6.Uint8List>(
                'dart:typed_data#Uint8List',
                el,
              ))
          .toList(),
      aListOfUri: (serialized?[r'aListOfUri'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserializeWithType<Uri>(
                'dart:core#Uri',
                el,
              ))
          .toList(),
      aListOfUriData: (serialized?[r'aListOfUriData'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserializeWithType<UriData>(
                'dart:core#UriData',
                el,
              ))
          .toList(),
      aMapOfBigInt: (serialized?[r'aMapOfBigInt'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<BigInt>(
            'dart:core#BigInt',
            value,
          ),
        );
      }),
      aMapOfBool: (serialized?[r'aMapOfBool'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          (value as bool),
        );
      }),
      aMapOfDateTime:
          (serialized?[r'aMapOfDateTime'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<DateTime>(
            'dart:core#DateTime',
            value,
          ),
        );
      }),
      aMapOfDouble: (serialized?[r'aMapOfDouble'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          (value as double),
        );
      }),
      aMapOfDuration:
          (serialized?[r'aMapOfDuration'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<Duration>(
            'dart:core#Duration',
            value,
          ),
        );
      }),
      aMapOfEnum: (serialized?[r'aMapOfEnum'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i2.MyEnum.values.byName((value as String)),
        );
      }),
      aMapOfInt: (serialized?[r'aMapOfInt'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          (value as int),
        );
      }),
      aMapOfNull: (serialized?[r'aMapOfNull'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          (value as Null),
        );
      }),
      aMapOfRegExp: (serialized?[r'aMapOfRegExp'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<RegExp>(
            'dart:core#RegExp',
            value,
          ),
        );
      }),
      aMapOfSimpleClass:
          (serialized?[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
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
          (serialized?[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        (value as Map<String, Object?>);
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
            r'project:apis/parameter_types.dart#SimpleStruct',
            value,
          ),
        );
      }),
      aMapOfStackTrace:
          (serialized?[r'aMapOfStackTrace'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<StackTrace>(
            'dart:core#StackTrace',
            value,
          ),
        );
      }),
      aMapOfString: (serialized?[r'aMapOfString'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          (value as String),
        );
      }),
      aMapOfUint8List:
          (serialized?[r'aMapOfUint8List'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<_i6.Uint8List>(
            'dart:typed_data#Uint8List',
            value,
          ),
        );
      }),
      aMapOfUri: (serialized?[r'aMapOfUri'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<Uri>(
            'dart:core#Uri',
            value,
          ),
        );
      }),
      aMapOfUriData:
          (serialized?[r'aMapOfUriData'] as Map<String, Object?>).map((
        key,
        value,
      ) {
        return MapEntry(
          key,
          _i3.Serializers.instance.deserializeWithType<UriData>(
            'dart:core#UriData',
            value,
          ),
        );
      }),
      aNull: (serialized?[r'aNull'] as Null),
      aRegExp: _i3.Serializers.instance.deserializeWithType<RegExp>(
        'dart:core#RegExp',
        serialized?[r'aRegExp'],
      ),
      aSimpleClass: _i2.SimpleClass.fromJson(
          (serialized?[r'aSimpleClass'] as Map<String, dynamic>)),
      aSimpleStruct:
          _i3.Serializers.instance.deserializeWithType<_i2.SimpleStruct>(
        r'project:apis/parameter_types.dart#SimpleStruct',
        serialized?[r'aSimpleStruct'],
      ),
      aStackTrace: _i3.Serializers.instance.deserializeWithType<StackTrace>(
        'dart:core#StackTrace',
        serialized?[r'aStackTrace'],
      ),
      aString: (serialized?[r'aString'] as String),
      aUint8List: _i3.Serializers.instance.deserializeWithType<_i6.Uint8List>(
        'dart:typed_data#Uint8List',
        serialized?[r'aUint8List'],
      ),
      aUri: _i3.Serializers.instance.deserializeWithType<Uri>(
        'dart:core#Uri',
        serialized?[r'aUri'],
      ),
      aUriData: _i3.Serializers.instance.deserializeWithType<UriData>(
        'dart:core#UriData',
        serialized?[r'aUriData'],
      ),
      anEnum: _i2.MyEnum.values.byName((serialized?[r'anEnum'] as String)),
      anInt: (serialized?[r'anInt'] as int),
      anIterableOfSimpleClass: (serialized?[r'anIterableOfSimpleClass']
              as Iterable<Object?>)
          .map((el) => _i2.SimpleClass.fromJson((el as Map<String, dynamic>)))
          .toList()
    );
  }

  @override
  Map<String, Object?> serialize(_i2.ComplexStruct value) => {
        'aBigInt': _i3.Serializers.instance.serializeWithType(
          'dart:core#BigInt',
          value.aBigInt,
        ),
        'aBool': value.aBool,
        'aDateTime': _i3.Serializers.instance.serializeWithType(
          'dart:core#DateTime',
          value.aDateTime,
        ),
        'aDouble': value.aDouble,
        'aDuration': _i3.Serializers.instance.serializeWithType(
          'dart:core#Duration',
          value.aDuration,
        ),
        'aListOfBigInt': value.aListOfBigInt
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:core#BigInt',
                  el,
                ))
            .toList(),
        'aListOfBool': value.aListOfBool,
        'aListOfDateTime': value.aListOfDateTime
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:core#DateTime',
                  el,
                ))
            .toList(),
        'aListOfDouble': value.aListOfDouble,
        'aListOfDuration': value.aListOfDuration
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:core#Duration',
                  el,
                ))
            .toList(),
        'aListOfEnum': value.aListOfEnum.map((el) => el.name).toList(),
        'aListOfInt': value.aListOfInt,
        'aListOfNull': value.aListOfNull,
        'aListOfRegExp': value.aListOfRegExp
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:core#RegExp',
                  el,
                ))
            .toList(),
        'aListOfSimpleClass':
            value.aListOfSimpleClass.map((el) => el.toJson()).toList(),
        'aListOfSimpleStruct': value.aListOfSimpleStruct
            .map((el) =>
                _i3.Serializers.instance.serializeWithType<_i2.SimpleStruct>(
                  r'project:apis/parameter_types.dart#SimpleStruct',
                  el,
                ))
            .toList(),
        'aListOfStackTrace': value.aListOfStackTrace
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:core#StackTrace',
                  el,
                ))
            .toList(),
        'aListOfString': value.aListOfString,
        'aListOfUint8List': value.aListOfUint8List
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:typed_data#Uint8List',
                  el,
                ))
            .toList(),
        'aListOfUri': value.aListOfUri
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:core#Uri',
                  el,
                ))
            .toList(),
        'aListOfUriData': value.aListOfUriData
            .map((el) => _i3.Serializers.instance.serializeWithType(
                  'dart:core#UriData',
                  el,
                ))
            .toList(),
        'aMapOfBigInt': value.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:core#BigInt',
                value,
              ),
            )),
        'aMapOfBool': value.aMapOfBool,
        'aMapOfDateTime': value.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:core#DateTime',
                value,
              ),
            )),
        'aMapOfDouble': value.aMapOfDouble,
        'aMapOfDuration': value.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:core#Duration',
                value,
              ),
            )),
        'aMapOfEnum': value.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              value.name,
            )),
        'aMapOfInt': value.aMapOfInt,
        'aMapOfNull': value.aMapOfNull,
        'aMapOfRegExp': value.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:core#RegExp',
                value,
              ),
            )),
        'aMapOfSimpleClass': value.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              value.toJson(),
            )),
        'aMapOfSimpleStruct': value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType<_i2.SimpleStruct>(
                r'project:apis/parameter_types.dart#SimpleStruct',
                value,
              ),
            )),
        'aMapOfStackTrace': value.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:core#StackTrace',
                value,
              ),
            )),
        'aMapOfString': value.aMapOfString,
        'aMapOfUint8List': value.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:typed_data#Uint8List',
                value,
              ),
            )),
        'aMapOfUri': value.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:core#Uri',
                value,
              ),
            )),
        'aMapOfUriData': value.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serializeWithType(
                'dart:core#UriData',
                value,
              ),
            )),
        'aNull': value.aNull,
        'aRegExp': _i3.Serializers.instance.serializeWithType(
          'dart:core#RegExp',
          value.aRegExp,
        ),
        'aSimpleClass': value.aSimpleClass.toJson(),
        'aSimpleStruct':
            _i3.Serializers.instance.serializeWithType<_i2.SimpleStruct>(
          r'project:apis/parameter_types.dart#SimpleStruct',
          value.aSimpleStruct,
        ),
        'aStackTrace': _i3.Serializers.instance.serializeWithType(
          'dart:core#StackTrace',
          value.aStackTrace,
        ),
        'aString': value.aString,
        'aUint8List': _i3.Serializers.instance.serializeWithType(
          'dart:typed_data#Uint8List',
          value.aUint8List,
        ),
        'aUri': _i3.Serializers.instance.serializeWithType(
          'dart:core#Uri',
          value.aUri,
        ),
        'aUriData': _i3.Serializers.instance.serializeWithType(
          'dart:core#UriData',
          value.aUriData,
        ),
        'anEnum': value.anEnum.name,
        'anInt': value.anInt,
        'anIterableOfSimpleClass':
            value.anIterableOfSimpleClass.map((el) => el.toJson()).toList(),
      };
}

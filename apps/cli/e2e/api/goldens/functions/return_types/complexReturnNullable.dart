// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:typed_data' as _i8;

import 'package:celest/celest.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i7;

import '../../../functions/parameter_types.dart' as _i5;
import '../../../functions/return_types.dart' as _i3;

class ComplexReturnNullableTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
      final response = _i3.complexReturnNullable(celestContext);
      return _i4.Serializers.instance.serialize<_i5.ComplexStruct?>(response);
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i6.FutureOr<_i7.Response> handler(_i7.Request request) {
    final handler = _i7.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i6.Future<void> main(List<String> args) async {
  _i4.Serializers.instance.put(const MyEnumSerializer());
  _i4.Serializers.instance.put(const SimpleClassSerializer());
  _i4.Serializers.instance.put(const SimpleStructSerializer());
  _i4.Serializers.instance.put(const ComplexStructSerializer());
  await _i1.serve(
    args,
    (_) => ComplexReturnNullableTarget(),
  );
}

final class MyEnumSerializer extends _i4.Serializer<_i5.MyEnum> {
  const MyEnumSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#MyEnum';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.MyEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i5.MyEnum.values.byName(serialized);
  }

  @override
  String serialize(_i5.MyEnum value) => value.name;
}

final class SimpleClassSerializer extends _i4.Serializer<_i5.SimpleClass> {
  const SimpleClassSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i5.SimpleClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i5.SimpleClass value) => value.toJson();
}

final class SimpleStructSerializer extends _i4.Serializer<_i5.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(_i5.SimpleStruct value) => {};
}

final class ComplexStructSerializer extends _i4.Serializer<_i5.ComplexStruct> {
  const ComplexStructSerializer();

  @override
  String get dartType =>
      r'project:functions/parameter_types.dart#ComplexStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.ComplexStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aBigInt:
          _i4.Serializers.instance.deserialize<BigInt>(serialized[r'aBigInt']),
      aBool: (serialized[r'aBool'] as bool),
      aDateTime: _i4.Serializers.instance
          .deserialize<DateTime>(serialized[r'aDateTime']),
      aDouble: (serialized[r'aDouble'] as double),
      aDuration: _i4.Serializers.instance
          .deserialize<Duration>(serialized[r'aDuration']),
      aListOfBigInt: (serialized[r'aListOfBigInt'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<BigInt>(el))
          .toList(),
      aListOfBool: (serialized[r'aListOfBool'] as Iterable<Object?>)
          .map((el) => (el as bool))
          .toList(),
      aListOfDateTime: (serialized[r'aListOfDateTime'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<DateTime>(el))
          .toList(),
      aListOfDouble: (serialized[r'aListOfDouble'] as Iterable<Object?>)
          .map((el) => (el as double))
          .toList(),
      aListOfDuration: (serialized[r'aListOfDuration'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<Duration>(el))
          .toList(),
      aListOfEnum: (serialized[r'aListOfEnum'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<_i5.MyEnum>(el))
          .toList(),
      aListOfInt: (serialized[r'aListOfInt'] as Iterable<Object?>)
          .map((el) => (el as int))
          .toList(),
      aListOfNull: (serialized[r'aListOfNull'] as Iterable<Object?>)
          .map((el) => (el as Null))
          .toList(),
      aListOfRegExp: (serialized[r'aListOfRegExp'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<RegExp>(el))
          .toList(),
      aListOfSimpleClass: (serialized[r'aListOfSimpleClass']
              as Iterable<Object?>)
          .map(
              (el) => _i4.Serializers.instance.deserialize<_i5.SimpleClass>(el))
          .toList(),
      aListOfSimpleStruct:
          (serialized[r'aListOfSimpleStruct'] as Iterable<Object?>)
              .map((el) =>
                  _i4.Serializers.instance.deserialize<_i5.SimpleStruct>(el))
              .toList(),
      aListOfStackTrace: (serialized[r'aListOfStackTrace'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<StackTrace>(el))
          .toList(),
      aListOfString: (serialized[r'aListOfString'] as Iterable<Object?>)
          .map((el) => (el as String))
          .toList(),
      aListOfUint8List: (serialized[r'aListOfUint8List'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<_i8.Uint8List>(el))
          .toList(),
      aListOfUri: (serialized[r'aListOfUri'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<Uri>(el))
          .toList(),
      aListOfUriData: (serialized[r'aListOfUriData'] as Iterable<Object?>)
          .map((el) => _i4.Serializers.instance.deserialize<UriData>(el))
          .toList(),
      aMapOfBigInt: (serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i4.Serializers.instance.deserialize<BigInt>(value),
          )),
      aMapOfBool: (serialized[r'aMapOfBool'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as bool),
          )),
      aMapOfDateTime:
          (serialized[r'aMapOfDateTime'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i4.Serializers.instance.deserialize<DateTime>(value),
              )),
      aMapOfDouble: (serialized[r'aMapOfDouble'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as double),
          )),
      aMapOfDuration:
          (serialized[r'aMapOfDuration'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i4.Serializers.instance.deserialize<Duration>(value),
              )),
      aMapOfEnum: (serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i4.Serializers.instance.deserialize<_i5.MyEnum>(value),
          )),
      aMapOfInt: (serialized[r'aMapOfInt'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as int),
          )),
      aMapOfNull: (serialized[r'aMapOfNull'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as Null),
          )),
      aMapOfRegExp: (serialized[r'aMapOfRegExp'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i4.Serializers.instance.deserialize<RegExp>(value),
          )),
      aMapOfSimpleClass:
          (serialized[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i4.Serializers.instance.deserialize<_i5.SimpleClass>(value),
              )),
      aMapOfSimpleStruct:
          (serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i4.Serializers.instance.deserialize<_i5.SimpleStruct>(value),
              )),
      aMapOfStackTrace:
          (serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i4.Serializers.instance.deserialize<StackTrace>(value),
              )),
      aMapOfString: (serialized[r'aMapOfString'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as String),
          )),
      aMapOfUint8List:
          (serialized[r'aMapOfUint8List'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i4.Serializers.instance.deserialize<_i8.Uint8List>(value),
              )),
      aMapOfUri: (serialized[r'aMapOfUri'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i4.Serializers.instance.deserialize<Uri>(value),
          )),
      aMapOfUriData:
          (serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i4.Serializers.instance.deserialize<UriData>(value),
              )),
      aNull: (serialized[r'aNull'] as Null),
      aRegExp:
          _i4.Serializers.instance.deserialize<RegExp>(serialized[r'aRegExp']),
      aSimpleClass: _i4.Serializers.instance
          .deserialize<_i5.SimpleClass>(serialized[r'aSimpleClass']),
      aSimpleStruct: _i4.Serializers.instance
          .deserialize<_i5.SimpleStruct>(serialized[r'aSimpleStruct']),
      aStackTrace: _i4.Serializers.instance
          .deserialize<StackTrace>(serialized[r'aStackTrace']),
      aString: (serialized[r'aString'] as String),
      aUint8List: _i4.Serializers.instance
          .deserialize<_i8.Uint8List>(serialized[r'aUint8List']),
      aUri: _i4.Serializers.instance.deserialize<Uri>(serialized[r'aUri']),
      aUriData: _i4.Serializers.instance
          .deserialize<UriData>(serialized[r'aUriData']),
      anEnum: _i4.Serializers.instance
          .deserialize<_i5.MyEnum>(serialized[r'anEnum']),
      anInt: (serialized[r'anInt'] as int),
      anIterableOfSimpleClass: (serialized[r'anIterableOfSimpleClass']
              as Iterable<Object?>)
          .map(
              (el) => _i4.Serializers.instance.deserialize<_i5.SimpleClass>(el))
          .toList()
    );
  }

  @override
  Map<String, Object?> serialize(_i5.ComplexStruct value) => {
        r'aBigInt': _i4.Serializers.instance.serialize<BigInt>(value.aBigInt),
        r'aBool': value.aBool,
        r'aDateTime':
            _i4.Serializers.instance.serialize<DateTime>(value.aDateTime),
        r'aDouble': value.aDouble,
        r'aDuration':
            _i4.Serializers.instance.serialize<Duration>(value.aDuration),
        r'aListOfBigInt': value.aListOfBigInt
            .map((el) => _i4.Serializers.instance.serialize<BigInt>(el))
            .toList(),
        r'aListOfBool': value.aListOfBool,
        r'aListOfDateTime': value.aListOfDateTime
            .map((el) => _i4.Serializers.instance.serialize<DateTime>(el))
            .toList(),
        r'aListOfDouble': value.aListOfDouble,
        r'aListOfDuration': value.aListOfDuration
            .map((el) => _i4.Serializers.instance.serialize<Duration>(el))
            .toList(),
        r'aListOfEnum': value.aListOfEnum
            .map((el) => _i4.Serializers.instance.serialize<_i5.MyEnum>(el))
            .toList(),
        r'aListOfInt': value.aListOfInt,
        r'aListOfNull': value.aListOfNull,
        r'aListOfRegExp': value.aListOfRegExp
            .map((el) => _i4.Serializers.instance.serialize<RegExp>(el))
            .toList(),
        r'aListOfSimpleClass': value.aListOfSimpleClass
            .map(
                (el) => _i4.Serializers.instance.serialize<_i5.SimpleClass>(el))
            .toList(),
        r'aListOfSimpleStruct': value.aListOfSimpleStruct
            .map((el) =>
                _i4.Serializers.instance.serialize<_i5.SimpleStruct>(el))
            .toList(),
        r'aListOfStackTrace': value.aListOfStackTrace
            .map((el) => _i4.Serializers.instance.serialize<StackTrace>(el))
            .toList(),
        r'aListOfString': value.aListOfString,
        r'aListOfUint8List': value.aListOfUint8List
            .map((el) => _i4.Serializers.instance.serialize<_i8.Uint8List>(el))
            .toList(),
        r'aListOfUri': value.aListOfUri
            .map((el) => _i4.Serializers.instance.serialize<Uri>(el))
            .toList(),
        r'aListOfUriData': value.aListOfUriData
            .map((el) => _i4.Serializers.instance.serialize<UriData>(el))
            .toList(),
        r'aMapOfBigInt': value.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<BigInt>(value),
            )),
        r'aMapOfBool': value.aMapOfBool,
        r'aMapOfDateTime': value.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<DateTime>(value),
            )),
        r'aMapOfDouble': value.aMapOfDouble,
        r'aMapOfDuration': value.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<Duration>(value),
            )),
        r'aMapOfEnum': value.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<_i5.MyEnum>(value),
            )),
        r'aMapOfInt': value.aMapOfInt,
        r'aMapOfNull': value.aMapOfNull,
        r'aMapOfRegExp': value.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<RegExp>(value),
            )),
        r'aMapOfSimpleClass': value.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<_i5.SimpleClass>(value),
            )),
        r'aMapOfSimpleStruct': value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<_i5.SimpleStruct>(value),
            )),
        r'aMapOfStackTrace': value.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<StackTrace>(value),
            )),
        r'aMapOfString': value.aMapOfString,
        r'aMapOfUint8List': value.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<_i8.Uint8List>(value),
            )),
        r'aMapOfUri': value.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<Uri>(value),
            )),
        r'aMapOfUriData': value.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serialize<UriData>(value),
            )),
        r'aNull': value.aNull,
        r'aRegExp': _i4.Serializers.instance.serialize<RegExp>(value.aRegExp),
        r'aSimpleClass': _i4.Serializers.instance
            .serialize<_i5.SimpleClass>(value.aSimpleClass),
        r'aSimpleStruct': _i4.Serializers.instance
            .serialize<_i5.SimpleStruct>(value.aSimpleStruct),
        r'aStackTrace':
            _i4.Serializers.instance.serialize<StackTrace>(value.aStackTrace),
        r'aString': value.aString,
        r'aUint8List':
            _i4.Serializers.instance.serialize<_i8.Uint8List>(value.aUint8List),
        r'aUri': _i4.Serializers.instance.serialize<Uri>(value.aUri),
        r'aUriData':
            _i4.Serializers.instance.serialize<UriData>(value.aUriData),
        r'anEnum': _i4.Serializers.instance.serialize<_i5.MyEnum>(value.anEnum),
        r'anInt': value.anInt,
        r'anIterableOfSimpleClass': value.anIterableOfSimpleClass
            .map(
                (el) => _i4.Serializers.instance.serialize<_i5.SimpleClass>(el))
            .toList(),
      };
}

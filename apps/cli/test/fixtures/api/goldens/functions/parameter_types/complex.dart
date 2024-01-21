// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/parameter_types.dart' as _i2;

final class ComplexTarget extends _i1.CloudFunctionTarget {
  ComplexTarget()
      : super(
          (request) async {
            await _i2.complex(
              _i3.Serializers.scoped
                  .deserialize<_i2.SimpleStruct>(request[r'aSimpleStruct']),
              _i3.Serializers.scoped
                  .deserialize<_i2.ComplexStruct>(request[r'aComplexStruct']),
              _i3.Serializers.scoped
                  .deserialize<_i2.SimpleClass>(request[r'aSimpleClass']),
              _i3.Serializers.scoped
                  .deserialize<_i2.ComplexClass>(request[r'aComplexClass']),
              _i3.Serializers.scoped.deserialize<_i2.SimpleStruct?>(
                  request[r'aNullableSimpleStruct']),
              _i3.Serializers.scoped.deserialize<_i2.ComplexStruct?>(
                  request[r'aNullableComplexStruct']),
              _i3.Serializers.scoped.deserialize<_i2.SimpleClass?>(
                  request[r'aNullableSimpleClass']),
              _i3.Serializers.scoped.deserialize<_i2.ComplexClass?>(
                  request[r'aNullableComplexClass']),
              (request[r'anIterableOfSimpleStruct'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleStruct>(el))
                  .toList(),
              (request[r'anIterableOfComplexStruct'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexStruct>(el))
                  .toList(),
              (request[r'anIterableOfSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(el))
                  .toList(),
              (request[r'anIterableOfComplexClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexClass>(el))
                  .toList(),
              (request[r'aNullableIterableOfSimpleStruct']
                      as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleStruct>(el))
                  .toList(),
              (request[r'aNullableIterableOfComplexStruct']
                      as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexStruct>(el))
                  .toList(),
              (request[r'aNullableIterableOfSimpleClass'] as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(el))
                  .toList(),
              (request[r'aNullableIterableOfComplexClass']
                      as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexClass>(el))
                  .toList(),
              (request[r'anIterableOfNullableSimpleStruct']
                      as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleStruct?>(el))
                  .toList(),
              (request[r'anIterableOfNullableComplexStruct']
                      as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped
                      .deserialize<_i2.ComplexStruct?>(el))
                  .toList(),
              (request[r'anIterableOfNullableSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleClass?>(el))
                  .toList(),
              (request[r'anIterableOfNullableComplexClass']
                      as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexClass?>(el))
                  .toList(),
              (request[r'aListOfSimpleStruct'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleStruct>(el))
                  .toList(),
              (request[r'aListOfComplexStruct'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexStruct>(el))
                  .toList(),
              (request[r'aListOfSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(el))
                  .toList(),
              (request[r'aListOfComplexClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexClass>(el))
                  .toList(),
              (request[r'aNullableListOfSimpleStruct'] as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleStruct>(el))
                  .toList(),
              (request[r'aNullableListOfComplexStruct'] as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexStruct>(el))
                  .toList(),
              (request[r'aNullableListOfSimpleClass'] as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(el))
                  .toList(),
              (request[r'aNullableListOfComplexClass'] as Iterable<Object?>?)
                  ?.map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexClass>(el))
                  .toList(),
              (request[r'aListOfNullableSimpleStruct'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleStruct?>(el))
                  .toList(),
              (request[r'aListOfNullableComplexStruct'] as Iterable<Object?>)
                  .map((el) => _i3.Serializers.scoped
                      .deserialize<_i2.ComplexStruct?>(el))
                  .toList(),
              (request[r'aListOfNullableSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.SimpleClass?>(el))
                  .toList(),
              (request[r'aListOfNullableComplexClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.scoped.deserialize<_i2.ComplexClass?>(el))
                  .toList(),
              (request[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<_i2.SimpleStruct>(value),
                  )),
              (request[r'aMapOfComplexStruct'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped
                        .deserialize<_i2.ComplexStruct>(value),
                  )),
              (request[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(value),
                  )),
              (request[r'aMapOfComplexClass'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.scoped.deserialize<_i2.ComplexClass>(value),
                  )),
              (request[r'aNullableMapOfSimpleStruct'] as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.SimpleStruct>(value),
                      )),
              (request[r'aNullableMapOfComplexStruct'] as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.ComplexStruct>(value),
                      )),
              (request[r'aNullableMapOfSimpleClass'] as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.SimpleClass>(value),
                      )),
              (request[r'aNullableMapOfComplexClass'] as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.ComplexClass>(value),
                      )),
              (request[r'aMapOfNullableSimpleStruct'] as Map<String, Object?>)
                  .map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.SimpleStruct?>(value),
                      )),
              (request[r'aMapOfNullableComplexStruct'] as Map<String, Object?>)
                  .map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.ComplexStruct?>(value),
                      )),
              (request[r'aMapOfNullableSimpleClass'] as Map<String, Object?>)
                  .map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.SimpleClass?>(value),
                      )),
              (request[r'aMapOfNullableComplexClass'] as Map<String, Object?>)
                  .map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.ComplexClass?>(value),
                      )),
              (request[r'aNullableMapOfNullableSimpleStruct']
                      as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.SimpleStruct?>(value),
                      )),
              (request[r'aNullableMapOfNullableComplexStruct']
                      as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.ComplexStruct?>(value),
                      )),
              (request[r'aNullableMapOfNullableSimpleClass']
                      as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.SimpleClass?>(value),
                      )),
              (request[r'aNullableMapOfNullableComplexClass']
                      as Map<String, Object?>?)
                  ?.map((
                key,
                value,
              ) =>
                      MapEntry(
                        key,
                        _i3.Serializers.scoped
                            .deserialize<_i2.ComplexClass?>(value),
                      )),
            );
            return (statusCode: 200, body: {'response': null});
          },
          installSerializers: (serializers) {
            serializers.put(const SimpleStructSerializer());
            serializers.put(const MyEnumSerializer());
            serializers.put(const SimpleClassSerializer());
            serializers.put(const ComplexStructSerializer());
            serializers.put(const ComplexClassSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ComplexTarget()},
  );
}

final class SimpleStructSerializer extends _i3.Serializer<_i2.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(_i2.SimpleStruct value) => {};
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

final class SimpleClassSerializer extends _i3.Serializer<_i2.SimpleClass> {
  const SimpleClassSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i2.SimpleClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i2.SimpleClass value) => value.toJson();
}

final class ComplexStructSerializer extends _i3.Serializer<_i2.ComplexStruct> {
  const ComplexStructSerializer();

  @override
  String get dartType =>
      r'project:functions/parameter_types.dart#ComplexStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.ComplexStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aBigInt:
          _i3.Serializers.scoped.deserialize<BigInt>(serialized[r'aBigInt']),
      aBool: (serialized[r'aBool'] as bool),
      aDateTime: _i3.Serializers.scoped
          .deserialize<DateTime>(serialized[r'aDateTime']),
      aDouble: (serialized[r'aDouble'] as num).toDouble(),
      aDuration: _i3.Serializers.scoped
          .deserialize<Duration>(serialized[r'aDuration']),
      aListOfBigInt: (serialized[r'aListOfBigInt'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<BigInt>(el))
          .toList(),
      aListOfBool: (serialized[r'aListOfBool'] as Iterable<Object?>)
          .map((el) => (el as bool))
          .toList(),
      aListOfDateTime: (serialized[r'aListOfDateTime'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<DateTime>(el))
          .toList(),
      aListOfDouble: (serialized[r'aListOfDouble'] as Iterable<Object?>)
          .map((el) => (el as num).toDouble())
          .toList(),
      aListOfDuration: (serialized[r'aListOfDuration'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<Duration>(el))
          .toList(),
      aListOfEnum: (serialized[r'aListOfEnum'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<_i2.MyEnum>(el))
          .toList(),
      aListOfInt: (serialized[r'aListOfInt'] as Iterable<Object?>)
          .map((el) => (el as num).toInt())
          .toList(),
      aListOfNull: (serialized[r'aListOfNull'] as Iterable<Object?>)
          .map((el) => (el as Null))
          .toList(),
      aListOfRegExp: (serialized[r'aListOfRegExp'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<RegExp>(el))
          .toList(),
      aListOfSimpleClass: (serialized[r'aListOfSimpleClass']
              as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(el))
          .toList(),
      aListOfSimpleStruct: (serialized[r'aListOfSimpleStruct']
              as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<_i2.SimpleStruct>(el))
          .toList(),
      aListOfStackTrace: (serialized[r'aListOfStackTrace'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<StackTrace>(el))
          .toList(),
      aListOfString: (serialized[r'aListOfString'] as Iterable<Object?>)
          .map((el) => (el as String))
          .toList(),
      aListOfUint8List: (serialized[r'aListOfUint8List'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<_i4.Uint8List>(el))
          .toList(),
      aListOfUri: (serialized[r'aListOfUri'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<Uri>(el))
          .toList(),
      aListOfUriData: (serialized[r'aListOfUriData'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<UriData>(el))
          .toList(),
      aMapOfBigInt: (serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i3.Serializers.scoped.deserialize<BigInt>(value),
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
                _i3.Serializers.scoped.deserialize<DateTime>(value),
              )),
      aMapOfDouble: (serialized[r'aMapOfDouble'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as num).toDouble(),
          )),
      aMapOfDuration:
          (serialized[r'aMapOfDuration'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i3.Serializers.scoped.deserialize<Duration>(value),
              )),
      aMapOfEnum: (serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i3.Serializers.scoped.deserialize<_i2.MyEnum>(value),
          )),
      aMapOfInt: (serialized[r'aMapOfInt'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as num).toInt(),
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
            _i3.Serializers.scoped.deserialize<RegExp>(value),
          )),
      aMapOfSimpleClass:
          (serialized[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(value),
              )),
      aMapOfSimpleStruct:
          (serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i3.Serializers.scoped.deserialize<_i2.SimpleStruct>(value),
              )),
      aMapOfStackTrace:
          (serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i3.Serializers.scoped.deserialize<StackTrace>(value),
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
                _i3.Serializers.scoped.deserialize<_i4.Uint8List>(value),
              )),
      aMapOfUri: (serialized[r'aMapOfUri'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i3.Serializers.scoped.deserialize<Uri>(value),
          )),
      aMapOfUriData:
          (serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i3.Serializers.scoped.deserialize<UriData>(value),
              )),
      aNull: (serialized[r'aNull'] as Null),
      aRegExp:
          _i3.Serializers.scoped.deserialize<RegExp>(serialized[r'aRegExp']),
      aSimpleClass: _i3.Serializers.scoped
          .deserialize<_i2.SimpleClass>(serialized[r'aSimpleClass']),
      aSimpleStruct: _i3.Serializers.scoped
          .deserialize<_i2.SimpleStruct>(serialized[r'aSimpleStruct']),
      aStackTrace: _i3.Serializers.scoped
          .deserialize<StackTrace>(serialized[r'aStackTrace']),
      aString: (serialized[r'aString'] as String),
      aUint8List: _i3.Serializers.scoped
          .deserialize<_i4.Uint8List>(serialized[r'aUint8List']),
      aUri: _i3.Serializers.scoped.deserialize<Uri>(serialized[r'aUri']),
      aUriData:
          _i3.Serializers.scoped.deserialize<UriData>(serialized[r'aUriData']),
      anEnum:
          _i3.Serializers.scoped.deserialize<_i2.MyEnum>(serialized[r'anEnum']),
      anInt: (serialized[r'anInt'] as num).toInt(),
      anIterableOfSimpleClass: (serialized[r'anIterableOfSimpleClass']
              as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<_i2.SimpleClass>(el))
          .toList()
    );
  }

  @override
  Map<String, Object?> serialize(_i2.ComplexStruct value) => {
        r'aBigInt': _i3.Serializers.scoped.serialize<BigInt>(value.aBigInt),
        r'aBool': value.aBool,
        r'aDateTime':
            _i3.Serializers.scoped.serialize<DateTime>(value.aDateTime),
        r'aDouble': value.aDouble,
        r'aDuration':
            _i3.Serializers.scoped.serialize<Duration>(value.aDuration),
        r'aListOfBigInt': value.aListOfBigInt
            .map((el) => _i3.Serializers.scoped.serialize<BigInt>(el))
            .toList(),
        r'aListOfBool': value.aListOfBool,
        r'aListOfDateTime': value.aListOfDateTime
            .map((el) => _i3.Serializers.scoped.serialize<DateTime>(el))
            .toList(),
        r'aListOfDouble': value.aListOfDouble,
        r'aListOfDuration': value.aListOfDuration
            .map((el) => _i3.Serializers.scoped.serialize<Duration>(el))
            .toList(),
        r'aListOfEnum': value.aListOfEnum
            .map((el) => _i3.Serializers.scoped.serialize<_i2.MyEnum>(el))
            .toList(),
        r'aListOfInt': value.aListOfInt,
        r'aListOfNull': value.aListOfNull,
        r'aListOfRegExp': value.aListOfRegExp
            .map((el) => _i3.Serializers.scoped.serialize<RegExp>(el))
            .toList(),
        r'aListOfSimpleClass': value.aListOfSimpleClass
            .map((el) => _i3.Serializers.scoped.serialize<_i2.SimpleClass>(el))
            .toList(),
        r'aListOfSimpleStruct': value.aListOfSimpleStruct
            .map((el) => _i3.Serializers.scoped.serialize<_i2.SimpleStruct>(el))
            .toList(),
        r'aListOfStackTrace': value.aListOfStackTrace
            .map((el) => _i3.Serializers.scoped.serialize<StackTrace>(el))
            .toList(),
        r'aListOfString': value.aListOfString,
        r'aListOfUint8List': value.aListOfUint8List
            .map((el) => _i3.Serializers.scoped.serialize<_i4.Uint8List>(el))
            .toList(),
        r'aListOfUri': value.aListOfUri
            .map((el) => _i3.Serializers.scoped.serialize<Uri>(el))
            .toList(),
        r'aListOfUriData': value.aListOfUriData
            .map((el) => _i3.Serializers.scoped.serialize<UriData>(el))
            .toList(),
        r'aMapOfBigInt': value.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<BigInt>(value),
            )),
        r'aMapOfBool': value.aMapOfBool,
        r'aMapOfDateTime': value.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<DateTime>(value),
            )),
        r'aMapOfDouble': value.aMapOfDouble,
        r'aMapOfDuration': value.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<Duration>(value),
            )),
        r'aMapOfEnum': value.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<_i2.MyEnum>(value),
            )),
        r'aMapOfInt': value.aMapOfInt,
        r'aMapOfNull': value.aMapOfNull,
        r'aMapOfRegExp': value.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<RegExp>(value),
            )),
        r'aMapOfSimpleClass': value.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<_i2.SimpleClass>(value),
            )),
        r'aMapOfSimpleStruct': value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<_i2.SimpleStruct>(value),
            )),
        r'aMapOfStackTrace': value.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<StackTrace>(value),
            )),
        r'aMapOfString': value.aMapOfString,
        r'aMapOfUint8List': value.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<_i4.Uint8List>(value),
            )),
        r'aMapOfUri': value.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<Uri>(value),
            )),
        r'aMapOfUriData': value.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.scoped.serialize<UriData>(value),
            )),
        r'aNull': value.aNull,
        r'aRegExp': _i3.Serializers.scoped.serialize<RegExp>(value.aRegExp),
        r'aSimpleClass': _i3.Serializers.scoped
            .serialize<_i2.SimpleClass>(value.aSimpleClass),
        r'aSimpleStruct': _i3.Serializers.scoped
            .serialize<_i2.SimpleStruct>(value.aSimpleStruct),
        r'aStackTrace':
            _i3.Serializers.scoped.serialize<StackTrace>(value.aStackTrace),
        r'aString': value.aString,
        r'aUint8List':
            _i3.Serializers.scoped.serialize<_i4.Uint8List>(value.aUint8List),
        r'aUri': _i3.Serializers.scoped.serialize<Uri>(value.aUri),
        r'aUriData': _i3.Serializers.scoped.serialize<UriData>(value.aUriData),
        r'anEnum': _i3.Serializers.scoped.serialize<_i2.MyEnum>(value.anEnum),
        r'anInt': value.anInt,
        r'anIterableOfSimpleClass': value.anIterableOfSimpleClass
            .map((el) => _i3.Serializers.scoped.serialize<_i2.SimpleClass>(el))
            .toList(),
      };
}

final class ComplexClassSerializer extends _i3.Serializer<_i2.ComplexClass> {
  const ComplexClassSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#ComplexClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.ComplexClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i2.ComplexClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i2.ComplexClass value) => value.toJson();
}

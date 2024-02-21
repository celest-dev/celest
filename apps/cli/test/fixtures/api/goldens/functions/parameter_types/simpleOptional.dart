// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/parameter_types.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;

import '../../../functions/parameter_types.dart' as _i2;

final class SimpleOptionalTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'simpleOptional';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      await _i2.simpleOptional(
        (request[r'aString'] as String?),
        (request[r'anInt'] as num?)?.toInt(),
        (request[r'aDouble'] as num?)?.toDouble(),
        (request[r'aBool'] as bool?),
        _i3.Serializers.instance.deserialize<_i4.MyEnum?>(request[r'anEnum']),
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
            .deserialize<_i5.Uint8List?>(request[r'aUint8List']),
        (request[r'anIterableOfString'] as Iterable<Object?>?)
            ?.map((el) => (el as String))
            .toList(),
        (request[r'anIterableOfUint8List'] as Iterable<Object?>?)
            ?.map(
                (el) => _i3.Serializers.instance.deserialize<_i5.Uint8List>(el))
            .toList(),
        (request[r'aListOfString'] as Iterable<Object?>?)
            ?.map((el) => (el as String))
            .toList(),
        (request[r'aListOfInt'] as Iterable<Object?>?)
            ?.map((el) => (el as num).toInt())
            .toList(),
        (request[r'aListOfDouble'] as Iterable<Object?>?)
            ?.map((el) => (el as num).toDouble())
            .toList(),
        (request[r'aListOfBool'] as Iterable<Object?>?)
            ?.map((el) => (el as bool))
            .toList(),
        (request[r'aListOfEnum'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<_i4.MyEnum>(el))
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
                (el) => _i3.Serializers.instance.deserialize<_i5.Uint8List>(el))
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
              (value as num).toInt(),
            )),
        (request[r'aMapOfDouble'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as num).toDouble(),
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
              _i3.Serializers.instance.deserialize<_i4.MyEnum>(value),
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
              _i3.Serializers.instance.deserialize<_i5.Uint8List>(value),
            )),
      );
      return (statusCode: 200, body: {'response': null});
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i7.InternalServerException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.InternalServerException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerException',
            'details': error,
          }
        }
      );
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const MyEnumSerializer());
    _i3.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i3.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i3.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SimpleOptionalTarget()},
  );
}

final class BadRequestExceptionSerializer
    extends _i3.Serializer<_i7.BadRequestException> {
  const BadRequestExceptionSerializer();

  @override
  _i7.BadRequestException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.BadRequestException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i7.BadRequestException value) =>
      {r'message': value.message};
}

final class InternalServerExceptionSerializer
    extends _i3.Serializer<_i7.InternalServerException> {
  const InternalServerExceptionSerializer();

  @override
  _i7.InternalServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.InternalServerException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i7.InternalServerException value) =>
      {r'message': value.message};
}

final class MyEnumSerializer extends _i3.Serializer<_i4.MyEnum> {
  const MyEnumSerializer();

  @override
  _i4.MyEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.MyEnum.values.byName(serialized);
  }

  @override
  Object? serialize(_i4.MyEnum value) => value.name;
}

final class SerializationExceptionSerializer
    extends _i3.Serializer<_i6.SerializationException> {
  const SerializationExceptionSerializer();

  @override
  _i6.SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i6.SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}

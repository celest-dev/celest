// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i7;

import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/parameter_types.dart' as _i4;
import 'package:celest_backend/src/functions/return_types.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

final class ComplexReturnTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'complexReturn';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i2.complexReturn();
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.ComplexStruct>(response)
        }
      );
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.ComplexStruct, Map<String, Object?>>(
      serialize: ($value) => {
        r'aBigInt': _i3.Serializers.instance.serialize<BigInt>($value.aBigInt),
        r'aBool': $value.aBool,
        r'aDateTime':
            _i3.Serializers.instance.serialize<DateTime>($value.aDateTime),
        r'aDouble': $value.aDouble,
        r'aDuration':
            _i3.Serializers.instance.serialize<Duration>($value.aDuration),
        r'aListOfBigInt': $value.aListOfBigInt
            .map((el) => _i3.Serializers.instance.serialize<BigInt>(el))
            .toList(),
        r'aListOfBool': $value.aListOfBool,
        r'aListOfDateTime': $value.aListOfDateTime
            .map((el) => _i3.Serializers.instance.serialize<DateTime>(el))
            .toList(),
        r'aListOfDouble': $value.aListOfDouble,
        r'aListOfDuration': $value.aListOfDuration
            .map((el) => _i3.Serializers.instance.serialize<Duration>(el))
            .toList(),
        r'aListOfEnum': $value.aListOfEnum
            .map((el) => _i3.Serializers.instance.serialize<_i4.MyEnum>(el))
            .toList(),
        r'aListOfInt': $value.aListOfInt,
        r'aListOfNull': $value.aListOfNull,
        r'aListOfRegExp': $value.aListOfRegExp
            .map((el) => _i3.Serializers.instance.serialize<RegExp>(el))
            .toList(),
        r'aListOfSimpleClass': $value.aListOfSimpleClass
            .map(
                (el) => _i3.Serializers.instance.serialize<_i4.SimpleClass>(el))
            .toList(),
        r'aListOfSimpleStruct': $value.aListOfSimpleStruct
            .map((el) =>
                _i3.Serializers.instance.serialize<_i4.SimpleStruct>(el))
            .toList(),
        r'aListOfStackTrace': $value.aListOfStackTrace
            .map((el) => _i3.Serializers.instance.serialize<StackTrace>(el))
            .toList(),
        r'aListOfString': $value.aListOfString,
        r'aListOfUint8List': $value.aListOfUint8List
            .map((el) => _i3.Serializers.instance.serialize<_i7.Uint8List>(el))
            .toList(),
        r'aListOfUri': $value.aListOfUri
            .map((el) => _i3.Serializers.instance.serialize<Uri>(el))
            .toList(),
        r'aListOfUriData': $value.aListOfUriData
            .map((el) => _i3.Serializers.instance.serialize<UriData>(el))
            .toList(),
        r'aMapOfBigInt': $value.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<BigInt>(value),
            )),
        r'aMapOfBool': $value.aMapOfBool,
        r'aMapOfDateTime': $value.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<DateTime>(value),
            )),
        r'aMapOfDouble': $value.aMapOfDouble,
        r'aMapOfDuration': $value.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<Duration>(value),
            )),
        r'aMapOfEnum': $value.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i4.MyEnum>(value),
            )),
        r'aMapOfInt': $value.aMapOfInt,
        r'aMapOfNull': $value.aMapOfNull,
        r'aMapOfRegExp': $value.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<RegExp>(value),
            )),
        r'aMapOfSimpleClass': $value.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i4.SimpleClass>(value),
            )),
        r'aMapOfSimpleStruct': $value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i4.SimpleStruct>(value),
            )),
        r'aMapOfStackTrace': $value.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<StackTrace>(value),
            )),
        r'aMapOfString': $value.aMapOfString,
        r'aMapOfUint8List': $value.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i7.Uint8List>(value),
            )),
        r'aMapOfUri': $value.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<Uri>(value),
            )),
        r'aMapOfUriData': $value.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<UriData>(value),
            )),
        r'aNull': $value.aNull,
        r'aRegExp': _i3.Serializers.instance.serialize<RegExp>($value.aRegExp),
        r'aSimpleClass': _i3.Serializers.instance
            .serialize<_i4.SimpleClass>($value.aSimpleClass),
        r'aSimpleStruct': _i3.Serializers.instance
            .serialize<_i4.SimpleStruct>($value.aSimpleStruct),
        r'aStackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.aStackTrace),
        r'aString': $value.aString,
        r'aUint8List': _i3.Serializers.instance
            .serialize<_i7.Uint8List>($value.aUint8List),
        r'aUri': _i3.Serializers.instance.serialize<Uri>($value.aUri),
        r'aUriData':
            _i3.Serializers.instance.serialize<UriData>($value.aUriData),
        r'anEnum':
            _i3.Serializers.instance.serialize<_i4.MyEnum>($value.anEnum),
        r'anInt': $value.anInt,
        r'anIterableOfSimpleClass': $value.anIterableOfSimpleClass
            .map(
                (el) => _i3.Serializers.instance.serialize<_i4.SimpleClass>(el))
            .toList(),
      },
      deserialize: ($serialized) {
        return (
          aBigInt: _i3.Serializers.instance
              .deserialize<BigInt>($serialized[r'aBigInt']),
          aBool: ($serialized[r'aBool'] as bool),
          aDateTime: _i3.Serializers.instance
              .deserialize<DateTime>($serialized[r'aDateTime']),
          aDouble: ($serialized[r'aDouble'] as num).toDouble(),
          aDuration: _i3.Serializers.instance
              .deserialize<Duration>($serialized[r'aDuration']),
          aListOfBigInt: ($serialized[r'aListOfBigInt'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<BigInt>(el))
              .toList(),
          aListOfBool: ($serialized[r'aListOfBool'] as Iterable<Object?>)
              .map((el) => (el as bool))
              .toList(),
          aListOfDateTime: ($serialized[r'aListOfDateTime']
                  as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<DateTime>(el))
              .toList(),
          aListOfDouble: ($serialized[r'aListOfDouble'] as Iterable<Object?>)
              .map((el) => (el as num).toDouble())
              .toList(),
          aListOfDuration: ($serialized[r'aListOfDuration']
                  as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<Duration>(el))
              .toList(),
          aListOfEnum: ($serialized[r'aListOfEnum'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<_i4.MyEnum>(el))
              .toList(),
          aListOfInt: ($serialized[r'aListOfInt'] as Iterable<Object?>)
              .map((el) => (el as num).toInt())
              .toList(),
          aListOfNull: ($serialized[r'aListOfNull'] as Iterable<Object?>)
              .map((el) => (el as Null))
              .toList(),
          aListOfRegExp: ($serialized[r'aListOfRegExp'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<RegExp>(el))
              .toList(),
          aListOfSimpleClass:
              ($serialized[r'aListOfSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.instance.deserialize<_i4.SimpleClass>(el))
                  .toList(),
          aListOfSimpleStruct: ($serialized[r'aListOfSimpleStruct']
                  as Iterable<Object?>)
              .map((el) =>
                  _i3.Serializers.instance.deserialize<_i4.SimpleStruct>(el))
              .toList(),
          aListOfStackTrace: ($serialized[r'aListOfStackTrace']
                  as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<StackTrace>(el))
              .toList(),
          aListOfString: ($serialized[r'aListOfString'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList(),
          aListOfUint8List:
              ($serialized[r'aListOfUint8List'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.instance.deserialize<_i7.Uint8List>(el))
                  .toList(),
          aListOfUri: ($serialized[r'aListOfUri'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<Uri>(el))
              .toList(),
          aListOfUriData: ($serialized[r'aListOfUriData'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<UriData>(el))
              .toList(),
          aMapOfBigInt:
              ($serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<BigInt>(value),
                  )),
          aMapOfBool: ($serialized[r'aMapOfBool'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as bool),
              )),
          aMapOfDateTime:
              ($serialized[r'aMapOfDateTime'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<DateTime>(value),
                  )),
          aMapOfDouble:
              ($serialized[r'aMapOfDouble'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    (value as num).toDouble(),
                  )),
          aMapOfDuration:
              ($serialized[r'aMapOfDuration'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<Duration>(value),
                  )),
          aMapOfEnum: ($serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _i3.Serializers.instance.deserialize<_i4.MyEnum>(value),
              )),
          aMapOfInt: ($serialized[r'aMapOfInt'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as num).toInt(),
              )),
          aMapOfNull: ($serialized[r'aMapOfNull'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as Null),
              )),
          aMapOfRegExp:
              ($serialized[r'aMapOfRegExp'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<RegExp>(value),
                  )),
          aMapOfSimpleClass:
              ($serialized[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance
                        .deserialize<_i4.SimpleClass>(value),
                  )),
          aMapOfSimpleStruct:
              ($serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance
                        .deserialize<_i4.SimpleStruct>(value),
                  )),
          aMapOfStackTrace:
              ($serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<StackTrace>(value),
                  )),
          aMapOfString:
              ($serialized[r'aMapOfString'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    (value as String),
                  )),
          aMapOfUint8List:
              ($serialized[r'aMapOfUint8List'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<_i7.Uint8List>(value),
                  )),
          aMapOfUri: ($serialized[r'aMapOfUri'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _i3.Serializers.instance.deserialize<Uri>(value),
              )),
          aMapOfUriData:
              ($serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<UriData>(value),
                  )),
          aNull: ($serialized[r'aNull'] as Null),
          aRegExp: _i3.Serializers.instance
              .deserialize<RegExp>($serialized[r'aRegExp']),
          aSimpleClass: _i3.Serializers.instance
              .deserialize<_i4.SimpleClass>($serialized[r'aSimpleClass']),
          aSimpleStruct: _i3.Serializers.instance
              .deserialize<_i4.SimpleStruct>($serialized[r'aSimpleStruct']),
          aStackTrace: _i3.Serializers.instance
              .deserialize<StackTrace>($serialized[r'aStackTrace']),
          aString: ($serialized[r'aString'] as String),
          aUint8List: _i3.Serializers.instance
              .deserialize<_i7.Uint8List>($serialized[r'aUint8List']),
          aUri: _i3.Serializers.instance.deserialize<Uri>($serialized[r'aUri']),
          aUriData: _i3.Serializers.instance
              .deserialize<UriData>($serialized[r'aUriData']),
          anEnum: _i3.Serializers.instance
              .deserialize<_i4.MyEnum>($serialized[r'anEnum']),
          anInt: ($serialized[r'anInt'] as num).toInt(),
          anIterableOfSimpleClass:
              ($serialized[r'anIterableOfSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.instance.deserialize<_i4.SimpleClass>(el))
                  .toList()
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.MyEnum, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.MyEnum.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.SimpleClass, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.SimpleClass.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.SimpleStruct, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return ();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i8.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i8.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': ComplexReturnTarget()});
}

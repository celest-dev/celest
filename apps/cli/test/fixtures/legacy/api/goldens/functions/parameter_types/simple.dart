// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/parameter_types.dart' as _i4;
import 'package:celest_backend/src/functions/parameter_types.dart' as _i2;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

final class SimpleTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'simple';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      await _i2.simple(
        (request[r'aString'] as String),
        (request[r'anInt'] as num).toInt(),
        (request[r'aDouble'] as num).toDouble(),
        (request[r'aBool'] as bool),
        _i3.Serializers.instance.deserialize<_i4.MyEnum>(request[r'anEnum']),
        (request[r'aNull'] as Null),
        _i3.Serializers.instance.deserialize<BigInt>(request[r'aBigInt']),
        _i3.Serializers.instance.deserialize<DateTime>(request[r'aDateTime']),
        _i3.Serializers.instance.deserialize<Duration>(request[r'aDuration']),
        _i3.Serializers.instance.deserialize<RegExp>(request[r'aRegExp']),
        _i3.Serializers.instance
            .deserialize<StackTrace>(request[r'aStackTrace']),
        _i3.Serializers.instance.deserialize<Uri>(request[r'aUri']),
        _i3.Serializers.instance.deserialize<UriData>(request[r'aUriData']),
        _i3.Serializers.instance
            .deserialize<_i5.Uint8List>(request[r'aUint8List']),
        (request[r'anIterableOfString'] as Iterable<Object?>)
            .map((el) => (el as String))
            .toList(),
        (request[r'anIterableOfUint8List'] as Iterable<Object?>)
            .map(
                (el) => _i3.Serializers.instance.deserialize<_i5.Uint8List>(el))
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
            .map((el) => _i3.Serializers.instance.deserialize<_i4.MyEnum>(el))
            .toList(),
        (request[r'aListOfNull'] as Iterable<Object?>)
            .map((el) => (el as Null))
            .toList(),
        (request[r'aListOfBigInt'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance.deserialize<BigInt>(el))
            .toList(),
        (request[r'aListOfDateTime'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance.deserialize<DateTime>(el))
            .toList(),
        (request[r'aListOfDuration'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance.deserialize<Duration>(el))
            .toList(),
        (request[r'aListOfRegExp'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance.deserialize<RegExp>(el))
            .toList(),
        (request[r'aListOfStackTrace'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance.deserialize<StackTrace>(el))
            .toList(),
        (request[r'aListOfUri'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance.deserialize<Uri>(el))
            .toList(),
        (request[r'aListOfUriData'] as Iterable<Object?>)
            .map((el) => _i3.Serializers.instance.deserialize<UriData>(el))
            .toList(),
        (request[r'aListOfUint8List'] as Iterable<Object?>)
            .map(
                (el) => _i3.Serializers.instance.deserialize<_i5.Uint8List>(el))
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
              _i3.Serializers.instance.deserialize<_i4.MyEnum>(value),
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
              _i3.Serializers.instance.deserialize<BigInt>(value),
            )),
        (request[r'aMapOfDateTime'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<DateTime>(value),
            )),
        (request[r'aMapOfDuration'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<Duration>(value),
            )),
        (request[r'aMapOfRegExp'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<RegExp>(value),
            )),
        (request[r'aMapOfStackTrace'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<StackTrace>(value),
            )),
        (request[r'aMapOfUri'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<Uri>(value),
            )),
        (request[r'aMapOfUriData'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<UriData>(value),
            )),
        (request[r'aMapOfUint8List'] as Map<String, Object?>).map((
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
      final error = {
        'message': e.message,
        'code': 'celest.core.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.MyEnum, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.MyEnum.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.SerializationException, Map<String, Object?>>(
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
        return _i6.SerializationException(($serialized[r'message'] as String));
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
  await _i1.serve(targets: {'/': SimpleTarget()});
}

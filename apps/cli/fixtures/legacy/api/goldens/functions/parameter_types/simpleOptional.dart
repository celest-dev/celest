// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:convert' as _i11;
import 'dart:typed_data' as _i6;

import 'package:celest/celest.dart' as _i9;
import 'package:celest/src/core/context.dart' as _i8;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/parameter_types.dart' as _i5;
import 'package:celest_backend/src/functions/parameter_types.dart' as _i3;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i12;
import 'package:celest_core/src/serialization/json_value.dart' as _i13;
import 'package:shelf/shelf.dart' as _i2;

final class SimpleOptionalTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'simpleOptional';

  @override
  String get method => 'POST';

  @override
  Future<_i2.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      await _i3.simpleOptional(
        (request[r'aString'] as String?),
        (request[r'anInt'] as num?)?.toInt(),
        (request[r'aDouble'] as num?)?.toDouble(),
        (request[r'aBool'] as bool?),
        _i4.Serializers.instance.deserialize<_i5.MyEnum?>(request[r'anEnum']),
        (request[r'aNull'] as Null),
        _i4.Serializers.instance.deserialize<BigInt?>(request[r'aBigInt']),
        _i4.Serializers.instance.deserialize<DateTime?>(request[r'aDateTime']),
        _i4.Serializers.instance.deserialize<Duration?>(request[r'aDuration']),
        _i4.Serializers.instance.deserialize<RegExp?>(request[r'aRegExp']),
        _i4.Serializers.instance.deserialize<StackTrace?>(
          request[r'aStackTrace'],
        ),
        _i4.Serializers.instance.deserialize<Uri?>(request[r'aUri']),
        _i4.Serializers.instance.deserialize<UriData?>(request[r'aUriData']),
        _i4.Serializers.instance.deserialize<_i6.Uint8List?>(
          request[r'aUint8List'],
        ),
        (request[r'anIterableOfString'] as Iterable<Object?>?)
            ?.map((el) => (el as String))
            .toList(),
        (request[r'anIterableOfUint8List'] as Iterable<Object?>?)
            ?.map(
              (el) => _i4.Serializers.instance.deserialize<_i6.Uint8List>(el),
            )
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
            ?.map((el) => _i4.Serializers.instance.deserialize<_i5.MyEnum>(el))
            .toList(),
        (request[r'aListOfNull'] as Iterable<Object?>?)
            ?.map((el) => (el as Null))
            .toList(),
        (request[r'aListOfBigInt'] as Iterable<Object?>?)
            ?.map((el) => _i4.Serializers.instance.deserialize<BigInt>(el))
            .toList(),
        (request[r'aListOfDateTime'] as Iterable<Object?>?)
            ?.map((el) => _i4.Serializers.instance.deserialize<DateTime>(el))
            .toList(),
        (request[r'aListOfDuration'] as Iterable<Object?>?)
            ?.map((el) => _i4.Serializers.instance.deserialize<Duration>(el))
            .toList(),
        (request[r'aListOfRegExp'] as Iterable<Object?>?)
            ?.map((el) => _i4.Serializers.instance.deserialize<RegExp>(el))
            .toList(),
        (request[r'aListOfStackTrace'] as Iterable<Object?>?)
            ?.map((el) => _i4.Serializers.instance.deserialize<StackTrace>(el))
            .toList(),
        (request[r'aListOfUri'] as Iterable<Object?>?)
            ?.map((el) => _i4.Serializers.instance.deserialize<Uri>(el))
            .toList(),
        (request[r'aListOfUriData'] as Iterable<Object?>?)
            ?.map((el) => _i4.Serializers.instance.deserialize<UriData>(el))
            .toList(),
        (request[r'aListOfUint8List'] as Iterable<Object?>?)
            ?.map(
              (el) => _i4.Serializers.instance.deserialize<_i6.Uint8List>(el),
            )
            .toList(),
        (request[r'aMapOfString'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(key, (value as String)),
        ),
        (request[r'aMapOfInt'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(key, (value as num).toInt()),
        ),
        (request[r'aMapOfDouble'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(key, (value as num).toDouble()),
        ),
        (request[r'aMapOfBool'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(key, (value as bool)),
        ),
        (request[r'aMapOfEnum'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<_i5.MyEnum>(value),
          ),
        ),
        (request[r'aMapOfNull'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(key, (value as Null)),
        ),
        (request[r'aMapOfBigInt'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<BigInt>(value),
          ),
        ),
        (request[r'aMapOfDateTime'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<DateTime>(value),
          ),
        ),
        (request[r'aMapOfDuration'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<Duration>(value),
          ),
        ),
        (request[r'aMapOfRegExp'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<RegExp>(value),
          ),
        ),
        (request[r'aMapOfStackTrace'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<StackTrace>(value),
          ),
        ),
        (request[r'aMapOfUri'] as Map<String, Object?>?)?.map(
          (key, value) =>
              MapEntry(key, _i4.Serializers.instance.deserialize<Uri>(value)),
        ),
        (request[r'aMapOfUriData'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<UriData>(value),
          ),
        ),
        (request[r'aMapOfUint8List'] as Map<String, Object?>?)?.map(
          (key, value) => MapEntry(
            key,
            _i4.Serializers.instance.deserialize<_i6.Uint8List>(value),
          ),
        ),
      );
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(null),
      );
    } on _i7.AbortedException catch (e, st) {
      const statusCode = 409;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.AbortedException',
              'value': _i4.Serializers.instance.serialize<_i7.AbortedException>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.AlreadyExistsException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.AlreadyExistsException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on AssertionError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.AssertionError',
              'value': _i4.Serializers.instance.serialize<AssertionError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i10.AsyncError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.async.AsyncError',
              'value': _i4.Serializers.instance.serialize<_i10.AsyncError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.CancelledException catch (e, st) {
      const statusCode = 499;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.CancelledException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.CancelledException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on ConcurrentModificationError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.ConcurrentModificationError',
              'value': _i4.Serializers.instance
                  .serialize<ConcurrentModificationError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.DataLossError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.DataLossError',
              'value': _i4.Serializers.instance.serialize<_i7.DataLossError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.DeadlineExceededError',
              'value': _i4.Serializers.instance
                  .serialize<_i7.DeadlineExceededError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.FailedPreconditionException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.FailedPreconditionException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on IndexError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.IndexError',
              'value': _i4.Serializers.instance.serialize<IndexError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on IntegerDivisionByZeroException catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.IntegerDivisionByZeroException',
              'value': _i4.Serializers.instance
                  .serialize<IntegerDivisionByZeroException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.InternalServerError',
              'value': _i4.Serializers.instance
                  .serialize<_i7.InternalServerError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i11.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.convert.JsonUnsupportedObjectError',
              'value': _i4.Serializers.instance
                  .serialize<_i11.JsonUnsupportedObjectError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.NotFoundException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.NotFoundException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on OutOfMemoryError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.OutOfMemoryError',
              'value': _i4.Serializers.instance.serialize<OutOfMemoryError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.OutOfRangeException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.OutOfRangeException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.PermissionDeniedException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.PermissionDeniedException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on RangeError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.RangeError',
              'value': _i4.Serializers.instance.serialize<RangeError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on ArgumentError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.ArgumentError',
              'value': _i4.Serializers.instance.serialize<ArgumentError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.ResourceExhaustedException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.ResourceExhaustedException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i12.SerializationException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.SerializationException',
              'value': _i4.Serializers.instance
                  .serialize<_i12.SerializationException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.BadRequestException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.BadRequestException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on FormatException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.FormatException',
              'value': _i4.Serializers.instance.serialize<FormatException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on StackOverflowError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.StackOverflowError',
              'value': _i4.Serializers.instance.serialize<StackOverflowError>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on StateError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.StateError',
              'value': _i4.Serializers.instance.serialize<StateError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i10.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.async.TimeoutException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.TimeoutException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on TypeError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.TypeError',
              'value': _i4.Serializers.instance.serialize<TypeError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnauthorizedException',
              'value': _i4.Serializers.instance
                  .serialize<_i7.UnauthorizedException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnavailableError',
              'value': _i4.Serializers.instance.serialize<_i7.UnavailableError>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnimplementedError',
              'value': _i4.Serializers.instance
                  .serialize<_i7.UnimplementedError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on UnimplementedError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.UnimplementedError',
              'value': _i4.Serializers.instance.serialize<UnimplementedError>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.UnknownError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnknownError',
              'value': _i4.Serializers.instance.serialize<_i7.UnknownError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i7.CloudException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.CloudException',
              'value': _i4.Serializers.instance.serialize<_i7.CloudException>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on Exception catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.Exception',
              'value': _i4.Serializers.instance.serialize<Exception>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on UnsupportedError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.UnsupportedError',
              'value': _i4.Serializers.instance.serialize<UnsupportedError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on Error catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.Error',
              'value': _i4.Serializers.instance.serialize<Error>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.AsyncError, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'error': $value.error,
              r'stackTrace': _i4.Serializers.instance.serialize<StackTrace>(
                $value.stackTrace,
              ),
            },
        deserialize: ($serialized) {
          return _i10.AsyncError(
            $serialized[r'error']!,
            _i4.Serializers.instance.deserialize<StackTrace?>(
              $serialized[r'stackTrace'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.TimeoutException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
              if (_i4.Serializers.instance.serialize<Duration?>($value.duration)
                  case final duration?)
                r'duration': duration,
            },
        deserialize: ($serialized) {
          return _i10.TimeoutException(
            ($serialized[r'message'] as String?),
            _i4.Serializers.instance.deserialize<Duration?>(
              $serialized[r'duration'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i11.JsonUnsupportedObjectError,
        Map<String, Object?>
      >(
        serialize:
            ($value) => <String, Object?>{
              if ($value.unsupportedObject case final unsupportedObject?)
                r'unsupportedObject': unsupportedObject,
              if ($value.cause case final cause?) r'cause': cause,
              if ($value.partialResult case final partialResult?)
                r'partialResult': partialResult,
            },
        deserialize: ($serialized) {
          return _i11.JsonUnsupportedObjectError(
            $serialized[r'unsupportedObject'],
            cause: $serialized[r'cause'],
            partialResult: ($serialized[r'partialResult'] as String?),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<ArgumentError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'invalidValue': $value.invalidValue,
              if ($value.name case final name?) r'name': name,
              r'message': $value.message,
            },
        deserialize: ($serialized) {
          return ArgumentError(
            $serialized?[r'message'],
            ($serialized?[r'name'] as String?),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<AssertionError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
            },
        deserialize: ($serialized) {
          return AssertionError($serialized?[r'message']);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<ConcurrentModificationError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.modifiedObject case final modifiedObject?)
                r'modifiedObject': modifiedObject,
            },
        deserialize: ($serialized) {
          return ConcurrentModificationError($serialized?[r'modifiedObject']);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<Error, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              if (_i4.Serializers.instance.serialize<StackTrace?>(
                    $value.stackTrace,
                  )
                  case final stackTrace?)
                r'stackTrace': stackTrace,
            },
        deserialize: ($serialized) {
          return Error();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<Exception, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return Exception($serialized?[r'message']);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<FormatException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'message': $value.message,
              r'source': $value.source,
              if ($value.offset case final offset?) r'offset': offset,
            },
        deserialize: ($serialized) {
          return FormatException(
            (($serialized?[r'message'] as String?)) ?? '',
            $serialized?[r'source'],
            ($serialized?[r'offset'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<IndexError, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.name case final name?) r'name': name,
              r'message': $value.message,
              if ($value.indexable case final indexable?)
                r'indexable': indexable,
              r'length': $value.length,
              r'invalidValue': $value.invalidValue,
              r'start': $value.start,
              r'end': $value.end,
            },
        deserialize: ($serialized) {
          return IndexError(
            ($serialized[r'invalidValue'] as num).toInt(),
            $serialized[r'indexable'],
            ($serialized[r'name'] as String?),
            ($serialized[r'message'] as String?),
            ($serialized[r'length'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        IntegerDivisionByZeroException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
            },
        deserialize: ($serialized) {
          return IntegerDivisionByZeroException();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return OutOfMemoryError();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<RangeError, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.name case final name?) r'name': name,
              r'message': $value.message,
              if ($value.start case final start?) r'start': start,
              if ($value.end case final end?) r'end': end,
              if ($value.invalidValue case final invalidValue?)
                r'invalidValue': invalidValue,
            },
        deserialize: ($serialized) {
          return RangeError($serialized[r'message']);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<StackOverflowError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return StackOverflowError();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<StateError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return StateError(($serialized[r'message'] as String));
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<TypeError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return TypeError();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<UnimplementedError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
            },
        deserialize: ($serialized) {
          return UnimplementedError(($serialized?[r'message'] as String?));
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<UnsupportedError, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
            },
        deserialize: ($serialized) {
          return UnsupportedError(($serialized[r'message'] as String));
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i5.MyEnum, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return _i5.MyEnum.values.byName($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.AbortedException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.AbortedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.AlreadyExistsException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.AlreadyExistsException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.BadRequestException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.BadRequestException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.CancelledException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.CancelledException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.CloudException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.CloudException.fromJson($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.DataLossError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.DataLossError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.DeadlineExceededError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.DeadlineExceededError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i7.FailedPreconditionException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.FailedPreconditionException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.InternalServerError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.InternalServerError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.NotFoundException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.NotFoundException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.OutOfRangeException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.OutOfRangeException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i7.PermissionDeniedException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.PermissionDeniedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i7.ResourceExhaustedException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.ResourceExhaustedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnauthorizedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnavailableError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnavailableError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnimplementedError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnimplementedError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnknownError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnknownError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i13.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.SerializationException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i13.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i12.SerializationException(
            ($serialized[r'message'] as String?),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i13.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i13.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i13.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/': SimpleOptionalTarget()},
    setup: (_i8.Context context) async {},
  );
}

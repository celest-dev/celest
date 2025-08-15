// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:convert' as _i12;
import 'dart:isolate' as _i11;

import 'package:celest/celest.dart' as _i9;
import 'package:celest/src/core/context.dart' as _i8;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/exceptions.dart' as _i4;
import 'package:celest_backend/models/sealed_classes.dart' as _i3;
import 'package:celest_backend/src/functions/sealed_classes.dart' as _i6;
import 'package:celest_core/celest_core.dart' as _i5;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i13;
import 'package:celest_core/src/serialization/json_value.dart' as _i14;
import 'package:shelf/shelf.dart' as _i2;

final class MultipleGenericResultTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'multipleGenericResult';

  @override
  String get method => 'POST';

  @override
  Future<_i2.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) {
    final $T = (request[r'$T'] as String?);
    final $E = (request[r'$E'] as String?);
    final $types = ($T, $E);
    return switch ($types) {
      (r'Shape' || null, r'ShapeException' || null) =>
        innerHandle<_i3.Shape, _i4.ShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Shape' || null, r'BadShapeException') =>
        innerHandle<_i3.Shape, _i4.BadShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Circle', r'ShapeException' || null) =>
        innerHandle<_i3.Circle, _i4.ShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Circle', r'BadShapeException') =>
        innerHandle<_i3.Circle, _i4.BadShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Rectangle', r'ShapeException' || null) =>
        innerHandle<_i3.Rectangle, _i4.ShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      (r'Rectangle', r'BadShapeException') =>
        innerHandle<_i3.Rectangle, _i4.BadShapeException>(
          request,
          headers: headers,
          queryParameters: queryParameters,
        ),
      _ =>
        throw _i5.SerializationException('Invalid type parameters: ${$types}'),
    };
  }

  Future<_i2.Response>
  innerHandle<T extends _i3.Shape, E extends _i4.ShapeException>(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i6.multipleGenericResult<T, E>(
        _i5.Serializers.instance.deserialize<T>(request[r'data']),
        _i5.Serializers.instance.deserialize<E>(request[r'error']),
      );
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(
          response
              .map(
                (el) =>
                    _i5.Serializers.instance.serialize<_i3.Result<T, E>>(el),
              )
              .toList(),
        ),
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
              'value': _i5.Serializers.instance.serialize<_i7.AbortedException>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.AlreadyExistsException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<AssertionError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<_i10.AsyncError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.CancelledException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<ConcurrentModificationError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i4.CustomErrorToFromJson catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'api.v1.CustomErrorToFromJson',
              'value': _i5.Serializers.instance
                  .serialize<_i4.CustomErrorToFromJson>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i4.CustomError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'api.v1.CustomError',
              'value': _i5.Serializers.instance.serialize<_i4.CustomError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i4.CustomErrorWithStackTrace catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'api.v1.CustomErrorWithStackTrace',
              'value': _i5.Serializers.instance
                  .serialize<_i4.CustomErrorWithStackTrace>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i4.CustomExceptionToFromJson catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'api.v1.CustomExceptionToFromJson',
              'value': _i5.Serializers.instance
                  .serialize<_i4.CustomExceptionToFromJson>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i4.CustomException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'api.v1.CustomException',
              'value': _i5.Serializers.instance.serialize<_i4.CustomException>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<_i7.DataLossError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.DeadlineExceededError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.FailedPreconditionException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<IndexError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<IntegerDivisionByZeroException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.InternalServerError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i11.IsolateSpawnException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.isolate.IsolateSpawnException',
              'value': _i5.Serializers.instance
                  .serialize<_i11.IsolateSpawnException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i12.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.convert.JsonUnsupportedObjectError',
              'value': _i5.Serializers.instance
                  .serialize<_i12.JsonUnsupportedObjectError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.NotFoundException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<OutOfMemoryError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.OutOfRangeException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.PermissionDeniedException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<RangeError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<ArgumentError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.ResourceExhaustedException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    } on _i13.SerializationException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.SerializationException',
              'value': _i5.Serializers.instance
                  .serialize<_i13.SerializationException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.BadRequestException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<FormatException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<StackOverflowError>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<StateError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i10.TimeoutException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<TypeError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.UnauthorizedException>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<_i7.UnavailableError>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance
                  .serialize<_i7.UnimplementedError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<UnimplementedError>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<_i7.UnknownError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<_i7.CloudException>(
                e,
              ),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<Exception>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<UnsupportedError>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
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
              'value': _i5.Serializers.instance.serialize<Error>(e),
            },
            if (_i8.context.environment != _i9.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        },
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i5.JsonUtf8.encode(status),
      );
    }
  }

  @override
  void init() {
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i10.AsyncError, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'error': $value.error,
              r'stackTrace': _i5.Serializers.instance.serialize<StackTrace>(
                $value.stackTrace,
              ),
            },
        deserialize: ($serialized) {
          return _i10.AsyncError(
            $serialized[r'error']!,
            _i5.Serializers.instance.deserialize<StackTrace?>(
              $serialized[r'stackTrace'],
            ),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i10.TimeoutException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
              if (_i5.Serializers.instance.serialize<Duration?>($value.duration)
                  case final duration?)
                r'duration': duration,
            },
        deserialize: ($serialized) {
          return _i10.TimeoutException(
            ($serialized[r'message'] as String?),
            _i5.Serializers.instance.deserialize<Duration?>(
              $serialized[r'duration'],
            ),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<
        _i12.JsonUnsupportedObjectError,
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
          return _i12.JsonUnsupportedObjectError(
            $serialized[r'unsupportedObject'],
            cause: $serialized[r'cause'],
            partialResult: ($serialized[r'partialResult'] as String?),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<ArgumentError, Map<String, Object?>?>(
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
    _i5.Serializers.instance.put(
      _i5.Serializer.define<AssertionError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
            },
        deserialize: ($serialized) {
          return AssertionError($serialized?[r'message']);
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<ConcurrentModificationError, Map<String, Object?>?>(
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
    _i5.Serializers.instance.put(
      _i5.Serializer.define<Error, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              if (_i5.Serializers.instance.serialize<StackTrace?>(
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
    _i5.Serializers.instance.put(
      _i5.Serializer.define<Exception, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return Exception($serialized?[r'message']);
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<FormatException, Map<String, Object?>?>(
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
    _i5.Serializers.instance.put(
      _i5.Serializer.define<IndexError, Map<String, Object?>>(
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
    _i5.Serializers.instance.put(
      _i5.Serializer.define<
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
    _i5.Serializers.instance.put(
      _i5.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return OutOfMemoryError();
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<RangeError, Map<String, Object?>>(
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
    _i5.Serializers.instance.put(
      _i5.Serializer.define<StackOverflowError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return StackOverflowError();
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<StateError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return StateError(($serialized[r'message'] as String));
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<TypeError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return TypeError();
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<UnimplementedError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
            },
        deserialize: ($serialized) {
          return UnimplementedError(($serialized?[r'message'] as String?));
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<UnsupportedError, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
            },
        deserialize: ($serialized) {
          return UnsupportedError(($serialized[r'message'] as String));
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i11.IsolateSpawnException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _i11.IsolateSpawnException(
            ($serialized[r'message'] as String),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i4.BadShapeException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'shape': _i5.Serializers.instance.serialize<_i3.Shape>(
                $value.shape,
              ),
            },
        deserialize: ($serialized) {
          return _i4.BadShapeException(
            _i5.Serializers.instance.deserialize<_i3.Shape>(
              $serialized[r'shape'],
            ),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i4.CustomError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'message': $value.message,
              r'additionalInfo': _i5.Serializers.instance
                  .serialize<_i14.JsonMap>(
                    $value.additionalInfo,
                    const _i5.TypeToken<_i14.JsonMap>('JsonMap'),
                  ),
            },
        deserialize: ($serialized) {
          return _i4.CustomError();
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i4.CustomErrorToFromJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return _i4.CustomErrorToFromJson.fromJson($serialized);
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<
        _i4.CustomErrorWithStackTrace,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'stackTrace': _i5.Serializers.instance.serialize<StackTrace>(
                $value.stackTrace,
              ),
              r'message': $value.message,
              r'additionalInfo': $value.additionalInfo,
            },
        deserialize: ($serialized) {
          return _i4.CustomErrorWithStackTrace(
            stackTrace: _i5.Serializers.instance.deserialize<StackTrace?>(
              $serialized?[r'stackTrace'],
            ),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i4.CustomException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'message': $value.message,
              r'additionalInfo': _i5.Serializers.instance
                  .serialize<_i14.JsonMap>(
                    $value.additionalInfo,
                    const _i5.TypeToken<_i14.JsonMap>('JsonMap'),
                  ),
            },
        deserialize: ($serialized) {
          return _i4.CustomException();
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<
        _i4.CustomExceptionToFromJson,
        Map<String, Object?>
      >(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return _i4.CustomExceptionToFromJson.fromJson($serialized);
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i4.ShapeException, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is _i4.BadShapeException) {
            return {
              ...(_i5.Serializers.instance.serialize<_i4.BadShapeException>(
                    $value,
                  )
                  as Map<String, Object?>),
              r'$type': r'BadShapeException',
            };
          }
          throw _i5.SerializationException(
            (StringBuffer('Unknown subtype of ')
                  ..write(r'ShapeException')
                  ..write(': ')
                  ..write($value.runtimeType))
                .toString(),
          );
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'BadShapeException') {
            return _i5.Serializers.instance.deserialize<_i4.BadShapeException>(
              $serialized,
            );
          }
          throw _i5.SerializationException(
            (StringBuffer('Unknown subtype of ')
                  ..write(r'ShapeException')
                  ..write(': ')
                  ..write($serialized[r'$type']))
                .toString(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i3.Circle, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'radius': $value.radius,
              r'area': $value.area,
            },
        deserialize: ($serialized) {
          return _i3.Circle(($serialized[r'radius'] as num).toDouble());
        },
      ),
    );
    _i5.Serializers.instance.put(const ErrResult_E_ShapeExceptionSerializer());
    _i5.Serializers.instance.put(
      const ErrResult_E_ShapeExceptionSerializer<_i4.ShapeException>(),
    );
    _i5.Serializers.instance.put(
      const ErrResult_E_ShapeExceptionSerializer<_i4.BadShapeException>(),
    );
    _i5.Serializers.instance.put(const ErrResult_T_ShapeSerializer());
    _i5.Serializers.instance.put(
      const ErrResult_T_ShapeSerializer<_i3.Shape>(),
    );
    _i5.Serializers.instance.put(
      const ErrResult_T_ShapeSerializer<_i3.Circle>(),
    );
    _i5.Serializers.instance.put(
      const ErrResult_T_ShapeSerializer<_i3.Rectangle>(),
    );
    _i5.Serializers.instance.put(const OkResult_E_ShapeExceptionSerializer());
    _i5.Serializers.instance.put(
      const OkResult_E_ShapeExceptionSerializer<_i4.ShapeException>(),
    );
    _i5.Serializers.instance.put(
      const OkResult_E_ShapeExceptionSerializer<_i4.BadShapeException>(),
    );
    _i5.Serializers.instance.put(const OkResult_T_ShapeSerializer());
    _i5.Serializers.instance.put(const OkResult_T_ShapeSerializer<_i3.Shape>());
    _i5.Serializers.instance.put(
      const OkResult_T_ShapeSerializer<_i3.Circle>(),
    );
    _i5.Serializers.instance.put(
      const OkResult_T_ShapeSerializer<_i3.Rectangle>(),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i3.Rectangle, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'width': $value.width,
              r'height': $value.height,
              r'area': $value.area,
            },
        deserialize: ($serialized) {
          return _i3.Rectangle(
            ($serialized[r'width'] as num).toDouble(),
            ($serialized[r'height'] as num).toDouble(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      const Result_E_ShapeException_T_ShapeSerializer(),
    );
    _i5.Serializers.instance.put(
      const Result_E_ShapeException_T_ShapeSerializer<
        _i4.ShapeException,
        _i3.Shape
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_E_ShapeException_T_ShapeSerializer<
        _i4.ShapeException,
        _i3.Circle
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_E_ShapeException_T_ShapeSerializer<
        _i4.ShapeException,
        _i3.Rectangle
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_E_ShapeException_T_ShapeSerializer<
        _i4.BadShapeException,
        _i3.Shape
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_E_ShapeException_T_ShapeSerializer<
        _i4.BadShapeException,
        _i3.Circle
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_E_ShapeException_T_ShapeSerializer<
        _i4.BadShapeException,
        _i3.Rectangle
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_T_Shape_E_ShapeExceptionSerializer(),
    );
    _i5.Serializers.instance.put(
      const Result_T_Shape_E_ShapeExceptionSerializer<
        _i3.Shape,
        _i4.ShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_T_Shape_E_ShapeExceptionSerializer<
        _i3.Shape,
        _i4.BadShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_T_Shape_E_ShapeExceptionSerializer<
        _i3.Circle,
        _i4.ShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_T_Shape_E_ShapeExceptionSerializer<
        _i3.Circle,
        _i4.BadShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_T_Shape_E_ShapeExceptionSerializer<
        _i3.Rectangle,
        _i4.ShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const Result_T_Shape_E_ShapeExceptionSerializer<
        _i3.Rectangle,
        _i4.BadShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i3.Shape, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is _i3.Circle) {
            return {
              ...(_i5.Serializers.instance.serialize<_i3.Circle>($value)
                  as Map<String, Object?>),
              r'$type': r'Circle',
            };
          }
          if ($value is _i3.Rectangle) {
            return {
              ...(_i5.Serializers.instance.serialize<_i3.Rectangle>($value)
                  as Map<String, Object?>),
              r'$type': r'Rectangle',
            };
          }
          throw _i5.SerializationException(
            (StringBuffer('Unknown subtype of ')
                  ..write(r'Shape')
                  ..write(': ')
                  ..write($value.runtimeType))
                .toString(),
          );
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'Circle') {
            return _i5.Serializers.instance.deserialize<_i3.Circle>(
              $serialized,
            );
          }
          if ($serialized[r'$type'] == r'Rectangle') {
            return _i5.Serializers.instance.deserialize<_i3.Rectangle>(
              $serialized,
            );
          }
          throw _i5.SerializationException(
            (StringBuffer('Unknown subtype of ')
                  ..write(r'Shape')
                  ..write(': ')
                  ..write($serialized[r'$type']))
                .toString(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
        _i4.ShapeException,
        _i3.Shape
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
        _i4.ShapeException,
        _i3.Circle
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
        _i4.ShapeException,
        _i3.Rectangle
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
        _i4.BadShapeException,
        _i3.Shape
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
        _i4.BadShapeException,
        _i3.Circle
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
        _i4.BadShapeException,
        _i3.Rectangle
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        _i3.Shape,
        _i4.ShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        _i3.Shape,
        _i4.BadShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        _i3.Circle,
        _i4.ShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        _i3.Circle,
        _i4.BadShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        _i3.Rectangle,
        _i4.ShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        _i3.Rectangle,
        _i4.BadShapeException
      >(),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.AbortedException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.AbortedException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.AlreadyExistsException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.AlreadyExistsException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.BadRequestException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.BadRequestException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.CancelledException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.CancelledException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.CloudException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.CloudException.fromJson($serialized);
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.DataLossError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.DataLossError(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.DeadlineExceededError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.DeadlineExceededError(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<
        _i7.FailedPreconditionException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.FailedPreconditionException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.InternalServerError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.InternalServerError(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.NotFoundException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.NotFoundException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.OutOfRangeException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.OutOfRangeException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<
        _i7.PermissionDeniedException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.PermissionDeniedException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<
        _i7.ResourceExhaustedException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.ResourceExhaustedException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnauthorizedException(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.UnavailableError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnavailableError(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.UnimplementedError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnimplementedError(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i7.UnknownError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i7.UnknownError(
            ($serialized?[r'message'] as String?),
            _i5.Serializers.instance.deserialize<_i14.JsonValue?>(
              $serialized?[r'details'],
              const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i13.SerializationException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i5.Serializers.instance.serialize<_i14.JsonValue?>(
                    $value.details,
                    const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i13.SerializationException(
            ($serialized[r'message'] as String?),
          );
        },
      ),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i14.JsonMap, Map<String, Object?>>(
        serialize: ($value) => $value,
        deserialize: ($serialized) {
          return _i14.JsonMap(($serialized as Map<String, Object?>));
        },
      ),
      const _i5.TypeToken<_i14.JsonMap>('JsonMap'),
    );
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i14.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i14.JsonValue($serialized);
        },
      ),
      const _i5.TypeToken<_i14.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/': MultipleGenericResultTarget()},
    setup: (_i8.Context context) async {},
  );
}

final class ErrResult_E_ShapeExceptionSerializer<E extends _i4.ShapeException>
    extends _i5.Serializer<_i3.ErrResult<E>> {
  const ErrResult_E_ShapeExceptionSerializer();

  @override
  _i3.ErrResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i3.ErrResult<E>(
      _i5.Serializers.instance.deserialize<E>($serialized[r'error']),
    );
  }

  @override
  Object? serialize(_i3.ErrResult<E> $value) => <String, Object?>{
    r'error': _i5.Serializers.instance.serialize<E>($value.error),
  };
}

final class ErrResult_T_ShapeSerializer<T extends _i3.Shape>
    extends _i5.Serializer<_i3.ErrResult<T>> {
  const ErrResult_T_ShapeSerializer();

  @override
  _i3.ErrResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i3.ErrResult<T>(
      _i5.Serializers.instance.deserialize<T>($serialized[r'error']),
    );
  }

  @override
  Object? serialize(_i3.ErrResult<T> $value) => <String, Object?>{
    r'error': _i5.Serializers.instance.serialize<T>($value.error),
  };
}

final class OkResult_E_ShapeExceptionSerializer<E extends _i4.ShapeException>
    extends _i5.Serializer<_i3.OkResult<E>> {
  const OkResult_E_ShapeExceptionSerializer();

  @override
  _i3.OkResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i3.OkResult<E>(
      _i5.Serializers.instance.deserialize<E>($serialized[r'data']),
    );
  }

  @override
  Object? serialize(_i3.OkResult<E> $value) => <String, Object?>{
    r'data': _i5.Serializers.instance.serialize<E>($value.data),
  };
}

final class OkResult_T_ShapeSerializer<T extends _i3.Shape>
    extends _i5.Serializer<_i3.OkResult<T>> {
  const OkResult_T_ShapeSerializer();

  @override
  _i3.OkResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i3.OkResult<T>(
      _i5.Serializers.instance.deserialize<T>($serialized[r'data']),
    );
  }

  @override
  Object? serialize(_i3.OkResult<T> $value) => <String, Object?>{
    r'data': _i5.Serializers.instance.serialize<T>($value.data),
  };
}

final class Result_E_ShapeException_T_ShapeSerializer<
  E extends _i4.ShapeException,
  T extends _i3.Shape
>
    extends _i5.Serializer<_i3.Result<E, T>> {
  const Result_E_ShapeException_T_ShapeSerializer();

  @override
  _i3.Result<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'OkResult') {
      return _i5.Serializers.instance.deserialize<_i3.OkResult<E>>($serialized);
    }
    if ($serialized[r'$type'] == r'SwappedResult') {
      return _i5.Serializers.instance.deserialize<_i3.SwappedResult<T, E>>(
        $serialized,
      );
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return _i5.Serializers.instance.deserialize<_i3.ErrResult<T>>(
        $serialized,
      );
    }
    throw _i5.SerializationException(
      (StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString(),
    );
  }

  @override
  Object? serialize(_i3.Result<E, T> $value) {
    if ($value is _i3.OkResult<E>) {
      return {
        ...(_i5.Serializers.instance.serialize<_i3.OkResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is _i3.SwappedResult<T, E>) {
      return {
        ...(_i5.Serializers.instance.serialize<_i3.SwappedResult<T, E>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is _i3.ErrResult<T>) {
      return {
        ...(_i5.Serializers.instance.serialize<_i3.ErrResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw _i5.SerializationException(
      (StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($value.runtimeType))
          .toString(),
    );
  }
}

final class Result_T_Shape_E_ShapeExceptionSerializer<
  T extends _i3.Shape,
  E extends _i4.ShapeException
>
    extends _i5.Serializer<_i3.Result<T, E>> {
  const Result_T_Shape_E_ShapeExceptionSerializer();

  @override
  _i3.Result<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'OkResult') {
      return _i5.Serializers.instance.deserialize<_i3.OkResult<T>>($serialized);
    }
    if ($serialized[r'$type'] == r'SwappedResult') {
      return _i5.Serializers.instance.deserialize<_i3.SwappedResult<E, T>>(
        $serialized,
      );
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return _i5.Serializers.instance.deserialize<_i3.ErrResult<E>>(
        $serialized,
      );
    }
    throw _i5.SerializationException(
      (StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString(),
    );
  }

  @override
  Object? serialize(_i3.Result<T, E> $value) {
    if ($value is _i3.OkResult<T>) {
      return {
        ...(_i5.Serializers.instance.serialize<_i3.OkResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is _i3.SwappedResult<E, T>) {
      return {
        ...(_i5.Serializers.instance.serialize<_i3.SwappedResult<E, T>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is _i3.ErrResult<E>) {
      return {
        ...(_i5.Serializers.instance.serialize<_i3.ErrResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw _i5.SerializationException(
      (StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($value.runtimeType))
          .toString(),
    );
  }
}

final class SwappedResult_E_ShapeException_T_ShapeSerializer<
  E extends _i4.ShapeException,
  T extends _i3.Shape
>
    extends _i5.Serializer<_i3.SwappedResult<E, T>> {
  const SwappedResult_E_ShapeException_T_ShapeSerializer();

  @override
  _i3.SwappedResult<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i3.SwappedResult<E, T>(
      _i5.Serializers.instance.deserialize<_i3.Result<E, T>>(
        $serialized[r'result'],
      ),
    );
  }

  @override
  Object? serialize(_i3.SwappedResult<E, T> $value) => <String, Object?>{
    r'result': _i5.Serializers.instance.serialize<_i3.Result<E, T>>(
      $value.result,
    ),
  };
}

final class SwappedResult_T_Shape_E_ShapeExceptionSerializer<
  T extends _i3.Shape,
  E extends _i4.ShapeException
>
    extends _i5.Serializer<_i3.SwappedResult<T, E>> {
  const SwappedResult_T_Shape_E_ShapeExceptionSerializer();

  @override
  _i3.SwappedResult<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i3.SwappedResult<T, E>(
      _i5.Serializers.instance.deserialize<_i3.Result<T, E>>(
        $serialized[r'result'],
      ),
    );
  }

  @override
  Object? serialize(_i3.SwappedResult<T, E> $value) => <String, Object?>{
    r'result': _i5.Serializers.instance.serialize<_i3.Result<T, E>>(
      $value.result,
    ),
  };
}

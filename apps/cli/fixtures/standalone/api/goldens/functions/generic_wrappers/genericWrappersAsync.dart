// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:convert' as _i10;

import 'package:celest/celest.dart' as _i8;
import 'package:celest/src/core/context.dart' as _i7;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/generic_wrappers.dart' as _i5;
import 'package:celest_backend/models/parameter_types.dart' as _i13;
import 'package:celest_backend/src/functions/generic_wrappers.dart' as _i3;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i11;
import 'package:celest_core/src/serialization/json_value.dart' as _i15;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i12;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i14;
import 'package:shelf/shelf.dart' as _i2;

final class GenericWrappersAsyncTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'genericWrappersAsync';

  @override
  String get method => 'POST';

  @override
  Future<_i2.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i3.genericWrappersAsync(
        _i4.Serializers.instance.deserialize<_i5.GenericWrappers>(
          request[r'value'],
        ),
      );
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(
          _i4.Serializers.instance.serialize<_i5.GenericWrappers>(response),
        ),
      );
    } on _i6.AbortedException catch (e, st) {
      const statusCode = 409;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.AbortedException',
              'value': _i4.Serializers.instance.serialize<_i6.AbortedException>(
                e,
              ),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.AlreadyExistsException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.AlreadyExistsException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.AssertionError',
              'value': _i4.Serializers.instance.serialize<AssertionError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i9.AsyncError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.async.AsyncError',
              'value': _i4.Serializers.instance.serialize<_i9.AsyncError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.CancelledException catch (e, st) {
      const statusCode = 499;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.CancelledException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.CancelledException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.DataLossError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.DataLossError',
              'value': _i4.Serializers.instance.serialize<_i6.DataLossError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.DeadlineExceededError',
              'value': _i4.Serializers.instance
                  .serialize<_i6.DeadlineExceededError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.FailedPreconditionException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.FailedPreconditionException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.IndexError',
              'value': _i4.Serializers.instance.serialize<IndexError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.message, e, st);
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.InternalServerError',
              'value': _i4.Serializers.instance
                  .serialize<_i6.InternalServerError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i10.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.convert.JsonUnsupportedObjectError',
              'value': _i4.Serializers.instance
                  .serialize<_i10.JsonUnsupportedObjectError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.NotFoundException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.NotFoundException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.OutOfMemoryError',
              'value': _i4.Serializers.instance.serialize<OutOfMemoryError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.OutOfRangeException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.OutOfRangeException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.PermissionDeniedException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.PermissionDeniedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.RangeError',
              'value': _i4.Serializers.instance.serialize<RangeError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.ArgumentError',
              'value': _i4.Serializers.instance.serialize<ArgumentError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.ResourceExhaustedException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.ResourceExhaustedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i11.SerializationException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.SerializationException',
              'value': _i4.Serializers.instance
                  .serialize<_i11.SerializationException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.BadRequestException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.BadRequestException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.FormatException',
              'value': _i4.Serializers.instance.serialize<FormatException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
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
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.StateError',
              'value': _i4.Serializers.instance.serialize<StateError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i9.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.async.TimeoutException',
              'value': _i4.Serializers.instance.serialize<_i9.TimeoutException>(
                e,
              ),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.TypeError',
              'value': _i4.Serializers.instance.serialize<TypeError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnauthorizedException',
              'value': _i4.Serializers.instance
                  .serialize<_i6.UnauthorizedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnavailableError',
              'value': _i4.Serializers.instance.serialize<_i6.UnavailableError>(
                e,
              ),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnimplementedError',
              'value': _i4.Serializers.instance
                  .serialize<_i6.UnimplementedError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.message, e, st);
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnknownError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnknownError',
              'value': _i4.Serializers.instance.serialize<_i6.UnknownError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.CloudException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.CloudException',
              'value': _i4.Serializers.instance.serialize<_i6.CloudException>(
                e,
              ),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.Exception',
              'value': _i4.Serializers.instance.serialize<Exception>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.UnsupportedError',
              'value': _i4.Serializers.instance.serialize<UnsupportedError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.Error',
              'value': _i4.Serializers.instance.serialize<Error>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i4.Serializer.define<_i9.AsyncError, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'error': $value.error,
              r'stackTrace': _i4.Serializers.instance.serialize<StackTrace>(
                $value.stackTrace,
              ),
            },
        deserialize: ($serialized) {
          return _i9.AsyncError(
            $serialized[r'error']!,
            _i4.Serializers.instance.deserialize<StackTrace?>(
              $serialized[r'stackTrace'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i9.TimeoutException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              if ($value.message case final message?) r'message': message,
              if (_i4.Serializers.instance.serialize<Duration?>($value.duration)
                  case final duration?)
                r'duration': duration,
            },
        deserialize: ($serialized) {
          return _i9.TimeoutException(
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
        _i10.JsonUnsupportedObjectError,
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
          return _i10.JsonUnsupportedObjectError(
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
      _i4.Serializer.define<_i5.GenericWrappers, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'listOfString': _i4.Serializers.instance
                  .serialize<_i12.IList<String>>($value.listOfString),
              r'listOfUri': _i4.Serializers.instance.serialize<_i12.IList<Uri>>(
                $value.listOfUri,
              ),
              r'listOfSimpleClass': _i4.Serializers.instance
                  .serialize<_i12.IList<_i13.SimpleClass>>(
                    $value.listOfSimpleClass,
                  ),
              r'listOfListOfString': _i4.Serializers.instance
                  .serialize<_i12.IList<_i12.IList<String>>>(
                    $value.listOfListOfString,
                  ),
              r'listOfListOfUri': _i4.Serializers.instance
                  .serialize<_i12.IList<_i12.IList<Uri>>>(
                    $value.listOfListOfUri,
                  ),
              r'listOfListOfSimpleClass': _i4.Serializers.instance
                  .serialize<_i12.IList<_i12.IList<_i13.SimpleClass>>>(
                    $value.listOfListOfSimpleClass,
                  ),
              r'mapOfString': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, String>>($value.mapOfString),
              r'mapOfUri': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, Uri>>($value.mapOfUri),
              r'mapOfSimpleClass': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, _i13.SimpleClass>>(
                    $value.mapOfSimpleClass,
                  ),
              r'mapOfListOfString': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, _i12.IList<String>>>(
                    $value.mapOfListOfString,
                  ),
              r'mapOfListOfUri': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, _i12.IList<Uri>>>(
                    $value.mapOfListOfUri,
                  ),
              r'mapOfListOfSimpleClass': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, _i12.IList<_i13.SimpleClass>>>(
                    $value.mapOfListOfSimpleClass,
                  ),
              r'mapOfMapOfString': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, _i14.IMap<String, String>>>(
                    $value.mapOfMapOfString,
                  ),
              r'mapOfMapOfUri': _i4.Serializers.instance
                  .serialize<_i14.IMap<String, _i14.IMap<String, Uri>>>(
                    $value.mapOfMapOfUri,
                  ),
              r'mapOfMapOfSimpleClass': _i4.Serializers.instance.serialize<
                _i14.IMap<String, _i14.IMap<String, _i13.SimpleClass>>
              >($value.mapOfMapOfSimpleClass),
            },
        deserialize: ($serialized) {
          return _i5.GenericWrappers(
            listOfString: _i4.Serializers.instance
                .deserialize<_i12.IList<String>>($serialized[r'listOfString']),
            listOfUri: _i4.Serializers.instance.deserialize<_i12.IList<Uri>>(
              $serialized[r'listOfUri'],
            ),
            listOfSimpleClass: _i4.Serializers.instance
                .deserialize<_i12.IList<_i13.SimpleClass>>(
                  $serialized[r'listOfSimpleClass'],
                ),
            listOfListOfString: _i4.Serializers.instance
                .deserialize<_i12.IList<_i12.IList<String>>>(
                  $serialized[r'listOfListOfString'],
                ),
            listOfListOfUri: _i4.Serializers.instance
                .deserialize<_i12.IList<_i12.IList<Uri>>>(
                  $serialized[r'listOfListOfUri'],
                ),
            listOfListOfSimpleClass: _i4.Serializers.instance
                .deserialize<_i12.IList<_i12.IList<_i13.SimpleClass>>>(
                  $serialized[r'listOfListOfSimpleClass'],
                ),
            mapOfString: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, String>>(
                  $serialized[r'mapOfString'],
                ),
            mapOfUri: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, Uri>>($serialized[r'mapOfUri']),
            mapOfSimpleClass: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, _i13.SimpleClass>>(
                  $serialized[r'mapOfSimpleClass'],
                ),
            mapOfListOfString: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, _i12.IList<String>>>(
                  $serialized[r'mapOfListOfString'],
                ),
            mapOfListOfUri: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, _i12.IList<Uri>>>(
                  $serialized[r'mapOfListOfUri'],
                ),
            mapOfListOfSimpleClass: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, _i12.IList<_i13.SimpleClass>>>(
                  $serialized[r'mapOfListOfSimpleClass'],
                ),
            mapOfMapOfString: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, _i14.IMap<String, String>>>(
                  $serialized[r'mapOfMapOfString'],
                ),
            mapOfMapOfUri: _i4.Serializers.instance
                .deserialize<_i14.IMap<String, _i14.IMap<String, Uri>>>(
                  $serialized[r'mapOfMapOfUri'],
                ),
            mapOfMapOfSimpleClass: _i4.Serializers.instance.deserialize<
              _i14.IMap<String, _i14.IMap<String, _i13.SimpleClass>>
            >($serialized[r'mapOfMapOfSimpleClass']),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i13.SimpleClass, Map<String, dynamic>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return _i13.SimpleClass.fromJson($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.AbortedException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.AbortedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.AlreadyExistsException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.BadRequestException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.BadRequestException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.CancelledException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.CancelledException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.CloudException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.CloudException.fromJson($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.DataLossError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.DataLossError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.DeadlineExceededError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i6.FailedPreconditionException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.FailedPreconditionException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.InternalServerError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.InternalServerError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.NotFoundException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.NotFoundException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.OutOfRangeException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i6.PermissionDeniedException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.PermissionDeniedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i6.ResourceExhaustedException,
        Map<String, Object?>?
      >(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.ResourceExhaustedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.UnauthorizedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.UnavailableError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.UnavailableError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.UnimplementedError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.UnknownError, Map<String, Object?>?>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i6.UnknownError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i11.SerializationException, Map<String, Object?>>(
        serialize:
            ($value) => <String, Object?>{
              r'code': $value.code,
              r'message': $value.message,
              if (_i4.Serializers.instance.serialize<_i15.JsonValue?>(
                    $value.details,
                    const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
                  )
                  case final details?)
                r'details': details,
            },
        deserialize: ($serialized) {
          return _i11.SerializationException(
            ($serialized[r'message'] as String?),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i15.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.IList<String>, dynamic>(
        serialize: ($value) => $value.toJson((value) => value),
        deserialize: ($serialized) {
          return _i12.IList<String>.fromJson(
            $serialized,
            (value) => (value as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.IList<Uri>, dynamic>(
        serialize:
            ($value) => $value.toJson(
              (value) => _i4.Serializers.instance.serialize<Uri>(value),
            ),
        deserialize: ($serialized) {
          return _i12.IList<Uri>.fromJson(
            $serialized,
            (value) => _i4.Serializers.instance.deserialize<Uri>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.IList<_i13.SimpleClass>, dynamic>(
        serialize:
            ($value) => $value.toJson(
              (value) =>
                  _i4.Serializers.instance.serialize<_i13.SimpleClass>(value),
            ),
        deserialize: ($serialized) {
          return _i12.IList<_i13.SimpleClass>.fromJson(
            $serialized,
            (value) =>
                _i4.Serializers.instance.deserialize<_i13.SimpleClass>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.IList<_i12.IList<String>>, dynamic>(
        serialize:
            ($value) => $value.toJson(
              (value) =>
                  _i4.Serializers.instance.serialize<_i12.IList<String>>(value),
            ),
        deserialize: ($serialized) {
          return _i12.IList<_i12.IList<String>>.fromJson(
            $serialized,
            (value) =>
                _i4.Serializers.instance.deserialize<_i12.IList<String>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.IList<_i12.IList<Uri>>, dynamic>(
        serialize:
            ($value) => $value.toJson(
              (value) =>
                  _i4.Serializers.instance.serialize<_i12.IList<Uri>>(value),
            ),
        deserialize: ($serialized) {
          return _i12.IList<_i12.IList<Uri>>.fromJson(
            $serialized,
            (value) =>
                _i4.Serializers.instance.deserialize<_i12.IList<Uri>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.IList<_i12.IList<_i13.SimpleClass>>, dynamic>(
        serialize:
            ($value) => $value.toJson(
              (value) => _i4.Serializers.instance
                  .serialize<_i12.IList<_i13.SimpleClass>>(value),
            ),
        deserialize: ($serialized) {
          return _i12.IList<_i12.IList<_i13.SimpleClass>>.fromJson(
            $serialized,
            (value) => _i4.Serializers.instance
                .deserialize<_i12.IList<_i13.SimpleClass>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i14.IMap<String, String>, Map<String, Object?>>(
        serialize:
            ($value) => $value.toJson((value) => value, (value) => value),
        deserialize: ($serialized) {
          return _i14.IMap<String, String>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => (value as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i14.IMap<String, Uri>, Map<String, Object?>>(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) => _i4.Serializers.instance.serialize<Uri>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<String, Uri>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _i4.Serializers.instance.deserialize<Uri>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i14.IMap<String, _i13.SimpleClass>,
        Map<String, Object?>
      >(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) =>
                  _i4.Serializers.instance.serialize<_i13.SimpleClass>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<String, _i13.SimpleClass>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) =>
                _i4.Serializers.instance.deserialize<_i13.SimpleClass>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i14.IMap<String, _i12.IList<String>>,
        Map<String, Object?>
      >(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) =>
                  _i4.Serializers.instance.serialize<_i12.IList<String>>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<String, _i12.IList<String>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) =>
                _i4.Serializers.instance.deserialize<_i12.IList<String>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i14.IMap<String, _i12.IList<Uri>>,
        Map<String, Object?>
      >(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) =>
                  _i4.Serializers.instance.serialize<_i12.IList<Uri>>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<String, _i12.IList<Uri>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) =>
                _i4.Serializers.instance.deserialize<_i12.IList<Uri>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i14.IMap<String, _i12.IList<_i13.SimpleClass>>,
        Map<String, Object?>
      >(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) => _i4.Serializers.instance
                  .serialize<_i12.IList<_i13.SimpleClass>>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<String, _i12.IList<_i13.SimpleClass>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _i4.Serializers.instance
                .deserialize<_i12.IList<_i13.SimpleClass>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i14.IMap<String, _i14.IMap<String, String>>,
        Map<String, Object?>
      >(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) => _i4.Serializers.instance
                  .serialize<_i14.IMap<String, String>>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<String, _i14.IMap<String, String>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _i4.Serializers.instance
                .deserialize<_i14.IMap<String, String>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i14.IMap<String, _i14.IMap<String, Uri>>,
        Map<String, Object?>
      >(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) => _i4.Serializers.instance
                  .serialize<_i14.IMap<String, Uri>>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<String, _i14.IMap<String, Uri>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _i4.Serializers.instance
                .deserialize<_i14.IMap<String, Uri>>(value),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i14.IMap<String, _i14.IMap<String, _i13.SimpleClass>>,
        Map<String, Object?>
      >(
        serialize:
            ($value) => $value.toJson(
              (value) => value,
              (value) => _i4.Serializers.instance
                  .serialize<_i14.IMap<String, _i13.SimpleClass>>(value),
            ),
        deserialize: ($serialized) {
          return _i14.IMap<
            String,
            _i14.IMap<String, _i13.SimpleClass>
          >.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _i4.Serializers.instance
                .deserialize<_i14.IMap<String, _i13.SimpleClass>>(value),
          );
        },
      ),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/': GenericWrappersAsyncTarget()},
    setup: (_i7.Context context) async {},
  );
}

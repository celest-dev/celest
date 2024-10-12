// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i8;

import 'package:celest/celest.dart' as _i6;
import 'package:celest/src/core/context.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/authenticated_lib.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i5;
import 'package:celest_core/src/auth/user.dart' as _i10;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i4;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i9;
import 'package:celest_core/src/serialization/json_value.dart' as _i11;

final class StreamHelloTarget extends _i1.CloudEventSourceTarget {
  @override
  String get name => 'streamHello';

  @override
  bool get hasBody => false;

  @override
  Stream<Object?> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async* {
    try {
      await for (final response in _i2.streamHello(
          user: _i3.context.expect(_i3.ContextKey.principal))) {
        yield response;
      }
    } on _i4.AbortedException catch (e, st) {
      const statusCode = 409;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.AbortedException',
              'value':
                  _i5.Serializers.instance.serialize<_i4.AbortedException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.AlreadyExistsException',
              'value': _i5.Serializers.instance
                  .serialize<_i4.AlreadyExistsException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on AssertionError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.AssertionError',
              'value': _i5.Serializers.instance.serialize<AssertionError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i7.AsyncError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.async.AsyncError',
              'value': _i5.Serializers.instance.serialize<_i7.AsyncError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.CancelledException catch (e, st) {
      const statusCode = 499;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.CancelledException',
              'value':
                  _i5.Serializers.instance.serialize<_i4.CancelledException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on ConcurrentModificationError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
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
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.DataLossError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.DataLossError',
              'value': _i5.Serializers.instance.serialize<_i4.DataLossError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.DeadlineExceededError',
              'value': _i5.Serializers.instance
                  .serialize<_i4.DeadlineExceededError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.FailedPreconditionException',
              'value': _i5.Serializers.instance
                  .serialize<_i4.FailedPreconditionException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on IndexError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.IndexError',
              'value': _i5.Serializers.instance.serialize<IndexError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on IntegerDivisionByZeroException catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
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
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.InternalServerError',
              'value': _i5.Serializers.instance
                  .serialize<_i4.InternalServerError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i8.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.convert.JsonUnsupportedObjectError',
              'value': _i5.Serializers.instance
                  .serialize<_i8.JsonUnsupportedObjectError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.NotFoundException',
              'value':
                  _i5.Serializers.instance.serialize<_i4.NotFoundException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on OutOfMemoryError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.OutOfMemoryError',
              'value': _i5.Serializers.instance.serialize<OutOfMemoryError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.OutOfRangeException',
              'value': _i5.Serializers.instance
                  .serialize<_i4.OutOfRangeException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.PermissionDeniedException',
              'value': _i5.Serializers.instance
                  .serialize<_i4.PermissionDeniedException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on RangeError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.RangeError',
              'value': _i5.Serializers.instance.serialize<RangeError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on ArgumentError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.ArgumentError',
              'value': _i5.Serializers.instance.serialize<ArgumentError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.ResourceExhaustedException',
              'value': _i5.Serializers.instance
                  .serialize<_i4.ResourceExhaustedException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i9.SerializationException catch (e, st) {
      const statusCode = 400;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.SerializationException',
              'value': _i5.Serializers.instance
                  .serialize<_i9.SerializationException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.BadRequestException',
              'value': _i5.Serializers.instance
                  .serialize<_i4.BadRequestException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on FormatException catch (e, st) {
      const statusCode = 400;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.FormatException',
              'value': _i5.Serializers.instance.serialize<FormatException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on StackOverflowError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.StackOverflowError',
              'value':
                  _i5.Serializers.instance.serialize<StackOverflowError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on StateError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.StateError',
              'value': _i5.Serializers.instance.serialize<StateError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i7.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.async.TimeoutException',
              'value':
                  _i5.Serializers.instance.serialize<_i7.TimeoutException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on TypeError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.TypeError',
              'value': _i5.Serializers.instance.serialize<TypeError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnauthorizedException',
              'value': _i5.Serializers.instance
                  .serialize<_i4.UnauthorizedException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnavailableError',
              'value':
                  _i5.Serializers.instance.serialize<_i4.UnavailableError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnimplementedError',
              'value':
                  _i5.Serializers.instance.serialize<_i4.UnimplementedError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on UnimplementedError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.UnimplementedError',
              'value':
                  _i5.Serializers.instance.serialize<UnimplementedError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.UnknownError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.UnknownError',
              'value': _i5.Serializers.instance.serialize<_i4.UnknownError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on _i4.CloudException catch (e, st) {
      const statusCode = 400;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'celest.core.v1.CloudException',
              'value':
                  _i5.Serializers.instance.serialize<_i4.CloudException>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on Exception catch (e, st) {
      const statusCode = 400;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.Exception',
              'value': _i5.Serializers.instance.serialize<Exception>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on UnsupportedError catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.message,
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.core.UnsupportedError',
              'value': _i5.Serializers.instance.serialize<UnsupportedError>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    } on Error catch (e, st) {
      const statusCode = 500;
      _i3.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.core.Error',
              'value': _i5.Serializers.instance.serialize<Error>(e),
            },
            if (_i3.context.environment != _i6.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i5.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      yield status;
    }
  }

  @override
  void init() {
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i7.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i5.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i7.AsyncError(
          $serialized[r'error']!,
          _i5.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i7.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message,
        if (_i5.Serializers.instance.serialize<Duration?>($value.duration)
            case final duration?)
          r'duration': duration,
      },
      deserialize: ($serialized) {
        return _i7.TimeoutException(
          ($serialized[r'message'] as String?),
          _i5.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i8.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.unsupportedObject case final unsupportedObject?)
          r'unsupportedObject': unsupportedObject,
        if ($value.cause case final cause?) r'cause': cause,
        if ($value.partialResult case final partialResult?)
          r'partialResult': partialResult,
      },
      deserialize: ($serialized) {
        return _i8.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<ArgumentError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
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
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.modifiedObject case final modifiedObject?)
          r'modifiedObject': modifiedObject
      },
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if (_i5.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
            case final stackTrace?)
          r'stackTrace': stackTrace
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<Exception, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return Exception($serialized?[r'message']);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<FormatException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
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
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<IndexError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.name case final name?) r'name': name,
        r'message': $value.message,
        if ($value.indexable case final indexable?) r'indexable': indexable,
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
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<RangeError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i10.User, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i10.User.fromJson($serialized);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.AbortedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.BadRequestException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.CancelledException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.CloudException.fromJson($serialized);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.DataLossError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.InternalServerError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.NotFoundException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.OutOfRangeException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.UnauthorizedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.UnavailableError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.UnimplementedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.UnimplementedError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i4.UnknownError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i5.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i9.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i5.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i11.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i11.JsonValue($serialized);
        },
      ),
      const _i5.TypeToken<_i11.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/': StreamHelloTarget()},
    setup: (_i3.Context context) async {},
  );
}

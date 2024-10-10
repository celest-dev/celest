// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i11;
import 'dart:io' as _i9;
import 'dart:isolate' as _i10;

import 'package:celest/celest.dart' as _i7;
import 'package:celest/src/core/context.dart' as _i6;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/flutter.dart' as _i3;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i13;
import 'package:celest_core/src/serialization/json_value.dart' as _i15;
import 'package:flutter/src/foundation/key.dart' as _i14;
import 'package:flutter/src/painting/image_provider.dart' as _i12;
import 'package:shelf/shelf.dart' as _i2;

final class HelloWorldTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'helloWorld';

  @override
  String get method => 'GET';

  @override
  Future<_i2.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i3.helloWorld();
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(
            _i4.Serializers.instance.serialize<_i3.HelloWorld>(response)),
      );
    } on _i5.AbortedException catch (e, st) {
      const statusCode = 409;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i5.AbortedException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.AlreadyExistsException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on AssertionError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<AssertionError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i8.AsyncError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i8.AsyncError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.CancelledException catch (e, st) {
      const statusCode = 499;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i5.CancelledException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.CertificateException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.CertificateException',
              'value': _i4.Serializers.instance
                  .serialize<_i9.CertificateException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on ConcurrentModificationError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<ConcurrentModificationError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.DataLossError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i5.DataLossError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.DeadlineExceededError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.FailedPreconditionException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.HandshakeException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.HandshakeException',
              'value':
                  _i4.Serializers.instance.serialize<_i9.HandshakeException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.HttpException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart._http.HttpException',
              'value': _i4.Serializers.instance.serialize<_i9.HttpException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on IndexError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<IndexError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on IntegerDivisionByZeroException catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<IntegerDivisionByZeroException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.InternalServerError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i10.IsolateSpawnException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.isolate.IsolateSpawnException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.IsolateSpawnException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i11.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i11.JsonUnsupportedObjectError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i12.NetworkImageLoadException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'flutter.NetworkImageLoadException',
              'value': _i4.Serializers.instance
                  .serialize<_i12.NetworkImageLoadException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i5.NotFoundException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.OSError catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.OSError',
              'value': _i4.Serializers.instance.serialize<_i9.OSError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on OutOfMemoryError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<OutOfMemoryError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.OutOfRangeException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.PathAccessException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.PathAccessException',
              'value': _i4.Serializers.instance
                  .serialize<_i9.PathAccessException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.PathExistsException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.PathExistsException',
              'value': _i4.Serializers.instance
                  .serialize<_i9.PathExistsException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.PathNotFoundException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.PathNotFoundException',
              'value': _i4.Serializers.instance
                  .serialize<_i9.PathNotFoundException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.FileSystemException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.FileSystemException',
              'value': _i4.Serializers.instance
                  .serialize<_i9.FileSystemException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.PermissionDeniedException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.ProcessException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.ProcessException',
              'value':
                  _i4.Serializers.instance.serialize<_i9.ProcessException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on RangeError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<RangeError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on ArgumentError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<ArgumentError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.ResourceExhaustedException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i13.SerializationException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i13.SerializationException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.BadRequestException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on FormatException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<FormatException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.SignalException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.SignalException',
              'value':
                  _i4.Serializers.instance.serialize<_i9.SignalException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on StackOverflowError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<StackOverflowError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on StateError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<StateError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.StdinException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.StdinException',
              'value':
                  _i4.Serializers.instance.serialize<_i9.StdinException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.StdoutException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.StdoutException',
              'value':
                  _i4.Serializers.instance.serialize<_i9.StdoutException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i8.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i8.TimeoutException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.TlsException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart.io.TlsException',
              'value': _i4.Serializers.instance.serialize<_i9.TlsException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on TypeError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<TypeError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i5.UnauthorizedException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i5.UnavailableError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i5.UnimplementedError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on UnimplementedError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<UnimplementedError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.UnknownError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i5.UnknownError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i5.CloudException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i5.CloudException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on UnsupportedError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<UnsupportedError>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on Error catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<Error>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
      };
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(status),
      );
    } on _i9.WebSocketException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
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
              '@type': 'dart._http.WebSocketException',
              'value':
                  _i4.Serializers.instance.serialize<_i9.WebSocketException>(e),
            },
            if (_i6.context.environment != _i7.Environment.production)
              {
                '@type': 'dart.core.StackTrace',
                'value': _i4.Serializers.instance.serialize<StackTrace>(st),
              },
          ],
        }
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i8.AsyncError(
          $serialized[r'error']!,
          _i4.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message,
        if (_i4.Serializers.instance.serialize<Duration?>($value.duration)
            case final duration?)
          r'duration': duration,
      },
      deserialize: ($serialized) {
        return _i8.TimeoutException(
          ($serialized[r'message'] as String?),
          _i4.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i11.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<ArgumentError, Map<String, Object?>?>(
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.modifiedObject case final modifiedObject?)
          r'modifiedObject': modifiedObject
      },
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if (_i4.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
            case final stackTrace?)
          r'stackTrace': stackTrace
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<FormatException, Map<String, Object?>?>(
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<IndexError, Map<String, Object?>>(
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
    _i4.Serializers.instance.put(_i4.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<RangeError, Map<String, Object?>>(
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.CertificateException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.CertificateException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i9.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.FileSystemException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.FileSystemException(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'path'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i9.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.HandshakeException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.HandshakeException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i9.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.HttpException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<Uri?>($value.uri)
            case final uri?)
          r'uri': uri,
      },
      deserialize: ($serialized) {
        return _i9.HttpException(
          ($serialized[r'message'] as String),
          uri: _i4.Serializers.instance.deserialize<Uri?>($serialized[r'uri']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.OSError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i9.OSError(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'errorCode'] as num?)?.toInt()) ??
              _i9.OSError.noErrorCode,
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.PathAccessException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.PathAccessException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i9.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.PathExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.PathExistsException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i9.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.PathNotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.PathNotFoundException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i9.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.ProcessException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'executable': $value.executable,
        r'arguments': $value.arguments,
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i9.ProcessException(
          ($serialized[r'executable'] as String),
          ($serialized[r'arguments'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList(),
          (($serialized[r'message'] as String?)) ?? '',
          (($serialized[r'errorCode'] as num?)?.toInt()) ?? 0,
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.SignalException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'osError': $value.osError,
      },
      deserialize: ($serialized) {
        return _i9.SignalException(
          ($serialized[r'message'] as String),
          $serialized[r'osError'],
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.StdinException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.StdinException(
          ($serialized[r'message'] as String),
          _i4.Serializers.instance
              .deserialize<_i9.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.StdoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.StdoutException(
          ($serialized[r'message'] as String),
          _i4.Serializers.instance
              .deserialize<_i9.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.TlsException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i9.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i9.TlsException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i9.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.WebSocketException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return _i9.WebSocketException(
            (($serialized?[r'message'] as String?)) ?? '');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i10.IsolateSpawnException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return _i10.IsolateSpawnException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.HelloWorld, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if (_i4.Serializers.instance.serialize<_i14.Key?>($value.key)
            case final key?)
          r'key': key
      },
      deserialize: ($serialized) {
        return _i3.HelloWorld(
            key: _i4.Serializers.instance
                .deserialize<_i14.Key?>($serialized?[r'key']));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.AbortedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.BadRequestException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.CancelledException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.CloudException.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.DataLossError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i5.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.InternalServerError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.NotFoundException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.OutOfRangeException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i5.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i5.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.UnauthorizedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.UnavailableError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.UnimplementedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.UnimplementedError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i5.UnknownError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i15.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i13.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
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
        return _i13.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i15.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i15.JsonValue?>('JsonValue'),
    );
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i14.Key, Map<String, Object?>>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return _i14.Key(($serialized[r'value'] as String));
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i12.NetworkImageLoadException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'statusCode': $value.statusCode,
        r'uri': _i4.Serializers.instance.serialize<Uri>($value.uri),
      },
      deserialize: ($serialized) {
        return _i12.NetworkImageLoadException(
          statusCode: ($serialized[r'statusCode'] as num).toInt(),
          uri: _i4.Serializers.instance.deserialize<Uri>($serialized[r'uri']),
        );
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': HelloWorldTarget()});
}

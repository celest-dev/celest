// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:convert' as _i20;
import 'dart:io' as _i13;
import 'dart:isolate' as _i19;

import 'package:celest/celest.dart' as _i8;
import 'package:celest/src/core/context.dart' as _i7;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/database/task_database.dart' as _i5;
import 'package:celest_backend/src/functions/tasks.dart' as _i3;
import 'package:celest_backend/src/generated/data.celest.dart' as _i25;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i21;
import 'package:celest_core/src/serialization/json_value.dart' as _i24;
import 'package:drift/src/remote/communication.dart' as _i16;
import 'package:drift/src/runtime/cancellation_zone.dart' as _i12;
import 'package:drift/src/runtime/exceptions.dart' as _i17;
import 'package:google_cloud/src/bad_configuration_exception.dart' as _i10;
import 'package:google_cloud/src/bad_request_exception.dart' as _i11;
import 'package:hrana/src/exception.dart' as _i15;
import 'package:http/src/exception.dart' as _i14;
import 'package:shelf/shelf.dart' as _i2;
import 'package:shelf/src/hijack_exception.dart' as _i18;
import 'package:sqlite3/src/exception.dart' as _i22;
import 'package:sqlite3/src/vfs.dart' as _i23;

final class CreateTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'create';

  @override
  String get method => 'POST';

  @override
  Future<_i2.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i3.create(
        title: (request[r'title'] as String),
        priority: (_i4.Serializers.instance
                .deserialize<_i5.Priority?>(request[r'priority'])) ??
            _i5.Priority.high,
      );
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(
            _i4.Serializers.instance.serialize<_i5.Task>(response)),
      );
    } on _i6.AbortedException catch (e, st) {
      const statusCode = 409;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i6.AbortedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i7.context.logger.severe(
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
                  .serialize<_i6.AlreadyExistsException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i9.AsyncError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i9.AsyncError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i10.BadConfigurationException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'google_cloud.BadConfigurationException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.BadConfigurationException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i11.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'google_cloud.BadRequestException',
              'value': _i4.Serializers.instance
                  .serialize<_i11.BadRequestException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i12.CancellationException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'drift.CancellationException',
              'value': _i4.Serializers.instance
                  .serialize<_i12.CancellationException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.CancelledException catch (e, st) {
      const statusCode = 499;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i6.CancelledException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.CertificateException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i13.CertificateException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i14.ClientException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'http.ClientException',
              'value':
                  _i4.Serializers.instance.serialize<_i14.ClientException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i15.ConnectionClosed catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'hrana.ConnectionClosed',
              'value':
                  _i4.Serializers.instance.serialize<_i15.ConnectionClosed>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i16.ConnectionClosedException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'drift.ConnectionClosedException',
              'value': _i4.Serializers.instance
                  .serialize<_i16.ConnectionClosedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i17.CouldNotRollBackException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'drift.CouldNotRollBackException',
              'value': _i4.Serializers.instance
                  .serialize<_i17.CouldNotRollBackException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.DataLossError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i6.DataLossError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i7.context.logger.severe(
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
                  .serialize<_i6.DeadlineExceededError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i17.DriftWrappedException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'drift.DriftWrappedException',
              'value': _i4.Serializers.instance
                  .serialize<_i17.DriftWrappedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i7.context.logger.severe(
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
                  .serialize<_i6.FailedPreconditionException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.HandshakeException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i13.HandshakeException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i18.HijackException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'shelf.HijackException',
              'value':
                  _i4.Serializers.instance.serialize<_i18.HijackException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.HttpException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              'value':
                  _i4.Serializers.instance.serialize<_i13.HttpException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(
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
                  .serialize<_i6.InternalServerError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i19.IsolateSpawnException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i19.IsolateSpawnException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i20.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(
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
                  .serialize<_i20.JsonUnsupportedObjectError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i6.NotFoundException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.OSError catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i13.OSError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i7.context.logger.severe(
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
                  .serialize<_i6.OutOfRangeException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.PathAccessException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i13.PathAccessException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.PathExistsException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i13.PathExistsException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.PathNotFoundException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i13.PathNotFoundException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.FileSystemException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i13.FileSystemException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i7.context.logger.severe(
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
                  .serialize<_i6.PermissionDeniedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.ProcessException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i13.ProcessException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i7.context.logger.severe(
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
                  .serialize<_i6.ResourceExhaustedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i21.SerializationException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i21.SerializationException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  .serialize<_i6.BadRequestException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i15.ServerException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'hrana.ServerException',
              'value':
                  _i4.Serializers.instance.serialize<_i15.ServerException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.SignalException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i13.SignalException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i22.SqliteException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'sqlite3.SqliteException',
              'value':
                  _i4.Serializers.instance.serialize<_i22.SqliteException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.StdinException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i13.StdinException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.StdoutException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i13.StdoutException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i9.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i9.TimeoutException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.TlsException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i13.TlsException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i7.context.logger.severe(
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
                  .serialize<_i6.UnauthorizedException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i6.UnavailableError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i6.UnimplementedError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.UnknownError catch (e, st) {
      const statusCode = 500;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<_i6.UnknownError>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i6.CloudException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
                  _i4.Serializers.instance.serialize<_i6.CloudException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
      _i7.context.logger.severe(
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
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i23.VfsException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              '@type': 'sqlite3.VfsException',
              'value': _i4.Serializers.instance.serialize<_i23.VfsException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on _i13.WebSocketException catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance
                  .serialize<_i13.WebSocketException>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
    } on Exception catch (e, st) {
      const statusCode = 400;
      _i7.context.logger.severe(
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
              'value': _i4.Serializers.instance.serialize<Exception>(e),
            },
            if (_i7.context.environment != _i8.Environment.production)
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
        .put(_i4.Serializer.define<_i9.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i9.AsyncError(
          $serialized[r'error']!,
          _i4.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message,
        if (_i4.Serializers.instance.serialize<Duration?>($value.duration)
            case final duration?)
          r'duration': duration,
      },
      deserialize: ($serialized) {
        return _i9.TimeoutException(
          ($serialized[r'message'] as String?),
          _i4.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i20.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.unsupportedObject case final unsupportedObject?)
          r'unsupportedObject': unsupportedObject,
        if ($value.cause case final cause?) r'cause': cause,
        if ($value.partialResult case final partialResult?)
          r'partialResult': partialResult,
      },
      deserialize: ($serialized) {
        return _i20.JsonUnsupportedObjectError(
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
        .put(_i4.Serializer.define<Exception, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return Exception($serialized?[r'message']);
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
        _i4.Serializer.define<_i13.CertificateException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.CertificateException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i13.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i13.FileSystemException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.FileSystemException(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'path'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i13.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i13.HandshakeException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.HandshakeException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i13.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i13.HttpException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<Uri?>($value.uri)
            case final uri?)
          r'uri': uri,
      },
      deserialize: ($serialized) {
        return _i13.HttpException(
          ($serialized[r'message'] as String),
          uri: _i4.Serializers.instance.deserialize<Uri?>($serialized[r'uri']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i13.OSError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i13.OSError(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'errorCode'] as num?)?.toInt()) ??
              _i13.OSError.noErrorCode,
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i13.PathAccessException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.PathAccessException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i13.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i13.PathExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.PathExistsException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i13.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i13.PathNotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.PathNotFoundException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i13.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i13.ProcessException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'executable': $value.executable,
        r'arguments': $value.arguments,
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i13.ProcessException(
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
        .put(_i4.Serializer.define<_i13.SignalException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'osError': $value.osError,
      },
      deserialize: ($serialized) {
        return _i13.SignalException(
          ($serialized[r'message'] as String),
          $serialized[r'osError'],
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i13.StdinException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.StdinException(
          ($serialized[r'message'] as String),
          _i4.Serializers.instance
              .deserialize<_i13.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i13.StdoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.StdoutException(
          ($serialized[r'message'] as String),
          _i4.Serializers.instance
              .deserialize<_i13.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i13.TlsException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i13.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i13.TlsException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i13.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i13.WebSocketException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return _i13.WebSocketException(
            (($serialized?[r'message'] as String?)) ?? '');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i19.IsolateSpawnException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return _i19.IsolateSpawnException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<_i5.Priority, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i5.Priority.values.byName($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.Task, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.Task.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.CloudException.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.UnimplementedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.UnimplementedError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          code: ($serialized[r'code'] as num?)?.toInt(),
          details: _i4.Serializers.instance.deserialize<_i24.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i21.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'code': $value.code,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i24.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i21.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i24.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i24.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i24.JsonValue?>('JsonValue'),
    );
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i16.ConnectionClosedException, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return _i16.ConnectionClosedException();
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i12.CancellationException, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return _i12.CancellationException();
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i17.CouldNotRollBackException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'cause': $value.cause,
        r'originalStackTrace': _i4.Serializers.instance
            .serialize<StackTrace>($value.originalStackTrace),
        r'exception': $value.exception,
      },
      deserialize: ($serialized) {
        return _i17.CouldNotRollBackException(
          $serialized[r'cause']!,
          _i4.Serializers.instance
              .deserialize<StackTrace>($serialized[r'originalStackTrace']),
          $serialized[r'exception']!,
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i17.DriftWrappedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.cause case final cause?) r'cause': cause,
        if (_i4.Serializers.instance.serialize<StackTrace?>($value.trace)
            case final trace?)
          r'trace': trace,
      },
      deserialize: ($serialized) {
        return _i17.DriftWrappedException(
          message: ($serialized[r'message'] as String),
          cause: $serialized[r'cause'],
          trace: _i4.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'trace']),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i10.BadConfigurationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.details case final details?) r'details': details,
      },
      deserialize: ($serialized) {
        return _i10.BadConfigurationException(
          ($serialized[r'message'] as String),
          details: ($serialized[r'details'] as String?),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i11.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'statusCode': $value.statusCode,
        r'message': $value.message,
        if ($value.innerError case final innerError?) r'innerError': innerError,
        if (_i4.Serializers.instance.serialize<StackTrace?>($value.innerStack)
            case final innerStack?)
          r'innerStack': innerStack,
      },
      deserialize: ($serialized) {
        return _i11.BadRequestException(
          ($serialized[r'statusCode'] as num).toInt(),
          ($serialized[r'message'] as String),
          innerError: $serialized[r'innerError'],
          innerStack: _i4.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'innerStack']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i15.ConnectionClosed, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return _i15.ConnectionClosed();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i15.ServerException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.code case final code?) r'code': code,
      },
      deserialize: ($serialized) {
        return _i15.ServerException(
          message: ($serialized[r'message'] as String),
          code: ($serialized[r'code'] as String?),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i14.ClientException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<Uri?>($value.uri)
            case final uri?)
          r'uri': uri,
      },
      deserialize: ($serialized) {
        return _i14.ClientException(
          ($serialized[r'message'] as String),
          _i4.Serializers.instance.deserialize<Uri?>($serialized[r'uri']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i18.HijackException, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return _i18.HijackException();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i22.SqliteException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.explanation case final explanation?)
          r'explanation': explanation,
        r'extendedResultCode': $value.extendedResultCode,
        r'resultCode': $value.resultCode,
        if ($value.operation case final operation?) r'operation': operation,
        if ($value.causingStatement case final causingStatement?)
          r'causingStatement': causingStatement,
        if ($value.parametersToStatement case final parametersToStatement?)
          r'parametersToStatement': parametersToStatement,
      },
      deserialize: ($serialized) {
        return _i22.SqliteException(
          ($serialized[r'extendedResultCode'] as num).toInt(),
          ($serialized[r'message'] as String),
          ($serialized[r'explanation'] as String?),
          ($serialized[r'causingStatement'] as String?),
          ($serialized[r'parametersToStatement'] as Iterable<Object?>?)
              ?.toList(),
          ($serialized[r'operation'] as String?),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i23.VfsException, Map<String, Object?>>(
      serialize: ($value) =>
          <String, Object?>{r'returnCode': $value.returnCode},
      deserialize: ($serialized) {
        return _i23.VfsException(($serialized[r'returnCode'] as num).toInt());
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/': CreateTarget()},
    setup: (_i7.Context context) async {
      await _i25.CelestData.init(context);
    },
  );
}

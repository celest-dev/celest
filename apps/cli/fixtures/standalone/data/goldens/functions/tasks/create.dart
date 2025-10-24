// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:convert' as _i22;
import 'dart:io' as _i15;
import 'dart:isolate' as _i21;

import 'package:built_value/built_value.dart' as _i13;
import 'package:cedar/src/authorization/authorization_response.dart' as _i12;
import 'package:cedar/src/model/errors.dart' as _i10;
import 'package:cedar/src/model/value.dart' as _i33;
import 'package:celest/celest.dart' as _i9;
import 'package:celest/src/core/context.dart' as _i8;
import 'package:celest/src/runtime/data/celest_database.dart' as _i39;
import 'package:celest/src/runtime/data/database_registry.dart' as _i38;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/database/log_database.dart' as _i41;
import 'package:celest_backend/src/database/task_database.dart' as _i5;
import 'package:celest_backend/src/database/task_database.drift.dart' as _i6;
import 'package:celest_backend/src/functions/tasks.dart' as _i3;
import 'package:celest_backend/src/generated/data.celest.dart' as _i40;
import 'package:celest_cloud_auth/celest_cloud_auth.dart' as _i42;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i27;
import 'package:celest_core/src/serialization/json_value.dart' as _i34;
import 'package:chunked_stream/src/read_chunked_stream.dart' as _i23;
import 'package:corks_cedar/src/exceptions.dart' as _i20;
import 'package:drift/src/remote/communication.dart' as _i17;
import 'package:drift/src/runtime/cancellation_zone.dart' as _i14;
import 'package:drift/src/runtime/exceptions.dart' as _i18;
import 'package:hrana/src/exception.dart' as _i16;
import 'package:http/src/abortable.dart' as _i25;
import 'package:http/src/exception.dart' as _i26;
import 'package:mustache_template/src/template_exception.dart' as _i31;
import 'package:petitparser/src/core/exception.dart' as _i24;
import 'package:petitparser/src/core/result.dart' as _i35;
import 'package:shelf/shelf.dart' as _i2;
import 'package:shelf/src/hijack_exception.dart' as _i19;
import 'package:source_span/src/location.dart' as _i36;
import 'package:source_span/src/span.dart' as _i37;
import 'package:source_span/src/span_exception.dart' as _i30;
import 'package:sqlite3/src/exception.dart' as _i28;
import 'package:sqlite3/src/vfs.dart' as _i32;
import 'package:string_scanner/src/exception.dart' as _i29;

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
        priority:
            (_i4.Serializers.instance.deserialize<_i5.Priority?>(
              request[r'priority'],
            )) ??
            _i5.Priority.high,
      );
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(
          _i4.Serializers.instance.serialize<_i6.Task>(response),
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
    } on _i10.ArityException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'cedar.ArityException',
              'value': _i4.Serializers.instance.serialize<_i10.ArityException>(
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
    } on _i11.AsyncError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.async.AsyncError',
              'value': _i4.Serializers.instance.serialize<_i11.AsyncError>(e),
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
    } on _i10.AttributeAccessException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'cedar.AttributeAccessException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.AttributeAccessException>(e),
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
    } on _i12.AuthorizationException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'cedar.AuthorizationException',
              'value': _i4.Serializers.instance
                  .serialize<_i12.AuthorizationException>(e),
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
    } on _i13.BuiltValueMissingGenericsError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'built_value.BuiltValueMissingGenericsError',
              'value': _i4.Serializers.instance
                  .serialize<_i13.BuiltValueMissingGenericsError>(e),
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
    } on _i13.BuiltValueNestedFieldError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'built_value.BuiltValueNestedFieldError',
              'value': _i4.Serializers.instance
                  .serialize<_i13.BuiltValueNestedFieldError>(e),
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
    } on _i13.BuiltValueNullFieldError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'built_value.BuiltValueNullFieldError',
              'value': _i4.Serializers.instance
                  .serialize<_i13.BuiltValueNullFieldError>(e),
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
    } on _i14.CancellationException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'drift.CancellationException',
              'value': _i4.Serializers.instance
                  .serialize<_i14.CancellationException>(e),
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
    } on _i15.CertificateException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.io.CertificateException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.CertificateException>(e),
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
    } on _i16.ConnectionClosed catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'hrana.ConnectionClosed',
              'value': _i4.Serializers.instance
                  .serialize<_i16.ConnectionClosed>(e),
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
    } on _i17.ConnectionClosedException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'drift.ConnectionClosedException',
              'value': _i4.Serializers.instance
                  .serialize<_i17.ConnectionClosedException>(e),
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
    } on _i18.CouldNotRollBackException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'drift.CouldNotRollBackException',
              'value': _i4.Serializers.instance
                  .serialize<_i18.CouldNotRollBackException>(e),
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
    } on _i18.DriftWrappedException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'drift.DriftWrappedException',
              'value': _i4.Serializers.instance
                  .serialize<_i18.DriftWrappedException>(e),
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
    } on _i10.EntityNotFoundException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'cedar.EntityNotFoundException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.EntityNotFoundException>(e),
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
    } on _i15.HandshakeException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.io.HandshakeException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.HandshakeException>(e),
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
    } on _i19.HijackException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'shelf.HijackException',
              'value': _i4.Serializers.instance.serialize<_i19.HijackException>(
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
    } on _i15.HttpException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart._http.HttpException',
              'value': _i4.Serializers.instance.serialize<_i15.HttpException>(
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
    } on _i20.InvalidCorkException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'corks_cedar.InvalidCorkException',
              'value': _i4.Serializers.instance
                  .serialize<_i20.InvalidCorkException>(e),
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
    } on _i21.IsolateSpawnException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.isolate.IsolateSpawnException',
              'value': _i4.Serializers.instance
                  .serialize<_i21.IsolateSpawnException>(e),
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
    } on _i22.JsonUnsupportedObjectError catch (e, st) {
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
                  .serialize<_i22.JsonUnsupportedObjectError>(e),
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
    } on _i23.MaximumSizeExceeded catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'chunked_stream.MaximumSizeExceeded',
              'value': _i4.Serializers.instance
                  .serialize<_i23.MaximumSizeExceeded>(e),
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
    } on _i20.MissingSignatureError catch (e, st) {
      const statusCode = 500;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'corks_cedar.MissingSignatureError',
              'value': _i4.Serializers.instance
                  .serialize<_i20.MissingSignatureError>(e),
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
    } on _i15.OSError catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.io.OSError',
              'value': _i4.Serializers.instance.serialize<_i15.OSError>(e),
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
    } on _i10.OverflowException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'cedar.OverflowException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.OverflowException>(e),
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
    } on _i24.ParserException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'petitparser.ParserException',
              'value': _i4.Serializers.instance.serialize<_i24.ParserException>(
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
    } on _i15.PathAccessException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.io.PathAccessException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.PathAccessException>(e),
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
    } on _i15.PathExistsException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.io.PathExistsException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.PathExistsException>(e),
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
    } on _i15.PathNotFoundException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'dart.io.PathNotFoundException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.PathNotFoundException>(e),
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
    } on _i15.FileSystemException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.io.FileSystemException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.FileSystemException>(e),
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
    } on _i15.ProcessException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.io.ProcessException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.ProcessException>(e),
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
    } on _i25.RequestAbortedException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'http.RequestAbortedException',
              'value': _i4.Serializers.instance
                  .serialize<_i25.RequestAbortedException>(e),
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
    } on _i26.ClientException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'http.ClientException',
              'value': _i4.Serializers.instance.serialize<_i26.ClientException>(
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
    } on _i27.SerializationException catch (e, st) {
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
                  .serialize<_i27.SerializationException>(e),
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
    } on _i15.SignalException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.io.SignalException',
              'value': _i4.Serializers.instance.serialize<_i15.SignalException>(
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
    } on _i28.SqliteException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'sqlite3.SqliteException',
              'value': _i4.Serializers.instance.serialize<_i28.SqliteException>(
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
    } on _i15.StdinException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.io.StdinException',
              'value': _i4.Serializers.instance.serialize<_i15.StdinException>(
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
    } on _i15.StdoutException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.io.StdoutException',
              'value': _i4.Serializers.instance.serialize<_i15.StdoutException>(
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
    } on _i29.StringScannerException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'string_scanner.StringScannerException',
              'value': _i4.Serializers.instance
                  .serialize<_i29.StringScannerException>(e),
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
    } on _i30.SourceSpanFormatException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'source_span.SourceSpanFormatException',
              'value': _i4.Serializers.instance
                  .serialize<_i30.SourceSpanFormatException>(e),
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
    } on _i30.SourceSpanException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'source_span.SourceSpanException',
              'value': _i4.Serializers.instance
                  .serialize<_i30.SourceSpanException>(e),
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
    } on _i31.TemplateException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'mustache_template.TemplateException',
              'value': _i4.Serializers.instance
                  .serialize<_i31.TemplateException>(e),
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
    } on _i11.TimeoutException catch (e, st) {
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
                  .serialize<_i11.TimeoutException>(e),
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
    } on _i15.TlsException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart.io.TlsException',
              'value': _i4.Serializers.instance.serialize<_i15.TlsException>(e),
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
    } on _i10.TypeException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'cedar.TypeException',
              'value': _i4.Serializers.instance.serialize<_i10.TypeException>(
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
    } on _i10.UnknownExtensionException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'cedar.UnknownExtensionException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.UnknownExtensionException>(e),
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
    } on _i10.UnspecifiedEntityException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'cedar.UnspecifiedEntityException',
              'value': _i4.Serializers.instance
                  .serialize<_i10.UnspecifiedEntityException>(e),
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
    } on _i32.VfsException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.toString(), e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': null,
          'details': [
            {
              '@type': 'sqlite3.VfsException',
              'value': _i4.Serializers.instance.serialize<_i32.VfsException>(e),
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
    } on _i15.WebSocketException catch (e, st) {
      const statusCode = 400;
      _i8.context.logger.severe(e.message, e, st);
      final status = {
        '@status': {
          'code': statusCode,
          'message': e.message,
          'details': [
            {
              '@type': 'dart._http.WebSocketException',
              'value': _i4.Serializers.instance
                  .serialize<_i15.WebSocketException>(e),
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
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i11.AsyncError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'error': $value.error,
          r'stackTrace': _i4.Serializers.instance.serialize<StackTrace>(
            $value.stackTrace,
          ),
        },
        deserialize: ($serialized) {
          return _i11.AsyncError(
            $serialized[r'error']!,
            _i4.Serializers.instance.deserialize<StackTrace?>(
              $serialized[r'stackTrace'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i11.TimeoutException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
          if (_i4.Serializers.instance.serialize<Duration?>($value.duration)
              case final duration?)
            r'duration': duration,
        },
        deserialize: ($serialized) {
          return _i11.TimeoutException(
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
        _i22.JsonUnsupportedObjectError,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          if ($value.unsupportedObject case final unsupportedObject?)
            r'unsupportedObject': unsupportedObject,
          if ($value.cause case final cause?) r'cause': cause,
          if ($value.partialResult case final partialResult?)
            r'partialResult': partialResult,
        },
        deserialize: ($serialized) {
          return _i22.JsonUnsupportedObjectError(
            $serialized[r'unsupportedObject'],
            cause: $serialized[r'cause'],
            partialResult: ($serialized[r'partialResult'] as String?),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<ArgumentError, Map<String, Object?>?>(
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
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<AssertionError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
        },
        deserialize: ($serialized) {
          return AssertionError($serialized?[r'message']);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<ConcurrentModificationError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
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
        serialize: ($value) => <String, Object?>{
          if (_i4.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
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
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<IndexError, Map<String, Object?>>(
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
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        IntegerDivisionByZeroException,
        Map<String, Object?>?
      >(
        serialize: ($value) => <String, Object?>{
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
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
        },
        deserialize: ($serialized) {
          return UnimplementedError(($serialized?[r'message'] as String?));
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<UnsupportedError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
        },
        deserialize: ($serialized) {
          return UnsupportedError(($serialized[r'message'] as String));
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.CertificateException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.CertificateException(
            (($serialized?[r'message'] as String?)) ?? '',
            _i4.Serializers.instance.deserialize<_i15.OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.FileSystemException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.FileSystemException(
            (($serialized?[r'message'] as String?)) ?? '',
            (($serialized?[r'path'] as String?)) ?? '',
            _i4.Serializers.instance.deserialize<_i15.OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.HandshakeException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.HandshakeException(
            (($serialized?[r'message'] as String?)) ?? '',
            _i4.Serializers.instance.deserialize<_i15.OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.HttpException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<Uri?>($value.uri)
              case final uri?)
            r'uri': uri,
        },
        deserialize: ($serialized) {
          return _i15.HttpException(
            ($serialized[r'message'] as String),
            uri: _i4.Serializers.instance.deserialize<Uri?>(
              $serialized[r'uri'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.OSError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'errorCode': $value.errorCode,
        },
        deserialize: ($serialized) {
          return _i15.OSError(
            (($serialized?[r'message'] as String?)) ?? '',
            (($serialized?[r'errorCode'] as num?)?.toInt()) ??
                _i15.OSError.noErrorCode,
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.PathAccessException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.PathAccessException(
            ($serialized[r'path'] as String),
            _i4.Serializers.instance.deserialize<_i15.OSError>(
              $serialized[r'osError'],
            ),
            (($serialized[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.PathExistsException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.PathExistsException(
            ($serialized[r'path'] as String),
            _i4.Serializers.instance.deserialize<_i15.OSError>(
              $serialized[r'osError'],
            ),
            (($serialized[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.PathNotFoundException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.path case final path?) r'path': path,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.PathNotFoundException(
            ($serialized[r'path'] as String),
            _i4.Serializers.instance.deserialize<_i15.OSError>(
              $serialized[r'osError'],
            ),
            (($serialized[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.ProcessException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'executable': $value.executable,
          r'arguments': $value.arguments,
          r'message': $value.message,
          r'errorCode': $value.errorCode,
        },
        deserialize: ($serialized) {
          return _i15.ProcessException(
            ($serialized[r'executable'] as String),
            ($serialized[r'arguments'] as Iterable<Object?>)
                .map((el) => (el as String))
                .toList(),
            (($serialized[r'message'] as String?)) ?? '',
            (($serialized[r'errorCode'] as num?)?.toInt()) ?? 0,
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.SignalException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'osError': $value.osError,
        },
        deserialize: ($serialized) {
          return _i15.SignalException(
            ($serialized[r'message'] as String),
            $serialized[r'osError'],
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.StdinException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.StdinException(
            ($serialized[r'message'] as String),
            _i4.Serializers.instance.deserialize<_i15.OSError?>(
              $serialized[r'osError'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.StdoutException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.StdoutException(
            ($serialized[r'message'] as String),
            _i4.Serializers.instance.deserialize<_i15.OSError?>(
              $serialized[r'osError'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.TlsException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i15.OSError?>($value.osError)
              case final osError?)
            r'osError': osError,
        },
        deserialize: ($serialized) {
          return _i15.TlsException(
            (($serialized?[r'message'] as String?)) ?? '',
            _i4.Serializers.instance.deserialize<_i15.OSError?>(
              $serialized?[r'osError'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i15.WebSocketException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.httpStatusCode case final httpStatusCode?)
            r'httpStatusCode': httpStatusCode,
        },
        deserialize: ($serialized) {
          return _i15.WebSocketException(
            (($serialized?[r'message'] as String?)) ?? '',
            ($serialized?[r'httpStatusCode'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i21.IsolateSpawnException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _i21.IsolateSpawnException(
            ($serialized[r'message'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i13.BuiltValueMissingGenericsError,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'parameter': $value.parameter,
        },
        deserialize: ($serialized) {
          return _i13.BuiltValueMissingGenericsError(
            ($serialized[r'type'] as String),
            ($serialized[r'parameter'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i13.BuiltValueNestedFieldError,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'field': $value.field,
          r'error': $value.error,
        },
        deserialize: ($serialized) {
          return _i13.BuiltValueNestedFieldError(
            ($serialized[r'type'] as String),
            ($serialized[r'field'] as String),
            ($serialized[r'error'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i13.BuiltValueNullFieldError,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'field': $value.field,
        },
        deserialize: ($serialized) {
          return _i13.BuiltValueNullFieldError(
            ($serialized[r'type'] as String),
            ($serialized[r'field'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i12.AuthorizationException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.policyId case final policyId?) r'policyId': policyId,
          r'message': $value.message,
        },
        deserialize: ($serialized) {
          return _i12.AuthorizationException.fromJson($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.ArityException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'name': $value.name,
          r'expected': $value.expected,
          r'actual': $value.actual,
        },
        deserialize: ($serialized) {
          return _i10.ArityException(
            ($serialized[r'name'] as String),
            ($serialized[r'expected'] as num).toInt(),
            ($serialized[r'actual'] as num).toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i10.AttributeAccessException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'type': $value.type,
          r'attribute': $value.attribute,
        },
        deserialize: ($serialized) {
          return _i10.AttributeAccessException(
            ($serialized[r'type'] as String),
            ($serialized[r'attribute'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.EntityNotFoundException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'entityId': _i4.Serializers.instance.serialize<_i33.EntityUid>(
            $value.entityId,
          ),
        },
        deserialize: ($serialized) {
          return _i10.EntityNotFoundException(
            _i4.Serializers.instance.deserialize<_i33.EntityUid>(
              $serialized[r'entityId'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.OverflowException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _i10.OverflowException(($serialized[r'message'] as String));
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i10.TypeException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _i10.TypeException(($serialized[r'message'] as String));
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i10.UnknownExtensionException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{r'name': $value.name},
        deserialize: ($serialized) {
          return _i10.UnknownExtensionException(
            ($serialized[r'name'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i10.UnspecifiedEntityException,
        Map<String, Object?>?
      >(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _i10.UnspecifiedEntityException();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i33.EntityUid, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return _i33.EntityUid.fromJson($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i5.Priority, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return _i5.Priority.values.byName($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i6.Task, Map<String, dynamic>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return _i6.Task.fromJson($serialized);
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.AbortedException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.AbortedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.AlreadyExistsException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.AlreadyExistsException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.BadRequestException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.BadRequestException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.CancelledException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.CancelledException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.CloudException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
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
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.DataLossError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.DeadlineExceededError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.DeadlineExceededError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
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
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.FailedPreconditionException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.InternalServerError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.InternalServerError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.NotFoundException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.NotFoundException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.OutOfRangeException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.OutOfRangeException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
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
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.PermissionDeniedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
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
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.ResourceExhaustedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.UnauthorizedException(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnavailableError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.UnavailableError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnimplementedError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.UnimplementedError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i7.UnknownError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i7.UnknownError(
            ($serialized?[r'message'] as String?),
            _i4.Serializers.instance.deserialize<_i34.JsonValue?>(
              $serialized?[r'details'],
              const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i27.SerializationException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i34.JsonValue?>(
                $value.details,
                const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
              )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _i27.SerializationException(
            ($serialized[r'message'] as String?),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i34.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i34.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i34.JsonValue?>('JsonValue'),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i23.MaximumSizeExceeded, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'maxSize': $value.maxSize},
        deserialize: ($serialized) {
          return _i23.MaximumSizeExceeded(
            ($serialized[r'maxSize'] as num).toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i20.InvalidCorkException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'source': $value.source,
          if ($value.offset case final offset?) r'offset': offset,
        },
        deserialize: ($serialized) {
          return _i20.InvalidCorkException(
            (($serialized?[r'message'] as String?)) ?? '',
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i20.MissingSignatureError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _i20.MissingSignatureError();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i17.ConnectionClosedException,
        Map<String, Object?>?
      >(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _i17.ConnectionClosedException();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i14.CancellationException, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _i14.CancellationException();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i18.CouldNotRollBackException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'cause': $value.cause,
          r'originalStackTrace': _i4.Serializers.instance.serialize<StackTrace>(
            $value.originalStackTrace,
          ),
          r'exception': $value.exception,
        },
        deserialize: ($serialized) {
          return _i18.CouldNotRollBackException(
            $serialized[r'cause']!,
            _i4.Serializers.instance.deserialize<StackTrace>(
              $serialized[r'originalStackTrace'],
            ),
            $serialized[r'exception']!,
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i18.DriftWrappedException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.cause case final cause?) r'cause': cause,
          if (_i4.Serializers.instance.serialize<StackTrace?>($value.trace)
              case final trace?)
            r'trace': trace,
        },
        deserialize: ($serialized) {
          return _i18.DriftWrappedException(
            message: ($serialized[r'message'] as String),
            cause: $serialized[r'cause'],
            trace: _i4.Serializers.instance.deserialize<StackTrace?>(
              $serialized[r'trace'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i16.ConnectionClosed, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _i16.ConnectionClosed();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i25.RequestAbortedException,
        Map<String, Object?>?
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<Uri?>($value.uri)
              case final uri?)
            r'uri': uri,
        },
        deserialize: ($serialized) {
          return _i25.RequestAbortedException(
            _i4.Serializers.instance.deserialize<Uri?>($serialized?[r'uri']),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i26.ClientException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<Uri?>($value.uri)
              case final uri?)
            r'uri': uri,
        },
        deserialize: ($serialized) {
          return _i26.ClientException(
            ($serialized[r'message'] as String),
            _i4.Serializers.instance.deserialize<Uri?>($serialized[r'uri']),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i31.TemplateException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.templateName case final templateName?)
            r'templateName': templateName,
          if ($value.source case final source?) r'source': source,
          if ($value.offset case final offset?) r'offset': offset,
          r'line': $value.line,
          r'column': $value.column,
          r'context': $value.context,
        },
        deserialize: ($serialized) {
          return _i31.TemplateException(
            ($serialized[r'message'] as String),
            ($serialized[r'templateName'] as String?),
            ($serialized[r'source'] as String?),
            ($serialized[r'offset'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i24.ParserException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'failure': _i4.Serializers.instance.serialize<_i35.Failure>(
            $value.failure,
          ),
          r'message': $value.message,
          r'offset': $value.offset,
          r'source': $value.source,
        },
        deserialize: ($serialized) {
          return _i24.ParserException(
            _i4.Serializers.instance.deserialize<_i35.Failure>(
              $serialized[r'failure'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i35.Failure, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'buffer': $value.buffer,
          r'position': $value.position,
          r'isSuccess': $value.isSuccess,
          r'isFailure': $value.isFailure,
          r'message': $value.message,
        },
        deserialize: ($serialized) {
          return _i35.Failure(
            ($serialized[r'buffer'] as String),
            ($serialized[r'position'] as num).toInt(),
            ($serialized[r'message'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i19.HijackException, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return _i19.HijackException();
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i36.SourceLocation, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if (_i4.Serializers.instance.serialize<Uri?>($value.sourceUrl)
              case final sourceUrl?)
            r'sourceUrl': sourceUrl,
          r'offset': $value.offset,
          r'line': $value.line,
          r'column': $value.column,
          r'toolString': $value.toolString,
        },
        deserialize: ($serialized) {
          return _i36.SourceLocation(
            ($serialized[r'offset'] as num).toInt(),
            sourceUrl: $serialized[r'sourceUrl'],
            line: ($serialized[r'line'] as num?)?.toInt(),
            column: ($serialized[r'column'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i37.SourceSpan, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'start': _i4.Serializers.instance.serialize<_i36.SourceLocation>(
            $value.start,
          ),
          r'end': _i4.Serializers.instance.serialize<_i36.SourceLocation>(
            $value.end,
          ),
          r'text': $value.text,
          if (_i4.Serializers.instance.serialize<Uri?>($value.sourceUrl)
              case final sourceUrl?)
            r'sourceUrl': sourceUrl,
          r'length': $value.length,
        },
        deserialize: ($serialized) {
          return _i37.SourceSpan(
            _i4.Serializers.instance.deserialize<_i36.SourceLocation>(
              $serialized[r'start'],
            ),
            _i4.Serializers.instance.deserialize<_i36.SourceLocation>(
              $serialized[r'end'],
            ),
            ($serialized[r'text'] as String),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i30.SourceSpanException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i37.SourceSpan?>($value.span)
              case final span?)
            r'span': span,
        },
        deserialize: ($serialized) {
          return _i30.SourceSpanException(
            ($serialized[r'message'] as String),
            _i4.Serializers.instance.deserialize<_i37.SourceSpan?>(
              $serialized[r'span'],
            ),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<
        _i30.SourceSpanFormatException,
        Map<String, Object?>
      >(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i37.SourceSpan?>($value.span)
              case final span?)
            r'span': span,
          r'source': $value.source,
          if ($value.offset case final offset?) r'offset': offset,
        },
        deserialize: ($serialized) {
          return _i30.SourceSpanFormatException(
            ($serialized[r'message'] as String),
            _i4.Serializers.instance.deserialize<_i37.SourceSpan?>(
              $serialized[r'span'],
            ),
            $serialized[r'source'],
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i28.SqliteException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if ($value.explanation case final explanation?)
            r'explanation': explanation,
          r'extendedResultCode': $value.extendedResultCode,
          r'resultCode': $value.resultCode,
          if ($value.offset case final offset?) r'offset': offset,
          if ($value.operation case final operation?) r'operation': operation,
          if ($value.causingStatement case final causingStatement?)
            r'causingStatement': causingStatement,
          if ($value.parametersToStatement case final parametersToStatement?)
            r'parametersToStatement': parametersToStatement,
        },
        deserialize: ($serialized) {
          return _i28.SqliteException(
            ($serialized[r'extendedResultCode'] as num).toInt(),
            ($serialized[r'message'] as String),
            ($serialized[r'explanation'] as String?),
            ($serialized[r'causingStatement'] as String?),
            ($serialized[r'parametersToStatement'] as Iterable<Object?>?)
                ?.toList(),
            ($serialized[r'operation'] as String?),
            ($serialized[r'offset'] as num?)?.toInt(),
          );
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i32.VfsException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'returnCode': $value.returnCode,
        },
        deserialize: ($serialized) {
          return _i32.VfsException(($serialized[r'returnCode'] as num).toInt());
        },
      ),
    );
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i29.StringScannerException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          if (_i4.Serializers.instance.serialize<_i37.SourceSpan?>($value.span)
              case final span?)
            r'span': span,
          if ($value.offset case final offset?) r'offset': offset,
          r'source': $value.source,
          if (_i4.Serializers.instance.serialize<Uri?>($value.sourceUrl)
              case final sourceUrl?)
            r'sourceUrl': sourceUrl,
        },
        deserialize: ($serialized) {
          return _i29.StringScannerException(
            ($serialized[r'message'] as String),
            _i4.Serializers.instance.deserialize<_i37.SourceSpan>(
              $serialized[r'span'],
            ),
            ($serialized[r'source'] as String),
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
    targets: {'/': CreateTarget()},
    setup: (_i8.Context context) async {
      final $databases = _i38.CelestDatabaseRegistry();
      context.put(_i38.CelestDatabaseRegistry.contextKey, $databases);
      final _databaseCelestDatabase = await _i39.CelestDatabase.create(
        context,
        name: 'TaskDatabase',
        factory: _i5.TaskDatabase.new,
        hostnameVariable: const _i9.env('TASK_DATABASE_HOST'),
        tokenSecret: const _i9.secret('TASK_DATABASE_TOKEN'),
      );
      final database = await _databaseCelestDatabase.connect();
      context.put(_i40.CelestData.database$Key, database);
      $databases.register(
        databaseId: 'TaskDatabase',
        dartName: 'database',
        displayName: 'TaskDatabase',
        database: _databaseCelestDatabase,
        connection: database,
      );
      if (context.environment == _i9.Environment.local) {
        final $studio = _databaseCelestDatabase.createStudio(
          pageTitle: 'TaskDatabase',
        );
        context.router.mount('/_admin/studio/task-database', $studio.call);
        context.router.mount('/_admin/studio', $studio.call);
      }
      final _logsDatabaseCelestDatabase = await _i39.CelestDatabase.create(
        context,
        name: 'LogDatabase',
        factory: _i41.LogDatabase.new,
        hostnameVariable: const _i9.env('LOG_DATABASE_HOST'),
        tokenSecret: const _i9.secret('LOG_DATABASE_TOKEN'),
      );
      final logsDatabase = await _logsDatabaseCelestDatabase.connect();
      context.put(_i40.CelestData.logsDatabase$Key, logsDatabase);
      $databases.register(
        databaseId: 'LogDatabase',
        dartName: 'logsDatabase',
        displayName: 'LogDatabase',
        database: _logsDatabaseCelestDatabase,
        connection: logsDatabase,
      );
      if (context.environment == _i9.Environment.local) {
        final $studio = _logsDatabaseCelestDatabase.createStudio(
          pageTitle: 'LogDatabase',
        );
        context.router.mount('/_admin/studio/log-database', $studio.call);
      }
      final $cloudAuth = await _i42.CelestCloudAuth.create(database: database);
      context.router.mount('/v1alpha1/auth/', $cloudAuth.handler);
      context.put(_i42.CelestCloudAuth.contextKey, $cloudAuth);
    },
  );
}

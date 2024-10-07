// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i9;
import 'dart:io' as _i7;
import 'dart:isolate' as _i8;
import 'dart:ui' as _i4;

import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/dart_ui.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i10;
import 'package:celest_core/src/serialization/json_value.dart' as _i11;

final class AddCountryCodeTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'addCountryCode';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i2.addCountryCode(
        _i3.Serializers.instance.deserialize<_i4.Locale>(request[r'locale']),
        (request[r'countryCode'] as String),
      );
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance.serialize<_i4.Locale>(response)
        }
      );
    } on _i5.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on AssertionError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.AssertionError',
        'details': _i3.Serializers.instance.serialize<AssertionError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AsyncError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.AsyncError',
        'details': _i3.Serializers.instance.serialize<_i6.AsyncError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CertificateException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.CertificateException',
        'details':
            _i3.Serializers.instance.serialize<_i7.CertificateException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on ConcurrentModificationError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ConcurrentModificationError',
        'details':
            _i3.Serializers.instance.serialize<ConcurrentModificationError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.HandshakeException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.HandshakeException',
        'details':
            _i3.Serializers.instance.serialize<_i7.HandshakeException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.HttpException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart._http.HttpException',
        'details': _i3.Serializers.instance.serialize<_i7.HttpException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on IndexError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IndexError',
        'details': _i3.Serializers.instance.serialize<IndexError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on IntegerDivisionByZeroException catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'details': _i3.Serializers.instance
            .serialize<IntegerDivisionByZeroException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.IsolateSpawnException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.isolate.IsolateSpawnException',
        'details':
            _i3.Serializers.instance.serialize<_i8.IsolateSpawnException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.JsonUnsupportedObjectError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'details': _i3.Serializers.instance
            .serialize<_i9.JsonUnsupportedObjectError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.OSError catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.OSError',
        'details': _i3.Serializers.instance.serialize<_i7.OSError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on OutOfMemoryError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.OutOfMemoryError',
        'details': _i3.Serializers.instance.serialize<OutOfMemoryError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.PathAccessException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.PathAccessException',
        'details':
            _i3.Serializers.instance.serialize<_i7.PathAccessException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.PathExistsException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.PathExistsException',
        'details':
            _i3.Serializers.instance.serialize<_i7.PathExistsException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.PathNotFoundException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.PathNotFoundException',
        'details':
            _i3.Serializers.instance.serialize<_i7.PathNotFoundException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.FileSystemException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.FileSystemException',
        'details':
            _i3.Serializers.instance.serialize<_i7.FileSystemException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.ProcessException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.ProcessException',
        'details': _i3.Serializers.instance.serialize<_i7.ProcessException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on RangeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.RangeError',
        'details': _i3.Serializers.instance.serialize<RangeError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on ArgumentError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ArgumentError',
        'details': _i3.Serializers.instance.serialize<ArgumentError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i10.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on FormatException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.FormatException',
        'details': _i3.Serializers.instance.serialize<FormatException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.SignalException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.SignalException',
        'details': _i3.Serializers.instance.serialize<_i7.SignalException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StackOverflowError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StackOverflowError',
        'details': _i3.Serializers.instance.serialize<StackOverflowError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StateError',
        'details': _i3.Serializers.instance.serialize<StateError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.StdinException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.StdinException',
        'details': _i3.Serializers.instance.serialize<_i7.StdinException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.StdoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.StdoutException',
        'details': _i3.Serializers.instance.serialize<_i7.StdoutException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.TimeoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.TimeoutException',
        'details': _i3.Serializers.instance.serialize<_i6.TimeoutException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.TlsException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.io.TlsException',
        'details': _i3.Serializers.instance.serialize<_i7.TlsException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on TypeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.TypeError',
        'details': _i3.Serializers.instance.serialize<TypeError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on UnimplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnimplementedError',
        'details': _i3.Serializers.instance.serialize<UnimplementedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on UnsupportedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnsupportedError',
        'details': _i3.Serializers.instance.serialize<UnsupportedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on Error catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.Error',
        'details': _i3.Serializers.instance.serialize<Error>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.WebSocketException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart._http.WebSocketException',
        'details':
            _i3.Serializers.instance.serialize<_i7.WebSocketException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.AsyncError, Map<String, Object?>>(
      serialize: ($value) => {
        r'error': $value.error,
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i6.AsyncError(
          $serialized[r'error']!,
          _i3.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'duration':
            _i3.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i6.TimeoutException(
          ($serialized[r'message'] as String?),
          _i3.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => {
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
      },
      deserialize: ($serialized) {
        return _i9.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<ArgumentError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'invalidValue': $value.invalidValue,
        r'name': $value.name,
        r'message': $value.message,
      },
      deserialize: ($serialized) {
        return ArgumentError(
          $serialized?[r'message'],
          ($serialized?[r'name'] as String?),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => {r'modifiedObject': $value.modifiedObject},
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<FormatException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'source': $value.source,
        r'offset': $value.offset,
      },
      deserialize: ($serialized) {
        return FormatException(
          (($serialized?[r'message'] as String?)) ?? '',
          $serialized?[r'source'],
          ($serialized?[r'offset'] as num?)?.toInt(),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<IndexError, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'message': $value.message,
        r'indexable': $value.indexable,
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
    _i3.Serializers.instance.put(_i3.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<RangeError, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'message': $value.message,
        r'start': $value.start,
        r'end': $value.end,
        r'invalidValue': $value.invalidValue,
      },
      deserialize: ($serialized) {
        return RangeError($serialized[r'message']);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.CertificateException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'type': $value.type,
        r'message': $value.message,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.CertificateException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i3.Serializers.instance
              .deserialize<_i7.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.FileSystemException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'path': $value.path,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.FileSystemException(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'path'] as String?)) ?? '',
          _i3.Serializers.instance
              .deserialize<_i7.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.HandshakeException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'type': $value.type,
        r'message': $value.message,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.HandshakeException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i3.Serializers.instance
              .deserialize<_i7.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.HttpException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'uri': _i3.Serializers.instance.serialize<Uri?>($value.uri),
      },
      deserialize: ($serialized) {
        return _i7.HttpException(
          ($serialized[r'message'] as String),
          uri: _i3.Serializers.instance.deserialize<Uri?>($serialized[r'uri']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.OSError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i7.OSError(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'errorCode'] as num?)?.toInt()) ??
              _i7.OSError.noErrorCode,
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.PathAccessException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'path': $value.path,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.PathAccessException(
          ($serialized[r'path'] as String),
          _i3.Serializers.instance
              .deserialize<_i7.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.PathExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'path': $value.path,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.PathExistsException(
          ($serialized[r'path'] as String),
          _i3.Serializers.instance
              .deserialize<_i7.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.PathNotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'path': $value.path,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.PathNotFoundException(
          ($serialized[r'path'] as String),
          _i3.Serializers.instance
              .deserialize<_i7.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.ProcessException, Map<String, Object?>>(
      serialize: ($value) => {
        r'executable': $value.executable,
        r'arguments': $value.arguments,
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i7.ProcessException(
          ($serialized[r'executable'] as String),
          ($serialized[r'arguments'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList(),
          (($serialized[r'message'] as String?)) ?? '',
          (($serialized[r'errorCode'] as num?)?.toInt()) ?? 0,
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.SignalException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'osError': $value.osError,
      },
      deserialize: ($serialized) {
        return _i7.SignalException(
          ($serialized[r'message'] as String),
          $serialized[r'osError'],
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.StdinException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.StdinException(
          ($serialized[r'message'] as String),
          _i3.Serializers.instance
              .deserialize<_i7.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.StdoutException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.StdoutException(
          ($serialized[r'message'] as String),
          _i3.Serializers.instance
              .deserialize<_i7.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.TlsException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'type': $value.type,
        r'message': $value.message,
        r'osError':
            _i3.Serializers.instance.serialize<_i7.OSError?>($value.osError),
      },
      deserialize: ($serialized) {
        return _i7.TlsException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i3.Serializers.instance
              .deserialize<_i7.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.WebSocketException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.WebSocketException(
            (($serialized?[r'message'] as String?)) ?? '');
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.IsolateSpawnException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i8.IsolateSpawnException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Locale, Map<String, Object?>>(
      serialize: ($value) => {
        r'languageCode': $value.languageCode,
        r'scriptCode': $value.scriptCode,
        r'countryCode': $value.countryCode,
      },
      deserialize: ($serialized) {
        return _i4.Locale(
          ($serialized[r'languageCode'] as String),
          ($serialized[r'countryCode'] as String?),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i10.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i10.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i11.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i11.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': AddCountryCodeTarget()});
}

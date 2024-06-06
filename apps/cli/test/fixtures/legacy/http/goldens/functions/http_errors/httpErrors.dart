// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i8;
import 'dart:isolate' as _i9;

import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/http_errors.dart' as _i5;
import 'package:celest_backend/models/http_errors.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;

import '../../../functions/http_errors.dart' as _i2;

final class HttpErrorsTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'httpErrors';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      await _i2.httpErrors(_i3.Serializers.instance
          .deserialize<_i4.ExceptionType>(request[r'type']));
      return (statusCode: 200, body: {'response': null});
    } on _i5.BadGatewayError catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.BadGatewayError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadGatewayError',
            'details': error,
          }
        }
      );
    } on _i5.AnotherNotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.AnotherNotFoundException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AnotherNotFoundException',
            'details': error,
          }
        }
      );
    } on _i5.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.NotFoundException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'NotFoundException',
            'details': error,
          }
        }
      );
    } on _i5.ForbiddenException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.ForbiddenException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'ForbiddenException',
            'details': error,
          }
        }
      );
    } on _i5.CustomBadRequestException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.CustomBadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomBadRequestException',
            'details': error,
          }
        }
      );
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i7.InternalServerError catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.InternalServerError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerError',
            'details': error,
          }
        }
      );
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.UnauthorizedException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UnauthorizedException',
            'details': error,
          }
        }
      );
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.AnotherNotFoundException, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return _i5.AnotherNotFoundException();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.BadGatewayError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.BadGatewayError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.CustomBadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.CustomBadRequestException(
            ($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.ForbiddenException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.ForbiddenException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.NotFoundException, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return _i5.NotFoundException();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.ExceptionType, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.ExceptionType.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i6.SerializationException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i8.Platform.numberOfProcessors; i++)
      _i9.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i1.serve(targets: {'/': HttpErrorsTarget()});
}

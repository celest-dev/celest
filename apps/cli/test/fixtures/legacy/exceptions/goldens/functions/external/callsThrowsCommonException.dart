// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i7;
import 'dart:isolate' as _i8;

import 'package:_common/_common.dart' as _i3;
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;

import '../../../functions/external.dart' as _i2;

final class CallsThrowsCommonExceptionTarget
    extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'callsThrowsCommonException';

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
      _i2.callsThrowsCommonException();
      return (statusCode: 200, body: {'response': null});
    } on _i3.OverriddenException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.OverriddenException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'OverriddenException',
            'details': error,
          }
        }
      );
    } on _i3.CommonException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CommonException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CommonException',
            'details': error,
          }
        }
      );
    } on _i3.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.InternalServerError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerError',
            'details': error,
          }
        }
      );
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.UnauthorizedException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UnauthorizedException',
            'details': error,
          }
        }
      );
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.BadRequestException>(e);
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.CommonException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i3.CommonException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.CustomException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i3.CustomException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.OverriddenException, String>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i3.OverriddenException.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i7.Platform.numberOfProcessors; i++)
      _i8.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i1.serve(targets: {'/': CallsThrowsCommonExceptionTarget()});
}

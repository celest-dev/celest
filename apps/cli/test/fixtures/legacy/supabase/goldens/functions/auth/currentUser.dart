// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;
import 'package:gotrue/src/types/auth_exception.dart' as _i5;
import 'package:supabase/src/auth_user.dart' as _i4;

import '../../../functions/auth.dart' as _i2;

final class CurrentUserTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'currentUser';

  @override
  String get method => 'GET';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i2.currentUser();
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance.serialize<_i4.AuthUser>(response)
        }
      );
    } on _i5.AuthWeakPasswordException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.AuthWeakPasswordException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AuthWeakPasswordException',
            'details': error,
          }
        }
      );
    } on _i5.AuthApiException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.AuthApiException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AuthApiException',
            'details': error,
          }
        }
      );
    } on _i5.AuthRetryableFetchException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance
          .serialize<_i5.AuthRetryableFetchException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AuthRetryableFetchException',
            'details': error,
          }
        }
      );
    } on _i5.AuthSessionMissingException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance
          .serialize<_i5.AuthSessionMissingException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AuthSessionMissingException',
            'details': error,
          }
        }
      );
    } on _i5.AuthPKCEGrantCodeExchangeError catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance
          .serialize<_i5.AuthPKCEGrantCodeExchangeError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AuthPKCEGrantCodeExchangeError',
            'details': error,
          }
        }
      );
    } on _i5.AuthException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.AuthException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AuthException',
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
      const statusCode = 500;
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
      const statusCode = 400;
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.AuthApiException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'statusCode': $value.statusCode,
      },
      deserialize: ($serialized) {
        return _i5.AuthApiException(
          ($serialized[r'message'] as String),
          statusCode: ($serialized[r'statusCode'] as String?),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.AuthException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'statusCode': $value.statusCode,
      },
      deserialize: ($serialized) {
        return _i5.AuthException(
          ($serialized[r'message'] as String),
          statusCode: ($serialized[r'statusCode'] as String?),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.AuthPKCEGrantCodeExchangeError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'statusCode': $value.statusCode,
      },
      deserialize: ($serialized) {
        return _i5.AuthPKCEGrantCodeExchangeError(
            ($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.AuthRetryableFetchException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'statusCode': $value.statusCode,
      },
      deserialize: ($serialized) {
        return _i5.AuthRetryableFetchException(
          message: (($serialized?[r'message'] as String?)) ??
              'AuthRetryableFetchException',
          statusCode: ($serialized?[r'statusCode'] as String?),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.AuthSessionMissingException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'statusCode': $value.statusCode,
      },
      deserialize: ($serialized) {
        return _i5.AuthSessionMissingException();
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.AuthWeakPasswordException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'statusCode': $value.statusCode,
        r'reasons': $value.reasons,
      },
      deserialize: ($serialized) {
        return _i5.AuthWeakPasswordException(
          message: ($serialized[r'message'] as String),
          statusCode: ($serialized[r'statusCode'] as String),
          reasons: ($serialized[r'reasons'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList(),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.AuthUser, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.AuthUser(
          id: ($serialized[r'id'] as String),
          appMetadata: ($serialized[r'appMetadata'] as Map<String, Object?>),
          userMetadata: ($serialized[r'userMetadata'] as Map<String, Object?>),
          aud: ($serialized[r'aud'] as String),
          email: ($serialized[r'email'] as String?),
          phone: ($serialized[r'phone'] as String?),
          createdAt: ($serialized[r'createdAt'] as String),
          confirmedAt: ($serialized[r'confirmedAt'] as String?),
          emailConfirmedAt: ($serialized[r'emailConfirmedAt'] as String?),
          phoneConfirmedAt: ($serialized[r'phoneConfirmedAt'] as String?),
          lastSignInAt: ($serialized[r'lastSignInAt'] as String?),
          role: ($serialized[r'role'] as String),
          updatedAt: ($serialized[r'updatedAt'] as String),
        );
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': CurrentUserTarget()});
}

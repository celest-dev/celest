// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i5;

import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/core/context.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/person.dart' as _i7;
import 'package:celest_backend/src/functions/injected.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i6;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i9;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i8;
import 'package:celest_core/src/serialization/json_value.dart' as _i10;

final class SayHelloPersonTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'sayHelloPerson';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i2.sayHelloPerson(
        name: _i3.context.get(const _i4.env(r'MY_NAME'))!,
        age: int.parse(_i3.context.get(const _i4.env(r'MY_AGE'))!),
        height: double.parse(_i3.context.get(const _i4.env(r'MY_HEIGHT'))!),
        weight: num.parse(_i3.context.get(const _i4.env(r'MY_WEIGHT'))!),
        website: Uri.parse(_i3.context.get(const _i4.env(r'MY_WEBSITE'))!),
        isCool: bool.parse(_i3.context.get(const _i4.env(r'IM_COOL'))!),
        superSecret: _i5
            .base64Decode(_i3.context.get(const _i4.secret(r'SUPER_SECRET'))!),
        currentEnvironment:
            _i3.context.get(const _i4.env(r'CELEST_ENVIRONMENT'))!,
      );
      return (
        statusCode: 200,
        body: {
          'response': _i6.Serializers.instance.serialize<_i7.Person>(response)
        }
      );
    } on _i8.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i9.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.Person, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'age': $value.age,
        r'height': $value.height,
        r'weight': $value.weight,
        r'isCool': $value.isCool,
        r'website': _i6.Serializers.instance.serialize<Uri>($value.website),
      },
      deserialize: ($serialized) {
        return _i7.Person(
          name: ($serialized[r'name'] as String),
          age: ($serialized[r'age'] as num).toInt(),
          height: ($serialized[r'height'] as num).toDouble(),
          weight: ($serialized[r'weight'] as num),
          isCool: ($serialized[r'isCool'] as bool),
          website: _i6.Serializers.instance
              .deserialize<Uri>($serialized[r'website']),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i9.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i9.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.CloudException.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i9.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i9.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i9.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i9.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i9.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i9.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i9.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i8.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i6.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i6.Serializers.instance.put(
      _i6.Serializer.define<_i10.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i10.JsonValue($serialized);
        },
      ),
      const _i6.TypeToken<_i10.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': SayHelloPersonTarget()});
}

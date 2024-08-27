// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/metadata.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i7;

import '../../../functions/metadata.dart' as _i2;

final class PositionalDefaultValuesTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'positionalDefaultValues';

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
      _i2.positionalDefaultValues(
        ((request[r'value'] as String?)) ?? 'value',
        ((request[r'intValue'] as num?)?.toInt()) ?? 1,
        ((request[r'doubleValue'] as num?)?.toDouble()) ?? 1.0,
        ((request[r'boolValue'] as bool?)) ?? true,
        ((request[r'list'] as Iterable<Object?>?)
                ?.map((el) => (el as String))
                .toList()) ??
            const ['list'],
        ((request[r'map'] as Map<String, Object?>?)?.map((
              key,
              value,
            ) =>
                MapEntry(
                  key,
                  (value as String),
                ))) ??
            const {'map': 'map'},
        (_i3.Serializers.instance
                .deserialize<_i4.Exportable?>(request[r'exportable'])) ??
            const _i4.Exportable(),
        (_i3.Serializers.instance
                .deserialize<_i4.Serializable?>(request[r'serializable'])) ??
            const _i4.Serializable.forType('String'),
        (_i3.Serializers.instance
                .deserialize<_i4.LiteralEnum?>(request[r'enumValue'])) ??
            _i4.LiteralEnum.a,
        (_i3.Serializers.instance
                .deserialize<({String a, String b, String c})?>(
                    request[r'recordValue'])) ??
            const (a: 'a', b: 'b', c: 'c'),
      );
      return (statusCode: 200, body: {'response': null});
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<Record$k7x4l9, Map<String, Object?>>(
      serialize: ($value) => {
        r'a': $value.a,
        r'b': $value.b,
        r'c': $value.c,
      },
      deserialize: ($serialized) {
        return (
          a: ($serialized[r'a'] as String),
          b: ($serialized[r'b'] as String),
          c: ($serialized[r'c'] as String)
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Exportable, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return _i4.Exportable();
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.LiteralEnum, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.LiteralEnum.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Serializable, Map<String, Object?>?>(
      serialize: ($value) => {r'type': $value.type},
      deserialize: ($serialized) {
        return _i4.Serializable(($serialized?[r'type'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i7.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i7.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': PositionalDefaultValuesTarget()});
}

typedef Record$k7x4l9 = ({String a, String b, String c});

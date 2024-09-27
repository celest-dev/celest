// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/available_stock.dart' as _i10;
import 'package:_common/src/models/available_stocks.dart' as _i4;
import 'package:_common/src/models/errors_and_exceptions.dart' as _i8;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i7;
import 'package:celest_backend/models/overrides.dart' as _i12;
import 'package:celest_backend/src/functions/models.dart' as _i2;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i11;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i9;

final class AvailableStocksTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'availableStocks';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i2.availableStocks(_i3.Serializers.instance
          .deserialize<_i4.AvailableStocks>(request[r'availableStocks']));
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.AvailableStocks>(response)
        }
      );
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
    } on _i7.UserException_ShowInConsole catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.UserException_ShowInConsole',
        'details': _i3.Serializers.instance
            .serialize<_i7.UserException_ShowInConsole>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.ValidateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': '_common.ValidateError',
        'details': _i3.Serializers.instance.serialize<_i8.ValidateError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.NotYetImplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.NotYetImplementedError',
        'details':
            _i3.Serializers.instance.serialize<_i7.NotYetImplementedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AppException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.AppException',
        'details': _i3.Serializers.instance.serialize<_i7.AppException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AppError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.AppError',
        'details': _i3.Serializers.instance.serialize<_i7.AppError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.UserException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': '_common.UserException',
        'details': _i3.Serializers.instance.serialize<_i8.UserException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.AvailableStocks, Map<String, Object?>>(
      serialize: ($value) => {
        r'list': _i3.Serializers.instance
            .serialize<_i9.IList<_i10.AvailableStock>>($value.list)
      },
      deserialize: ($serialized) {
        return _i4.AvailableStocks(($serialized[r'list'] as Iterable<Object?>)
            .map((el) =>
                _i3.Serializers.instance.deserialize<_i10.AvailableStock>(el))
            .toList());
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.UserException, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i8.UserException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.ValidateError, Map<String, Object?>>(
      serialize: ($value) => {r'msg': $value.msg},
      deserialize: ($serialized) {
        return _i8.ValidateError(($serialized[r'msg'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.AppError, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i7.AppError.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.AppException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'error': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.error,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
        r'msg': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.msg,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return (_i8.AppException(
          $serialized?[r'msg'],
          $serialized?[r'error'],
        ) as _i7.AppException);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.NotYetImplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'message': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.message,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.NotYetImplementedError(
            _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
          $serialized?[r'message'],
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.UserException_ShowInConsole, Map<String, Object?>>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.cause,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UserException_ShowInConsole(
          msg: ($serialized[r'msg'] as String),
          cause: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'cause'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i12.AvailableStock, Map<String, Object?>>(
      serialize: ($value) => {
        r'ticker': $value.ticker,
        r'name': $value.name,
        r'currentPrice': $value.currentPrice,
        r'currentPriceStr': $value.currentPriceStr,
      },
      deserialize: ($serialized) {
        return (_i10.AvailableStock(
          ($serialized[r'ticker'] as String),
          name: ($serialized[r'name'] as String),
          currentPrice: ($serialized[r'currentPrice'] as num).toDouble(),
        ) as _i12.AvailableStock);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i9.IList<_i10.AvailableStock>, dynamic>(
      serialize: ($value) => $value.toJson((value) =>
          _i3.Serializers.instance.serialize<_i10.AvailableStock>(value)),
      deserialize: ($serialized) {
        return _i9.IList<_i10.AvailableStock>.fromJson(
          $serialized,
          (value) =>
              _i3.Serializers.instance.deserialize<_i10.AvailableStock>(value),
        );
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': AvailableStocksTarget()});
}

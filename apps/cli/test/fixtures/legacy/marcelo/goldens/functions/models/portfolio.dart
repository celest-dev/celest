// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/cash_balance.dart' as _i11;
import 'package:_common/src/models/errors_and_exceptions.dart' as _i8;
import 'package:_common/src/models/portfolio.dart' as _i4;
import 'package:_common/src/models/stock.dart' as _i13;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i7;
import 'package:celest_backend/models/overrides.dart' as _i10;
import 'package:celest_backend/src/functions/models.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i9;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i12;

final class PortfolioTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'portfolio';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i2.portfolio(_i3.Serializers.instance
          .deserialize<_i4.Portfolio>(request[r'portfolio']));
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.Portfolio>(response)
        }
      );
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UserException_ShowInConsole catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.v1.UserException_ShowInConsole',
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
        'code': 'marcelo.v1.NotYetImplementedError',
        'details':
            _i3.Serializers.instance.serialize<_i7.NotYetImplementedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AppException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.v1.AppException',
        'details': _i3.Serializers.instance.serialize<_i7.AppException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AppError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.v1.AppError',
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
        r'error': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.error,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
        r'msg': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.msg,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
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
        r'message': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.message,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.NotYetImplementedError(
            _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
          $serialized?[r'message'],
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.UserException_ShowInConsole, Map<String, Object?>>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.cause,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UserException_ShowInConsole(
          msg: ($serialized[r'msg'] as String),
          cause: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'cause'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i10.CashBalance, Map<String, Object?>>(
      serialize: ($value) => {r'amount': $value.amount},
      deserialize: ($serialized) {
        return (_i11.CashBalance(($serialized[r'amount'] as num).toDouble())
            as _i10.CashBalance);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i10.Portfolio, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stocks': _i3.Serializers.instance
            .serialize<_i12.IList<_i13.Stock>>($value.stocks),
        r'cashBalance': _i3.Serializers.instance
            .serialize<_i11.CashBalance>($value.cashBalance),
        r'isEmpty': $value.isEmpty,
        r'totalCostBasis': $value.totalCostBasis,
      },
      deserialize: ($serialized) {
        return (_i4.Portfolio(
          stocks: ($serialized?[r'stocks'] as Iterable<Object?>?)
              ?.map(
                  (el) => _i3.Serializers.instance.deserialize<_i13.Stock>(el))
              .toList(),
          cashBalance: (_i3.Serializers.instance.deserialize<_i11.CashBalance?>(
                  $serialized?[r'cashBalance'])) ??
              _i11.CashBalance.ZERO,
        ) as _i10.Portfolio);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i10.Stock, Map<String, Object?>>(
      serialize: ($value) => {
        r'ticker': $value.ticker,
        r'howManyShares': $value.howManyShares,
        r'averagePrice': $value.averagePrice,
        r'costBasis': $value.costBasis,
        r'averagePriceStr': $value.averagePriceStr,
      },
      deserialize: ($serialized) {
        return (_i13.Stock(
          ($serialized[r'ticker'] as String),
          howManyShares: ($serialized[r'howManyShares'] as num).toInt(),
          averagePrice: ($serialized[r'averagePrice'] as num).toDouble(),
        ) as _i10.Stock);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i9.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i9.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i9.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i9.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i9.JsonValue?>('JsonValue'),
    );
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i12.IList<_i13.Stock>, dynamic>(
      serialize: ($value) => $value.toJson(
          (value) => _i3.Serializers.instance.serialize<_i13.Stock>(value)),
      deserialize: ($serialized) {
        return _i12.IList<_i13.Stock>.fromJson(
          $serialized,
          (value) => _i3.Serializers.instance.deserialize<_i13.Stock>(value),
        );
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': PortfolioTarget()});
}

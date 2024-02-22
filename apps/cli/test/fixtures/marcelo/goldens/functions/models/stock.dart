// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/errors_and_exceptions.dart' as _i6;
import 'package:_common/src/models/stock.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i5;
import 'package:celest_backend/models/overrides.dart' as _i8;
import 'package:celest_core/src/serialization/json_value.dart' as _i7;

import '../../../functions/models.dart' as _i2;

final class StockTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'stock';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.stock(
          _i3.Serializers.instance.deserialize<_i4.Stock>(request[r'stock']));
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance.serialize<_i4.Stock>(response)
        }
      );
    } on _i5.UserException_ShowInConsole catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance
          .serialize<_i5.UserException_ShowInConsole>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UserException_ShowInConsole',
            'details': error,
          }
        }
      );
    } on _i6.ValidateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i6.ValidateError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'ValidateError',
            'details': error,
          }
        }
      );
    } on _i5.NotYetImplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.NotYetImplementedError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'NotYetImplementedError',
            'details': error,
          }
        }
      );
    } on _i5.AppException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.AppException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AppException',
            'details': error,
          }
        }
      );
    } on _i5.AppError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.AppError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AppError',
            'details': error,
          }
        }
      );
    } on _i5.UserException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.UserException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UserException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.ValidateError, Map<String, Object?>>(
      serialize: ($value) => {r'msg': $value.msg},
      deserialize: ($serialized) {
        return _i6.ValidateError(($serialized[r'msg'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.AppError, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.AppError.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.AppException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'error': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.error,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
        r'msg': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.msg,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return (_i6.AppException(
          $serialized?[r'msg'],
          $serialized?[r'error'],
        ) as _i5.AppException);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.NotYetImplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'message': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.message,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.NotYetImplementedError(
            _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
          $serialized?[r'message'],
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.UserException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.cause,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UserException(
          msg: ($serialized?[r'msg'] as String?),
          cause: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized?[r'cause'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.UserException_ShowInConsole, Map<String, Object?>>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.cause,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UserException_ShowInConsole(
          msg: ($serialized[r'msg'] as String),
          cause: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'cause'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.Stock, Map<String, Object?>>(
      serialize: ($value) => {
        r'ticker': $value.ticker,
        r'howManyShares': $value.howManyShares,
        r'averagePrice': $value.averagePrice,
      },
      deserialize: ($serialized) {
        return (_i4.Stock(
          ($serialized[r'ticker'] as String),
          howManyShares: ($serialized[r'howManyShares'] as num).toInt(),
          averagePrice: ($serialized[r'averagePrice'] as num).toDouble(),
        ) as _i8.Stock);
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

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': StockTarget()},
  );
}

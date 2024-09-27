// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/available_stock.dart' as _$available_stock;
import 'package:_common/src/models/available_stocks.dart' as _$available_stocks;
import 'package:_common/src/models/cash_balance.dart' as _$cash_balance;
import 'package:_common/src/models/errors_and_exceptions.dart'
    as _$errors_and_exceptions;
import 'package:_common/src/models/portfolio.dart' as _$portfolio;
import 'package:_common/src/models/stock.dart' as _$stock;
import 'package:_common/src/models/ui.dart' as _$ui;
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/overrides.dart' as _$overrides;
import 'package:celest_backend/models/overrides.dart' as _$overrides;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _$ilist;

void initSerializers() {
  Serializers.instance.put(Serializer.define<_$available_stocks.AvailableStocks,
      Map<String, Object?>>(
    serialize: ($value) => {
      r'list': Serializers.instance
          .serialize<_$ilist.IList<_$available_stock.AvailableStock>>(
              $value.list)
    },
    deserialize: ($serialized) {
      return _$available_stocks.AvailableStocks(
          ($serialized[r'list'] as Iterable<Object?>)
              .map((el) => Serializers.instance
                  .deserialize<_$available_stock.AvailableStock>(el))
              .toList());
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$errors_and_exceptions.UserException, Map<String, dynamic>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$errors_and_exceptions.UserException.fromJson($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$errors_and_exceptions.ValidateError, Map<String, Object?>>(
    serialize: ($value) => {r'msg': $value.msg},
    deserialize: ($serialized) {
      return _$errors_and_exceptions.ValidateError(
          ($serialized[r'msg'] as String));
    },
  ));
  Serializers.instance.put(Serializer.define<_$ui.ScreenChoice, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return _$ui.ScreenChoice.values.byName($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.AppError, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$overrides.AppError.fromJson($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.AppException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'error': Serializers.instance.serialize<JsonValue?>(
        $value.error,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
      r'msg': Serializers.instance.serialize<JsonValue?>(
        $value.msg,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return (_$errors_and_exceptions.AppException(
        $serialized?[r'msg'],
        $serialized?[r'error'],
      ) as _$overrides.AppException);
    },
  ));
  Serializers.instance.put(Serializer.define<_$overrides.NotYetImplementedError,
      Map<String, Object?>?>(
    serialize: ($value) => {
      r'msg': $value.msg,
      r'message': Serializers.instance.serialize<JsonValue?>(
        $value.message,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$overrides.NotYetImplementedError(
          Serializers.instance.deserialize<JsonValue?>(
        $serialized?[r'message'],
        const TypeToken<JsonValue?>('JsonValue'),
      ));
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$overrides.UserException_ShowInConsole, Map<String, Object?>>(
    serialize: ($value) => {
      r'msg': $value.msg,
      r'code': $value.code,
      r'cause': Serializers.instance.serialize<JsonValue?>(
        $value.cause,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$overrides.UserException_ShowInConsole(
        msg: ($serialized[r'msg'] as String),
        cause: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'cause'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.AvailableStock, Map<String, Object?>>(
    serialize: ($value) => {
      r'ticker': $value.ticker,
      r'name': $value.name,
      r'currentPrice': $value.currentPrice,
      r'currentPriceStr': $value.currentPriceStr,
    },
    deserialize: ($serialized) {
      return (_$available_stock.AvailableStock(
        ($serialized[r'ticker'] as String),
        name: ($serialized[r'name'] as String),
        currentPrice: ($serialized[r'currentPrice'] as num).toDouble(),
      ) as _$overrides.AvailableStock);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.CashBalance, Map<String, Object?>>(
    serialize: ($value) => {r'amount': $value.amount},
    deserialize: ($serialized) {
      return (_$cash_balance.CashBalance(
              ($serialized[r'amount'] as num).toDouble())
          as _$overrides.CashBalance);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.Portfolio, Map<String, Object?>?>(
    serialize: ($value) => {
      r'stocks': Serializers.instance
          .serialize<_$ilist.IList<_$stock.Stock>>($value.stocks),
      r'cashBalance': Serializers.instance
          .serialize<_$cash_balance.CashBalance>($value.cashBalance),
      r'isEmpty': $value.isEmpty,
      r'totalCostBasis': $value.totalCostBasis,
    },
    deserialize: ($serialized) {
      return (_$portfolio.Portfolio(
        stocks: ($serialized?[r'stocks'] as Iterable<Object?>?)
            ?.map((el) => Serializers.instance.deserialize<_$stock.Stock>(el))
            .toList(),
        cashBalance: (Serializers.instance
                .deserialize<_$cash_balance.CashBalance?>(
                    $serialized?[r'cashBalance'])) ??
            _$cash_balance.CashBalance.ZERO,
      ) as _$overrides.Portfolio);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.Stock, Map<String, Object?>>(
    serialize: ($value) => {
      r'ticker': $value.ticker,
      r'howManyShares': $value.howManyShares,
      r'averagePrice': $value.averagePrice,
      r'costBasis': $value.costBasis,
      r'averagePriceStr': $value.averagePriceStr,
    },
    deserialize: ($serialized) {
      return (_$stock.Stock(
        ($serialized[r'ticker'] as String),
        howManyShares: ($serialized[r'howManyShares'] as num).toInt(),
        averagePrice: ($serialized[r'averagePrice'] as num).toDouble(),
      ) as _$overrides.Stock);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$overrides.Ui, Map<String, Object?>>(
    serialize: ($value) => {
      r'isDarkMode': $value.isDarkMode,
      r'screenChoice': Serializers.instance
          .serialize<_$ui.ScreenChoice>($value.screenChoice),
    },
    deserialize: ($serialized) {
      return (_$ui.Ui(
        isDarkMode: ($serialized[r'isDarkMode'] as bool),
        screenChoice: (Serializers.instance.deserialize<_$ui.ScreenChoice?>(
                $serialized[r'screenChoice'])) ??
            _$ui.ScreenChoice.portfolioAndCashBalance,
      ) as _$overrides.Ui);
    },
  ));
  Serializers.instance
      .put(Serializer.define<AbortedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return AbortedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<AlreadyExistsException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return AlreadyExistsException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<BadRequestException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return BadRequestException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<CancelledException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return CancelledException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<CloudException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return CloudException.fromJson($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<DataLossError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return DataLossError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<DeadlineExceededError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return DeadlineExceededError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<FailedPreconditionException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return FailedPreconditionException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<InternalServerError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return InternalServerError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<NotFoundException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return NotFoundException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<OutOfRangeException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return OutOfRangeException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<PermissionDeniedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return PermissionDeniedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<ResourceExhaustedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return ResourceExhaustedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnauthorizedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnauthorizedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnavailableError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnavailableError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnimplementedError, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnimplementedError(($serialized?[r'message'] as String?));
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnknownError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnknownError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<SerializationException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'offset': $value.offset,
      r'source': $value.source,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return SerializationException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(
    Serializer.define<JsonValue, Object>(
      serialize: ($value) => $value.value,
      deserialize: ($serialized) {
        return JsonValue($serialized);
      },
    ),
    const TypeToken<JsonValue?>('JsonValue'),
  );
  Serializers.instance.put(Serializer.define<
      _$ilist.IList<_$available_stock.AvailableStock>, dynamic>(
    serialize: ($value) => $value.toJson((value) => Serializers.instance
        .serialize<_$available_stock.AvailableStock>(value)),
    deserialize: ($serialized) {
      return _$ilist.IList<_$available_stock.AvailableStock>.fromJson(
        $serialized,
        (value) => Serializers.instance
            .deserialize<_$available_stock.AvailableStock>(value),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$ilist.IList<_$stock.Stock>, dynamic>(
    serialize: ($value) => $value.toJson(
        (value) => Serializers.instance.serialize<_$stock.Stock>(value)),
    deserialize: ($serialized) {
      return _$ilist.IList<_$stock.Stock>.fromJson(
        $serialized,
        (value) => Serializers.instance.deserialize<_$stock.Stock>(value),
      );
    },
  ));
}

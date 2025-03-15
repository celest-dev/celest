import 'package:_common/src/models/errors_and_exceptions.dart';
import 'package:_common/src/utils/map_deserialization_extension.dart';
import 'package:_common/src/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meta/meta.dart';

import 'available_stock.dart';
import 'cash_balance.dart';
import 'stock.dart';

@immutable
class Portfolio {
  Portfolio({Iterable<Stock>? stocks, this.cashBalance = CashBalance.ZERO})
    : stocks = IList.orNull(stocks) ?? const IListConst([]);

  const Portfolio._()
    : stocks = const IListConst([]),
      cashBalance = CashBalance.ZERO;

  factory Portfolio.fromJson(Json? json) {
    if (json == null) {
      return Portfolio.EMPTY;
    } else {
      final stocks = json.asIListOf('stocks', Stock.fromJson);
      final cashBalance = json.asCashBalance('cashBalance') ?? CashBalance.ZERO;
      return Portfolio(stocks: stocks, cashBalance: cashBalance);
    }
  }
  static const Portfolio EMPTY = Portfolio._();

  final IList<Stock> stocks;
  final CashBalance cashBalance;

  Portfolio copyWith({Iterable<Stock>? stocks, CashBalance? cashBalance}) {
    return Portfolio(
      stocks: (stocks != null) ? stocks.toIList() : this.stocks,
      cashBalance: cashBalance ?? this.cashBalance,
    );
  }

  bool get isEmpty => stocks.isEmpty;

  Portfolio addCashBalance(double howMuch) {
    final newCashBalance = cashBalance.add(howMuch);
    return copyWith(cashBalance: newCashBalance);
  }

  Portfolio removeCashBalance(double howMuch) {
    final newCashBalance = cashBalance.remove(howMuch);
    return copyWith(cashBalance: newCashBalance);
  }

  Portfolio withoutStock(String ticker) {
    return withStock(ticker, 0, 0);
  }

  Portfolio withoutStocks() {
    return copyWith(stocks: []);
  }

  Portfolio withStock(String ticker, int quantity, double averagePrice) {
    final newStocks = stocks.where((stock) => stock.ticker != ticker).toList();

    if (quantity > 0) {
      final newStock = Stock(
        ticker,
        howManyShares: quantity,
        averagePrice: averagePrice,
      );
      newStocks.add(newStock);
    }

    return copyWith(stocks: newStocks);
  }

  int howManyStocks(String ticker) {
    final stock = getStockOrNull(ticker);
    return stock?.howManyShares ?? 0;
  }

  Stock getStock(String ticker) {
    final stock = getStockOrNull(ticker);
    if (stock == null) {
      throw Exception('Stock $ticker not found.');
    }
    return stock;
  }

  Stock? getStockOrNull(String ticker) {
    return stocks.firstWhereOrNull((stock) => stock.ticker == ticker);
  }

  bool hasStock(AvailableStock availableStock) {
    return _getStockPositionInList(availableStock) != -1;
  }

  bool hasMoneyToBuyStock(AvailableStock availableStock) {
    return cashBalance.amount >= availableStock.currentPrice;
  }

  /// Sells [howMany] shares of [availableStock].
  /// If the user does not own the stock, or does not own enough shares, throws a [UserException].
  /// This exception will be shown to the user in a dialog.
  Portfolio sell(AvailableStock availableStock, {required int howMany}) {
    final pos = _getStockPositionInList(availableStock);

    if (pos == -1) {
      throw const UserException('Cannot sell stock you do not own');
    } else {
      final stock = stocks[pos];

      if (stock.howManyShares < howMany) {
        throw UserException(
          'Cannot sell $howMany shares of stock you do not own',
        );
      } else {
        final newShares = stock.howManyShares - howMany;
        final newAveragePrice = round(
          ((stock.howManyShares * stock.averagePrice) -
                  (howMany * availableStock.currentPrice)) /
              newShares,
        );

        var newStocks = [...stocks];
        newStocks[pos] = Stock(
          stock.ticker,
          howManyShares: newShares,
          averagePrice: newAveragePrice,
        );

        if (newShares == 0) {
          newStocks =
              newStocks
                  .where((stock) => stock.ticker != availableStock.ticker)
                  .toList();
        }

        final newCashBalance = CashBalance(
          cashBalance.amount + availableStock.currentPrice * howMany,
        );
        return copyWith(stocks: newStocks, cashBalance: newCashBalance);
      }
    }
  }

  int _getStockPositionInList(AvailableStock availableStock) {
    return stocks.indexWhere((stock) => stock.ticker == availableStock.ticker);
  }

  double get totalCostBasis {
    return stocks.fold<double>(0, (sum, stock) => sum + stock.costBasis) +
        cashBalance.amount;
  }

  @override
  String toString() => 'Portfolio{stocks: $stocks, cashBalance: $cashBalance}';

  Json toJson() => {
    'stocks': stocks.map((stock) => stock.toJson()).toList(),
    'cashBalance': cashBalance.toJson(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Portfolio &&
          runtimeType == other.runtimeType &&
          stocks == other.stocks &&
          cashBalance == other.cashBalance;

  @override
  int get hashCode => stocks.hashCode ^ cashBalance.hashCode;
}

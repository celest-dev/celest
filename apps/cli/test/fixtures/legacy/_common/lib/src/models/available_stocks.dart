import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'available_stock.dart';

class AvailableStocks {
  static const AvailableStocks EMPTY = AvailableStocks._(IListConst([]));

  final IList<AvailableStock> list;

  AvailableStocks(Iterable<AvailableStock> list) : list = IList(list);

  const AvailableStocks._(this.list);

  AvailableStock? findBySymbolOrNull(String ticker) {
    return list.firstWhereOrNull((s) => s.ticker == ticker);
  }

  AvailableStock findBySymbol(String ticker) {
    final stock = findBySymbolOrNull(ticker);
    if (stock == null) throw Exception('Stock not found: $ticker');
    return stock;
  }

  void forEach(void Function(AvailableStock availableStock) callback) {
    list.forEach(callback);
  }

  /// Updates the available stock with the new available stock.
  /// If the stock is not found, it is added to the list.
  AvailableStocks withAvailableStock(AvailableStock newAvailableStock) {
    bool isPresent = list.any((s) => s.ticker == newAvailableStock.ticker);

    IList<AvailableStock> newList = isPresent
        ? list.map((s) => s.ticker == newAvailableStock.ticker ? newAvailableStock : s).toIList()
        : list.add(newAvailableStock);

    return AvailableStocks(newList);
  }

  /// Updates the available stock with the new available stock.
  /// If the stock is not found, it is NOT added to the list.
  AvailableStocks withUpdatedAvailableStock(AvailableStock newAvailableStock) {
    final newList =
        list.map((s) => s.ticker == newAvailableStock.ticker ? newAvailableStock : s).toIList();

    return AvailableStocks(newList);
  }

  @override
  String toString() {
    return 'AvailableStocks: ${list.isEmpty ? 'empty' : list}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailableStocks && runtimeType == other.runtimeType && list == other.list;

  @override
  int get hashCode => list.hashCode;
}

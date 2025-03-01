import 'package:_common/src/utils/map_deserialization_extension.dart';
import 'package:meta/meta.dart';

/// Stocks the user has.
@immutable
class Stock {
  const Stock(
    this.ticker, {
    required this.howManyShares,
    required this.averagePrice,
  });

  factory Stock.fromJson(Json json) {
    return Stock(
      json.asString('ticker')!,
      howManyShares: json.asInt('howManyShares')!,
      averagePrice: json.asDouble('averagePrice')!,
    );
  }
  final String ticker;
  final int howManyShares;
  final double averagePrice;

  double get costBasis => howManyShares * averagePrice;

  String get averagePriceStr => 'US\$ ${averagePrice.toStringAsFixed(2)}';

  @override
  String toString() => '$howManyShares $ticker @$averagePrice';

  Json toJson() => {
        'ticker': ticker,
        'howManyShares': howManyShares,
        'averagePrice': averagePrice,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stock &&
          runtimeType == other.runtimeType &&
          ticker == other.ticker &&
          howManyShares == other.howManyShares &&
          averagePrice == other.averagePrice;

  @override
  int get hashCode =>
      ticker.hashCode ^ howManyShares.hashCode ^ averagePrice.hashCode;
}

import 'package:_common/src/utils/map_deserialization_extension.dart';
import 'package:_common/src/utils/utils.dart';
import 'package:meta/meta.dart';

@immutable
class CashBalance {
  CashBalance(double amount) : amount = amount.isNaN ? 0 : round(amount);

  const CashBalance._(this.amount);

  factory CashBalance.fromJson(Json json) =>
      CashBalance(json.asDouble('amount')!);
  static const CashBalance ZERO = CashBalance._(0);

  final double amount;

  CashBalance withAmount(double amount) => CashBalance(round(amount));

  CashBalance add(double howMuch) {
    final newAmount = round(amount + howMuch);
    print('Added $howMuch. Cash balance is now: $newAmount.');
    return CashBalance(newAmount);
  }

  CashBalance remove(double howMuch) {
    var newAmount = round(amount - howMuch);
    if (newAmount < 0) newAmount = 0;
    print('Removed $howMuch. Cash balance is now: $newAmount.');
    return CashBalance(newAmount);
  }

  @override
  String toString() => 'US\$ ${amount.toStringAsFixed(2)}';

  Json toJson() => {'amount': amount};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CashBalance &&
          runtimeType == other.runtimeType &&
          amount == other.amount;

  @override
  int get hashCode => amount.hashCode;
}

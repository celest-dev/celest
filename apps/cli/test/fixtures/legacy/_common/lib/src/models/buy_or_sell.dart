enum BuyOrSell {
  buy,
  sell;

  @override
  String toString() => name;

  bool get isBuy => this == buy;
}

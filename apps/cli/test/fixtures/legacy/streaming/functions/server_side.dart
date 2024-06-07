/// Tests the ability to use server-side streaming.
library;

import 'package:_common/src/models/available_stock.dart';
import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
Stream<String> hello(List<String> names) async* {
  for (final name in names) {
    yield 'Hello, $name!';
  }
}

@cloud
Stream<AvailableStock> stockTicker(@httpQuery() String symbol) async* {
  for (var i = 0; i < 3; i++) {
    yield AvailableStock(symbol, name: symbol, currentPrice: 100.0 + i);
  }
}

@cloud
Stream<JsonValue> jsonValues() async* {
  yield JsonBool(true);
  yield JsonNum(42);
  yield JsonString('hello');
  yield JsonList([JsonBool(false), JsonInt(42), JsonDouble(42.0)]);
  yield JsonMap({'key': JsonBool(true)});
}

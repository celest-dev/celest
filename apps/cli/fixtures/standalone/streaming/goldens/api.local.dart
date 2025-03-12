// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/core/context.dart' as _i5;
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/server_side/hello.dart' as _i2;
import 'functions/server_side/jsonValues.dart' as _i3;
import 'functions/server_side/stockTicker.dart' as _i4;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {
      '/server-side/hello': _i2.HelloTarget(),
      '/server-side/json-values': _i3.JsonValuesTarget(),
      '/server-side/stock-ticker': _i4.StockTickerTarget(),
    },
    setup: (_i5.Context context) async {},
  );
}

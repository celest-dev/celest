// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/streaming/goldens/functions/server_side/hello.dart'
    as _i2;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/streaming/goldens/functions/server_side/jsonValues.dart'
    as _i3;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/streaming/goldens/functions/server_side/stockTicker.dart'
    as _i4;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {
    '/server-side/hello': _i2.HelloTarget(),
    '/server-side/json-values': _i3.JsonValuesTarget(),
    '/server-side/stock-ticker': _i4.StockTickerTarget(),
  });
}

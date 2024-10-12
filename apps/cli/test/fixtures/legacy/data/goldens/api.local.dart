// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/core/context.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/generated/data.celest.dart' as _i4;

import 'functions/tasks/create.dart' as _i2;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/tasks/create': _i2.CreateTarget()},
    setup: (_i3.Context context) async {
      await _i4.CelestData.init(context);
    },
  );
}

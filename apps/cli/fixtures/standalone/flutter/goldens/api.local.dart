// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/core/context.dart' as _i6;
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/dart_ui/addCountryCode.dart' as _i2;
import 'functions/dart_ui/lerpColor.dart' as _i3;
import 'functions/flutter/helloWorld.dart' as _i4;
import 'functions/flutter/paintWidget.dart' as _i5;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {
      '/dart-ui/add-country-code': _i2.AddCountryCodeTarget(),
      '/dart-ui/lerp-color': _i3.LerpColorTarget(),
      '/flutter/hello-world': _i4.HelloWorldTarget(),
      '/flutter/paint-widget': _i5.PaintWidgetTarget(),
    },
    setup: (_i6.Context context) async {},
  );
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i1;
import 'dart:isolate' as _i2;

import 'package:celest/src/runtime/serve.dart' as _i3;

import 'functions/injected/sayHello.dart' as _i4;
import 'functions/injected/sayHelloPerson.dart' as _i5;

Future<void> main() async {
  await Future.wait([
    for (var i = 0; i < _i1.Platform.numberOfProcessors; i++)
      _i2.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i3.serve(targets: {
    '/injected/say-hello': _i4.SayHelloTarget(),
    '/injected/say-hello-person': _i5.SayHelloPersonTarget(),
  });
}

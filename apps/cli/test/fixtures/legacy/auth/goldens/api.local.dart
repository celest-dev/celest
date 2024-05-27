// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i1;
import 'dart:isolate' as _i2;

import 'package:celest/src/runtime/serve.dart' as _i3;

import 'functions/authenticated_lib/sayHello.dart' as _i4;
import 'functions/lib/sayHello.dart' as _i5;
import 'functions/lib/sayHelloAuthenticated.dart' as _i6;
import 'functions/lib/sayHelloPublic.dart' as _i7;
import 'functions/public_lib/sayHello.dart' as _i8;

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i1.Platform.numberOfProcessors; i++)
      _i2.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i3.serve(targets: {
    '/authenticated-lib/say-hello': _i4.SayHelloTarget(),
    '/lib/say-hello': _i5.SayHelloTarget(),
    '/lib/say-hello-authenticated': _i6.SayHelloAuthenticatedTarget(),
    '/lib/say-hello-public': _i7.SayHelloPublicTarget(),
    '/public-lib/say-hello': _i8.SayHelloTarget(),
  });
}

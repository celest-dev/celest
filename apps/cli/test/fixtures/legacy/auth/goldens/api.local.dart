// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i1;
import 'dart:isolate' as _i2;

import 'package:celest/src/runtime/serve.dart' as _i3;

import 'functions/authenticated_lib/sayHello.dart' as _i4;
import 'functions/authenticated_lib/streamHello.dart' as _i5;
import 'functions/lib/sayHello.dart' as _i6;
import 'functions/lib/sayHelloAuthenticated.dart' as _i7;
import 'functions/lib/sayHelloPublic.dart' as _i8;
import 'functions/lib/streamHello.dart' as _i9;
import 'functions/lib/streamHelloAuthenticated.dart' as _i10;
import 'functions/lib/streamHelloPublic.dart' as _i11;
import 'functions/public_lib/sayHello.dart' as _i12;
import 'functions/public_lib/streamHello.dart' as _i13;

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i1.Platform.numberOfProcessors; i++)
      _i2.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i3.serve(targets: {
    '/authenticated-lib/say-hello': _i4.SayHelloTarget(),
    '/authenticated-lib/stream-hello': _i5.StreamHelloTarget(),
    '/lib/say-hello': _i6.SayHelloTarget(),
    '/lib/say-hello-authenticated': _i7.SayHelloAuthenticatedTarget(),
    '/lib/say-hello-public': _i8.SayHelloPublicTarget(),
    '/lib/stream-hello': _i9.StreamHelloTarget(),
    '/lib/stream-hello-authenticated': _i10.StreamHelloAuthenticatedTarget(),
    '/lib/stream-hello-public': _i11.StreamHelloPublicTarget(),
    '/public-lib/say-hello': _i12.SayHelloTarget(),
    '/public-lib/stream-hello': _i13.StreamHelloTarget(),
  });
}

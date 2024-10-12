// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/core/context.dart' as _i12;
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/authenticated_lib/sayHello.dart' as _i2;
import 'functions/authenticated_lib/streamHello.dart' as _i3;
import 'functions/lib/sayHello.dart' as _i4;
import 'functions/lib/sayHelloAuthenticated.dart' as _i5;
import 'functions/lib/sayHelloPublic.dart' as _i6;
import 'functions/lib/streamHello.dart' as _i7;
import 'functions/lib/streamHelloAuthenticated.dart' as _i8;
import 'functions/lib/streamHelloPublic.dart' as _i9;
import 'functions/public_lib/sayHello.dart' as _i10;
import 'functions/public_lib/streamHello.dart' as _i11;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {
      '/authenticated-lib/say-hello': _i2.SayHelloTarget(),
      '/authenticated-lib/stream-hello': _i3.StreamHelloTarget(),
      '/lib/say-hello': _i4.SayHelloTarget(),
      '/lib/say-hello-authenticated': _i5.SayHelloAuthenticatedTarget(),
      '/lib/say-hello-public': _i6.SayHelloPublicTarget(),
      '/lib/stream-hello': _i7.StreamHelloTarget(),
      '/lib/stream-hello-authenticated': _i8.StreamHelloAuthenticatedTarget(),
      '/lib/stream-hello-public': _i9.StreamHelloPublicTarget(),
      '/public-lib/say-hello': _i10.SayHelloTarget(),
      '/public-lib/stream-hello': _i11.StreamHelloTarget(),
    },
    setup: (_i12.Context context) async {},
  );
}

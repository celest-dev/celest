// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/authenticated_lib/sayHello.dart' as _i2;
import 'functions/lib/sayHello.dart' as _i3;
import 'functions/lib/sayHelloAuthenticated.dart' as _i4;
import 'functions/lib/sayHelloPublic.dart' as _i5;
import 'functions/public_lib/sayHello.dart' as _i6;

void main() {
  _i1.serve(targets: {
    '/authenticated-lib/say-hello': _i2.SayHelloTarget(),
    '/lib/say-hello': _i3.SayHelloTarget(),
    '/lib/say-hello-authenticated': _i4.SayHelloAuthenticatedTarget(),
    '/lib/say-hello-public': _i5.SayHelloPublicTarget(),
    '/public-lib/say-hello': _i6.SayHelloTarget(),
  });
}

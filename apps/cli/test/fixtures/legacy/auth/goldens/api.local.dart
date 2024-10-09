// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/authenticated_lib/sayHello.dart'
    as _i2;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/authenticated_lib/streamHello.dart'
    as _i3;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/lib/sayHello.dart'
    as _i4;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/lib/sayHelloAuthenticated.dart'
    as _i5;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/lib/sayHelloPublic.dart'
    as _i6;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/lib/streamHello.dart'
    as _i7;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/lib/streamHelloAuthenticated.dart'
    as _i8;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/lib/streamHelloPublic.dart'
    as _i9;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/public_lib/sayHello.dart'
    as _i10;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/auth/goldens/functions/public_lib/streamHello.dart'
    as _i11;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {
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
  });
}

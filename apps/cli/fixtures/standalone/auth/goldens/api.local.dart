// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i15;
import 'package:celest/src/core/context.dart' as _i12;
import 'package:celest/src/runtime/data/celest_database.dart' as _i13;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/generated/cloud.celest.dart' as _i18;
import 'package:celest_backend/src/generated/data.celest.dart' as _i16;
import 'package:celest_cloud_auth/celest_cloud_auth.dart' as _i17;
import 'package:celest_cloud_auth/src/database/auth_database.dart' as _i14;

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
    setup: (_i12.Context context) async {
      final cloudAuth = await _i13.CelestDatabase.create(
        context,
        name: 'CloudAuthDatabase',
        factory: _i14.CloudAuthDatabase.new,
        hostnameVariable: const _i15.env('CLOUD_AUTH_DATABASE_HOST'),
        tokenSecret: const _i15.secret('CLOUD_AUTH_DATABASE_TOKEN'),
      );
      context.put(_i16.CelestData.cloudAuth$Key, await cloudAuth.connect());
      final $cloudAuth = await _i17.CelestCloudAuth.create(
        database: _i18.celest.data.cloudAuth,
      );
      context.router.mount('/v1alpha1/auth/', $cloudAuth.handler);
      context.put(_i17.CelestCloudAuth.contextKey, $cloudAuth);
      if (context.environment == _i15.Environment.local) {
        final $studio = cloudAuth.createStudio();
        context.router.mount('/_admin/studio', $studio.call);
      }
    },
  );
}

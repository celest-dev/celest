// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:celest_auth/celest_auth.dart' as _$celest;
import 'package:celest_auth/src/auth_impl.dart' as _$celest;
import 'package:celest_core/_internal.dart' as _$celest;
import 'package:native_storage/native_storage.dart' as _$native_storage;

extension type CelestAuth._(_$celest.AuthImpl _hub) implements _$celest.Auth {
  CelestAuth(
    _$celest.CelestBase celest, {
    required _$native_storage.NativeStorage storage,
  }) : _hub = _$celest.AuthImpl(
          celest,
          storage: storage,
        );

  _$celest.Email get email => _$celest.Email(_hub);
}

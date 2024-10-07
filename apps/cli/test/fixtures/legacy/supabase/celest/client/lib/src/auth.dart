// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:celest_auth/celest_auth.dart' as _$celest;
import 'package:celest_auth/src/auth_impl.dart' as _$celest;
import 'package:celest_core/_internal.dart' as _$celest;
import 'package:gotrue/gotrue.dart' as _$gotrue;
import 'package:native_storage/native_storage.dart' as _$native_storage;
import 'package:stream_transform/stream_transform.dart' show Concatenate;

extension type CelestAuth._(_$celest.AuthImpl _hub) implements _$celest.Auth {
  CelestAuth(
    _$celest.CelestBase celest, {
    required _$native_storage.NativeStorage storage,
  }) : _hub = _$celest.AuthImpl(
          celest,
          storage: storage,
        );
}

/// External authentication providers which can be used to sign in to Celest.
///
/// This class is passed to `celest.init` to configure the token sources for
/// the external auth providers.
class ExternalAuth extends _$celest.TokenSource {
  /// {@macro celest_auth.token_source.of}
  const ExternalAuth.of({
    required super.provider,
    required super.stream,
  }) : super.of();

  /// ### Supabase
  ///
  /// See the [Supabase docs](https://supabase.com/docs/reference/dart/introduction)
  /// for more information on how to initialize Supabase.
  ///
  /// ```dart
  /// Future<void> main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await Supabase.initialize(
  ///     url: 'https://<your-project-id>.supabase.co',
  ///     ...
  ///   );
  ///   celest.init(
  ///     externalAuth: ExternalAuth.supabase(supabase.auth),
  ///   );
  /// }
  /// ```
  factory ExternalAuth.supabase(_$gotrue.GoTrueClient supabase) {
    return ExternalAuth.of(
      provider: _$celest.AuthProviderType.supabase,
      stream: supabase.onAuthStateChange
          .where(
            (state) => const [
              _$gotrue.AuthChangeEvent.initialSession,
              _$gotrue.AuthChangeEvent.tokenRefreshed,
              _$gotrue.AuthChangeEvent.signedIn,
              _$gotrue.AuthChangeEvent.signedOut,
            ].contains(state.event),
          )
          .map((state) => state.session?.accessToken)
          .startWith(supabase.currentSession?.accessToken),
    );
  }
}

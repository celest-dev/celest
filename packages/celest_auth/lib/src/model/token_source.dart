import 'dart:async';

import 'package:celest_auth/src/model/auth_provider_type.dart';

/// {@template celest_auth.token_source}
/// This class is passed to `celest.init` to configure the token sources for
/// the external auth providers.
/// {@endtemplate}
abstract class TokenSource extends StreamView<String?> {
  /// {@template celest_auth.token_source.of}
  /// Creates an instance of [TokenSource] from a raw token stream.
  ///
  /// This can be used instead of the first-party factories when third-party
  /// client libraries are used for the external auth providers.
  /// {@endtemplate}
  const TokenSource.of({
    required this.provider,
    required Stream<String?> stream,
  }) : super(stream);

  /// The external auth provider.
  final AuthProviderType provider;
}

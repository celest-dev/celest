// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library;

import 'package:celest/celest.dart';
import 'package:celest/src/core/context.dart';

/// An environment of a deployed Celest service.
///
/// Celest services can have multiple isolated branches, for example
/// a `development` and `production` environment.
extension type const CelestEnvironment._(String _env)
    implements Environment, String {
  /// The local Celest environment, used to delineate when a
  /// Celest service is running on a developer machine as opposed
  /// to the cloud.
  static const CelestEnvironment local = CelestEnvironment._('local');

  /// The production Celest environment which is common to all
  /// Celest projects and labels the environment which is considered
  /// live and served to end-users.
  static const CelestEnvironment production = CelestEnvironment._('production');

  /// Whether `this` represents the [local] environment.
  bool get isLocal => this == local;

  /// Whether `this` represents the [production] environment.
  bool get isProduction => this == production;
}

/// The environment variables for the Celest service.
///
/// This class provides access to the environment variable values
/// that are configured for the current [CelestEnvironment].
class CelestVariables {
  const CelestVariables();

  /// The environment variable that determines the current environment.
  ///
  /// This is set by the deployment environment and is used to
  /// determine the current environment of the Celest service.
  String get currentEnvironment => context.expect(env.environment);
}

/// The secrets for the Celest service.
///
/// This class provides access to the secret values that are configured
/// for the current [CelestEnvironment].
class CelestSecrets {
  const CelestSecrets();

  /// The value of the `OPEN_API_TOKEN` secret.
  String get openAiToken => context.expect(const env('OPEN_API_TOKEN'));
}

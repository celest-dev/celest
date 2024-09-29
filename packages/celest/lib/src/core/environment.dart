/// An environment of a deployed Celest service.
///
/// Celest services can have multiple isolated branches, for example
/// a `development` and `production` environment.
extension type const Environment(String _env) implements String {
  /// The local Celest environment, used to delineate when a
  /// Celest service is running on a developer machine as opposed
  /// to the cloud.
  static const Environment local = Environment('local');

  /// The production Celest environment which is common to all
  /// Celest projects and labels the environment which is considered
  /// live and served to end-users.
  static const Environment production = Environment('production');

  /// Whether `this` represents the production environment.
  bool get isProduction => this == production;
}

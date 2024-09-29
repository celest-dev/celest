import 'package:celest/src/core/cloud_widget.dart';

/// {@template celest.config.environment_variable}
/// A reference to an environment variable within a Celest backend.
/// {@endtemplate}
///
/// Environment variables can be used to provide environment-specific
/// configuration to your backend. They allow you to keep configuration values
/// separate from your codebase, improving flexibility when running in different
/// environments.
final class EnvironmentVariable extends CloudWidget {
  /// {@macro celest.config.environment_variable}
  const EnvironmentVariable({
    required this.name,
  });

  /// The name of the environment variable as it appears in its environment.
  final String name;
}

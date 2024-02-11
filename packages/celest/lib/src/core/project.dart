import 'package:celest/celest.dart';

/// {@template celest.core.project}
/// A project which is deployed to the cloud.
///
/// Projects are defined in the `project.dart` file at the root of your Celest
/// project and create the container for all [CloudWidget]s deployed to your
/// backend.
/// {@endtemplate}
class Project implements CloudWidget {
  /// {@macro celest.core.project}
  const Project({
    required this.name,
    this.logoUrl,
  });

  /// The name of the project as its identified in your Celest backend.
  final String name;

  /// The hosted URL of your project's logo.
  ///
  /// This is used by widgets like [Auth] to craft a custom login page.
  final String? logoUrl;
}

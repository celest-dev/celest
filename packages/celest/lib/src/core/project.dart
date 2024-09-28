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
    this.displayName,
    this.region,
  });

  /// The name of the project as its identified in your Celest backend.
  final String name;

  /// A friendly name for the project.
  final String? displayName;

  /// The region of the project, when deploying to Celest Cloud.
  ///
  /// If not specified, the closest region will be chosen at the time of
  /// deployment.
  final Region? region;
}

/// The Celest cloud region to deploy to.
enum Region {
  /// The North America region.
  ///
  /// Includes the `us-east1`, `us-south1` and `us-west1` GCP regions.
  northAmerica,

  /// The Europe region.
  ///
  /// Includes the `europe-west4` and `europe-west9` GCP regions.
  europe,

  /// The Asia-Pacific region.
  ///
  /// Includes the `asia-south1` GCP region.
  asiaPacific,
}

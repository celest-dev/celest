import 'package:celest/src/core/cloud_widget.dart';

/// {@template celest.core.project}
/// A project which is deployed to the cloud.
///
/// Projects are defined in the `project.dart` file at the root of your Celest
/// project and create the container for all [CloudWidget]s deployed to your
/// backend.
/// {@endtemplate}
class Project implements CloudWidget {
  /// {@macro celest.core.project}
  const Project({required this.name, this.displayName, this.region, this.productionUrl,});

  /// The name of the project as its identified in your Celest backend.
  final String name;

  /// A friendly name for the project.
  final String? displayName;

  /// The region of the project, when deploying to Celest Cloud.
  ///
  /// If not specified, the closest region will be chosen at the time of
  /// deployment.
  final Region? region;

  /// The production URL for self-hosted-deployments.
  ///
  /// When specified this URL will be used as the production endpoint
  /// in the generated client code. This is useful for self-hosted
  /// deployments where Celest Cloud is not used therefore a production URL is not set
  final String? productionUrl;
}

/// The Celest cloud region to deploy to.
enum Region {
  /// The North America region.
  northAmerica,

  /// The Europe region.
  europe,

  /// The Asia-Pacific region.
  asiaPacific,
}

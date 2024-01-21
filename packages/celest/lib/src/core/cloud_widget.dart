/// {@template celest.core.cloud_widget}
/// A marker trait for a Cloud Widget.
///
/// A Cloud Widget is a declarative description of a component of your Celest
/// backend. An instance of a [CloudWidget] describes a specific configuration
/// of that component. In this way, Cloud Widgets are similar to Flutter
/// Widgets–they are reusable templates for backend infrastructure.
/// {@endtemplate}
abstract mixin class CloudWidget {
  /// {@macro celest.core.cloud_widget}
  const CloudWidget();
}

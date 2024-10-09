import 'package:code_builder/code_builder.dart';

abstract final class CloudPaths {
  static Uri get client =>
      Uri.parse('package:celest_backend/src/generated/cloud.celest.dart');
  static Uri get config =>
      Uri.parse('package:celest_backend/src/generated/config.celest.dart');
}

final class CloudClientTypes {
  CloudClientTypes._(this.name, this.uri);

  static CloudClientTypes get topLevelClient =>
      CloudClientTypes._('celest', CloudPaths.client);
  static CloudClientTypes get clientClass =>
      CloudClientTypes._('CelestCloud', CloudPaths.client);
  static CloudClientTypes get environmentClass =>
      CloudClientTypes._('CelestEnvironment', CloudPaths.config);
  static CloudClientTypes get environmentVariablesClass =>
      CloudClientTypes._('CelestEnvironmentVariables', CloudPaths.config);
  static CloudClientTypes get secretsClass =>
      CloudClientTypes._('CelestSecrets', CloudPaths.config);

  final String name;
  final Uri uri;

  Reference get ref => refer(name, uri.toString());
}

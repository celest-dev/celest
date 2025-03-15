import 'package:code_builder/code_builder.dart';

abstract final class CloudPaths {
  static Uri get client =>
      Uri.parse('package:celest_backend/src/generated/cloud.celest.dart');
  static Uri get config =>
      Uri.parse('package:celest_backend/src/generated/config.celest.dart');
  static Uri get data =>
      Uri.parse('package:celest_backend/src/generated/data.celest.dart');
  static Uri get auth =>
      Uri.parse('package:celest_backend/src/generated/auth.celest.dart');
}

final class CloudClientTypes {
  CloudClientTypes._(this.name, this.uri);

  static CloudClientTypes get topLevelClient =>
      CloudClientTypes._('celest', CloudPaths.client);
  static CloudClientTypes get topLevelContext =>
      CloudClientTypes._('context', CloudPaths.client);
  static CloudClientTypes get clientClass =>
      CloudClientTypes._('CelestCloud', CloudPaths.client);
  static CloudClientTypes get contextClass =>
      CloudClientTypes._('CelestContext', CloudPaths.client);
  static CloudClientTypes get environmentClass =>
      CloudClientTypes._('CelestEnvironment', CloudPaths.config);
  static CloudClientTypes get variablesClass =>
      CloudClientTypes._('CelestVariables', CloudPaths.config);
  static CloudClientTypes get secretsClass =>
      CloudClientTypes._('CelestSecrets', CloudPaths.config);
  static CloudClientTypes get dataClass =>
      CloudClientTypes._('CelestData', CloudPaths.data);
  static CloudClientTypes get authClass =>
      CloudClientTypes._('CelestAuth', CloudPaths.auth);

  final String name;
  final Uri uri;

  Reference get ref => refer(name, uri.toString());
}

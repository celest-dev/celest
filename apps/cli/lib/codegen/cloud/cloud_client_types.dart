import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart';

abstract final class CloudPaths {
  static String get client =>
      p.join(projectPaths.generatedDir, 'cloud.celest.dart');
  static String get config =>
      p.join(projectPaths.generatedDir, 'config.celest.dart');
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
  final String uri;

  Reference get ref => refer(name, p.toUri(uri).toString());
}

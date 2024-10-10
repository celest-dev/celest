import 'dart:convert';
import 'dart:io';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest_core/_internal.dart';
import 'package:logging/logging.dart';

/// Configures the environment in which Celest is running.
Future<void> configureEnvironment() async {
  final script = Platform.script;
  final configUri = script.resolve('./config.json');
  if (!FileSystemEntity.isFileSync(configUri.toFilePath())) {
    if (kReleaseMode) {
      Logger.root.finer(
        'No config.json file found. Skipping environment configuration.',
      );
    }
    return;
  }

  final configFile = await File.fromUri(configUri)
      .readAsString()
      .onError((e, _) => throw StateError('Failed to load config.json: $e'));

  final configJson = jsonDecode(configFile);
  if (configJson is! Map<String, Object?>) {
    throw FormatException(
      'Invalid config.json: $configJson. '
      'Expected Map<String, Object?>, got ${configJson.runtimeType}',
    );
  }
  final environmentVariables = configJson['environmentVariables'];
  if (environmentVariables is! Map<String, Object?>) {
    throw FormatException(
      'Invalid "environmentVariables" in config.json: $environmentVariables. '
      'Expected Map<String, String>, got ${environmentVariables.runtimeType}',
    );
  }
  final secrets = configJson['secrets'];
  if (secrets is! Map<String, Object?>) {
    throw FormatException(
      'Invalid "secrets" in config.json: $secrets. '
      'Expected Map<String, String>, got ${secrets.runtimeType}',
    );
  }

  for (final MapEntry(key: name, :value) in environmentVariables.entries) {
    if (value is! String) {
      throw FormatException(
        'Invalid value for environment variable "$name" in config.json: $value. '
        'Expected String, got ${value.runtimeType}',
      );
    }
    Context.root.put(env(name), value);
  }

  for (final MapEntry(key: name, :value) in secrets.entries) {
    if (value is! String) {
      throw FormatException(
        'Invalid value for secret "$name" in config.json: $value. '
        'Expected String, got ${value.runtimeType}',
      );
    }
    Context.root.put(secret(name), value);
  }
}

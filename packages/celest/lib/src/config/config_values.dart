import 'package:celest/src/core/context.dart';
import 'package:meta/meta.dart';

/// A configuration value that can be used to configure a Celest backend.
@immutable
sealed class ConfigurationValue extends ContextKey<String> {
  const ConfigurationValue._(this.type, this.name) : super('$type:$name');

  /// The type of configuration value (e.g. `env`, `secret`).
  final String type;

  /// The name of the configuration value in the environment.
  final String name;

  String _decodeValue(String value) {
    if (!value.startsWith('data:')) {
      return value;
    }
    final UriData data = UriData.parse(value);
    if (data.isBase64) {
      return data.contentText;
    } else {
      return data.contentAsString();
    }
  }

  /// Reads and decodes the value for `this` from the given [context].
  ///
  /// Returns `null` if the value is not set.
  String? read(Context context) {
    final String? raw = rawValue(context);
    if (raw == null) {
      return null;
    }
    return _decodeValue(raw);
  }

  /// Reads the raw value for `this` from the given [context].
  ///
  /// Unlike [read], this will not decode `data:` URIs.
  String? rawValue(Context context) {
    if (context.get(this) case final value?) {
      return value;
    }
    if (context.platform.environment[name] case final platformValue?) {
      return platformValue;
    }
    return null;
  }

  // void set(Context context, String? value) {
  //   context.setLocal(key, value);
  // }
}

/// {@template celest.config.environment_variable}
/// A reference to an environment variable within a Celest backend.
/// {@endtemplate}
///
/// Environment variables can be used to provide environment-specific
/// configuration to your backend. They allow you to keep configuration values
/// separate from your codebase, improving flexibility when running in different
/// environments.
final class env extends ConfigurationValue {
  /// {@macro celest.config.environment_variable}
  const env(String name) : super._('env', name);

  /// A static environment variable with a fixed value across all environments.
  const factory env.static(String name, String value) = _staticEnv;

  /// The active Celest environment.
  ///
  /// For example, `production`.
  static const env environment = env('CELEST_ENVIRONMENT');

  @override
  String toString() => 'env($name)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is env && other.name == name;
  }

  @override
  int get hashCode => Object.hash(env, name);
}

final class _staticEnv extends env {
  const _staticEnv(super.name, this.value);

  final String value;
}

/// {@template celest.config.secret}
/// A secret value that should be kept confidential within a Celest backend.
///
/// Secrets behave much like environment variables except that their values
/// are encrypted in the transit and only exposed to the backend itself.
/// {@endtemplate}
final class secret extends ConfigurationValue {
  /// {@macro celest.config.secret}
  const secret(String name) : super._('secret', name);

  @override
  String toString() => 'secret($name)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is secret && other.name == name;
  }

  @override
  int get hashCode => Object.hash(secret, name);
}

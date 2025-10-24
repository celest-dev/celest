import 'dart:typed_data';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/core/environment.dart';
import 'package:celest/src/runtime/http/logging.dart';
import 'package:celest_ast/celest_ast.dart';
// ignore: implementation_imports
import 'package:celest_ast/src/proto/celest/ast/v1/resolved_ast.pb.dart' as pb;
import 'package:celest_core/_internal.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';

Map<String, Object?>? _loadJsonFromEnv(Context rootContext) {
  final String? configJson =
      rootContext.platform.environment['CELEST_CONFIG_JSON'];
  if (configJson == null) {
    return null;
  }
  try {
    return JsonUtf8.decodeMap(configJson);
  } on FormatException catch (e) {
    throw StateError('Failed to parse CELEST_CONFIG_JSON: $e');
  }
}

Future<Map<String, Object?>?> _loadJsonFromFileSystem(
  Context rootContext,
) async {
  String? configPath = rootContext.platform.environment['CELEST_CONFIG'];
  if (configPath == null) {
    final Uri script = rootContext.platform.script;
    configPath = script.resolve('./celest.json').toFilePath();
  }
  if (!rootContext.fileSystem.isFileSync(configPath)) {
    return null;
  }

  final File configFile = rootContext.fileSystem.file(configPath);
  final Uint8List configData = await configFile.readAsBytes().onError(
    (e, _) => throw StateError('Failed to load celest.json: $e'),
  );

  try {
    return JsonUtf8.decodeMap(configData);
  } on FormatException catch (e) {
    throw StateError('Failed to parse celest.json from "$configPath": $e');
  }
}

/// Configures the environment in which Celest is running.
Future<ContextOverrides> configure({ResolvedProject? config}) async {
  configureLogging();

  final Context rootContext = Context.current;

  if (config == null) {
    final Map<String, Object?>? configJson =
        _loadJsonFromEnv(rootContext) ??
        await _loadJsonFromFileSystem(rootContext);
    if (configJson == null) {
      throw StateError(
        'No project configuration found. Create a celest.json file and set '
        'CELEST_CONFIG with its path or CELEST_CONFIG_JSON with its contents.',
      );
    }

    final configPb = pb.ResolvedProject()..mergeFromProto3Json(configJson);
    config = ResolvedProject.fromProto(configPb);
  }

  Logger.root
    ..config('Loaded project configuration')
    ..config(config);

  final contextOverrides = <ContextKey<Object?>, Object?>{
    ContextKey.project: config,
    ContextKey.environment: Environment(config.environmentId),
    env.environment: config.environmentId,
    ContextKey.googleProjectId: rootContext.googleProjectId ?? config.projectId,
  };
  for (final ResolvedVariable(:name, :value) in config.variables) {
    contextOverrides[env(name)] = value;
  }
  for (final ResolvedSecret(:name, :value) in config.secrets) {
    contextOverrides[secret(name)] = value;
  }
  return contextOverrides;
}

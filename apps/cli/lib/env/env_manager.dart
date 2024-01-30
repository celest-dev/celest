import 'dart:io';

import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/env/env_parser.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_proto/ast.dart' as ast;
import 'package:source_span/source_span.dart';

final class EnvManager {
  EnvManager(String envFile) : _envFile = File(envFile) {
    final (env, spans) = _load();
    _env = env;
    _spans = spans;
  }

  final File _envFile;
  late DateTime _lastModified;
  late Map<String, String> _env;
  late Map<String, FileSpan> _spans;
  final _changes = <String, String>{};

  Map<String, String> get env => _env;
  Iterable<ast.EnvironmentVariable> get envVars => _env.keys.map(
        (name) => ast.EnvironmentVariable(
          name,
          location: _spans[name]!,
        ),
      );

  Iterable<ast.EnvironmentVariable> reload() {
    final (env, spans) = _load();
    _env = env;
    _spans = spans;
    return envVars;
  }

  (Map<String, String> env, Map<String, FileSpan> spans) _load() {
    if (!_envFile.existsSync()) {
      _envFile.createSync(recursive: true);
    }
    _lastModified = _envFile.lastModifiedSync();
    final parser = EnvParser(
      source: _envFile.readAsStringSync(),
      sourceUri: _envFile.uri,
    )..parse();
    return (parser.env, parser.spans);
  }

  String? get(String key) => _changes[key] ?? _env[key];
  void set(String key, String value) => _changes[key] = value;
  void remove(String key) => _env.remove(key);

  void writeChanges(
    ast.Project project, {
    required bool Function(String key, String value) onConflict,
  }) {
    if (_envFile.lastModifiedSync().isAfter(_lastModified)) {
      final (newEnv, _) = _load();
      _changes.forEach((key, value) {
        newEnv.update(
          key,
          (curr) {
            if (_env[key] != curr) {
              if (onConflict(key, curr)) {
                return value;
              }
              return curr;
            }
            return value;
          },
          ifAbsent: () => value,
        );
      });
      _env = newEnv;
    } else {
      _env.addAll(_changes);
    }
    _changes.clear();

    project = project.rebuild(
      (project) => project.envVars.replace(envVars),
    );

    final resourcesDart = CloudCodeGenerator.generateResourcesDart(project);
    File(projectPaths.resourcesDart).writeAsStringSync(resourcesDart);
    File(projectPaths.envFile).writeAsStringSync(
      _env.entries
          .map((e) => '${e.key}=${e.value}')
          .join(Platform.lineTerminator),
    );
  }
}

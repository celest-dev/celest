import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/env/env_parser.dart';
import 'package:celest_cli/src/context.dart';

final class EnvManager {
  EnvManager(String envFile) : _envFile = File(envFile) {
    _env = _load();
  }

  final File _envFile;
  late DateTime _lastModified;
  late Map<String, String> _env;
  final _changes = <String, String>{};

  Map<String, String> get env => _env;

  Map<String, String> _load() {
    if (!_envFile.existsSync()) {
      _envFile.createSync(recursive: true);
    }
    _lastModified = _envFile.lastModifiedSync();
    return EnvParser.parse(
      LineSplitter.split(_envFile.readAsStringSync()),
    );
  }

  String? get(String key) => _changes[key] ?? _env[key];
  void set(String key, String value) => _changes[key] = value;
  void remove(String key) => _env.remove(key);

  void writeChanges(
    ast.Project project, {
    required bool Function(String key, String value) onConflict,
  }) {
    if (_envFile.lastModifiedSync().isAfter(_lastModified)) {
      final newEnv = _load();
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
      (project) => project.envVars.replace(
        _env.keys.map(ast.EnvironmentVariable.new),
      ),
    );

    final resourcesDart = CodeGenerator.generateResourcesDart(project);
    File(projectPaths.resourcesDart).writeAsStringSync(resourcesDart);
    File(projectPaths.envFile).writeAsStringSync(
      _env.entries
          .map((e) => '${e.key}=${e.value}')
          .join(Platform.lineTerminator),
    );
  }
}

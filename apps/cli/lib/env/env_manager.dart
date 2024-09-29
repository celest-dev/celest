import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/env/env_parser.dart';
import 'package:celest_cli/src/context.dart';
import 'package:source_span/source_span.dart';
import 'package:stream_channel/isolate_channel.dart';

typedef _EnvRequest = ({
  int id,
  String? name,
  String? value,
  List<(ast.EnvironmentVariable, String)>? envVars,
});

final class EnvManager {
  EnvManager(this.envFile);

  final String envFile;

  Isolate? _isolate;
  IsolateChannel<_EnvRequest>? _channel;
  StreamSubscription<void>? _listener;
  final _pendingRequests = <int, Completer<_EnvRequest>>{};
  var _closed = false;

  var _currentRequestId = 0;
  (int, Completer<_EnvRequest>) get _nextRequestId {
    final id = _currentRequestId++;
    final completer = Completer<_EnvRequest>.sync();
    _pendingRequests[id] = completer;
    return (id, completer);
  }

  Future<void> spawn() async {
    await _spawn().then((_) {
      _listener = _channel!.stream.listen(
        (response) {
          final completer = _pendingRequests.remove(response.id);
          if (completer == null) {
            throw StateError('Request already completed');
          }
          completer.complete(response);
        },
        onError: (Object e, StackTrace st) {
          close(force: true);
          Error.throwWithStackTrace(e, st);
        },
      );
    });
  }

  Future<void> _spawn() async {
    final port = ReceivePort();
    _channel = IsolateChannel<_EnvRequest>.connectReceive(port);
    _isolate = await Isolate.spawn(
      _handleRequests,
      (port.sendPort, envFile),
      debugName: 'IsolatedEnvManager',
    );
  }

  static Future<void> _handleRequests(
    (SendPort sendPort, String envFile) config,
  ) async {
    final (sendPort, envFile) = config;
    final channel = IsolateChannel<_EnvRequest>.connectSend(sendPort);
    final manager = _IsolatedEnvManager(envFile);
    await for (final (:id, :name, envVars: _, value: _) in channel.stream) {
      final envVars = manager.reload();
      channel.sink.add(
        (
          id: id,
          name: name,
          value: name == null ? null : manager.get(name),
          envVars: envVars,
        ),
      );
    }
  }

  final _cache = <String, String?>{};

  String? cachedValueFor(String key) => _cache[key];

  Future<String?> valueFor(String key) async {
    final resp = await _send(key: key);
    return _cache[key] = resp.value;
  }

  Future<_EnvRequest> _send({
    String? key,
  }) async {
    if (_closed) {
      throw StateError('EnvManager is closed');
    }
    final (id, completer) = _nextRequestId;
    try {
      _channel!.sink.add((id: id, name: key, value: null, envVars: null));
      final response = await completer.future;
      return response;
    } finally {
      _pendingRequests.remove(id);
    }
  }

  Future<List<ast.EnvironmentVariable>> get envVars async {
    final resp = await _send();
    final envVars = resp.envVars!;
    for (final (envVar, value) in envVars) {
      _cache[envVar.envName] = value;
    }
    return envVars.map((it) => it.$1).toList();
  }

  Future<void> close({bool force = false}) async {
    if (_closed) {
      return;
    }
    _closed = true;
    try {
      if (force) {
        for (final pendingRequest in _pendingRequests.values) {
          pendingRequest.completeError(
            StateError('EnvManager closed unexpectedly'),
          );
        }
      } else {
        await Future.wait([
          for (final pendingRequest in _pendingRequests.values)
            pendingRequest.future,
        ]);
      }
    } finally {
      _pendingRequests.clear();
      unawaited(_listener?.cancel());
      _listener = null;
      unawaited(_channel?.sink.close());
      _channel = null;
      _isolate?.kill();
      _isolate = null;
    }
  }
}

final class _IsolatedEnvManager {
  _IsolatedEnvManager(String envFile) : _envFile = File(envFile);

  final File _envFile;
  late DateTime _lastModified;
  late Map<String, String> _env;
  late Map<String, FileSpan> _spans;
  final _changes = <String, String>{};

  Map<String, String> get env => _env;
  List<(ast.EnvironmentVariable, String)> get envVars => _env.entries
      .map(
        (entry) => (
          ast.EnvironmentVariable(
            entry.key,
            location: _spans[entry.key]!,
          ),
          entry.value
        ),
      )
      .toList();

  List<(ast.EnvironmentVariable, String)> reload() {
    final (env, spans) = _load();
    _env = env;
    _spans = spans;
    return envVars;
  }

  (Map<String, String> env, Map<String, FileSpan> spans) _load() {
    if (!_envFile.existsSync()) {
      return const ({}, {});
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

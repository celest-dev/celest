import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/env/env_parser.dart';
import 'package:celest_cli/src/context.dart';
import 'package:logging/logging.dart';
import 'package:source_span/source_span.dart';
import 'package:stream_channel/isolate_channel.dart';

typedef _EnvRequest = ({
  int id,
  String? name,
  String? value,
  List<(ast.EnvironmentVariable, String)>? envVars,
});

typedef EnvironmentID = String;

final class EnvManager {
  late final SingleEnvManager _base = SingleEnvManager(projectPaths.envFile);
  final Map<EnvironmentID, SingleEnvManager> _environments = {};

  static final Logger _logger = Logger('EnvManager');

  Future<EnvLoader> environment(EnvironmentID environment) async {
    if (_environments[environment] case final overlay?) {
      final manager = OverlayEnvManager(_base, overlay);
      return manager.spawn();
    }
    final envFile = projectPaths.envFileFor(environment);
    if (!fileSystem.file(envFile).existsSync()) {
      _logger.fine(
        'Environment file does not exist for "$environment": $envFile',
      );
      return _base.spawn();
    }
    _logger.fine('Using environment file for "$environment": $envFile');
    final envManager = _environments[environment] = SingleEnvManager(envFile);
    final overlay = OverlayEnvManager(_base, envManager);
    return overlay.spawn();
  }
}

abstract class EnvLoader {
  Future<EnvLoader> spawn();
  Future<String?> valueFor(String key);
  Future<Map<String, String>> readAll();
}

final class OverlayEnvManager implements EnvLoader {
  OverlayEnvManager(this._base, this._overlay);

  final SingleEnvManager _base;
  final SingleEnvManager? _overlay;

  @override
  Future<OverlayEnvManager> spawn() async {
    await (_base.spawn(), Future.value(_overlay?.spawn())).wait;
    return this;
  }

  @override
  Future<String?> valueFor(String key) async {
    return await _overlay?.valueFor(key) ?? await _base.valueFor(key);
  }

  @override
  Future<Map<String, String>> readAll() async {
    final (base, overlay) = await (
      _base.readAll(),
      Future.value(_overlay?.readAll()),
    ).wait;
    return {...base, ...overlay};
  }
}

final class SingleEnvManager implements EnvLoader {
  SingleEnvManager(this.envFile);

  final String envFile;

  Isolate? _isolate;
  IsolateChannel<_EnvRequest>? _channel;
  StreamSubscription<void>? _listener;
  final _pendingRequests = <int, Completer<_EnvRequest>>{};
  var _closed = false;
  Future<void>? _spawned;

  var _currentRequestId = 0;
  (int, Completer<_EnvRequest>) get _nextRequestId {
    final id = _currentRequestId++;
    final completer = Completer<_EnvRequest>.sync();
    _pendingRequests[id] = completer;
    return (id, completer);
  }

  @override
  Future<SingleEnvManager> spawn() async {
    _spawned ??= _spawn().then((_) {
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
    await _spawned;
    return this;
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

  @override
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
      _cache[envVar.name] = value;
    }
    return envVars.map((it) => it.$1).toList();
  }

  @override
  Future<Map<String, String>> readAll() async {
    final envVars = await this.envVars;
    final values = await Future.wait([
      for (final envVar in envVars)
        valueFor(envVar.name).then(
          (value) => MapEntry(envVar.name, value!),
        ),
    ]);
    return Map.fromEntries(values);
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
  DateTime? _lastCached;
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
    final lastModified = _envFile.lastModifiedSync();
    if (_lastCached != null && lastModified.isBefore(_lastCached!)) {
      return (_env, _spans);
    }
    _lastCached = _envFile.lastModifiedSync();
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
    if (_lastCached == null ||
        _envFile.lastModifiedSync().isAfter(_lastCached!)) {
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

import 'dart:async';
import 'dart:js_interop';

import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/isolated/isolated_storage_request.dart';
import 'package:web/web.dart' as web;

/// The browser implementation of [IsolatedNativeStorage].
final class IsolatedNativeStoragePlatform implements IsolatedNativeStorage {
  IsolatedNativeStoragePlatform({
    required NativeStorageFactory factory,
    String? namespace,
    this.scope,
  }) : namespace = namespace ?? web.window.location.hostname {
    _spawned = spawn();
  }

  final String? namespace;
  final String? scope;

  late final String _prefix =
      scope == null ? '$namespace/' : '$namespace/$scope/';

  static final _workerEntrypoint = Uri.dataFromString(
    '''
class StorageWorker {
  #storage = new Map;

  handle(event) {
    const { id, command, key, value } = event.data;
    switch (command) {
      case 'clear':
        this.#storage.clear();
        return { id, command };
      case 'delete':
        const current = this.#storage.get(key);
        this.#storage.delete(key);
        return { id, command, key, value: current };
      case 'read':
        return { id, command, key, value: this.#storage.get(key) };
      case 'write':
        this.#storage.set(key, value);
        return { id, command, key, value };
      default:
        return { id, command, error: 'Unknown command' };
    }
  }
}

const worker = new StorageWorker;

self.onmessage = function(event) {
  const response = worker.handle(event);
  self.postMessage(response);
};
self.postMessage('ready');
''',
    mimeType: 'application/javascript',
  ).toString();

  web.Worker? _worker;

  Future<void> spawn() async {
    final ready = Completer<void>();
    try {
      _worker = web.Worker(_workerEntrypoint);
    } on Object {
      ready.completeError(NativeStorageException('Failed to spawn worker'));
      return ready.future;
    }
    _worker!.addEventListener(
      'message',
      Zone.current.bindUnaryCallback((web.MessageEvent event) {
        if (event.data.typeofEquals('string')) {
          final message = (event.data as JSString).toDart;
          if (message == 'ready') {
            ready.complete();
            return;
          }
          ready.completeError(
            NativeStorageException('Worker not ready: $message'),
          );
        }
        if (!ready.isCompleted) {
          ready.completeError(
            StateError('Received message before worker ready'),
          );
          return;
        }
        final message = event.data as JSObject;
        final response = IsolatedStorageRequest.fromMap(
          (message.dartify() as Map).cast(),
        );
        final completer = _pendingRequests.remove(response.id);
        if (completer == null) {
          throw StateError('Request already completed');
        }
        completer.complete(response);
      }).toJS,
    );
    _worker!.addEventListener(
      'messageerror',
      Zone.current.bindUnaryCallback((web.MessageEvent event) {
        final error = StateError(
          'Failed to send/receive message: ${event.data.stringify()}',
        );
        if (ready.isCompleted) {
          throw error;
        }
        ready.completeError(error);
      }).toJS,
      {'once': true}.jsify()!,
    );
    _worker!.addEventListener(
      'error',
      Zone.current.bindUnaryCallback((web.ErrorEvent event) {
        final error = event.error.dartify();
        if (!ready.isCompleted) {
          ready.completeError(
            NativeStorageException('Worker errored before ready: $error'),
          );
          return;
        }
        for (final completer in _pendingRequests.values) {
          completer.completeError(
            NativeStorageException('Worker error: $error'),
          );
        }
        _pendingRequests.clear();
      }).toJS,
      {'once': true}.jsify()!,
    );
    return ready.future;
  }

  var _closed = false;
  Future<void>? _spawned;
  final _pendingRequests = <int, Completer<IsolatedStorageRequest>>{};

  var _currentRequestId = 0;
  (int, Completer<IsolatedStorageRequest>) get _nextRequestId {
    final id = _currentRequestId++;
    final completer = Completer<IsolatedStorageRequest>.sync();
    _pendingRequests[id] = completer;
    return (id, completer);
  }

  Future<String?> _send({
    required IsolatedStorageCommand command,
    String? key,
    String? value,
  }) async {
    if (_closed) {
      throw StateError('Storage is closed');
    }
    await _spawned;
    final (id, completer) = _nextRequestId;
    final request = IsolatedStorageRequest(
      id: id,
      command: command,
      key: '$_prefix$key',
      value: value,
    );
    try {
      _worker!.postMessage(request.toMap().jsify());
      final response = await completer.future;
      return response.unwrap();
    } finally {
      _pendingRequests.remove(id);
    }
  }

  @override
  Future<void> clear() async {
    await _send(command: IsolatedStorageCommand.clear);
  }

  @override
  Future<String?> delete(String key) async {
    return _send(command: IsolatedStorageCommand.delete, key: key);
  }

  @override
  Future<String?> read(String key) async {
    return _send(command: IsolatedStorageCommand.read, key: key);
  }

  @override
  Future<String> write(String key, String value) async {
    final writtenValue = await _send(
      command: IsolatedStorageCommand.write,
      key: key,
      value: value,
    );
    return writtenValue!;
  }

  @override
  Future<void> close({bool force = false}) async {
    if (_closed) {
      return;
    }
    _closed = true;
    try {
      if (force) {
        for (final pendingRequest in _pendingRequests.values) {
          pendingRequest.completeError(StateError('Storage is closed'));
        }
      } else {
        await Future.wait([
          for (final pendingRequest in _pendingRequests.values)
            pendingRequest.future,
        ]);
      }
    } finally {
      _pendingRequests.clear();
      _worker?.terminate();
      _worker = null;
      _spawned?.ignore();
      _spawned = null;
    }
  }
}

@JS('JSON')
extension type _JSON._(JSObject _) {
  external static JSString stringify(JSAny? o);
}

extension on JSAny? {
  String stringify() => _JSON.stringify(this).toDart;
}

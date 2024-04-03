import 'dart:async';
import 'dart:isolate';

import 'package:native_storage/native_storage.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:stream_channel/isolate_channel.dart';

enum IsolatedStorageCommand { read, write, delete, clear }

typedef StorageConfig = ({
  NativeStorageFactory factory,
  String? namespace,
  String? scope,
});

final class IsolatedStorageRequest {
  const IsolatedStorageRequest({
    required this.id,
    required this.command,
    this.key,
    this.value,
    this.error,
  });

  final int id;
  final IsolatedStorageCommand command;
  final String? key;
  final String? value;
  final (NativeStorageException, StackTrace)? error;

  IsolatedStorageRequest result({
    String? value,
    (NativeStorageException, StackTrace)? error,
  }) {
    return IsolatedStorageRequest(
      id: id,
      command: command,
      key: key,
      value: value,
      error: error,
    );
  }

  String? unwrap() {
    if (error case (final error, final stackTrace)) {
      Error.throwWithStackTrace(
        error,
        Chain([stackTrace, Chain.current()].map(Trace.from)),
      );
    }
    return value;
  }
}

typedef IsolatedStorageResponse = String?;

/// The VM implementation of [IsolatedNativeStorage] which uses an [Isolate]
/// to handle storage operations.
final class IsolatedNativeStoragePlatform implements IsolatedNativeStorage {
  IsolatedNativeStoragePlatform({
    required NativeStorageFactory factory,
    String? namespace,
    String? scope,
  }) : _config = (
          factory: factory,
          namespace: namespace,
          scope: scope,
        ) {
    _spawned = spawn().then((_) {
      _listener = _channel!.stream.listen((response) {
        final completer = _pendingRequests.remove(response.id);
        if (completer == null) {
          throw StateError('Request already completed');
        }
        completer.complete(response);
      });
    });
  }

  final StorageConfig _config;
  Isolate? _isolate;
  IsolateChannel<IsolatedStorageRequest>? _channel;
  StreamSubscription<IsolatedStorageRequest>? _listener;
  Future<void>? _spawned;
  final _pendingRequests = <int, Completer<IsolatedStorageRequest>>{};
  var _closed = false;

  Future<void> spawn() async {
    final port = ReceivePort();
    _channel = IsolateChannel<IsolatedStorageRequest>.connectReceive(port);
    _isolate = await Isolate.spawn(
      _handleRequests,
      (port.sendPort, _config),
      debugName: 'IsolatedStoragePlatform',
    );
  }

  var _currentRequestId = 0;
  (int, Completer<IsolatedStorageRequest>) get _nextRequestId {
    final id = _currentRequestId++;
    final completer = Completer<IsolatedStorageRequest>.sync();
    _pendingRequests[id] = completer;
    return (id, completer);
  }

  static Future<void> _handleRequests(
    (SendPort sendPort, StorageConfig config) init,
  ) async {
    final (sendPort, (:factory, :namespace, :scope)) = init;
    final channel =
        IsolateChannel<IsolatedStorageRequest>.connectSend(sendPort);
    final storage = factory(namespace: namespace, scope: scope);
    try {
      await for (final request in channel.stream) {
        channel.sink.add(storage.handle(request));
      }
    } finally {
      storage.close();
    }
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
      key: key,
      value: value,
    );
    try {
      _channel!.sink.add(request);
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
    _pendingRequests.clear();
    unawaited(_listener?.cancel());
    _listener = null;
    _channel?.sink.close();
    _channel = null;
    _isolate?.kill();
    _isolate = null;
  }
}

extension on NativeStorage {
  IsolatedStorageRequest handle(IsolatedStorageRequest request) {
    final IsolatedStorageRequest(
      :command,
      :key,
      :value,
    ) = request;
    try {
      switch (command) {
        case IsolatedStorageCommand.read:
          if (key == null) {
            throw StateError('Missing key');
          }
          final value = read(key);
          return request.result(value: value);
        case IsolatedStorageCommand.write:
          if (key == null) {
            throw StateError('Missing key');
          }
          if (value == null) {
            throw StateError('Missing key');
          }
          final wroteValue = write(key, value);
          return request.result(value: wroteValue);
        case IsolatedStorageCommand.delete:
          if (key == null) {
            throw StateError('Missing key');
          }
          final value = delete(key);
          return request.result(value: value);
        case IsolatedStorageCommand.clear:
          clear();
          return request.result();
      }
    } on Object catch (e, st) {
      final storageException = switch (e) {
        NativeStorageException() => e,
        _ => NativeStorageUnknownException(e.toString()),
      };
      return request.result(error: (storageException, st));
    }
  }
}

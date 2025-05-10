import 'dart:async';

import 'package:celest_cli/src/context.dart';

/// Monitors the local connection to the Internet.
final class ConnectionMonitor {
  /// We use pub.dev to check if an Internet connection is available generally
  /// since this is mostly used to determine if we need to pass `--offline`
  /// to pub commands.
  static final Uri _checkUri = Uri.parse('https://pub.dev/');

  final _connectionStream = StreamController<bool>.broadcast();

  bool _isConnected = true;
  bool get isConnected => _isConnected;
  Stream<bool> get stream => _connectionStream.stream;

  void init() {
    _checkConnection();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_connectionStream.isClosed) {
        timer.cancel();
        return;
      }
      _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    final status = await checkConnection();
    _isConnected = status;
    if (!_connectionStream.isClosed) {
      _connectionStream.add(status);
    }
  }

  Future<bool> checkConnection() async {
    try {
      final result = await httpClient
          .head(_checkUri)
          .timeout(const Duration(seconds: 1));
      return result.statusCode == 200;
    } on Object {
      return false;
    }
  }

  void close() {
    _connectionStream.close();
  }
}

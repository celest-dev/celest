import 'dart:async';
import 'dart:io';

import 'package:celest/src/runtime/serve.dart';

abstract interface class PortFinder {
  const factory PortFinder([int initialPort]) = DefaultPortFinder;

  Future<int> findOpenPort();
}

final class DefaultPortFinder implements PortFinder {
  const DefaultPortFinder([this.initialPort = defaultCelestPort]);

  final int initialPort;

  @override
  Future<int> findOpenPort() async {
    Future<int> findOpenPort() async {
      var port = initialPort;
      while (true) {
        try {
          final socket = await ServerSocket.bind(
            InternetAddress.anyIPv4,
            port,
          );
          await socket.close();
          return port;
        } on SocketException {
          port++;
        }
      }
    }

    return findOpenPort().timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        throw TimeoutException('Could not find an open port.');
      },
    );
  }
}

final class RandomPortFinder implements PortFinder {
  const RandomPortFinder();

  @override
  Future<int> findOpenPort() async {
    final socket = await ServerSocket.bind(
      InternetAddress.anyIPv4,
      0,
    );
    final port = socket.port;
    await socket.close();
    return port;
  }
}

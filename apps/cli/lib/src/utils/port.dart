import 'dart:async';
import 'dart:io';

import 'package:celest/src/runtime/serve.dart';

abstract class PortFinder {
  const PortFinder._();

  const factory PortFinder([int initialPort]) = DefaultPortFinder;

  Future<bool> checkPort(int port) async {
    try {
      final socket = await ServerSocket.bind(
        InternetAddress.anyIPv4,
        port,
      );
      await socket.close();
      return true;
    } on SocketException {
      return false;
    }
  }

  Future<int> findOpenPort();
}

final class DefaultPortFinder extends PortFinder {
  const DefaultPortFinder([this.initialPort = defaultCelestPort]) : super._();

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

final class RandomPortFinder extends PortFinder {
  const RandomPortFinder() : super._();

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

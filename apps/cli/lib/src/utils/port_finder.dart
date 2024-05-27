import 'dart:async';
import 'dart:io';

import 'package:celest/src/runtime/serve.dart';

abstract class PortFinder {
  const PortFinder._();

  const factory PortFinder([int initialPort]) = DefaultPortFinder;

  static const int maxPort = 65535;
  static final List<InternetAddress> _ips = [
    InternetAddress.anyIPv4,
    InternetAddress.loopbackIPv4,
  ];

  static Future<bool> checkPort(int port, [InternetAddress? ip]) async {
    RangeError.checkValueInInterval(port, 0, maxPort, 'port', 'Invalid port');
    try {
      final ips = ip == null ? _ips : [ip];
      for (final ip in ips) {
        final socket = await ServerSocket.bind(
          ip,
          port,
        );
        await socket.close();
      }
      return true;
    } on SocketException {
      return false;
    }
  }

  Future<int> checkOrUpdatePort(int? port, {List<int>? excluding}) async {
    if (port != null && await checkPort(port)) {
      if (excluding == null || !excluding.contains(port)) {
        return port;
      }
    }
    port = await findOpenPort(port);
    if (excluding != null) {
      while (excluding.contains(port)) {
        port = await findOpenPort(port! + 1);
      }
    }
    return port!;
  }

  Future<int> findOpenPort([int? startingPort]);
}

final class DefaultPortFinder extends PortFinder {
  const DefaultPortFinder([this.initialPort = defaultCelestPort])
      : assert(initialPort != 0, 'Use RandomPortFinder instead'),
        assert(
          initialPort > 0 && initialPort <= PortFinder.maxPort,
          'Invalid port. Must be >=0 <=${PortFinder.maxPort}.',
        ),
        super._();

  final int initialPort;

  @override
  Future<int> findOpenPort([int? startingPort]) async {
    Future<int> findOpenPort() async {
      for (var port = startingPort ?? initialPort;
          port <= PortFinder.maxPort;
          port++) {
        if (await PortFinder.checkPort(port)) {
          return port;
        }
      }
      throw StateError(
        'No open ports found in range: >=$initialPort <=${PortFinder.maxPort}.',
      );
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
  Future<int> findOpenPort([int? startingPort]) async {
    if (startingPort != null && await PortFinder.checkPort(startingPort)) {
      return startingPort;
    }
    final socket = await ServerSocket.bind(
      InternetAddress.loopbackIPv4,
      0,
    );
    final port = socket.port;
    await socket.close();
    return port;
  }
}

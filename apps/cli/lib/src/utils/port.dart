import 'dart:async';
import 'dart:io';

import 'package:celest/src/runtime/serve.dart';

Future<int> findOpenPort([int initialPort = defaultCelestPort]) async {
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

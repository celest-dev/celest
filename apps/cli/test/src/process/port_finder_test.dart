import 'dart:io';

import 'package:celest_cli/src/process/port_finder.dart';
import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group('PortFinder', () {
    group('checkPort', () {
      test('valid ports', () async {
        await check(PortFinder.checkPort(0)).completes((it) => it.isTrue());
        await check(
          PortFinder.checkPort(PortFinder.maxPort + 1),
        ).throws((it) => it.isA<RangeError>());
      });

      final ips = [InternetAddress.anyIPv4, InternetAddress.loopbackIPv4];
      for (final ip in ips) {
        test('used port ($ip)', () async {
          final socket = await ServerSocket.bind(ip, 0);
          addTearDown(socket.close);
          await check(
            PortFinder.checkPort(socket.port),
          ).completes((it) => it.isFalse());
        });
      }
    });
  });

  group('RandomPortFinder', () {
    test('checks all interfaces', () async {
      final randomPort = await const RandomPortFinder().findOpenPort();
      await check(
        PortFinder.checkPort(randomPort),
      ).completes((it) => it.isTrue());
    });
  });
}

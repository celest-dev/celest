@TestOn('mac-os')
library;

import 'dart:math';

import 'package:localhost/src/local_host.dart';
import 'package:multicast_dns/multicast_dns.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:test/test.dart';

void main() {
  group('MdnsService', () {
    test('startService', () async {
      final server = await serve(
        (request) async {
          return Response.ok('Hello, world!');
        },
        'localhost',
        8080,
      );
      addTearDown(() => server.close(force: true));

      final localPort = Random().nextInt(10000);
      final projectName = 'test-$localPort';
      final service = LocalHost.create(
        projectName: projectName,
        localPort: localPort,
      )!;
      addTearDown(service.stop);
      await service.start();

      final client = MDnsClient();
      addTearDown(client.stop);
      print('Starting mDNS client');
      await client.start();
      print('Resolving celest.local service');
      final ptr = await client
          .lookup<PtrResourceRecord>(
            ResourceRecordQuery.serverPointer('_celest._tcp.local'),
          )
          .tap(print)
          .firstWhere(
            (ptr) => ptr.domainName == '$projectName._celest._tcp.local',
          );
      print('Resolving SRV');
      final srv = await client
          .lookup<SrvResourceRecord>(
            ResourceRecordQuery.service(ptr.domainName),
          )
          .first;
      print('Found SRV: $srv');
      expect(srv.port, localPort);
      print('Resolving IP');
      final ip = await client
          .lookup<IPAddressResourceRecord>(
            ResourceRecordQuery.addressIPv4(srv.target),
          )
          .first;
      print('Found IP address: $ip');
    });
  });
}

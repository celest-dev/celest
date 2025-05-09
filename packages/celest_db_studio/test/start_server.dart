import 'dart:io';

import 'package:docker_process/docker_process.dart';

Future<DockerProcess> startSqld(int port) async {
  final DockerProcess process = await DockerProcess.start(
    image: 'ghcr.io/tursodatabase/libsql-server:latest',
    name: 'dart-hrana-test-$port',
    readySignal: (line) => line.contains('serving internal rpc server'),
    ports: ['$port:8080'],
  );

  return process;
}

Future<int> selectFreePort() async {
  final ServerSocket socket = await ServerSocket.bind(
    InternetAddress.anyIPv4,
    0,
  );
  final int port = socket.port;
  await socket.close();
  return port;
}

import 'dart:isolate';

import 'package:celest_rpc/protos.dart' as proto;

final class ProjectBuilder {
  ProjectBuilder({
    required this.projectName,
    required this.entrypoint,
    required this.rootDir,
    required this.outputDir,
  });

  final String projectName;
  final Uri entrypoint;
  final String rootDir;
  final String outputDir;

  Future<proto.Project> build() async {
    final receivePort = ReceivePort();
    final errorPort = ReceivePort();
    final isolate = await Isolate.spawnUri(
      entrypoint,
      [
        projectName,
        rootDir,
        outputDir,
        'development',
      ],
      receivePort.sendPort,
      onError: errorPort.sendPort,
      automaticPackageResolution: true,
    );
    try {
      final result = await Future.any([
        receivePort.first,
        errorPort.first.then((error) {
          print('Error: $error');
          if (error != null) {
            throw '${error.runtimeType}: $error';
          }
        }),
      ]);
      if (result is! List<int>) {
        throw StateError('Bad result: $result');
      }
      return proto.Project.fromBuffer(result);
    } finally {
      isolate.kill(priority: Isolate.immediate);
      receivePort.close();
      errorPort.close();
    }
  }
}

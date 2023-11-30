import 'dart:isolate';

import 'package:celest_cli/project/paths.dart';
import 'package:celest_rpc/protos.dart' as proto;
import 'package:path/path.dart' as p;

final class ProjectBuilder {
  ProjectBuilder({
    required this.projectName,
    required this.projectPaths,
  });

  final String projectName;
  final ProjectPaths projectPaths;

  Future<proto.Project> build() async {
    final receivePort = ReceivePort();
    final errorPort = ReceivePort();
    final isolate = await Isolate.spawnUri(
      p.toUri(projectPaths.projectBuildDart),
      [
        projectName,
        projectPaths.projectRoot,
        projectPaths.outputsDir,
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

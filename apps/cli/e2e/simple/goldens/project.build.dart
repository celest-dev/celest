// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:isolate' as _i1;

import 'file:///Users/dillonnys/celest/cloud/apps/cli/e2e/simple/project.dart'
    as _i2;

import 'package:celest/celest.dart' as _i3;

void main(
  List<String> args,
  _i1.SendPort sendPort,
) {
  final project = _i2.HelloProject();
  final context = _i3.ProjectContext(_i3.BuildEnvironment.fromArgs(args));
// ignore: invalid_use_of_internal_member
  final resources = context.build(project);
  sendPort.send(resources.writeToBuffer());
}

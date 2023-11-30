// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:isolate' as _i1;

import 'package:celest/celest.dart' as _i2;

import '../project.dart' as _i3;

void main(
  List<String> args,
  _i1.SendPort sendPort,
) {
  final context = _i2.ProjectContext(_i2.BuildEnvironment.fromArgs(args));
// ignore: invalid_use_of_internal_member
  final resources = context.build(_i3.define);
  sendPort.send(resources.writeToBuffer());
}

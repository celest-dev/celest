// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:isolate' as _i1;

import 'package:celest/celest.dart' as _i2;
import 'package:celest/src/core/project_context.dart' as _i3;

import '../project.dart' as _i5;
import '../resources.dart' as _i4;

void main(
  List<String> args,
  _i1.SendPort sendPort,
) {
  final context = _i2.ProjectContext(
    _i2.BuildEnvironment.fromArgs(args),
  );
// ignore: invalid_use_of_internal_member
  final project = _i3.runWithContext(context, () {
    final widgets = _i4.all.map((widget) => widget.toProto());
    return _i5.project.toProto()..widgets.addAll(widgets);
  });
  sendPort.send(project.writeToBuffer());
}

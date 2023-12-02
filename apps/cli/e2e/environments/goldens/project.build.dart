// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:isolate' as _i1;

import 'package:celest/celest.dart' as _i2;

import '../project.dart' as _i3;
import '../resources.dart' as _i4;

void main(
  List<String> args,
  _i1.SendPort sendPort,
) {
  final context = _i2.ProjectContext(
    _i2.BuildEnvironment.fromArgs(args),
  );
// ignore: invalid_use_of_internal_member
  final project = context.build(_i3.define);
  final widgets = _i2.CloudWidgetSet()
    ..addAll(project.widgets)
    ..addAll(
      _i4.resources
          .forEnvironment(context.environment)
          .map((widget) => widget.toProto()),
    );
  project.widgets
    ..clear()
    ..addAll(widgets);
  sendPort.send(project.writeToBuffer());
}

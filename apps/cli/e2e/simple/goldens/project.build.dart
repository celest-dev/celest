// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:isolate' as _i1;

import 'package:celest/celest.dart' as _i2;

import '../resources.dart' as _i3;

void main(
  List<String> args,
  _i1.SendPort sendPort,
) {
  final context = _i2.ProjectContext(
    _i2.BuildEnvironment.fromArgs(args),
  );
  final widgets = _i2.CloudWidgetSet();
// ignore: invalid_use_of_internal_member
  final project = context.build((context) {
    widgets.addAll(_i3.all.map((widget) => widget.toProto()));
  });
  widgets.addAll(project.widgets);
  project.widgets
    ..clear()
    ..addAll(widgets);
  sendPort.send(project.writeToBuffer());
}

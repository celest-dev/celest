// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i5;

import 'package:celest/celest.dart' as _i1;
import 'package:celest/src/core/project_context.dart' as _i2;

import '../project.dart' as _i4;
import '../resources.dart' as _i3;

void main(List<String> args) {
  final context = _i1.ProjectContext(
    _i1.BuildEnvironment.fromArgs(args),
  );
// ignore: invalid_use_of_internal_member
  final project = _i2.runWithContext(context, () {
    final widgets = _i3.all.map((widget) => widget.toProto());
    return _i4.project.toProto()..widgets.addAll(widgets);
  });
  _i5.stdout.add(project.writeToBuffer());
  _i5.stdout.flush();
}

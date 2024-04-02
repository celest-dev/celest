import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:platform_storage/src/util/functional.dart';
import 'package:windows_applicationmodel/windows_applicationmodel.dart';

final windows = WindowsCommon._();

final class WindowsCommon {
  WindowsCommon._();

  late final String? applicationId = lazy(() {
    final exeName = p.basenameWithoutExtension(Platform.resolvedExecutable);
    try {
      return Package.current?.id?.fullName ?? exeName;
    } on Object {
      return exeName;
    }
  });
}

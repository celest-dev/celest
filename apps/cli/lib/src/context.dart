import 'package:celest_cli/project/project_paths.dart';
// ignore: library_prefixes
import 'package:os_detect/os_detect.dart' as Platform;
import 'package:path/path.dart' as path;

path.Context get p {
  if (Platform.isLinux || Platform.isMacOS) {
    return path.posix;
  }
  if (Platform.isWindows) {
    return path.windows;
  }
  throw UnimplementedError();
}

ProjectPaths init({
  required String projectRoot,
  String? outputsDir,
}) {
  return projectPaths = ProjectPaths(
    projectRoot,
    outputsDir: outputsDir,
  );
}

late ProjectPaths projectPaths;

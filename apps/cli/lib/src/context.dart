import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/type_helper.dart';
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
  String? clientOutputsDir,
}) {
  return projectPaths = ProjectPaths(
    projectRoot,
    outputsDir: outputsDir,
    clientOutputsDir: clientOutputsDir,
  );
}

late ProjectPaths projectPaths;
final TypeHelper typeHelper = TypeHelper();
final JsonGenerator jsonGenerator = JsonGenerator();

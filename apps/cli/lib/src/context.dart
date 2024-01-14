import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:path/path.dart' as path;

path.Context get p => fileSystem.path;

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

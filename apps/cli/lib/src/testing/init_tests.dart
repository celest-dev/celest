import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:http/http.dart' as http;
import 'package:process/process.dart';

void initTests({
  FileSystem? fileSystem,
  http.Client? httpClient,
  ProcessManager? processManager,
}) {
  Cli.configure(
    verbose: true,
    fileSystem: fileSystem,
    httpClient: httpClient,
    processManager: processManager,
    storage: MemoryStorage(),
  );
}

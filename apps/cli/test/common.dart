import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:platform/platform.dart';
import 'package:process/process.dart';

Future<void> initTests({
  FileSystem? fileSystem,
  http.Client? httpClient,
  Platform? platform,
  ProcessManager? processManager,
}) async {
  if (kCelestTest) {
    return;
  }
  kCelestTest = true;
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('[${record.loggerName}] ${record.level.name}: ${record.message}');
    if (record.error != null) {
      print(record.error);
    }
    if (record.stackTrace != null) {
      print(record.stackTrace);
    }
  });
  await Cli.configure(
    verbose: true,
    fileSystem: fileSystem,
    platform: platform,
    httpClient: httpClient,
    processManager: processManager,
    storage: Storage.memory(),
  );
}

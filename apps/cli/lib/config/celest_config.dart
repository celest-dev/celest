import 'package:celest_cli/config/find_application_home.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';

final class CelestConfig {
  CelestConfig._(this.configDir);

  static CelestConfig get instance => _load();

  static CelestConfig _load() {
    final configHome = fileSystem.directory(
      applicationConfigHome('Celest'),
    );
    if (!configHome.existsSync()) {
      configHome.createSync(recursive: true);
    }
    return CelestConfig._(configHome);
  }

  final Directory configDir;
}

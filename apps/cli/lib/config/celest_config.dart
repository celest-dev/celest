import 'package:cli_util/cli_util.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';

final class CelestConfig {
  CelestConfig._(this.configDir);

  static final instance = _load();

  static CelestConfig _load({
    FileSystem fileSystem = const LocalFileSystem(),
  }) {
    final configHome = fileSystem.directory(
      applicationConfigHome('celest'),
    );
    if (!configHome.existsSync()) {
      configHome.createSync(
        recursive: false, // TODO: true?
      );
    }
    return CelestConfig._(configHome);
  }

  final Directory configDir;
}

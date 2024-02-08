import 'package:celest_cli/config/find_application_home.dart';
import 'package:celest_cli/src/jsettings/jsettings.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';

final class CelestConfig {
  CelestConfig._(
    this.configDir, {
    required this.settings,
  });

  static Future<CelestConfig> load() async {
    final configHome = fileSystem.directory(
      applicationConfigHome('Celest'),
    );
    if (!await configHome.exists()) {
      await configHome.create(recursive: true);
    }
    final settings = JSettings(configHome.childFile('config.json').path);
    await settings.init();
    return CelestConfig._(
      configHome,
      settings: CelestConfigValues(settings),
    );
  }

  final Directory configDir;
  final CelestConfigValues settings;

  @override
  String toString() => 'CelestConfig: $configDir';
}

extension type CelestConfigValues(JSettings settings) {
  Future<String?> getOrganizationId() async {
    return settings.getString('organization_id');
  }

  Future<void> setOrganizationId(String? value) async {
    return settings.setValue('organization_id', value);
  }
}

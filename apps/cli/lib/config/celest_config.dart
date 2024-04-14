import 'dart:convert';

import 'package:celest_cli/config/find_application_home.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_core/_internal.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';

final class CelestConfig {
  CelestConfig._(
    this.configDir, {
    required this.settings,
  });

  static final Logger logger = Logger('CelestConfig');

  static Future<CelestConfig> load({
    Directory? configHome,
  }) async {
    configHome ??= fileSystem.directory(
      applicationConfigHome('Celest'),
    );
    logger.finest('Loading configuration from $configHome');
    if (!await configHome.exists()) {
      await configHome.create(recursive: true);
    }

    final settings = CelestConfigValues(storage.isolated);
    // Migrate the old config JSON to local storage if it exists.
    final configJson = configHome.childFile('config.json');
    if (await configJson.exists()) {
      logger.finest('Migrating configuration to local storage');
      final config =
          jsonDecode(await configJson.readAsString()) as Map<String, Object?>;
      await Future.wait(
        config.entries.map(
          (entry) => settings.write(entry.key, entry.value.toString()),
        ),
      );
      await configJson.delete();
      logger.finest('Successfully migrated configuration to local storage');
    } else {
      logger.finest('Configuration already migrated to local storage');
    }
    return CelestConfig._(
      configHome,
      settings: settings,
    );
  }

  final Directory configDir;
  final CelestConfigValues settings;

  @override
  String toString() => 'CelestConfig: $configDir';
}

extension type CelestConfigValues(IsolatedNativeStorage settings)
    implements IsolatedNativeStorage {
  Future<String?> getOrganizationId() async {
    return settings.read('organization_id');
  }

  Future<void> setOrganizationId(String? value) async {
    if (value == null) {
      await settings.delete('organization_id');
    } else {
      await settings.write('organization_id', value);
    }
  }
}

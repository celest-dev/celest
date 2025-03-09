import 'dart:convert';

import 'package:celest_cli/config/find_application_home.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:native_storage/native_storage.dart';

final class CelestConfig {
  CelestConfig._(this.configDir);

  static final Logger logger = Logger('CelestConfig');

  static Future<CelestConfig> load({Directory? configHome}) async {
    configHome ??= fileSystem.directory(applicationConfigHome('Celest'));
    logger.finest('Loading configuration from $configHome');
    if (!await configHome.exists()) {
      await configHome.create(recursive: true);
    }

    // Migrate the old config JSON to local storage if it exists.
    final configJson = configHome.childFile('config.json');
    if (configJson.existsSync()) {
      logger.finest('Migrating configuration to local storage');
      final config =
          jsonDecode(await configJson.readAsString()) as Map<String, Object?>;
      await Future.wait(
        config.entries.map(
          (entry) => _settings.write(entry.key, entry.value.toString()),
        ),
      );
      await configJson.delete();
      logger.finest('Successfully migrated configuration to local storage');
    } else {
      logger.finest('Configuration already migrated to local storage');
    }
    return CelestConfig._(configHome);
  }

  static CelestConfigValues get _settings =>
      CelestConfigValues(storage.isolated);
  final Directory configDir;
  CelestConfigValues get settings => _settings;

  Future<void> delete() async {
    await _settings.clear();
    if (await configDir.exists()) {
      logger.fine('Removing Celest config dir: $configDir');
      await configDir.delete(recursive: true);
    }
  }

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

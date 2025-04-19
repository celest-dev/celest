import 'package:celest_cli/src/config/find_application_home.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:native_storage/native_storage.dart';

final class CelestConfig {
  CelestConfig._(this.configDir);

  factory CelestConfig({Directory? configHome}) {
    configHome ??= fileSystem.directory(applicationConfigHome('Celest'));
    if (!configHome.existsSync()) {
      configHome.createSync(recursive: true);
    }
    return CelestConfig._(configHome);
  }

  static final Logger logger = Logger('CelestConfig');

  final Directory configDir;

  CelestSettings get settings => CelestSettings(storage);
  CelestSecureSettings get secureSettings =>
      CelestSecureSettings(storage.isolated);

  Future<void> delete() async {
    settings.clear();
    await secureSettings.clear();
    if (configDir.existsSync()) {
      logger.fine('Removing Celest config dir: $configDir');
      await configDir.delete(recursive: true);
    }
  }

  @override
  String toString() => 'CelestConfig: $configDir';
}

extension type CelestSecureSettings(IsolatedNativeStorage settings)
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

extension type CelestSettings(NativeStorage settings) implements NativeStorage {
  String? get pubCacheFixDigest {
    return settings.read('pub_cache_fix_digest');
  }

  set pubCacheFixDigest(String? value) {
    if (value == null) {
      settings.delete('pub_cache_fix_digest');
    } else {
      settings.write('pub_cache_fix_digest', value);
    }
  }
}

import 'package:platform_storage/src/local/local_storage_platform.vm.dart';
import 'package:platform_storage/src/native/windows/windows.dart';
import 'package:platform_storage/src/util/functional.dart';
import 'package:win32_registry/win32_registry.dart';

final class LocalStoragePlatformWindows extends LocalStoragePlatform {
  LocalStoragePlatformWindows({
    String? namespace,
    super.scope,
  }) : super.base();

  @override
  late final String namespace = lazy(() {
    if (windows.applicationInfo case (:final companyName, :final productName)) {
      return '$companyName\\$productName';
    }
    return windows.applicationId;
  });

  late final _registry = lazy(() {
    final hkcu = Registry.currentUser;
    final rootKey = hkcu
        .createKey('SOFTWARE\\Classes\\Local Settings\\Software\\$namespace');
    if (scope case final scope?) {
      return rootKey.createKey(scope);
    }
    return rootKey;
  });

  @override
  String? delete(String key) {
    final stored = read(key);
    _registry.deleteValue(key);
    return stored;
  }

  @override
  String? read(String key) => _registry.getValueAsString(key);

  @override
  String write(String key, String value) {
    _registry.createValue(RegistryValue(key, RegistryValueType.string, value));
    return value;
  }

  @override
  void clear() {
    for (final value in _registry.values) {
      _registry.deleteValue(value.name);
    }
    for (final subkey in _registry.subkeyNames) {
      _registry.deleteKey(subkey, recursive: true);
    }
  }

  @override
  void close() {
    _registry.close();
    super.close();
  }
}

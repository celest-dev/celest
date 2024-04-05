import 'package:native_storage/src/local/local_storage_platform.vm.dart';
import 'package:native_storage/src/native/windows/windows.dart';
import 'package:native_storage/src/util/functional.dart';
import 'package:win32_registry/win32_registry.dart';

final class LocalStorageWindows extends NativeLocalStoragePlatform {
  LocalStorageWindows({
    String? namespace,
    super.scope,
  })  : _namespace = namespace,
        super.base();

  final String? _namespace;

  @override
  late final String namespace = lazy(() {
    if (_namespace != null) {
      return _namespace;
    }
    if (windows.applicationInfo case (:final companyName, :final productName)) {
      return '$companyName\\$productName';
    }
    return windows.applicationId;
  });

  late final _registry = lazy(() {
    final hkcu = Registry.currentUser;
    var key = hkcu
        .createKey('SOFTWARE\\Classes\\Local Settings\\Software\\$namespace');
    if (scope case final scope?) {
      for (final path in scope.split('/')) {
        key = key.createKey(path);
      }
    }
    return key;
  });

  @override
  String? delete(String key) {
    final current = read(key);
    if (current == null) {
      return null;
    }
    _registry.deleteValue(key);
    return current;
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
    for (final value in List.of(_registry.values)) {
      _registry.deleteValue(value.name);
    }
    for (final subkey in List.of(_registry.subkeyNames)) {
      _registry.deleteKey(subkey, recursive: true);
    }
  }

  @override
  void close() {
    _registry.close();
    super.close();
  }
}

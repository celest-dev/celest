import 'package:native_storage/src/local/local_storage_platform.vm.dart';
import 'package:native_storage/src/native/windows/windows.dart';
import 'package:win32_registry/win32_registry.dart';

final class LocalStorageWindows extends NativeLocalStoragePlatform
    with NativeStorageWindows {
  LocalStorageWindows({
    String? namespace,
    super.scope,
  })  : namespaceOverride = namespace,
        super.base();

  @override
  final String? namespaceOverride;

  @override
  String? read(String key) => registry.getValueAsString(key);

  @override
  String write(String key, String value) {
    registry.createValue(RegistryValue(key, RegistryValueType.string, value));
    return value;
  }
}

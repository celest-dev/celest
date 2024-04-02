import 'package:platform_storage/src/local/local_storage_platform.vm.dart';
import 'package:platform_storage/src/native/windows/windows.dart';
import 'package:windows_storage/windows_storage.dart';

final class LocalStoragePlatformWindows extends LocalStoragePlatform {
  LocalStoragePlatformWindows({
    String? namespace,
    super.scope,
  }) : super.base();

  @override
  String get namespace => windows.applicationId ?? '';

  final _settings = ApplicationData.current!.localSettings!;
  late final _container = scope == null
      ? _settings
      : _settings.createContainer(
          scope!,
          ApplicationDataCreateDisposition.always,
        )!;

  @override
  String? delete(String key) {
    final stored = read(key);
    _container.values!.remove(key);
    return stored;
  }

  @override
  String? read(String key) => _container.values!.lookup(key) as String?;

  @override
  String write(String key, String value) {
    _container.values!.insert(key, value);
    return value;
  }

  @override
  void clear() {
    for (final key in _container.values!.getView().keys) {
      _container.values!.remove(key);
    }
    if (scope case final scope?) {
      _settings.deleteContainer(scope);
    }
  }

  @override
  void close() {
    _container.close();
    _settings.close();
    super.close();
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:platform_storage/src/native/windows/windows_paths.dart';
import 'package:platform_storage/src/secure/secure_storage_platform.vm.dart';

final class SecureStoragePlatformWindows extends SecureStoragePlatform {
  SecureStoragePlatformWindows({
    required super.namespace,
    super.scope,
  }) : super.base();

  late final String _storagePath = p.joinAll([
    // The RoamingAppData folder
    PathProviderWindows.getApplicationSupportPath()!,
    if (scope != null) ...[namespace, '$scope.json'] else '$namespace.json',
  ]);
  late final File _storage = File(_storagePath);

  Map<String, String> _readData() {
    if (!_storage.existsSync()) {
      return {};
    }
    return (jsonDecode(_storage.readAsStringSync()) as Map).cast();
  }

  void _writeData(Map<String, String> data) {
    if (!_storage.existsSync()) {
      _storage.createSync(recursive: true);
    }
    _storage.writeAsStringSync(jsonEncode(data));
  }

  @override
  void clear() {
    if (_storage.existsSync()) {
      _storage.deleteSync();
    }
  }

  @override
  String? delete(String key) {
    final data = _readData();
    final value = data.remove(key);
    _writeData(data);
    return value;
  }

  @override
  String? read(String key) => _readData()[key];

  @override
  String write(String key, String value) {
    final data = _readData()..[key] = value;
    _writeData(data);
    return value;
  }
}

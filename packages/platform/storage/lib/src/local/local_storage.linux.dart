import 'dart:convert';
import 'dart:io';

import 'package:native_storage/src/local/local_storage_platform.vm.dart';
import 'package:native_storage/src/native/linux/linux.dart';
import 'package:path/path.dart' as p;

final class LocalStorageLinux extends NativeLocalStoragePlatform {
  LocalStorageLinux({
    String? namespace,
    super.scope,
  }) : super.base();

  late final String _storagePath = p.joinAll([
    linux.userConfigHome,
    if (scope != null) ...[namespace, '$scope.json'] else '$namespace.json',
  ]);

  @override
  String get namespace => linux.applicationId;

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

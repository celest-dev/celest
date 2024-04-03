import 'dart:convert';
import 'dart:io';

import 'package:native_synchronization/primitives.dart';
import 'package:path/path.dart' as p;
import 'package:platform_storage/src/local/local_storage_platform.vm.dart';
import 'package:platform_storage/src/native/linux/linux.dart';

final class LocalStoragePlatformLinux extends LocalStoragePlatform {
  LocalStoragePlatformLinux({
    String? namespace,
    super.scope,
  }) : super.base();

  late final String _storagePath = p.joinAll([
    linux.userConfigHome,
    if (scope != null) '$namespace.$scope.json' else '$namespace.json',
  ]);

  @override
  String get namespace => linux.applicationId;

  /// Protects [_storage] from concurrent access and ensures API transactionality.
  final Mutex _mutex = Mutex();
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
  void clear() => _mutex.runLocked(() {
        if (_storage.existsSync()) {
          _storage.deleteSync();
        }
      });

  @override
  String? delete(String key) => _mutex.runLocked(() {
        final data = _readData();
        final value = data.remove(key);
        _writeData(data);
        return value;
      });

  @override
  String? read(String key) => _mutex.runLocked(() => _readData()[key]);

  @override
  String write(String key, String value) => _mutex.runLocked(() {
        final data = _readData()..[key] = value;
        _writeData(data);
        return value;
      });
}

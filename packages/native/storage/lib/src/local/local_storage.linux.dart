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
    '$namespace.json',
  ]);

  @override
  String get namespace => linux.applicationId;

  late final String _prefix = scope == null ? '' : '$scope/';

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
    final updated = _readData()
      ..removeWhere((key, _) => key.startsWith(_prefix));
    _writeData(updated);
  }

  @override
  String? delete(String key) {
    final data = _readData();
    final value = data.remove('$_prefix$key');
    _writeData(data);
    return value;
  }

  @override
  String? read(String key) => _readData()['$_prefix$key'];

  @override
  String write(String key, String value) {
    final data = _readData();
    data['$_prefix$key'] = value;
    _writeData(data);
    return value;
  }

  @override
  List<String> get allKeys => [
        for (final key in _readData().keys)
          if (key.startsWith(_prefix)) key.substring(_prefix.length),
      ];
}

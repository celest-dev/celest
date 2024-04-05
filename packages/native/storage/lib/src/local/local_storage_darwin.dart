import 'dart:io';

import 'package:native_storage/src/local/local_storage_platform.vm.dart';
import 'package:native_storage/src/native/darwin/darwin.dart';
import 'package:native_storage/src/native/darwin/foundation.ffi.dart';
import 'package:native_storage/src/util/functional.dart';
import 'package:path/path.dart' as p;

final class LocalStoragePlatformDarwin extends NativeLocalStoragePlatform {
  LocalStoragePlatformDarwin({
    String? namespace,
    super.scope,
  })  : _namespace = namespace,
        super.base();

  final String? _namespace;

  @override
  late final String namespace = lazy(() {
    return _namespace ??
        darwin.bundleIdentifier ??
        p.basenameWithoutExtension(Platform.resolvedExecutable);
  });

  late final NSUserDefaults _userDefaults = darwin.userDefaults(namespace);
  late final String _prefix = scope == null ? '' : '$scope/';

  @override
  String? read(String key) {
    return _userDefaults
        .stringForKey_(darwin.nsString('$_prefix$key'))
        ?.toString();
  }

  @override
  String write(String key, String value) {
    _userDefaults.setObject_forKey_(
      darwin.nsString(value),
      darwin.nsString('$_prefix$key'),
    );
    return value;
  }

  @override
  String? delete(String key) {
    final existing = read('$_prefix$key');
    _userDefaults.removeObjectForKey_(darwin.nsString('$_prefix$key'));
    return existing;
  }

  @override
  void clear() {
    final allValues = _userDefaults.dictionaryRepresentation();
    final allKeys = allValues.allKeys;
    for (var i = 0; i < allKeys.count; i++) {
      final key = NSString.castFrom(allKeys.objectAtIndex_(i));
      if (scope == null || key.toString().startsWith(_prefix)) {
        _userDefaults.removeObjectForKey_(key);
      }
    }
  }
}

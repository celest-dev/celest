import 'dart:ffi';

import 'package:platform_storage/src/local/local_storage_platform.vm.dart';
import 'package:platform_storage/src/native/darwin/foundation.ffi.dart';

final class LocalStoragePlatformDarwin extends LocalStoragePlatform {
  LocalStoragePlatformDarwin({
    required super.namespace,
    super.scope,
  }) : super.base();

  final _lib = Foundation(DynamicLibrary.process());
  late final _bundleIdentifier = NSBundle.getMainBundle(_lib).bundleIdentifier;

  /// The search path for the user defaults database.
  ///
  /// On iOS/macOS, the default [namespace] is the bundle identifier of the app.
  /// If [scope] is provided, the namespace is the concatenation of the bundle
  /// identifier and the scope, which creates a new domain for the user defaults
  /// which can be shared between apps.
  ///
  /// See the discussion here: https://developer.apple.com/documentation/foundation/nsuserdefaults/1409957-initwithsuitename#discussion
  late final _suiteName = () {
    final String domain = scope == null ? namespace : '$namespace.$scope';
    if (_bundleIdentifier != null && domain == _bundleIdentifier.toString()) {
      return null;
    }
    return domain;
  }();
  late final _userDefaults = NSUserDefaults.alloc(_lib)
      .initWithSuiteName_(_suiteName?.toNSString(_lib))!;

  @override
  String? read(String key) {
    return _userDefaults.stringForKey_(key.toNSString(_lib))?.toString();
  }

  @override
  String write(String key, String value) {
    _userDefaults.setObject_forKey_(
      value.toNSString(_lib),
      key.toNSString(_lib),
    );
    return value;
  }

  @override
  String? delete(String key) {
    final existing = read(key);
    _userDefaults.removeObjectForKey_(key.toNSString(_lib));
    return existing;
  }

  @override
  void clear() {
    final allValues = _userDefaults.persistentDomainForName_(
      _suiteName?.toNSString(_lib) ?? _bundleIdentifier!,
    );
    if (allValues == null) {
      return;
    }
    for (var i = 0; i < allValues.allKeys.count; i++) {
      final key = allValues.allKeys.objectAtIndex_(i);
      _userDefaults.removeObjectForKey_(NSString.castFrom(key));
    }
  }
}

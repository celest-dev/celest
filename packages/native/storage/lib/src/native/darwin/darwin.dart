import 'dart:ffi';
import 'dart:io';

import 'package:native_storage/src/native/darwin/foundation.ffi.dart';
import 'package:native_storage/src/util/globals.dart';

final darwin = DarwinCommon._();

final class DarwinCommon {
  DarwinCommon._();

  bool get useDataProtection => Platform.isMacOS && kReleaseMode;

  late final _lib = Foundation(DynamicLibrary.process());
  late final String? bundleIdentifier =
      NSBundle.getMainBundle(_lib).bundleIdentifier?.toString();
  NSUserDefaults userDefaults(String namespace) =>
      NSUserDefaults.alloc(_lib).initWithSuiteName_(switch (namespace) {
        _ when namespace == bundleIdentifier => null,
        _ => namespace.toNSString(_lib),
      })!;

  NSString nsString(String value) => value.toNSString(_lib);
}

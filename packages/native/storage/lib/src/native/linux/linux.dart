import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:native_storage/src/native/linux/glib.ffi.dart';
import 'package:native_storage/src/native/linux/libsecret.ffi.dart';
import 'package:native_storage/src/util/functional.dart';
import 'package:native_storage/src/util/native.dart';
import 'package:xdg_directories/xdg_directories.dart' as xdg;

final linux = LinuxCommon._();

final class LinuxCommon {
  LinuxCommon._();

  late final Glib glib = Glib(_glibDylib);
  late final DynamicLibrary _glibDylib =
      DynamicLibrary.open('libglib-2.0.so.0');
  late final gStrHashPointer =
      _glibDylib.lookup<NativeFunction<UnsignedInt Function(Pointer<Void>)>>(
          'g_str_hash');

  late final Glib gio = Glib(DynamicLibrary.open('libgio-2.0.so.0'));

  late final Libsecret libSecret =
      Libsecret(DynamicLibrary.open('libsecret-1.so.0'));

  late final String applicationId = lazy(() {
    final exeName = File('/proc/self/exe').resolveSymbolicLinksSync();
    try {
      final application = gio.g_application_get_default();
      if (application == nullptr) {
        return exeName;
      }
      return gio.g_application_get_application_id(application).toDartString();
    } on Object {
      return exeName;
    }
  });

  late final String userConfigHome = lazy(() {
    if (tryOpenDylib('libglib-2.0.so.0') != null) {
      final userConfigHome = glib.g_get_user_config_dir();
      if (userConfigHome != nullptr) {
        return userConfigHome.toDartString();
      }
    }
    return xdg.configHome.path;
  });
}

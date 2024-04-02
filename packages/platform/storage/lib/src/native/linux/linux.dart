import 'dart:ffi';

import 'package:platform_storage/src/native/linux/glib.ffi.dart';
import 'package:platform_storage/src/native/linux/libsecret.ffi.dart';

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
}

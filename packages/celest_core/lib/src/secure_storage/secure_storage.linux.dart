import 'dart:ffi';
import 'dart:io';

import 'package:celest_core/src/native/linux/glib.ffi.dart';
import 'package:celest_core/src/native/linux/libsecret.ffi.dart';
import 'package:celest_core/src/secure_storage/secure_storage_exception.dart';
import 'package:celest_core/src/secure_storage/secure_storage_platform.vm.dart';
import 'package:ffi/ffi.dart';

final class SecureStoragePlatformLinux extends SecureStoragePlatform {
  SecureStoragePlatformLinux({
    required this.scope,
  }) : super.base();

  final String scope;

  final _glibDylib = DynamicLibrary.open('libglib-2.0.so.0');
  late final _glib = Glib(_glibDylib);

  final _gioDylib = DynamicLibrary.open('libgio-2.0.so');
  late final _gio = Glib(_gioDylib);

  final _libSecretDylib = DynamicLibrary.open('libsecret-1.so.0');
  late final _libSecret = Libsecret(_libSecretDylib);

  late final _gStrHashPointer =
      _glibDylib.lookup<NativeFunction<UnsignedInt Function(Pointer<Void>)>>(
          'g_str_hash');

  late final String _appName = () {
    final application = _gio.g_application_get_default();
    if (application == nullptr) {
      return File('/proc/self/exe').resolveSymbolicLinksSync();
    }
    return _gio
        .g_application_get_application_id(application)
        .cast<Utf8>()
        .toDartString();
  }();

  String _labelFor(String key) => '$scope/$key';
  Pointer<SecretSchema> _schemaFor(Arena arena) => arena<SecretSchema>()
    ..ref.name = _appName.toNativeUtf8(allocator: arena)
    ..ref.flags = SecretSchemaFlags.SECRET_SCHEMA_NONE
    ..ref.attributes[0].name = 'key'.toNativeUtf8(allocator: arena)
    ..ref.attributes[0].type =
        SecretSchemaAttributeType.SECRET_SCHEMA_ATTRIBUTE_STRING;

  Pointer<GHashTable> _attributes({
    String? key,
    required Arena arena,
  }) {
    final hashTable = _glib.g_hash_table_new(_gStrHashPointer, nullptr);
    if (key != null) {
      _glib.g_hash_table_insert(
        hashTable,
        'key'.toNativeUtf8(allocator: arena).cast(),
        key.toNativeUtf8(allocator: arena).cast(),
      );
    }
    arena.onReleaseAll(() => _glib.g_hash_table_destroy(hashTable));
    return hashTable;
  }

  @override
  void clear() => using((arena) {
        final schema = _schemaFor(arena);
        final attributes = _attributes(arena: arena);
        final err = arena<Pointer<GError>>();
        _libSecret.secret_password_clearv_sync(
          schema,
          attributes,
          nullptr,
          nullptr,
        );
        final error = err.value;
        if (error != nullptr) {
          arena.onReleaseAll(() => _glib.g_error_free(error));
          final message = error.ref.message.cast<Utf8>().toDartString();
          throw SecureStorageUnknownException(message);
        }
      });

  @override
  String? delete(String key) => using((arena) {
        final secret = read(key);
        final schema = _schemaFor(arena);
        final attributes = _attributes(key: key, arena: arena);
        final err = arena<Pointer<GError>>();
        _libSecret.secret_password_clearv_sync(
          schema,
          attributes,
          nullptr,
          nullptr,
        );
        final error = err.value;
        if (error != nullptr) {
          arena.onReleaseAll(() => _glib.g_error_free(error));
          final message = error.ref.message.cast<Utf8>().toDartString();
          throw SecureStorageUnknownException(message);
        }
        return secret;
      });

  @override
  String? read(String key) => using((arena) {
        final attributes = _attributes(key: key, arena: arena);
        final schema = _schemaFor(arena);
        final err = arena<Pointer<GError>>();
        final result = _libSecret.secret_password_lookupv_sync(
          schema,
          attributes,
          nullptr,
          err,
        );
        final error = err.value;
        if (error != nullptr) {
          arena.onReleaseAll(() => _glib.g_error_free(error));
          final message = error.ref.message.cast<Utf8>().toDartString();
          throw SecureStorageUnknownException(message);
        }
        if (result == nullptr) {
          return null;
        }
        arena.onReleaseAll(() => _libSecret.secret_password_free(result));
        return result.toDartString();
      });

  @override
  String write(String key, String value) {
    using((arena) {
      final label = _labelFor(key).toNativeUtf8(allocator: arena);
      final secret = value.toNativeUtf8(allocator: arena);
      final attributes = _attributes(key: key, arena: arena);
      final err = arena<Pointer<GError>>();
      _libSecret.secret_password_storev_sync(
        _schemaFor(arena),
        attributes,
        nullptr,
        label,
        secret,
        nullptr,
        err,
      );
      final error = err.value;
      if (error != nullptr) {
        arena.onReleaseAll(() => _glib.g_error_free(error));
        final message = error.ref.message.cast<Utf8>().toDartString();
        throw SecureStorageUnknownException(message);
      }
    });
    return value;
  }
}

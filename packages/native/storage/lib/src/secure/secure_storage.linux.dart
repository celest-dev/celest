import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:native_storage/src/native/linux/glib.ffi.dart';
import 'package:native_storage/src/native/linux/libsecret.ffi.dart';
import 'package:native_storage/src/native/linux/linux.dart';
import 'package:native_storage/src/secure/secure_storage_exception.dart';
import 'package:native_storage/src/secure/secure_storage_platform.vm.dart';
import 'package:native_storage/src/util/functional.dart';

final class SecureStorageLinux extends NativeSecureStoragePlatform {
  SecureStorageLinux({
    String? namespace,
    super.scope,
  })  : _namespace = namespace,
        super.base();

  final String? _namespace;

  late final String _appName = lazy(() {
    final application = linux.gio.g_application_get_default();
    if (application == nullptr) {
      return File('/proc/self/exe').resolveSymbolicLinksSync();
    }
    return linux.gio
        .g_application_get_application_id(application)
        .toDartString();
  });

  @override
  late final String namespace = _namespace ?? _appName;

  late final String _prefix = scope == null ? '' : '$scope/';

  Pointer<SecretSchema> _schema(Arena arena) {
    final schema = arena<SecretSchema>()
      ..ref.name = namespace.toNativeUtf8(allocator: arena)
      ..ref.flags = SecretSchemaFlags.SECRET_SCHEMA_NONE
      ..ref.attributes[0].name = 'key'.toNativeUtf8(allocator: arena)
      ..ref.attributes[0].type =
          SecretSchemaAttributeType.SECRET_SCHEMA_ATTRIBUTE_STRING;
    if (scope != null) {
      schema
        ..ref.attributes[1].name = 'scope'.toNativeUtf8(allocator: arena)
        ..ref.attributes[1].type =
            SecretSchemaAttributeType.SECRET_SCHEMA_ATTRIBUTE_STRING;
    }
    return schema;
  }

  Pointer<GHashTable> _attributes({
    String? key,
    required Arena arena,
  }) {
    final hashTable =
        linux.glib.g_hash_table_new(linux.gStrHashPointer, nullptr);
    if (key != null) {
      linux.glib.g_hash_table_insert(
        hashTable,
        'key'.toNativeUtf8(allocator: arena).cast(),
        key.toNativeUtf8(allocator: arena).cast(),
      );
      if (scope case final scope?) {
        linux.glib.g_hash_table_insert(
          hashTable,
          'scope'.toNativeUtf8(allocator: arena).cast(),
          scope.toNativeUtf8(allocator: arena).cast(),
        );
      }
    }
    arena.onReleaseAll(() => linux.glib.g_hash_table_destroy(hashTable));
    return hashTable;
  }

  @override
  void clear() => using((arena) {
        final schema = _schema(arena);
        final attributes = _attributes(arena: arena);
        final secrets = _check(
          (err) => linux.libSecret.secret_password_searchv_sync(
            schema,
            attributes,
            SecretSearchFlags.SECRET_SEARCH_ALL,
            nullptr,
            err,
          ),
          arena: arena,
        );
        if (secrets == nullptr) {
          return;
        }
        final count = linux.glib.g_list_length(secrets);
        for (var i = 0; i < count; i++) {
          final secret =
              linux.glib.g_list_nth_data(secrets, i).cast<SecretItem>();
          final label =
              linux.libSecret.secret_item_get_label(secret).toDartString();
          if (scope == null || label.startsWith(_prefix)) {
            _check(
              (err) => linux.libSecret.secret_item_delete_sync(
                secret,
                nullptr,
                err,
              ),
              arena: arena,
            );
          }
        }
      });

  @override
  String? delete(String key) => using((arena) {
        final secret = read(key);
        final schema = _schema(arena);
        final attributes = _attributes(key: key, arena: arena);
        _check(
          (err) => linux.libSecret.secret_password_clearv_sync(
            schema,
            attributes,
            nullptr,
            err,
          ),
          arena: arena,
        );
        return secret;
      });

  @override
  String? read(String key) => using((arena) {
        final attributes = _attributes(key: key, arena: arena);
        final schema = _schema(arena);
        final result = _check(
          (err) => linux.libSecret.secret_password_lookupv_sync(
            schema,
            attributes,
            nullptr,
            err,
          ),
          arena: arena,
        );
        if (result == nullptr) {
          return null;
        }
        arena.onReleaseAll(() => linux.libSecret.secret_password_free(result));
        return result.toDartString();
      });

  @override
  String write(String key, String value) {
    using((arena) {
      final schema = _schema(arena);
      final label = '$_prefix$key'.toNativeUtf8(allocator: arena);
      final secret = value.toNativeUtf8(allocator: arena);
      final attributes = _attributes(key: key, arena: arena);
      _check(
        (err) => linux.libSecret.secret_password_storev_sync(
          schema,
          attributes,
          SECRET_COLLECTION_DEFAULT.toNativeUtf8(allocator: arena),
          label,
          secret,
          nullptr,
          err,
        ),
        arena: arena,
      );
    });
    return value;
  }

  @override
  List<String> get allKeys => using((arena) {
        final schema = _schema(arena);
        final attributes = _attributes(arena: arena);
        final secrets = _check(
          (err) => linux.libSecret.secret_password_searchv_sync(
            schema,
            attributes,
            SecretSearchFlags.SECRET_SEARCH_ALL,
            nullptr,
            err,
          ),
          arena: arena,
        );
        if (secrets == nullptr) {
          return const [];
        }
        final count = linux.glib.g_list_length(secrets);
        final allKeys = <String>[];
        for (var i = 0; i < count; i++) {
          final secret =
              linux.glib.g_list_nth_data(secrets, i).cast<SecretItem>();
          final label =
              linux.libSecret.secret_item_get_label(secret).toDartString();
          if (scope == null || label.startsWith(_prefix)) {
            allKeys.add(label.substring(_prefix.length));
          }
        }
        return allKeys;
      });

  R _check<R>(
    R Function(Pointer<Pointer<GError>> err) action, {
    required Arena arena,
  }) {
    final err = arena<Pointer<GError>>();
    final result = action(err);
    final error = err.value;
    if (error != nullptr) {
      arena.onReleaseAll(() => linux.glib.g_error_free(error));
      final message = error.ref.message.toDartString();
      throw SecureStorageUnknownException(message);
    }
    return result;
  }
}

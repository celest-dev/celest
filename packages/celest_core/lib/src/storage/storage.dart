import 'package:celest_core/src/storage/local/local_storage.dart';
import 'package:celest_core/src/storage/memory_storage.dart';
import 'package:celest_core/src/storage/secure/secure_storage.dart';

abstract interface class Storage {
  factory Storage.memory({String? scope}) = MemoryStorage;
  factory Storage.local({String? scope}) = LocalStorage;
  factory Storage.secure({String? scope}) = SecureStorage;

  String? read(String key);
  String write(String key, String value);
  String? delete(String key);
  void clear();
}

import 'package:celest_core/src/storage/local/local_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/storage/local/local_storage_platform.web.dart';
import 'package:celest_core/src/storage/storage.dart';

abstract interface class LocalStorage implements Storage {
  factory LocalStorage({String? scope}) = LocalStoragePlatform;
}

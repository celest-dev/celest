@visibleForTesting
library;

import 'package:meta/meta.dart';
import 'package:native_storage/native_storage.dart';

typedef NativeStorageExtendedFactory = NativeStorageExtended Function({
  String? namespace,
  String? scope,
});

/// Extended interface for [NativeStorage], used in tests.
@visibleForTesting
abstract interface class NativeStorageExtended implements NativeStorage {
  @visibleForTesting
  List<String> get allKeys;
}

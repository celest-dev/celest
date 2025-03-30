import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:sqlite3/common.dart' as sqlite3;
import 'package:sqlite3/wasm.dart';

/// A [QueryExecutor] for an in-memory database.
Future<QueryExecutor> inMemoryExecutor({
  void Function(sqlite3.CommonDatabase)? setup,
}) async {
  final sqlite3 = await WasmSqlite3.loadFromUrl(Uri.parse('./sqlite3.wasm'));
  sqlite3.registerVirtualFileSystem(InMemoryFileSystem(), makeDefault: true);
  return WasmDatabase.inMemory(sqlite3, setup: setup);
}

/// A [QueryExecutor] with local persistence.
Future<QueryExecutor> localExecutor({
  required String name,
  void Function(sqlite3.CommonDatabase)? setup,
  String? path,
}) async {
  // TODO(dnys1): We don't have a use case for this yet.
  return inMemoryExecutor(setup: setup);
}

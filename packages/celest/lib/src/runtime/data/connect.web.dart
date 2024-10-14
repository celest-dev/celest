import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:sqlite3/wasm.dart';

/// A [QueryExecutor] for an in-memory database.
Future<QueryExecutor> inMemoryExecutor() async {
  final sqlite3 = await WasmSqlite3.loadFromUrl(Uri.parse('./sqlite3.wasm'));
  sqlite3.registerVirtualFileSystem(InMemoryFileSystem(), makeDefault: true);
  return WasmDatabase.inMemory(sqlite3);
}

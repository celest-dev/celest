import 'package:drift/drift.dart';
import 'package:drift/native.dart';

/// A [QueryExecutor] for an in-memory database.
Future<QueryExecutor> inMemoryExecutor() async => NativeDatabase.memory();

@TestOn('vm')
@Tags(['e2e'])
library;

import 'dart:io';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/connect.dart';
import 'package:drift/drift.dart';
import 'package:drift_hrana/drift_hrana.dart';
import 'package:platform/platform.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

Future<int> _findOpenPort() async {
  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
  final port = server.port;
  await server.close();
  return port;
}

Future<Uri> _startLibSqlServer() async {
  final port = await _findOpenPort();
  final process = await Process.start('turso', ['dev', '--port', '$port']);
  addTearDown(process.kill);
  return Uri.parse('ws://localhost:$port');
}

void main() {
  group('connect', () {
    test('allows local libSQL URIs', () async {
      final host = await _startLibSqlServer();
      final platform = FakePlatform(
        environment: {
          'CELEST_DATABASE_HOST': host.toString(),
        },
      );
      Context.current.put(env.environment, 'production');
      Context.current.put(ContextKey.platform, platform);
      await connect(
        Context.current,
        name: 'test',
        factory: expectAsync1((executor) {
          expect(executor, isA<HranaDatabase>());
          return _FakeDatabase();
        }),
        hostnameVariable: const env('CELEST_DATABASE_HOST'),
        tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
      );
    });
  });
}

final class _FakeDatabase extends Fake implements GeneratedDatabase {
  @override
  Selectable<QueryRow> customSelect(
    String query, {
    List<Variable<Object>> variables = const [],
    Set<ResultSetImplementation<dynamic, dynamic>> readsFrom = const {},
  }) {
    return _FakeSelectable();
  }
}

final class _FakeSelectable extends Fake implements Selectable<Never> {
  @override
  Future<List<Never>> get() {
    return Future.value([]);
  }
}

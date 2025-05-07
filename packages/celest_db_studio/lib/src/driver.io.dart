// ignore_for_file: invalid_use_of_internal_member, implementation_imports
import 'package:celest_db_studio/src/driver.dart';
import 'package:hrana/src/rpc_client.dart' as hrana;
import 'package:hrana/src/rpc_http_client.dart' as hrana;
import 'package:sqlite3/sqlite3.dart' show Database, sqlite3;

abstract final class DriverImpl {
  static Future<Driver> connect(Uri uri, {String? authToken}) async {
    switch (uri) {
      case Uri(scheme: 'libsql' || 'https' || 'http'):
        return await HranaDriver.connect(uri, jwtToken: authToken);
      case Uri(scheme: 'file', path: '/:memory:'):
        return NativeDriver.memory();
      case Uri(scheme: 'file'):
        return NativeDriver.file(uri.toFilePath());
      default:
        throw ArgumentError.value(
          uri.toString(),
          'databaseUri',
          'Unsupported database URI scheme: ${uri.scheme}. '
              'Supported schemes are: libsql, https, http, file',
        );
    }
  }
}

final class NativeDriver implements Driver {
  NativeDriver.file(String path) : _database = sqlite3.open(path);

  NativeDriver.memory() : _database = sqlite3.openInMemory();

  final Database _database;

  @override
  Future<DriverResultSet> execute(String sql) async {
    final result = _database.select(sql);
    final headers = [
      for (final column in result.columnNames)
        DriverResultHeader(
          name: column,
          displayName: column,
          originalType: null,
          type: null,
        ),
    ];
    return DriverResultSet(
      rows: result,
      headers: headers,
      stat: DriverStats(rowsAffected: 0),
    );
  }
}

final class HranaDriver implements Driver {
  HranaDriver(this._client);

  static Future<HranaDriver> connect(Uri uri, {String? jwtToken}) async {
    final client = await hrana.HranaHttpClient.connect(
      uri.replace(
        scheme: switch (uri.scheme) {
          'wss' || 'libsql' || 'https' => 'https',
          'ws' || 'http' => 'http',
          _ => uri.scheme,
        },
      ),
      jwtToken: jwtToken,
    );
    return HranaDriver(client);
  }

  final hrana.HranaClient _client;

  @override
  Future<DriverResultSet> execute(String sql) async {
    final session = await _client.openStream();
    try {
      final result = await session.executeStatement(
        hrana.SqlStatement(sql: sql, args: [], namedArgs: [], wantRows: true),
      );
      final headers = [
        for (final column in result.columns)
          DriverResultHeader(
            name: column.name ?? '',
            displayName: column.name ?? '',
            originalType: null,
            type: ColumnType.fromSql(column.decltype),
          ),
      ];
      return DriverResultSet(
        rows: [
          for (final row in result.rows)
            {
              for (final (index, header) in headers.indexed)
                header.name: row[index],
            },
        ],
        headers: headers,
        stat: DriverStats(rowsAffected: result.affectedRowCount),
        lastInsertRowid: result.lastInsertRowId,
      );
    } finally {
      session.closeStream().ignore();
    }
  }
}

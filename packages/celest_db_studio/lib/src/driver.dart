// ignore_for_file: invalid_use_of_internal_member, implementation_imports
import 'package:hrana/src/rpc_client.dart' as hrana;
import 'package:hrana/src/rpc_http_client.dart' as hrana;
import 'package:sqlite3/sqlite3.dart' show Database, sqlite3;
import 'package:sqlite3/src/result_set.dart';

sealed class Driver {
  static Future<Driver> connect(Uri uri, {String? authToken}) async {
    switch (uri) {
      case Uri(scheme: 'libsql' || 'https' || 'http'):
        return HranaDriver.connect(uri, jwtToken: authToken);
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

  Future<DriverResultSet> execute(String sql);
}

final class NativeDriver extends Driver {
  NativeDriver.file(String path) : _database = sqlite3.open(path);

  NativeDriver.memory() : _database = sqlite3.openInMemory();

  final Database _database;

  @override
  Future<DriverResultSet> execute(String sql) async {
    final ResultSet result = _database.select(sql);
    final List<DriverResultHeader> headers = [
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

final class HranaDriver extends Driver {
  HranaDriver(this._client);

  static Future<HranaDriver> connect(Uri uri, {String? jwtToken}) async {
    final hrana.HranaHttpClient client = await hrana.HranaHttpClient.connect(
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
    final hrana.HranaStream session = await _client.openStream();
    try {
      final hrana.StatementResult result = await session.executeStatement(
        hrana.SqlStatement(sql: sql, args: [], namedArgs: [], wantRows: true),
      );
      final List<DriverResultHeader> headers = [
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

final class DriverResultSet {
  DriverResultSet({
    required this.rows,
    required this.headers,
    required this.stat,
    this.lastInsertRowid,
  });

  final List<Map<String, Object?>> rows;
  final List<DriverResultHeader> headers;
  final DriverStats stat;
  final int? lastInsertRowid;

  Map<String, Object?> toJson() => {
    'rows': rows,
    'headers': headers.map((e) => e.toJson()).toList(),
    'stat': stat.toJson(),
    'lastInsertRowid': lastInsertRowid,
  };
}

final class DriverResultHeader {
  DriverResultHeader({
    required this.name,
    required this.displayName,
    this.originalType,
    this.type,
  });

  final String name;
  final String displayName;
  final String? originalType;
  final ColumnType? type;

  Map<String, Object?> toJson() => {
    'name': name,
    'displayName': displayName,
    'originalType': originalType,
    'type': type?.rawValue,
  };
}

final class DriverStats {
  DriverStats({
    required this.rowsAffected,
    this.rowsRead,
    this.rowsWritten,
    this.queryDurationMs,
  });

  final int rowsAffected;
  final int? rowsRead;
  final int? rowsWritten;
  final double? queryDurationMs;

  Map<String, Object?> toJson() => {
    'rowsAffected': rowsAffected,
    'rowsRead': rowsRead,
    'rowsWritten': rowsWritten,
    'queryDurationMs': queryDurationMs,
  };
}

enum ColumnType {
  text(1),
  integer(2),
  real(3),
  blob(4);

  const ColumnType(this.rawValue);

  factory ColumnType.fromSql(String? type) {
    if (type == null) {
      return ColumnType.blob;
    }
    type = type.toUpperCase();

    if (type.contains('CHAR') ||
        type.contains('TEXT') ||
        type.contains('CLOB') ||
        type.contains('STRING')) {
      return ColumnType.text;
    }
    if (type.contains('INT')) {
      return ColumnType.integer;
    }
    if (type.contains('BLOB')) {
      return ColumnType.blob;
    }
    if (type.contains('REAL') ||
        type.contains('FLOAT') ||
        type.contains('DOUBLE')) {
      return ColumnType.real;
    }

    return ColumnType.text;
  }

  final int rawValue;
}

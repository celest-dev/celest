import 'package:celest_db_studio/src/driver.io.dart'
    if (dart.library.js_interop) 'package:celest_db_studio/src/driver.web.dart';

abstract interface class Driver {
  static Future<Driver> connect(Uri uri, {String? authToken}) async {
    return DriverImpl.connect(uri, authToken: authToken);
  }

  Future<DriverResultSet> execute(String sql);
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

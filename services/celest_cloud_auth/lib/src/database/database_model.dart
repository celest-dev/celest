import 'package:drift/drift.dart';

final class TimestampType implements CustomSqlType<DateTime> {
  const TimestampType();

  @override
  String mapToSqlLiteral(DateTime dartValue) {
    final seconds = dartValue.millisecondsSinceEpoch / 1000;
    return seconds.toStringAsFixed(3);
  }

  @override
  Object mapToSqlParameter(DateTime dartValue) {
    return dartValue.millisecondsSinceEpoch / 1000;
  }

  @override
  DateTime read(Object fromSql) {
    if (fromSql is! num) {
      throw ArgumentError.value(
        fromSql,
        'fromSql',
        'Expected a number, got a ${fromSql.runtimeType}',
      );
    }

    final seconds = fromSql.toInt();
    final milliseconds = ((fromSql - seconds) * 1000).toInt();
    return DateTime.fromMillisecondsSinceEpoch(
      seconds * 1000 + milliseconds,
      isUtc: true,
    );
  }

  @override
  String sqlTypeName(GenerationContext context) {
    return 'DATETIME';
  }
}

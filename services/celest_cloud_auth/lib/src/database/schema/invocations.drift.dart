// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/database/schema/invocations.drift.dart'
    as i1;
import 'dart:typed_data' as i2;

class CelestInvocations extends i0.Table
    with i0.TableInfo<CelestInvocations, i1.CelestInvocation> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestInvocations(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> invocationId =
      i0.GeneratedColumn<String>('invocation_id', aliasedName, false,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> functionId = i0.GeneratedColumn<String>(
      'function_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<DateTime> startTime =
      i0.GeneratedColumn<DateTime>('start_time', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
          defaultValue:
              const i0.CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final i0.GeneratedColumn<DateTime> endTime =
      i0.GeneratedColumn<DateTime>('end_time', aliasedName, true,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<i2.Uint8List> result =
      i0.GeneratedColumn<i2.Uint8List>('result', aliasedName, true,
          type: i0.DriftSqlType.blob,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<i2.Uint8List> error =
      i0.GeneratedColumn<i2.Uint8List>('error', aliasedName, true,
          type: i0.DriftSqlType.blob,
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [invocationId, functionId, startTime, endTime, result, error];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_invocations';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {invocationId};
  @override
  i1.CelestInvocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CelestInvocation(
      invocationId: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}invocation_id'])!,
      functionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}function_id'])!,
      startTime: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      result: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}result']),
      error: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}error']),
    );
  }

  @override
  CelestInvocations createAlias(String alias) {
    return CelestInvocations(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT celest_invocations_function_fk FOREIGN KEY(function_id)REFERENCES celest_functions(function_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CelestInvocation extends i0.DataClass
    implements i0.Insertable<i1.CelestInvocation> {
  /// The unique identifier of the invocation.
  final String invocationId;

  /// The ID of the function being invoked.
  final String functionId;

  /// The time the invocation started.
  final DateTime startTime;

  /// The time the invocation ended.
  final DateTime? endTime;

  /// The result of the invocation.
  final i2.Uint8List? result;

  /// The error of the invocation.
  final i2.Uint8List? error;
  const CelestInvocation(
      {required this.invocationId,
      required this.functionId,
      required this.startTime,
      this.endTime,
      this.result,
      this.error});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['invocation_id'] = i0.Variable<String>(invocationId);
    map['function_id'] = i0.Variable<String>(functionId);
    map['start_time'] = i0.Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = i0.Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || result != null) {
      map['result'] = i0.Variable<i2.Uint8List>(result);
    }
    if (!nullToAbsent || error != null) {
      map['error'] = i0.Variable<i2.Uint8List>(error);
    }
    return map;
  }

  factory CelestInvocation.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CelestInvocation(
      invocationId: serializer.fromJson<String>(json['invocation_id']),
      functionId: serializer.fromJson<String>(json['function_id']),
      startTime: serializer.fromJson<DateTime>(json['start_time']),
      endTime: serializer.fromJson<DateTime?>(json['end_time']),
      result: serializer.fromJson<i2.Uint8List?>(json['result']),
      error: serializer.fromJson<i2.Uint8List?>(json['error']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'invocation_id': serializer.toJson<String>(invocationId),
      'function_id': serializer.toJson<String>(functionId),
      'start_time': serializer.toJson<DateTime>(startTime),
      'end_time': serializer.toJson<DateTime?>(endTime),
      'result': serializer.toJson<i2.Uint8List?>(result),
      'error': serializer.toJson<i2.Uint8List?>(error),
    };
  }

  i1.CelestInvocation copyWith(
          {String? invocationId,
          String? functionId,
          DateTime? startTime,
          i0.Value<DateTime?> endTime = const i0.Value.absent(),
          i0.Value<i2.Uint8List?> result = const i0.Value.absent(),
          i0.Value<i2.Uint8List?> error = const i0.Value.absent()}) =>
      i1.CelestInvocation(
        invocationId: invocationId ?? this.invocationId,
        functionId: functionId ?? this.functionId,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        result: result.present ? result.value : this.result,
        error: error.present ? error.value : this.error,
      );
  CelestInvocation copyWithCompanion(i1.CelestInvocationsCompanion data) {
    return CelestInvocation(
      invocationId: data.invocationId.present
          ? data.invocationId.value
          : this.invocationId,
      functionId:
          data.functionId.present ? data.functionId.value : this.functionId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      result: data.result.present ? data.result.value : this.result,
      error: data.error.present ? data.error.value : this.error,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestInvocation(')
          ..write('invocationId: $invocationId, ')
          ..write('functionId: $functionId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('result: $result, ')
          ..write('error: $error')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(invocationId, functionId, startTime, endTime,
      i0.$driftBlobEquality.hash(result), i0.$driftBlobEquality.hash(error));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CelestInvocation &&
          other.invocationId == this.invocationId &&
          other.functionId == this.functionId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          i0.$driftBlobEquality.equals(other.result, this.result) &&
          i0.$driftBlobEquality.equals(other.error, this.error));
}

class CelestInvocationsCompanion
    extends i0.UpdateCompanion<i1.CelestInvocation> {
  final i0.Value<String> invocationId;
  final i0.Value<String> functionId;
  final i0.Value<DateTime> startTime;
  final i0.Value<DateTime?> endTime;
  final i0.Value<i2.Uint8List?> result;
  final i0.Value<i2.Uint8List?> error;
  final i0.Value<int> rowid;
  const CelestInvocationsCompanion({
    this.invocationId = const i0.Value.absent(),
    this.functionId = const i0.Value.absent(),
    this.startTime = const i0.Value.absent(),
    this.endTime = const i0.Value.absent(),
    this.result = const i0.Value.absent(),
    this.error = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CelestInvocationsCompanion.insert({
    required String invocationId,
    required String functionId,
    this.startTime = const i0.Value.absent(),
    this.endTime = const i0.Value.absent(),
    this.result = const i0.Value.absent(),
    this.error = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : invocationId = i0.Value(invocationId),
        functionId = i0.Value(functionId);
  static i0.Insertable<i1.CelestInvocation> custom({
    i0.Expression<String>? invocationId,
    i0.Expression<String>? functionId,
    i0.Expression<DateTime>? startTime,
    i0.Expression<DateTime>? endTime,
    i0.Expression<i2.Uint8List>? result,
    i0.Expression<i2.Uint8List>? error,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (invocationId != null) 'invocation_id': invocationId,
      if (functionId != null) 'function_id': functionId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (result != null) 'result': result,
      if (error != null) 'error': error,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CelestInvocationsCompanion copyWith(
      {i0.Value<String>? invocationId,
      i0.Value<String>? functionId,
      i0.Value<DateTime>? startTime,
      i0.Value<DateTime?>? endTime,
      i0.Value<i2.Uint8List?>? result,
      i0.Value<i2.Uint8List?>? error,
      i0.Value<int>? rowid}) {
    return i1.CelestInvocationsCompanion(
      invocationId: invocationId ?? this.invocationId,
      functionId: functionId ?? this.functionId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      result: result ?? this.result,
      error: error ?? this.error,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (invocationId.present) {
      map['invocation_id'] = i0.Variable<String>(invocationId.value);
    }
    if (functionId.present) {
      map['function_id'] = i0.Variable<String>(functionId.value);
    }
    if (startTime.present) {
      map['start_time'] = i0.Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = i0.Variable<DateTime>(endTime.value);
    }
    if (result.present) {
      map['result'] = i0.Variable<i2.Uint8List>(result.value);
    }
    if (error.present) {
      map['error'] = i0.Variable<i2.Uint8List>(error.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CelestInvocationsCompanion(')
          ..write('invocationId: $invocationId, ')
          ..write('functionId: $functionId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('result: $result, ')
          ..write('error: $error, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

typedef $CelestInvocationsCreateCompanionBuilder = i1.CelestInvocationsCompanion
    Function({
  required String invocationId,
  required String functionId,
  i0.Value<DateTime> startTime,
  i0.Value<DateTime?> endTime,
  i0.Value<i2.Uint8List?> result,
  i0.Value<i2.Uint8List?> error,
  i0.Value<int> rowid,
});
typedef $CelestInvocationsUpdateCompanionBuilder = i1.CelestInvocationsCompanion
    Function({
  i0.Value<String> invocationId,
  i0.Value<String> functionId,
  i0.Value<DateTime> startTime,
  i0.Value<DateTime?> endTime,
  i0.Value<i2.Uint8List?> result,
  i0.Value<i2.Uint8List?> error,
  i0.Value<int> rowid,
});

class $CelestInvocationsFilterComposer
    extends i0.FilterComposer<i0.GeneratedDatabase, i1.CelestInvocations> {
  $CelestInvocationsFilterComposer(super.$state);
  i0.ColumnFilters<String> get invocationId => $state.composableBuilder(
      column: $state.table.invocationId,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get functionId => $state.composableBuilder(
      column: $state.table.functionId,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<i2.Uint8List> get result => $state.composableBuilder(
      column: $state.table.result,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<i2.Uint8List> get error => $state.composableBuilder(
      column: $state.table.error,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));
}

class $CelestInvocationsOrderingComposer
    extends i0.OrderingComposer<i0.GeneratedDatabase, i1.CelestInvocations> {
  $CelestInvocationsOrderingComposer(super.$state);
  i0.ColumnOrderings<String> get invocationId => $state.composableBuilder(
      column: $state.table.invocationId,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get functionId => $state.composableBuilder(
      column: $state.table.functionId,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<i2.Uint8List> get result => $state.composableBuilder(
      column: $state.table.result,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<i2.Uint8List> get error => $state.composableBuilder(
      column: $state.table.error,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $CelestInvocationsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CelestInvocations,
    i1.CelestInvocation,
    i1.$CelestInvocationsFilterComposer,
    i1.$CelestInvocationsOrderingComposer,
    $CelestInvocationsCreateCompanionBuilder,
    $CelestInvocationsUpdateCompanionBuilder,
    (
      i1.CelestInvocation,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestInvocations,
          i1.CelestInvocation>
    ),
    i1.CelestInvocation,
    i0.PrefetchHooks Function()> {
  $CelestInvocationsTableManager(
      i0.GeneratedDatabase db, i1.CelestInvocations table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              i1.$CelestInvocationsFilterComposer(i0.ComposerState(db, table)),
          orderingComposer: i1
              .$CelestInvocationsOrderingComposer(i0.ComposerState(db, table)),
          updateCompanionCallback: ({
            i0.Value<String> invocationId = const i0.Value.absent(),
            i0.Value<String> functionId = const i0.Value.absent(),
            i0.Value<DateTime> startTime = const i0.Value.absent(),
            i0.Value<DateTime?> endTime = const i0.Value.absent(),
            i0.Value<i2.Uint8List?> result = const i0.Value.absent(),
            i0.Value<i2.Uint8List?> error = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestInvocationsCompanion(
            invocationId: invocationId,
            functionId: functionId,
            startTime: startTime,
            endTime: endTime,
            result: result,
            error: error,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String invocationId,
            required String functionId,
            i0.Value<DateTime> startTime = const i0.Value.absent(),
            i0.Value<DateTime?> endTime = const i0.Value.absent(),
            i0.Value<i2.Uint8List?> result = const i0.Value.absent(),
            i0.Value<i2.Uint8List?> error = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestInvocationsCompanion.insert(
            invocationId: invocationId,
            functionId: functionId,
            startTime: startTime,
            endTime: endTime,
            result: result,
            error: error,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CelestInvocationsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CelestInvocations,
    i1.CelestInvocation,
    i1.$CelestInvocationsFilterComposer,
    i1.$CelestInvocationsOrderingComposer,
    $CelestInvocationsCreateCompanionBuilder,
    $CelestInvocationsUpdateCompanionBuilder,
    (
      i1.CelestInvocation,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestInvocations,
          i1.CelestInvocation>
    ),
    i1.CelestInvocation,
    i0.PrefetchHooks Function()>;
i0.Index get celestInvocationsFunctionIdx => i0.Index(
    'celest_invocations_function_idx',
    'CREATE INDEX IF NOT EXISTS celest_invocations_function_idx ON celest_invocations (function_id)');

class CelestInvocationLogs extends i0.Table
    with i0.TableInfo<CelestInvocationLogs, i1.CelestInvocationLog> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CelestInvocationLogs(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<int> sequenceId = i0.GeneratedColumn<int>(
      'sequence_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> invocationId =
      i0.GeneratedColumn<String>('invocation_id', aliasedName, false,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<DateTime> time = i0.GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: i0.DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
      defaultValue:
          const i0.CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final i0.GeneratedColumn<String> severity = i0.GeneratedColumn<String>(
      'severity', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> message = i0.GeneratedColumn<String>(
      'message', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> error = i0.GeneratedColumn<String>(
      'error', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> stackTrace = i0.GeneratedColumn<String>(
      'stack_trace', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [sequenceId, invocationId, time, severity, message, error, stackTrace];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'celest_invocation_logs';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {sequenceId, invocationId};
  @override
  i1.CelestInvocationLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CelestInvocationLog(
      sequenceId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}sequence_id'])!,
      invocationId: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}invocation_id'])!,
      time: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      severity: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}severity'])!,
      message: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}message'])!,
      error: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}error']),
      stackTrace: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}stack_trace']),
    );
  }

  @override
  CelestInvocationLogs createAlias(String alias) {
    return CelestInvocationLogs(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY(sequence_id, invocation_id)',
        'CONSTRAINT celest_invocation_logs_invocation_fk FOREIGN KEY(invocation_id)REFERENCES celest_invocations(invocation_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CelestInvocationLog extends i0.DataClass
    implements i0.Insertable<i1.CelestInvocationLog> {
  /// The sequence number of the log.
  final int sequenceId;

  /// The ID of the invocation.
  final String invocationId;

  /// The time the log was created.
  final DateTime time;

  /// The severity of the log.
  final String severity;

  /// The message of the log.
  final String message;

  /// The error associated with the log.
  final String? error;

  /// The stack trace associated with the log.
  final String? stackTrace;
  const CelestInvocationLog(
      {required this.sequenceId,
      required this.invocationId,
      required this.time,
      required this.severity,
      required this.message,
      this.error,
      this.stackTrace});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['sequence_id'] = i0.Variable<int>(sequenceId);
    map['invocation_id'] = i0.Variable<String>(invocationId);
    map['time'] = i0.Variable<DateTime>(time);
    map['severity'] = i0.Variable<String>(severity);
    map['message'] = i0.Variable<String>(message);
    if (!nullToAbsent || error != null) {
      map['error'] = i0.Variable<String>(error);
    }
    if (!nullToAbsent || stackTrace != null) {
      map['stack_trace'] = i0.Variable<String>(stackTrace);
    }
    return map;
  }

  factory CelestInvocationLog.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CelestInvocationLog(
      sequenceId: serializer.fromJson<int>(json['sequence_id']),
      invocationId: serializer.fromJson<String>(json['invocation_id']),
      time: serializer.fromJson<DateTime>(json['time']),
      severity: serializer.fromJson<String>(json['severity']),
      message: serializer.fromJson<String>(json['message']),
      error: serializer.fromJson<String?>(json['error']),
      stackTrace: serializer.fromJson<String?>(json['stack_trace']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sequence_id': serializer.toJson<int>(sequenceId),
      'invocation_id': serializer.toJson<String>(invocationId),
      'time': serializer.toJson<DateTime>(time),
      'severity': serializer.toJson<String>(severity),
      'message': serializer.toJson<String>(message),
      'error': serializer.toJson<String?>(error),
      'stack_trace': serializer.toJson<String?>(stackTrace),
    };
  }

  i1.CelestInvocationLog copyWith(
          {int? sequenceId,
          String? invocationId,
          DateTime? time,
          String? severity,
          String? message,
          i0.Value<String?> error = const i0.Value.absent(),
          i0.Value<String?> stackTrace = const i0.Value.absent()}) =>
      i1.CelestInvocationLog(
        sequenceId: sequenceId ?? this.sequenceId,
        invocationId: invocationId ?? this.invocationId,
        time: time ?? this.time,
        severity: severity ?? this.severity,
        message: message ?? this.message,
        error: error.present ? error.value : this.error,
        stackTrace: stackTrace.present ? stackTrace.value : this.stackTrace,
      );
  CelestInvocationLog copyWithCompanion(i1.CelestInvocationLogsCompanion data) {
    return CelestInvocationLog(
      sequenceId:
          data.sequenceId.present ? data.sequenceId.value : this.sequenceId,
      invocationId: data.invocationId.present
          ? data.invocationId.value
          : this.invocationId,
      time: data.time.present ? data.time.value : this.time,
      severity: data.severity.present ? data.severity.value : this.severity,
      message: data.message.present ? data.message.value : this.message,
      error: data.error.present ? data.error.value : this.error,
      stackTrace:
          data.stackTrace.present ? data.stackTrace.value : this.stackTrace,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CelestInvocationLog(')
          ..write('sequenceId: $sequenceId, ')
          ..write('invocationId: $invocationId, ')
          ..write('time: $time, ')
          ..write('severity: $severity, ')
          ..write('message: $message, ')
          ..write('error: $error, ')
          ..write('stackTrace: $stackTrace')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      sequenceId, invocationId, time, severity, message, error, stackTrace);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CelestInvocationLog &&
          other.sequenceId == this.sequenceId &&
          other.invocationId == this.invocationId &&
          other.time == this.time &&
          other.severity == this.severity &&
          other.message == this.message &&
          other.error == this.error &&
          other.stackTrace == this.stackTrace);
}

class CelestInvocationLogsCompanion
    extends i0.UpdateCompanion<i1.CelestInvocationLog> {
  final i0.Value<int> sequenceId;
  final i0.Value<String> invocationId;
  final i0.Value<DateTime> time;
  final i0.Value<String> severity;
  final i0.Value<String> message;
  final i0.Value<String?> error;
  final i0.Value<String?> stackTrace;
  final i0.Value<int> rowid;
  const CelestInvocationLogsCompanion({
    this.sequenceId = const i0.Value.absent(),
    this.invocationId = const i0.Value.absent(),
    this.time = const i0.Value.absent(),
    this.severity = const i0.Value.absent(),
    this.message = const i0.Value.absent(),
    this.error = const i0.Value.absent(),
    this.stackTrace = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CelestInvocationLogsCompanion.insert({
    required int sequenceId,
    required String invocationId,
    this.time = const i0.Value.absent(),
    required String severity,
    required String message,
    this.error = const i0.Value.absent(),
    this.stackTrace = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : sequenceId = i0.Value(sequenceId),
        invocationId = i0.Value(invocationId),
        severity = i0.Value(severity),
        message = i0.Value(message);
  static i0.Insertable<i1.CelestInvocationLog> custom({
    i0.Expression<int>? sequenceId,
    i0.Expression<String>? invocationId,
    i0.Expression<DateTime>? time,
    i0.Expression<String>? severity,
    i0.Expression<String>? message,
    i0.Expression<String>? error,
    i0.Expression<String>? stackTrace,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (sequenceId != null) 'sequence_id': sequenceId,
      if (invocationId != null) 'invocation_id': invocationId,
      if (time != null) 'time': time,
      if (severity != null) 'severity': severity,
      if (message != null) 'message': message,
      if (error != null) 'error': error,
      if (stackTrace != null) 'stack_trace': stackTrace,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CelestInvocationLogsCompanion copyWith(
      {i0.Value<int>? sequenceId,
      i0.Value<String>? invocationId,
      i0.Value<DateTime>? time,
      i0.Value<String>? severity,
      i0.Value<String>? message,
      i0.Value<String?>? error,
      i0.Value<String?>? stackTrace,
      i0.Value<int>? rowid}) {
    return i1.CelestInvocationLogsCompanion(
      sequenceId: sequenceId ?? this.sequenceId,
      invocationId: invocationId ?? this.invocationId,
      time: time ?? this.time,
      severity: severity ?? this.severity,
      message: message ?? this.message,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (sequenceId.present) {
      map['sequence_id'] = i0.Variable<int>(sequenceId.value);
    }
    if (invocationId.present) {
      map['invocation_id'] = i0.Variable<String>(invocationId.value);
    }
    if (time.present) {
      map['time'] = i0.Variable<DateTime>(time.value);
    }
    if (severity.present) {
      map['severity'] = i0.Variable<String>(severity.value);
    }
    if (message.present) {
      map['message'] = i0.Variable<String>(message.value);
    }
    if (error.present) {
      map['error'] = i0.Variable<String>(error.value);
    }
    if (stackTrace.present) {
      map['stack_trace'] = i0.Variable<String>(stackTrace.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CelestInvocationLogsCompanion(')
          ..write('sequenceId: $sequenceId, ')
          ..write('invocationId: $invocationId, ')
          ..write('time: $time, ')
          ..write('severity: $severity, ')
          ..write('message: $message, ')
          ..write('error: $error, ')
          ..write('stackTrace: $stackTrace, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

typedef $CelestInvocationLogsCreateCompanionBuilder
    = i1.CelestInvocationLogsCompanion Function({
  required int sequenceId,
  required String invocationId,
  i0.Value<DateTime> time,
  required String severity,
  required String message,
  i0.Value<String?> error,
  i0.Value<String?> stackTrace,
  i0.Value<int> rowid,
});
typedef $CelestInvocationLogsUpdateCompanionBuilder
    = i1.CelestInvocationLogsCompanion Function({
  i0.Value<int> sequenceId,
  i0.Value<String> invocationId,
  i0.Value<DateTime> time,
  i0.Value<String> severity,
  i0.Value<String> message,
  i0.Value<String?> error,
  i0.Value<String?> stackTrace,
  i0.Value<int> rowid,
});

class $CelestInvocationLogsFilterComposer
    extends i0.FilterComposer<i0.GeneratedDatabase, i1.CelestInvocationLogs> {
  $CelestInvocationLogsFilterComposer(super.$state);
  i0.ColumnFilters<int> get sequenceId => $state.composableBuilder(
      column: $state.table.sequenceId,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get invocationId => $state.composableBuilder(
      column: $state.table.invocationId,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get severity => $state.composableBuilder(
      column: $state.table.severity,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get error => $state.composableBuilder(
      column: $state.table.error,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get stackTrace => $state.composableBuilder(
      column: $state.table.stackTrace,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));
}

class $CelestInvocationLogsOrderingComposer
    extends i0.OrderingComposer<i0.GeneratedDatabase, i1.CelestInvocationLogs> {
  $CelestInvocationLogsOrderingComposer(super.$state);
  i0.ColumnOrderings<int> get sequenceId => $state.composableBuilder(
      column: $state.table.sequenceId,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get invocationId => $state.composableBuilder(
      column: $state.table.invocationId,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get severity => $state.composableBuilder(
      column: $state.table.severity,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get error => $state.composableBuilder(
      column: $state.table.error,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get stackTrace => $state.composableBuilder(
      column: $state.table.stackTrace,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $CelestInvocationLogsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.CelestInvocationLogs,
    i1.CelestInvocationLog,
    i1.$CelestInvocationLogsFilterComposer,
    i1.$CelestInvocationLogsOrderingComposer,
    $CelestInvocationLogsCreateCompanionBuilder,
    $CelestInvocationLogsUpdateCompanionBuilder,
    (
      i1.CelestInvocationLog,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestInvocationLogs,
          i1.CelestInvocationLog>
    ),
    i1.CelestInvocationLog,
    i0.PrefetchHooks Function()> {
  $CelestInvocationLogsTableManager(
      i0.GeneratedDatabase db, i1.CelestInvocationLogs table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          filteringComposer: i1
              .$CelestInvocationLogsFilterComposer(i0.ComposerState(db, table)),
          orderingComposer: i1.$CelestInvocationLogsOrderingComposer(
              i0.ComposerState(db, table)),
          updateCompanionCallback: ({
            i0.Value<int> sequenceId = const i0.Value.absent(),
            i0.Value<String> invocationId = const i0.Value.absent(),
            i0.Value<DateTime> time = const i0.Value.absent(),
            i0.Value<String> severity = const i0.Value.absent(),
            i0.Value<String> message = const i0.Value.absent(),
            i0.Value<String?> error = const i0.Value.absent(),
            i0.Value<String?> stackTrace = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestInvocationLogsCompanion(
            sequenceId: sequenceId,
            invocationId: invocationId,
            time: time,
            severity: severity,
            message: message,
            error: error,
            stackTrace: stackTrace,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int sequenceId,
            required String invocationId,
            i0.Value<DateTime> time = const i0.Value.absent(),
            required String severity,
            required String message,
            i0.Value<String?> error = const i0.Value.absent(),
            i0.Value<String?> stackTrace = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CelestInvocationLogsCompanion.insert(
            sequenceId: sequenceId,
            invocationId: invocationId,
            time: time,
            severity: severity,
            message: message,
            error: error,
            stackTrace: stackTrace,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CelestInvocationLogsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.CelestInvocationLogs,
    i1.CelestInvocationLog,
    i1.$CelestInvocationLogsFilterComposer,
    i1.$CelestInvocationLogsOrderingComposer,
    $CelestInvocationLogsCreateCompanionBuilder,
    $CelestInvocationLogsUpdateCompanionBuilder,
    (
      i1.CelestInvocationLog,
      i0.BaseReferences<i0.GeneratedDatabase, i1.CelestInvocationLogs,
          i1.CelestInvocationLog>
    ),
    i1.CelestInvocationLog,
    i0.PrefetchHooks Function()>;
i0.Index get celestInvocationLogsInvocationIdx => i0.Index(
    'celest_invocation_logs_invocation_idx',
    'CREATE INDEX IF NOT EXISTS celest_invocation_logs_invocation_idx ON celest_invocation_logs (invocation_id)');

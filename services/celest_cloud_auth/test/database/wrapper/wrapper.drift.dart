// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'wrapper.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_core.drift.dart'
    as i3;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift.dart'
    as i4;

typedef $TestCreateCompanionBuilder =
    i1.TestCompanion Function({
      required String userId,
      required String sessionId,
      i0.Value<int> rowid,
    });
typedef $TestUpdateCompanionBuilder =
    i1.TestCompanion Function({
      i0.Value<String> userId,
      i0.Value<String> sessionId,
      i0.Value<int> rowid,
    });

class $TestFilterComposer extends i0.Composer<i0.GeneratedDatabase, i1.Test> {
  $TestFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $TestOrderingComposer extends i0.Composer<i0.GeneratedDatabase, i1.Test> {
  $TestOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $TestAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Test> {
  $TestAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);
}

class $TestTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Test,
          i1.TestData,
          i1.$TestFilterComposer,
          i1.$TestOrderingComposer,
          i1.$TestAnnotationComposer,
          $TestCreateCompanionBuilder,
          $TestUpdateCompanionBuilder,
          (
            i1.TestData,
            i0.BaseReferences<i0.GeneratedDatabase, i1.Test, i1.TestData>,
          ),
          i1.TestData,
          i0.PrefetchHooks Function()
        > {
  $TestTableManager(i0.GeneratedDatabase db, i1.Test table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => i1.$TestFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$TestOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => i1.$TestAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> userId = const i0.Value.absent(),
                i0.Value<String> sessionId = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TestCompanion(
                userId: userId,
                sessionId: sessionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                required String sessionId,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TestCompanion.insert(
                userId: userId,
                sessionId: sessionId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TestProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Test,
      i1.TestData,
      i1.$TestFilterComposer,
      i1.$TestOrderingComposer,
      i1.$TestAnnotationComposer,
      $TestCreateCompanionBuilder,
      $TestUpdateCompanionBuilder,
      (
        i1.TestData,
        i0.BaseReferences<i0.GeneratedDatabase, i1.Test, i1.TestData>,
      ),
      i1.TestData,
      i0.PrefetchHooks Function()
    >;

class Test extends i0.Table with i0.TableInfo<Test, i1.TestData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Test(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> userId = i0.GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final i0.GeneratedColumn<String> sessionId = i0.GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<i0.GeneratedColumn> get $columns => [userId, sessionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => const {};
  @override
  i1.TestData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.TestData(
      userId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      sessionId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}session_id'],
          )!,
    );
  }

  @override
  Test createAlias(String alias) {
    return Test(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(user_id)REFERENCES cloud_auth_users(user_id)',
    'FOREIGN KEY(session_id)REFERENCES cloud_auth_sessions(session_id)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class TestData extends i0.DataClass implements i0.Insertable<i1.TestData> {
  /// Ensure we can reference Cloud Auth tables.
  final String userId;

  /// Added in schema version 2
  final String sessionId;
  const TestData({required this.userId, required this.sessionId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['user_id'] = i0.Variable<String>(userId);
    map['session_id'] = i0.Variable<String>(sessionId);
    return map;
  }

  factory TestData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return TestData(
      userId: serializer.fromJson<String>(json['user_id']),
      sessionId: serializer.fromJson<String>(json['session_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<String>(userId),
      'session_id': serializer.toJson<String>(sessionId),
    };
  }

  i1.TestData copyWith({String? userId, String? sessionId}) => i1.TestData(
    userId: userId ?? this.userId,
    sessionId: sessionId ?? this.sessionId,
  );
  TestData copyWithCompanion(i1.TestCompanion data) {
    return TestData(
      userId: data.userId.present ? data.userId.value : this.userId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestData(')
          ..write('userId: $userId, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, sessionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.TestData &&
          other.userId == this.userId &&
          other.sessionId == this.sessionId);
}

class TestCompanion extends i0.UpdateCompanion<i1.TestData> {
  final i0.Value<String> userId;
  final i0.Value<String> sessionId;
  final i0.Value<int> rowid;
  const TestCompanion({
    this.userId = const i0.Value.absent(),
    this.sessionId = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TestCompanion.insert({
    required String userId,
    required String sessionId,
    this.rowid = const i0.Value.absent(),
  }) : userId = i0.Value(userId),
       sessionId = i0.Value(sessionId);
  static i0.Insertable<i1.TestData> custom({
    i0.Expression<String>? userId,
    i0.Expression<String>? sessionId,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (sessionId != null) 'session_id': sessionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TestCompanion copyWith({
    i0.Value<String>? userId,
    i0.Value<String>? sessionId,
    i0.Value<int>? rowid,
  }) {
    return i1.TestCompanion(
      userId: userId ?? this.userId,
      sessionId: sessionId ?? this.sessionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (sessionId.present) {
      map['session_id'] = i0.Variable<String>(sessionId.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestCompanion(')
          ..write('userId: $userId, ')
          ..write('sessionId: $sessionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class WrapperDrift extends i2.ModularAccessor {
  WrapperDrift(i0.GeneratedDatabase db) : super(db);
  i3.CloudAuthCoreDrift get cloudAuthCoreDrift =>
      this.accessor(i3.CloudAuthCoreDrift.new);
  i4.CloudAuthUsersDrift get cloudAuthUsersDrift =>
      this.accessor(i4.CloudAuthUsersDrift.new);
}

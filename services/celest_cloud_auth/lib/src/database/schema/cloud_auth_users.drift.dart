// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_core/src/auth/user.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift.dart'
    as i2;
import 'package:celest_cloud_auth/src/database/database_model.dart' as i3;
import 'package:drift/internal/modular.dart' as i4;
import 'dart:async' as i5;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i6;

typedef $CloudAuthUsersCreateCompanionBuilder = i2.CloudAuthUsersCompanion
    Function({
  required String userId,
  i0.Value<String?> givenName,
  i0.Value<String?> familyName,
  i0.Value<String?> timeZone,
  i0.Value<String?> languageCode,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> updateTime,
  i0.Value<int> rowid,
});
typedef $CloudAuthUsersUpdateCompanionBuilder = i2.CloudAuthUsersCompanion
    Function({
  i0.Value<String> userId,
  i0.Value<String?> givenName,
  i0.Value<String?> familyName,
  i0.Value<String?> timeZone,
  i0.Value<String?> languageCode,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> updateTime,
  i0.Value<int> rowid,
});

class $CloudAuthUsersFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUsers> {
  $CloudAuthUsersFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get givenName => $composableBuilder(
      column: $table.givenName, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get familyName => $composableBuilder(
      column: $table.familyName, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get timeZone => $composableBuilder(
      column: $table.timeZone, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get languageCode => $composableBuilder(
      column: $table.languageCode,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => i0.ColumnFilters(column));
}

class $CloudAuthUsersOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUsers> {
  $CloudAuthUsersOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get givenName => $composableBuilder(
      column: $table.givenName,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get familyName => $composableBuilder(
      column: $table.familyName,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get timeZone => $composableBuilder(
      column: $table.timeZone, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get languageCode => $composableBuilder(
      column: $table.languageCode,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get createTime => $composableBuilder(
      column: $table.createTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CloudAuthUsersAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUsers> {
  $CloudAuthUsersAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumn<String> get givenName =>
      $composableBuilder(column: $table.givenName, builder: (column) => column);

  i0.GeneratedColumn<String> get familyName => $composableBuilder(
      column: $table.familyName, builder: (column) => column);

  i0.GeneratedColumn<String> get timeZone =>
      $composableBuilder(column: $table.timeZone, builder: (column) => column);

  i0.GeneratedColumn<String> get languageCode => $composableBuilder(
      column: $table.languageCode, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => column);
}

class $CloudAuthUsersTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.CloudAuthUsers,
    i1.User,
    i2.$CloudAuthUsersFilterComposer,
    i2.$CloudAuthUsersOrderingComposer,
    i2.$CloudAuthUsersAnnotationComposer,
    $CloudAuthUsersCreateCompanionBuilder,
    $CloudAuthUsersUpdateCompanionBuilder,
    (
      i1.User,
      i0.BaseReferences<i0.GeneratedDatabase, i2.CloudAuthUsers, i1.User>
    ),
    i1.User,
    i0.PrefetchHooks Function()> {
  $CloudAuthUsersTableManager(i0.GeneratedDatabase db, i2.CloudAuthUsers table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$CloudAuthUsersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$CloudAuthUsersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$CloudAuthUsersAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> userId = const i0.Value.absent(),
            i0.Value<String?> givenName = const i0.Value.absent(),
            i0.Value<String?> familyName = const i0.Value.absent(),
            i0.Value<String?> timeZone = const i0.Value.absent(),
            i0.Value<String?> languageCode = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> updateTime = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i2.CloudAuthUsersCompanion(
            userId: userId,
            givenName: givenName,
            familyName: familyName,
            timeZone: timeZone,
            languageCode: languageCode,
            createTime: createTime,
            updateTime: updateTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            i0.Value<String?> givenName = const i0.Value.absent(),
            i0.Value<String?> familyName = const i0.Value.absent(),
            i0.Value<String?> timeZone = const i0.Value.absent(),
            i0.Value<String?> languageCode = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> updateTime = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i2.CloudAuthUsersCompanion.insert(
            userId: userId,
            givenName: givenName,
            familyName: familyName,
            timeZone: timeZone,
            languageCode: languageCode,
            createTime: createTime,
            updateTime: updateTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CloudAuthUsersProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.CloudAuthUsers,
    i1.User,
    i2.$CloudAuthUsersFilterComposer,
    i2.$CloudAuthUsersOrderingComposer,
    i2.$CloudAuthUsersAnnotationComposer,
    $CloudAuthUsersCreateCompanionBuilder,
    $CloudAuthUsersUpdateCompanionBuilder,
    (
      i1.User,
      i0.BaseReferences<i0.GeneratedDatabase, i2.CloudAuthUsers, i1.User>
    ),
    i1.User,
    i0.PrefetchHooks Function()>;
typedef $CloudAuthUserEmailsCreateCompanionBuilder
    = i2.CloudAuthUserEmailsCompanion Function({
  required String userId,
  required String email,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});
typedef $CloudAuthUserEmailsUpdateCompanionBuilder
    = i2.CloudAuthUserEmailsCompanion Function({
  i0.Value<String> userId,
  i0.Value<String> email,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});

class $CloudAuthUserEmailsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUserEmails> {
  $CloudAuthUserEmailsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary, builder: (column) => i0.ColumnFilters(column));
}

class $CloudAuthUserEmailsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUserEmails> {
  $CloudAuthUserEmailsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<bool> get isVerified => $composableBuilder(
      column: $table.isVerified,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CloudAuthUserEmailsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUserEmails> {
  $CloudAuthUserEmailsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  i0.GeneratedColumn<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => column);

  i0.GeneratedColumn<bool> get isPrimary =>
      $composableBuilder(column: $table.isPrimary, builder: (column) => column);
}

class $CloudAuthUserEmailsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.CloudAuthUserEmails,
    i1.Email,
    i2.$CloudAuthUserEmailsFilterComposer,
    i2.$CloudAuthUserEmailsOrderingComposer,
    i2.$CloudAuthUserEmailsAnnotationComposer,
    $CloudAuthUserEmailsCreateCompanionBuilder,
    $CloudAuthUserEmailsUpdateCompanionBuilder,
    (
      i1.Email,
      i0.BaseReferences<i0.GeneratedDatabase, i2.CloudAuthUserEmails, i1.Email>
    ),
    i1.Email,
    i0.PrefetchHooks Function()> {
  $CloudAuthUserEmailsTableManager(
      i0.GeneratedDatabase db, i2.CloudAuthUserEmails table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$CloudAuthUserEmailsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$CloudAuthUserEmailsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$CloudAuthUserEmailsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> userId = const i0.Value.absent(),
            i0.Value<String> email = const i0.Value.absent(),
            i0.Value<bool> isVerified = const i0.Value.absent(),
            i0.Value<bool> isPrimary = const i0.Value.absent(),
          }) =>
              i2.CloudAuthUserEmailsCompanion(
            userId: userId,
            email: email,
            isVerified: isVerified,
            isPrimary: isPrimary,
          ),
          createCompanionCallback: ({
            required String userId,
            required String email,
            i0.Value<bool> isVerified = const i0.Value.absent(),
            i0.Value<bool> isPrimary = const i0.Value.absent(),
          }) =>
              i2.CloudAuthUserEmailsCompanion.insert(
            userId: userId,
            email: email,
            isVerified: isVerified,
            isPrimary: isPrimary,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CloudAuthUserEmailsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.CloudAuthUserEmails,
    i1.Email,
    i2.$CloudAuthUserEmailsFilterComposer,
    i2.$CloudAuthUserEmailsOrderingComposer,
    i2.$CloudAuthUserEmailsAnnotationComposer,
    $CloudAuthUserEmailsCreateCompanionBuilder,
    $CloudAuthUserEmailsUpdateCompanionBuilder,
    (
      i1.Email,
      i0.BaseReferences<i0.GeneratedDatabase, i2.CloudAuthUserEmails, i1.Email>
    ),
    i1.Email,
    i0.PrefetchHooks Function()>;
typedef $CloudAuthUserPhoneNumbersCreateCompanionBuilder
    = i2.CloudAuthUserPhoneNumbersCompanion Function({
  required String userId,
  required String phoneNumber,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});
typedef $CloudAuthUserPhoneNumbersUpdateCompanionBuilder
    = i2.CloudAuthUserPhoneNumbersCompanion Function({
  i0.Value<String> userId,
  i0.Value<String> phoneNumber,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});

class $CloudAuthUserPhoneNumbersFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUserPhoneNumbers> {
  $CloudAuthUserPhoneNumbersFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary, builder: (column) => i0.ColumnFilters(column));
}

class $CloudAuthUserPhoneNumbersOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUserPhoneNumbers> {
  $CloudAuthUserPhoneNumbersOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<bool> get isVerified => $composableBuilder(
      column: $table.isVerified,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<bool> get isPrimary => $composableBuilder(
      column: $table.isPrimary,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CloudAuthUserPhoneNumbersAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.CloudAuthUserPhoneNumbers> {
  $CloudAuthUserPhoneNumbersAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  i0.GeneratedColumn<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => column);

  i0.GeneratedColumn<bool> get isPrimary =>
      $composableBuilder(column: $table.isPrimary, builder: (column) => column);
}

class $CloudAuthUserPhoneNumbersTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.CloudAuthUserPhoneNumbers,
    i1.PhoneNumber,
    i2.$CloudAuthUserPhoneNumbersFilterComposer,
    i2.$CloudAuthUserPhoneNumbersOrderingComposer,
    i2.$CloudAuthUserPhoneNumbersAnnotationComposer,
    $CloudAuthUserPhoneNumbersCreateCompanionBuilder,
    $CloudAuthUserPhoneNumbersUpdateCompanionBuilder,
    (
      i1.PhoneNumber,
      i0.BaseReferences<i0.GeneratedDatabase, i2.CloudAuthUserPhoneNumbers,
          i1.PhoneNumber>
    ),
    i1.PhoneNumber,
    i0.PrefetchHooks Function()> {
  $CloudAuthUserPhoneNumbersTableManager(
      i0.GeneratedDatabase db, i2.CloudAuthUserPhoneNumbers table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => i2
              .$CloudAuthUserPhoneNumbersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$CloudAuthUserPhoneNumbersOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$CloudAuthUserPhoneNumbersAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> userId = const i0.Value.absent(),
            i0.Value<String> phoneNumber = const i0.Value.absent(),
            i0.Value<bool> isVerified = const i0.Value.absent(),
            i0.Value<bool> isPrimary = const i0.Value.absent(),
          }) =>
              i2.CloudAuthUserPhoneNumbersCompanion(
            userId: userId,
            phoneNumber: phoneNumber,
            isVerified: isVerified,
            isPrimary: isPrimary,
          ),
          createCompanionCallback: ({
            required String userId,
            required String phoneNumber,
            i0.Value<bool> isVerified = const i0.Value.absent(),
            i0.Value<bool> isPrimary = const i0.Value.absent(),
          }) =>
              i2.CloudAuthUserPhoneNumbersCompanion.insert(
            userId: userId,
            phoneNumber: phoneNumber,
            isVerified: isVerified,
            isPrimary: isPrimary,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CloudAuthUserPhoneNumbersProcessedTableManager
    = i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i2.CloudAuthUserPhoneNumbers,
        i1.PhoneNumber,
        i2.$CloudAuthUserPhoneNumbersFilterComposer,
        i2.$CloudAuthUserPhoneNumbersOrderingComposer,
        i2.$CloudAuthUserPhoneNumbersAnnotationComposer,
        $CloudAuthUserPhoneNumbersCreateCompanionBuilder,
        $CloudAuthUserPhoneNumbersUpdateCompanionBuilder,
        (
          i1.PhoneNumber,
          i0.BaseReferences<i0.GeneratedDatabase, i2.CloudAuthUserPhoneNumbers,
              i1.PhoneNumber>
        ),
        i1.PhoneNumber,
        i0.PrefetchHooks Function()>;

class CloudAuthUsers extends i0.Table
    with i0.TableInfo<CloudAuthUsers, i1.User> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthUsers(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> userId = i0.GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> givenName = i0.GeneratedColumn<String>(
      'given_name', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> familyName = i0.GeneratedColumn<String>(
      'family_name', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> timeZone = i0.GeneratedColumn<String>(
      'time_zone', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> languageCode =
      i0.GeneratedColumn<String>('language_code', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<DateTime> createTime =
      i0.GeneratedColumn<DateTime>(
          'create_time', aliasedName, false,
          type: const i3.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
          defaultValue:
              const i0.CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final i0.GeneratedColumn<DateTime> updateTime =
      i0.GeneratedColumn<DateTime>('update_time', aliasedName, true,
          type: const i3.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<i0.GeneratedColumn> get $columns => [
        userId,
        givenName,
        familyName,
        timeZone,
        languageCode,
        createTime,
        updateTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_users';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {userId};
  @override
  i1.User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.User(
      userId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      createTime: attachedDatabase.typeMapping.read(
          const i3.TimestampType(), data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping.read(
          const i3.TimestampType(), data['${effectivePrefix}update_time']),
      givenName: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}given_name']),
      familyName: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}family_name']),
      timeZone: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}time_zone']),
      languageCode: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}language_code']),
    );
  }

  @override
  CloudAuthUsers createAlias(String alias) {
    return CloudAuthUsers(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthUsersCompanion extends i0.UpdateCompanion<i1.User> {
  final i0.Value<String> userId;
  final i0.Value<String?> givenName;
  final i0.Value<String?> familyName;
  final i0.Value<String?> timeZone;
  final i0.Value<String?> languageCode;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime?> updateTime;
  final i0.Value<int> rowid;
  const CloudAuthUsersCompanion({
    this.userId = const i0.Value.absent(),
    this.givenName = const i0.Value.absent(),
    this.familyName = const i0.Value.absent(),
    this.timeZone = const i0.Value.absent(),
    this.languageCode = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CloudAuthUsersCompanion.insert({
    required String userId,
    this.givenName = const i0.Value.absent(),
    this.familyName = const i0.Value.absent(),
    this.timeZone = const i0.Value.absent(),
    this.languageCode = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : userId = i0.Value(userId);
  static i0.Insertable<i1.User> custom({
    i0.Expression<String>? userId,
    i0.Expression<String>? givenName,
    i0.Expression<String>? familyName,
    i0.Expression<String>? timeZone,
    i0.Expression<String>? languageCode,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? updateTime,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (givenName != null) 'given_name': givenName,
      if (familyName != null) 'family_name': familyName,
      if (timeZone != null) 'time_zone': timeZone,
      if (languageCode != null) 'language_code': languageCode,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i2.CloudAuthUsersCompanion copyWith(
      {i0.Value<String>? userId,
      i0.Value<String?>? givenName,
      i0.Value<String?>? familyName,
      i0.Value<String?>? timeZone,
      i0.Value<String?>? languageCode,
      i0.Value<DateTime>? createTime,
      i0.Value<DateTime?>? updateTime,
      i0.Value<int>? rowid}) {
    return i2.CloudAuthUsersCompanion(
      userId: userId ?? this.userId,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      timeZone: timeZone ?? this.timeZone,
      languageCode: languageCode ?? this.languageCode,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (givenName.present) {
      map['given_name'] = i0.Variable<String>(givenName.value);
    }
    if (familyName.present) {
      map['family_name'] = i0.Variable<String>(familyName.value);
    }
    if (timeZone.present) {
      map['time_zone'] = i0.Variable<String>(timeZone.value);
    }
    if (languageCode.present) {
      map['language_code'] = i0.Variable<String>(languageCode.value);
    }
    if (createTime.present) {
      map['create_time'] =
          i0.Variable<DateTime>(createTime.value, const i3.TimestampType());
    }
    if (updateTime.present) {
      map['update_time'] =
          i0.Variable<DateTime>(updateTime.value, const i3.TimestampType());
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthUsersCompanion(')
          ..write('userId: $userId, ')
          ..write('givenName: $givenName, ')
          ..write('familyName: $familyName, ')
          ..write('timeZone: $timeZone, ')
          ..write('languageCode: $languageCode, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Trigger get cloudAuthUsersCreateTrg => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_users_create_trg BEFORE INSERT ON cloud_auth_users BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::User\', NEW.user_id);END',
    'cloud_auth_users_create_trg');
i0.Trigger get cloudAuthUsersDeleteTrg => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS cloud_auth_users_delete_trg AFTER DELETE ON cloud_auth_users BEGIN DELETE FROM cedar_relationships WHERE(entity_type = \'Celest::User\' AND entity_id = OLD.user_id)OR(parent_type = \'Celest::User\' AND parent_id = OLD.user_id);DELETE FROM cedar_entities WHERE entity_id = OLD.user_id AND entity_type = \'Celest::User\';END',
    'cloud_auth_users_delete_trg');

class CloudAuthUserEmails extends i0.Table
    with i0.TableInfo<CloudAuthUserEmails, i1.Email> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthUserEmails(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> userId = i0.GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> email = i0.GeneratedColumn<String>(
      'email', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<bool> isVerified = i0.GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const i0.CustomExpression('FALSE'));
  late final i0.GeneratedColumn<bool> isPrimary = i0.GeneratedColumn<bool>(
      'is_primary', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const i0.CustomExpression('FALSE'));
  @override
  List<i0.GeneratedColumn> get $columns =>
      [userId, email, isVerified, isPrimary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_user_emails';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {userId, email};
  @override
  i1.Email map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Email(
      email: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}email'])!,
      isVerified: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
      isPrimary: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}is_primary'])!,
    );
  }

  @override
  CloudAuthUserEmails createAlias(String alias) {
    return CloudAuthUserEmails(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT cloud_auth_user_emails_pk PRIMARY KEY(user_id, email)',
        'CONSTRAINT cloud_auth_user_emails_user_fk FOREIGN KEY(user_id)REFERENCES cloud_auth_users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthUserEmailsCompanion extends i0.UpdateCompanion<i1.Email> {
  final i0.Value<String> userId;
  final i0.Value<String> email;
  final i0.Value<bool> isVerified;
  final i0.Value<bool> isPrimary;
  const CloudAuthUserEmailsCompanion({
    this.userId = const i0.Value.absent(),
    this.email = const i0.Value.absent(),
    this.isVerified = const i0.Value.absent(),
    this.isPrimary = const i0.Value.absent(),
  });
  CloudAuthUserEmailsCompanion.insert({
    required String userId,
    required String email,
    this.isVerified = const i0.Value.absent(),
    this.isPrimary = const i0.Value.absent(),
  })  : userId = i0.Value(userId),
        email = i0.Value(email);
  static i0.Insertable<i1.Email> custom({
    i0.Expression<String>? userId,
    i0.Expression<String>? email,
    i0.Expression<bool>? isVerified,
    i0.Expression<bool>? isPrimary,
  }) {
    return i0.RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (email != null) 'email': email,
      if (isVerified != null) 'is_verified': isVerified,
      if (isPrimary != null) 'is_primary': isPrimary,
    });
  }

  i2.CloudAuthUserEmailsCompanion copyWith(
      {i0.Value<String>? userId,
      i0.Value<String>? email,
      i0.Value<bool>? isVerified,
      i0.Value<bool>? isPrimary}) {
    return i2.CloudAuthUserEmailsCompanion(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (email.present) {
      map['email'] = i0.Variable<String>(email.value);
    }
    if (isVerified.present) {
      map['is_verified'] = i0.Variable<bool>(isVerified.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = i0.Variable<bool>(isPrimary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthUserEmailsCompanion(')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class CloudAuthUserPhoneNumbers extends i0.Table
    with i0.TableInfo<CloudAuthUserPhoneNumbers, i1.PhoneNumber> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudAuthUserPhoneNumbers(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<String> userId = i0.GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> phoneNumber =
      i0.GeneratedColumn<String>('phone_number', aliasedName, false,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<bool> isVerified = i0.GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const i0.CustomExpression('FALSE'));
  late final i0.GeneratedColumn<bool> isPrimary = i0.GeneratedColumn<bool>(
      'is_primary', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const i0.CustomExpression('FALSE'));
  @override
  List<i0.GeneratedColumn> get $columns =>
      [userId, phoneNumber, isVerified, isPrimary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_auth_user_phone_numbers';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {userId, phoneNumber};
  @override
  i1.PhoneNumber map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.PhoneNumber(
      phoneNumber: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      isVerified: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
      isPrimary: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}is_primary'])!,
    );
  }

  @override
  CloudAuthUserPhoneNumbers createAlias(String alias) {
    return CloudAuthUserPhoneNumbers(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT cloud_auth_user_phone_numbers_pk PRIMARY KEY(user_id, phone_number)',
        'CONSTRAINT cloud_auth_user_phone_numbers_user_fk FOREIGN KEY(user_id)REFERENCES cloud_auth_users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CloudAuthUserPhoneNumbersCompanion
    extends i0.UpdateCompanion<i1.PhoneNumber> {
  final i0.Value<String> userId;
  final i0.Value<String> phoneNumber;
  final i0.Value<bool> isVerified;
  final i0.Value<bool> isPrimary;
  const CloudAuthUserPhoneNumbersCompanion({
    this.userId = const i0.Value.absent(),
    this.phoneNumber = const i0.Value.absent(),
    this.isVerified = const i0.Value.absent(),
    this.isPrimary = const i0.Value.absent(),
  });
  CloudAuthUserPhoneNumbersCompanion.insert({
    required String userId,
    required String phoneNumber,
    this.isVerified = const i0.Value.absent(),
    this.isPrimary = const i0.Value.absent(),
  })  : userId = i0.Value(userId),
        phoneNumber = i0.Value(phoneNumber);
  static i0.Insertable<i1.PhoneNumber> custom({
    i0.Expression<String>? userId,
    i0.Expression<String>? phoneNumber,
    i0.Expression<bool>? isVerified,
    i0.Expression<bool>? isPrimary,
  }) {
    return i0.RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (isVerified != null) 'is_verified': isVerified,
      if (isPrimary != null) 'is_primary': isPrimary,
    });
  }

  i2.CloudAuthUserPhoneNumbersCompanion copyWith(
      {i0.Value<String>? userId,
      i0.Value<String>? phoneNumber,
      i0.Value<bool>? isVerified,
      i0.Value<bool>? isPrimary}) {
    return i2.CloudAuthUserPhoneNumbersCompanion(
      userId: userId ?? this.userId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isVerified: isVerified ?? this.isVerified,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = i0.Variable<String>(phoneNumber.value);
    }
    if (isVerified.present) {
      map['is_verified'] = i0.Variable<bool>(isVerified.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = i0.Variable<bool>(isPrimary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudAuthUserPhoneNumbersCompanion(')
          ..write('userId: $userId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class CloudAuthUsersDrift extends i4.ModularAccessor {
  CloudAuthUsersDrift(i0.GeneratedDatabase db) : super(db);
  i5.Future<List<i1.User>> createUser(
      {required String userId,
      String? givenName,
      String? familyName,
      String? timeZone,
      String? languageCode}) {
    return customWriteReturning(
        'INSERT INTO cloud_auth_users (user_id, given_name, family_name, time_zone, language_code) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
        variables: [
          i0.Variable<String>(userId),
          i0.Variable<String>(givenName),
          i0.Variable<String>(familyName),
          i0.Variable<String>(timeZone),
          i0.Variable<String>(languageCode)
        ],
        updates: {
          cloudAuthUsers
        }).then((rows) => Future.wait(rows.map(cloudAuthUsers.mapFromRow)));
  }

  i0.Selectable<i1.User> getUser({required String userId}) {
    return customSelect('SELECT * FROM cloud_auth_users WHERE user_id = ?1',
        variables: [
          i0.Variable<String>(userId)
        ],
        readsFrom: {
          cloudAuthUsers,
        }).asyncMap(cloudAuthUsers.mapFromRow);
  }

  i0.Selectable<ListUsersResult> listUsers(
      {DateTime? startTime,
      required int offset,
      ListUsers$orderBy? order_by,
      required int limit}) {
    var $arrayStartIndex = 4;
    final generatedorder_by = $write(
        order_by?.call(this.cloudAuthUsers) ?? const i0.OrderBy.nothing(),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedorder_by.amountOfVariables;
    return customSelect(
        'WITH rowed AS (SELECT ROW_NUMBER()OVER (ORDER BY create_time DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE NO OTHERS) AS row_num, user_id FROM cloud_auth_users WHERE cloud_auth_users.create_time < coalesce(?1, unixepoch(\'now\', \'+1 second\', \'subsec\'))) SELECT row_num,"cloud_auth_users"."user_id" AS "nested_0.user_id", "cloud_auth_users"."given_name" AS "nested_0.given_name", "cloud_auth_users"."family_name" AS "nested_0.family_name", "cloud_auth_users"."time_zone" AS "nested_0.time_zone", "cloud_auth_users"."language_code" AS "nested_0.language_code", "cloud_auth_users"."create_time" AS "nested_0.create_time", "cloud_auth_users"."update_time" AS "nested_0.update_time", rowed.user_id AS "\$n_0", rowed.user_id AS "\$n_1" FROM cloud_auth_users INNER JOIN rowed ON cloud_auth_users.user_id = rowed.user_id WHERE row_num > ?2 ${generatedorder_by.sql} LIMIT ?3',
        variables: [
          i0.Variable<DateTime>(startTime),
          i0.Variable<int>(offset),
          i0.Variable<int>(limit),
          ...generatedorder_by.introducedVariables
        ],
        readsFrom: {
          cloudAuthUsers,
          cloudAuthUserEmails,
          cloudAuthUserPhoneNumbers,
          ...generatedorder_by.watchedTables,
        }).asyncMap((i0.QueryRow row) async => ListUsersResult(
          rowNum: row.read<int>('row_num'),
          cloudAuthUsers:
              await cloudAuthUsers.mapFromRow(row, tablePrefix: 'nested_0'),
          emails: await customSelect(
              'SELECT * FROM cloud_auth_user_emails WHERE user_id = ?1',
              variables: [
                i0.Variable<String>(row.read('\$n_0'))
              ],
              readsFrom: {
                cloudAuthUserEmails,
              }).asyncMap(cloudAuthUserEmails.mapFromRow).get(),
          phoneNumbers: await customSelect(
              'SELECT * FROM cloud_auth_user_phone_numbers WHERE user_id = ?1',
              variables: [
                i0.Variable<String>(row.read('\$n_1'))
              ],
              readsFrom: {
                cloudAuthUserPhoneNumbers,
              }).asyncMap(cloudAuthUserPhoneNumbers.mapFromRow).get(),
        ));
  }

  Future<int> deleteUser({required String userId}) {
    return customUpdate(
      'DELETE FROM cloud_auth_users WHERE user_id = ?1',
      variables: [i0.Variable<String>(userId)],
      updates: {cloudAuthUsers},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i5.Future<List<i1.Email>> upsertUserEmail(
      {required String userId,
      required String email,
      bool? isVerified,
      bool? isPrimary}) {
    return customWriteReturning(
        'INSERT INTO cloud_auth_user_emails (user_id, email, is_verified, is_primary) VALUES (?1, ?2, coalesce(?3, FALSE), coalesce(?4, (SELECT count(*) = 0 FROM cloud_auth_user_emails WHERE user_id = ?1))) ON CONFLICT (user_id, email) DO UPDATE SET is_verified = coalesce(?3, is_verified), is_primary = coalesce(?4, is_primary) RETURNING *',
        variables: [
          i0.Variable<String>(userId),
          i0.Variable<String>(email),
          i0.Variable<bool>(isVerified),
          i0.Variable<bool>(isPrimary)
        ],
        updates: {
          cloudAuthUserEmails
        }).then(
        (rows) => Future.wait(rows.map(cloudAuthUserEmails.mapFromRow)));
  }

  i0.Selectable<i1.Email> getUserEmails({required String userId}) {
    return customSelect(
        'SELECT * FROM cloud_auth_user_emails WHERE user_id = ?1',
        variables: [
          i0.Variable<String>(userId)
        ],
        readsFrom: {
          cloudAuthUserEmails,
        }).asyncMap(cloudAuthUserEmails.mapFromRow);
  }

  i0.Selectable<LookupUserByEmailResult> lookupUserByEmail(
      {required String email}) {
    return customSelect(
        'SELECT"cloud_auth_users"."user_id" AS "nested_0.user_id", "cloud_auth_users"."given_name" AS "nested_0.given_name", "cloud_auth_users"."family_name" AS "nested_0.family_name", "cloud_auth_users"."time_zone" AS "nested_0.time_zone", "cloud_auth_users"."language_code" AS "nested_0.language_code", "cloud_auth_users"."create_time" AS "nested_0.create_time", "cloud_auth_users"."update_time" AS "nested_0.update_time","cloud_auth_user_emails"."user_id" AS "nested_1.user_id", "cloud_auth_user_emails"."email" AS "nested_1.email", "cloud_auth_user_emails"."is_verified" AS "nested_1.is_verified", "cloud_auth_user_emails"."is_primary" AS "nested_1.is_primary" FROM cloud_auth_users INNER JOIN cloud_auth_user_emails ON cloud_auth_users.user_id = cloud_auth_user_emails.user_id WHERE cloud_auth_user_emails.email = ?1 AND cloud_auth_user_emails.is_verified ORDER BY cloud_auth_user_emails.is_primary DESC',
        variables: [
          i0.Variable<String>(email)
        ],
        readsFrom: {
          cloudAuthUsers,
          cloudAuthUserEmails,
        }).asyncMap((i0.QueryRow row) async => LookupUserByEmailResult(
          cloudAuthUsers:
              await cloudAuthUsers.mapFromRow(row, tablePrefix: 'nested_0'),
          cloudAuthUserEmails: await cloudAuthUserEmails.mapFromRow(row,
              tablePrefix: 'nested_1'),
        ));
  }

  Future<int> deleteUserEmail({required String userId, required String email}) {
    return customUpdate(
      'DELETE FROM cloud_auth_user_emails WHERE user_id = ?1 AND email = ?2',
      variables: [i0.Variable<String>(userId), i0.Variable<String>(email)],
      updates: {cloudAuthUserEmails},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i5.Future<List<i1.PhoneNumber>> upsertUserPhoneNumber(
      {required String userId,
      required String phoneNumber,
      bool? isVerified,
      bool? isPrimary}) {
    return customWriteReturning(
        'INSERT INTO cloud_auth_user_phone_numbers (user_id, phone_number, is_verified, is_primary) VALUES (?1, ?2, coalesce(?3, FALSE), coalesce(?4, (SELECT count(*) = 0 FROM cloud_auth_user_phone_numbers WHERE user_id = ?1))) ON CONFLICT (user_id, phone_number) DO UPDATE SET is_verified = coalesce(?3, is_verified), is_primary = coalesce(?4, is_primary) RETURNING *',
        variables: [
          i0.Variable<String>(userId),
          i0.Variable<String>(phoneNumber),
          i0.Variable<bool>(isVerified),
          i0.Variable<bool>(isPrimary)
        ],
        updates: {
          cloudAuthUserPhoneNumbers
        }).then(
        (rows) => Future.wait(rows.map(cloudAuthUserPhoneNumbers.mapFromRow)));
  }

  i0.Selectable<i1.PhoneNumber> getUserPhoneNumbers({required String userId}) {
    return customSelect(
        'SELECT * FROM cloud_auth_user_phone_numbers WHERE user_id = ?1',
        variables: [
          i0.Variable<String>(userId)
        ],
        readsFrom: {
          cloudAuthUserPhoneNumbers,
        }).asyncMap(cloudAuthUserPhoneNumbers.mapFromRow);
  }

  i0.Selectable<LookupUserByPhoneResult> lookupUserByPhone(
      {required String phoneNumber}) {
    return customSelect(
        'SELECT"cloud_auth_users"."user_id" AS "nested_0.user_id", "cloud_auth_users"."given_name" AS "nested_0.given_name", "cloud_auth_users"."family_name" AS "nested_0.family_name", "cloud_auth_users"."time_zone" AS "nested_0.time_zone", "cloud_auth_users"."language_code" AS "nested_0.language_code", "cloud_auth_users"."create_time" AS "nested_0.create_time", "cloud_auth_users"."update_time" AS "nested_0.update_time","cloud_auth_user_phone_numbers"."user_id" AS "nested_1.user_id", "cloud_auth_user_phone_numbers"."phone_number" AS "nested_1.phone_number", "cloud_auth_user_phone_numbers"."is_verified" AS "nested_1.is_verified", "cloud_auth_user_phone_numbers"."is_primary" AS "nested_1.is_primary" FROM cloud_auth_users INNER JOIN cloud_auth_user_phone_numbers ON cloud_auth_users.user_id = cloud_auth_user_phone_numbers.user_id WHERE cloud_auth_user_phone_numbers.phone_number = ?1 AND cloud_auth_user_phone_numbers.is_verified ORDER BY cloud_auth_user_phone_numbers.is_primary DESC',
        variables: [
          i0.Variable<String>(phoneNumber)
        ],
        readsFrom: {
          cloudAuthUsers,
          cloudAuthUserPhoneNumbers,
        }).asyncMap((i0.QueryRow row) async => LookupUserByPhoneResult(
          cloudAuthUsers:
              await cloudAuthUsers.mapFromRow(row, tablePrefix: 'nested_0'),
          cloudAuthUserPhoneNumbers: await cloudAuthUserPhoneNumbers
              .mapFromRow(row, tablePrefix: 'nested_1'),
        ));
  }

  Future<int> deleteUserPhoneNumber(
      {required String userId, required String phoneNumber}) {
    return customUpdate(
      'DELETE FROM cloud_auth_user_phone_numbers WHERE user_id = ?1 AND phone_number = ?2',
      variables: [
        i0.Variable<String>(userId),
        i0.Variable<String>(phoneNumber)
      ],
      updates: {cloudAuthUserPhoneNumbers},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i2.CloudAuthUsers get cloudAuthUsers =>
      i4.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.CloudAuthUsers>('cloud_auth_users');
  i2.CloudAuthUserEmails get cloudAuthUserEmails =>
      i4.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.CloudAuthUserEmails>('cloud_auth_user_emails');
  i2.CloudAuthUserPhoneNumbers get cloudAuthUserPhoneNumbers =>
      i4.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.CloudAuthUserPhoneNumbers>(
              'cloud_auth_user_phone_numbers');
  i6.CedarDrift get cedarDrift => this.accessor(i6.CedarDrift.new);
}

class ListUsersResult {
  final int rowNum;
  final i1.User cloudAuthUsers;
  final List<i1.Email> emails;
  final List<i1.PhoneNumber> phoneNumbers;
  ListUsersResult({
    required this.rowNum,
    required this.cloudAuthUsers,
    required this.emails,
    required this.phoneNumbers,
  });
}

typedef ListUsers$orderBy = i0.OrderBy Function(
    i2.CloudAuthUsers cloud_auth_users);

class LookupUserByEmailResult {
  final i1.User cloudAuthUsers;
  final i1.Email cloudAuthUserEmails;
  LookupUserByEmailResult({
    required this.cloudAuthUsers,
    required this.cloudAuthUserEmails,
  });
}

class LookupUserByPhoneResult {
  final i1.User cloudAuthUsers;
  final i1.PhoneNumber cloudAuthUserPhoneNumbers;
  LookupUserByPhoneResult({
    required this.cloudAuthUsers,
    required this.cloudAuthUserPhoneNumbers,
  });
}

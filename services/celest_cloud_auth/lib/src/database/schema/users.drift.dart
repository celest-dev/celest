// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_core/src/auth/user.dart' as i1;
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart' as i2;
import 'package:celest_cloud_auth/src/database/database_model.dart' as i3;
import 'package:drift/internal/modular.dart' as i4;
import 'dart:async' as i5;

typedef $UsersCreateCompanionBuilder = i2.UsersCompanion Function({
  required String userId,
  i0.Value<String?> givenName,
  i0.Value<String?> familyName,
  i0.Value<String?> timeZone,
  i0.Value<String?> languageCode,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> updateTime,
  i0.Value<int> rowid,
});
typedef $UsersUpdateCompanionBuilder = i2.UsersCompanion Function({
  i0.Value<String> userId,
  i0.Value<String?> givenName,
  i0.Value<String?> familyName,
  i0.Value<String?> timeZone,
  i0.Value<String?> languageCode,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> updateTime,
  i0.Value<int> rowid,
});

class $UsersFilterComposer extends i0.Composer<i0.GeneratedDatabase, i2.Users> {
  $UsersFilterComposer({
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

class $UsersOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.Users> {
  $UsersOrderingComposer({
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

class $UsersAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.Users> {
  $UsersAnnotationComposer({
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

class $UsersTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.Users,
    i1.User,
    i2.$UsersFilterComposer,
    i2.$UsersOrderingComposer,
    i2.$UsersAnnotationComposer,
    $UsersCreateCompanionBuilder,
    $UsersUpdateCompanionBuilder,
    (i1.User, i0.BaseReferences<i0.GeneratedDatabase, i2.Users, i1.User>),
    i1.User,
    i0.PrefetchHooks Function()> {
  $UsersTableManager(i0.GeneratedDatabase db, i2.Users table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$UsersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$UsersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$UsersAnnotationComposer($db: db, $table: table),
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
              i2.UsersCompanion(
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
              i2.UsersCompanion.insert(
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

typedef $UsersProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.Users,
    i1.User,
    i2.$UsersFilterComposer,
    i2.$UsersOrderingComposer,
    i2.$UsersAnnotationComposer,
    $UsersCreateCompanionBuilder,
    $UsersUpdateCompanionBuilder,
    (i1.User, i0.BaseReferences<i0.GeneratedDatabase, i2.Users, i1.User>),
    i1.User,
    i0.PrefetchHooks Function()>;
typedef $UserEmailsCreateCompanionBuilder = i2.UserEmailsCompanion Function({
  required String userId,
  required String email,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});
typedef $UserEmailsUpdateCompanionBuilder = i2.UserEmailsCompanion Function({
  i0.Value<String> userId,
  i0.Value<String> email,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});

class $UserEmailsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.UserEmails> {
  $UserEmailsFilterComposer({
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

class $UserEmailsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.UserEmails> {
  $UserEmailsOrderingComposer({
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

class $UserEmailsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.UserEmails> {
  $UserEmailsAnnotationComposer({
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

class $UserEmailsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.UserEmails,
    i1.Email,
    i2.$UserEmailsFilterComposer,
    i2.$UserEmailsOrderingComposer,
    i2.$UserEmailsAnnotationComposer,
    $UserEmailsCreateCompanionBuilder,
    $UserEmailsUpdateCompanionBuilder,
    (
      i1.Email,
      i0.BaseReferences<i0.GeneratedDatabase, i2.UserEmails, i1.Email>
    ),
    i1.Email,
    i0.PrefetchHooks Function()> {
  $UserEmailsTableManager(i0.GeneratedDatabase db, i2.UserEmails table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$UserEmailsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$UserEmailsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$UserEmailsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> userId = const i0.Value.absent(),
            i0.Value<String> email = const i0.Value.absent(),
            i0.Value<bool> isVerified = const i0.Value.absent(),
            i0.Value<bool> isPrimary = const i0.Value.absent(),
          }) =>
              i2.UserEmailsCompanion(
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
              i2.UserEmailsCompanion.insert(
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

typedef $UserEmailsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.UserEmails,
    i1.Email,
    i2.$UserEmailsFilterComposer,
    i2.$UserEmailsOrderingComposer,
    i2.$UserEmailsAnnotationComposer,
    $UserEmailsCreateCompanionBuilder,
    $UserEmailsUpdateCompanionBuilder,
    (
      i1.Email,
      i0.BaseReferences<i0.GeneratedDatabase, i2.UserEmails, i1.Email>
    ),
    i1.Email,
    i0.PrefetchHooks Function()>;
typedef $UserPhoneNumbersCreateCompanionBuilder = i2.UserPhoneNumbersCompanion
    Function({
  required String userId,
  required String phoneNumber,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});
typedef $UserPhoneNumbersUpdateCompanionBuilder = i2.UserPhoneNumbersCompanion
    Function({
  i0.Value<String> userId,
  i0.Value<String> phoneNumber,
  i0.Value<bool> isVerified,
  i0.Value<bool> isPrimary,
});

class $UserPhoneNumbersFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.UserPhoneNumbers> {
  $UserPhoneNumbersFilterComposer({
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

class $UserPhoneNumbersOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.UserPhoneNumbers> {
  $UserPhoneNumbersOrderingComposer({
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

class $UserPhoneNumbersAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.UserPhoneNumbers> {
  $UserPhoneNumbersAnnotationComposer({
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

class $UserPhoneNumbersTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.UserPhoneNumbers,
    i1.PhoneNumber,
    i2.$UserPhoneNumbersFilterComposer,
    i2.$UserPhoneNumbersOrderingComposer,
    i2.$UserPhoneNumbersAnnotationComposer,
    $UserPhoneNumbersCreateCompanionBuilder,
    $UserPhoneNumbersUpdateCompanionBuilder,
    (
      i1.PhoneNumber,
      i0
      .BaseReferences<i0.GeneratedDatabase, i2.UserPhoneNumbers, i1.PhoneNumber>
    ),
    i1.PhoneNumber,
    i0.PrefetchHooks Function()> {
  $UserPhoneNumbersTableManager(
      i0.GeneratedDatabase db, i2.UserPhoneNumbers table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$UserPhoneNumbersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$UserPhoneNumbersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$UserPhoneNumbersAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> userId = const i0.Value.absent(),
            i0.Value<String> phoneNumber = const i0.Value.absent(),
            i0.Value<bool> isVerified = const i0.Value.absent(),
            i0.Value<bool> isPrimary = const i0.Value.absent(),
          }) =>
              i2.UserPhoneNumbersCompanion(
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
              i2.UserPhoneNumbersCompanion.insert(
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

typedef $UserPhoneNumbersProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.UserPhoneNumbers,
    i1.PhoneNumber,
    i2.$UserPhoneNumbersFilterComposer,
    i2.$UserPhoneNumbersOrderingComposer,
    i2.$UserPhoneNumbersAnnotationComposer,
    $UserPhoneNumbersCreateCompanionBuilder,
    $UserPhoneNumbersUpdateCompanionBuilder,
    (
      i1.PhoneNumber,
      i0
      .BaseReferences<i0.GeneratedDatabase, i2.UserPhoneNumbers, i1.PhoneNumber>
    ),
    i1.PhoneNumber,
    i0.PrefetchHooks Function()>;

class Users extends i0.Table with i0.TableInfo<Users, i1.User> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'users';
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
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UsersCompanion extends i0.UpdateCompanion<i1.User> {
  final i0.Value<String> userId;
  final i0.Value<String?> givenName;
  final i0.Value<String?> familyName;
  final i0.Value<String?> timeZone;
  final i0.Value<String?> languageCode;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime?> updateTime;
  final i0.Value<int> rowid;
  const UsersCompanion({
    this.userId = const i0.Value.absent(),
    this.givenName = const i0.Value.absent(),
    this.familyName = const i0.Value.absent(),
    this.timeZone = const i0.Value.absent(),
    this.languageCode = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  UsersCompanion.insert({
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

  i2.UsersCompanion copyWith(
      {i0.Value<String>? userId,
      i0.Value<String?>? givenName,
      i0.Value<String?>? familyName,
      i0.Value<String?>? timeZone,
      i0.Value<String?>? languageCode,
      i0.Value<DateTime>? createTime,
      i0.Value<DateTime?>? updateTime,
      i0.Value<int>? rowid}) {
    return i2.UsersCompanion(
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
    return (StringBuffer('UsersCompanion(')
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

i0.Trigger get usersCreate => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS users_create BEFORE INSERT ON users BEGIN INSERT INTO cedar_entities (entity_type, entity_id) VALUES (\'Celest::User\', NEW.user_id);END',
    'users_create');
i0.Trigger get usersDelete => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS users_delete AFTER DELETE ON users BEGIN DELETE FROM cedar_relationships WHERE(entity_type = \'Celest::User\' AND entity_id = OLD.user_id)OR(parent_type = \'Celest::User\' AND parent_id = OLD.user_id);DELETE FROM cedar_entities WHERE entity_id = OLD.user_id AND entity_type = \'Celest::User\';END',
    'users_delete');

class UserEmails extends i0.Table with i0.TableInfo<UserEmails, i1.Email> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserEmails(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'user_emails';
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
  UserEmails createAlias(String alias) {
    return UserEmails(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT user_emails_pk PRIMARY KEY(user_id, email)',
        'CONSTRAINT user_emails_user_fk FOREIGN KEY(user_id)REFERENCES users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class UserEmailsCompanion extends i0.UpdateCompanion<i1.Email> {
  final i0.Value<String> userId;
  final i0.Value<String> email;
  final i0.Value<bool> isVerified;
  final i0.Value<bool> isPrimary;
  const UserEmailsCompanion({
    this.userId = const i0.Value.absent(),
    this.email = const i0.Value.absent(),
    this.isVerified = const i0.Value.absent(),
    this.isPrimary = const i0.Value.absent(),
  });
  UserEmailsCompanion.insert({
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

  i2.UserEmailsCompanion copyWith(
      {i0.Value<String>? userId,
      i0.Value<String>? email,
      i0.Value<bool>? isVerified,
      i0.Value<bool>? isPrimary}) {
    return i2.UserEmailsCompanion(
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
    return (StringBuffer('UserEmailsCompanion(')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class UserPhoneNumbers extends i0.Table
    with i0.TableInfo<UserPhoneNumbers, i1.PhoneNumber> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserPhoneNumbers(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'user_phone_numbers';
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
  UserPhoneNumbers createAlias(String alias) {
    return UserPhoneNumbers(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT user_phone_numbers_pk PRIMARY KEY(user_id, phone_number)',
        'CONSTRAINT user_phone_numbers_user_fk FOREIGN KEY(user_id)REFERENCES users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class UserPhoneNumbersCompanion extends i0.UpdateCompanion<i1.PhoneNumber> {
  final i0.Value<String> userId;
  final i0.Value<String> phoneNumber;
  final i0.Value<bool> isVerified;
  final i0.Value<bool> isPrimary;
  const UserPhoneNumbersCompanion({
    this.userId = const i0.Value.absent(),
    this.phoneNumber = const i0.Value.absent(),
    this.isVerified = const i0.Value.absent(),
    this.isPrimary = const i0.Value.absent(),
  });
  UserPhoneNumbersCompanion.insert({
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

  i2.UserPhoneNumbersCompanion copyWith(
      {i0.Value<String>? userId,
      i0.Value<String>? phoneNumber,
      i0.Value<bool>? isVerified,
      i0.Value<bool>? isPrimary}) {
    return i2.UserPhoneNumbersCompanion(
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
    return (StringBuffer('UserPhoneNumbersCompanion(')
          ..write('userId: $userId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class UsersDrift extends i4.ModularAccessor {
  UsersDrift(i0.GeneratedDatabase db) : super(db);
  i5.Future<List<i1.User>> createUser(
      {required String userId,
      String? givenName,
      String? familyName,
      String? timeZone,
      String? languageCode}) {
    return customWriteReturning(
        'INSERT INTO users (user_id, given_name, family_name, time_zone, language_code) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
        variables: [
          i0.Variable<String>(userId),
          i0.Variable<String>(givenName),
          i0.Variable<String>(familyName),
          i0.Variable<String>(timeZone),
          i0.Variable<String>(languageCode)
        ],
        updates: {
          users
        }).then((rows) => Future.wait(rows.map(users.mapFromRow)));
  }

  i0.Selectable<i1.User> getUser({required String userId}) {
    return customSelect('SELECT * FROM users WHERE user_id = ?1', variables: [
      i0.Variable<String>(userId)
    ], readsFrom: {
      users,
    }).asyncMap(users.mapFromRow);
  }

  Future<int> deleteUser({required String userId}) {
    return customUpdate(
      'DELETE FROM users WHERE user_id = ?1',
      variables: [i0.Variable<String>(userId)],
      updates: {users},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i5.Future<List<i1.Email>> upsertUserEmail(
      {required String userId,
      required String email,
      bool? isVerified,
      bool? isPrimary}) {
    return customWriteReturning(
        'INSERT INTO user_emails (user_id, email, is_verified, is_primary) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (user_id, email) DO UPDATE SET is_verified = coalesce(excluded.is_verified, is_verified), is_primary = coalesce(excluded.is_primary, is_primary) RETURNING *',
        variables: [
          i0.Variable<String>(userId),
          i0.Variable<String>(email),
          i0.Variable<bool>(isVerified),
          i0.Variable<bool>(isPrimary)
        ],
        updates: {
          userEmails
        }).then((rows) => Future.wait(rows.map(userEmails.mapFromRow)));
  }

  i0.Selectable<i1.Email> getUserEmails({required String userId}) {
    return customSelect('SELECT * FROM user_emails WHERE user_id = ?1',
        variables: [
          i0.Variable<String>(userId)
        ],
        readsFrom: {
          userEmails,
        }).asyncMap(userEmails.mapFromRow);
  }

  i0.Selectable<LookupUserByEmailResult> lookupUserByEmail(
      {required String email}) {
    return customSelect(
        'SELECT"users"."user_id" AS "nested_0.user_id", "users"."given_name" AS "nested_0.given_name", "users"."family_name" AS "nested_0.family_name", "users"."time_zone" AS "nested_0.time_zone", "users"."language_code" AS "nested_0.language_code", "users"."create_time" AS "nested_0.create_time", "users"."update_time" AS "nested_0.update_time","user_emails"."user_id" AS "nested_1.user_id", "user_emails"."email" AS "nested_1.email", "user_emails"."is_verified" AS "nested_1.is_verified", "user_emails"."is_primary" AS "nested_1.is_primary" FROM users INNER JOIN user_emails ON users.user_id = user_emails.user_id WHERE user_emails.email = ?1 AND user_emails.is_verified ORDER BY user_emails.is_primary DESC',
        variables: [
          i0.Variable<String>(email)
        ],
        readsFrom: {
          users,
          userEmails,
        }).asyncMap((i0.QueryRow row) async => LookupUserByEmailResult(
          users: await users.mapFromRow(row, tablePrefix: 'nested_0'),
          userEmails: await userEmails.mapFromRow(row, tablePrefix: 'nested_1'),
        ));
  }

  Future<int> deleteUserEmail({required String userId, required String email}) {
    return customUpdate(
      'DELETE FROM user_emails WHERE user_id = ?1 AND email = ?2',
      variables: [i0.Variable<String>(userId), i0.Variable<String>(email)],
      updates: {userEmails},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i5.Future<List<i1.PhoneNumber>> upsertUserPhoneNumber(
      {required String userId,
      required String phoneNumber,
      bool? isVerified,
      bool? isPrimary}) {
    return customWriteReturning(
        'INSERT INTO user_phone_numbers (user_id, phone_number, is_verified, is_primary) VALUES (?1, ?2, ?3, ?4) ON CONFLICT (user_id, phone_number) DO UPDATE SET is_verified = coalesce(excluded.is_verified, is_verified), is_primary = coalesce(excluded.is_primary, is_primary) RETURNING *',
        variables: [
          i0.Variable<String>(userId),
          i0.Variable<String>(phoneNumber),
          i0.Variable<bool>(isVerified),
          i0.Variable<bool>(isPrimary)
        ],
        updates: {
          userPhoneNumbers
        }).then((rows) => Future.wait(rows.map(userPhoneNumbers.mapFromRow)));
  }

  i0.Selectable<i1.PhoneNumber> getUserPhoneNumbers({required String userId}) {
    return customSelect('SELECT * FROM user_phone_numbers WHERE user_id = ?1',
        variables: [
          i0.Variable<String>(userId)
        ],
        readsFrom: {
          userPhoneNumbers,
        }).asyncMap(userPhoneNumbers.mapFromRow);
  }

  i0.Selectable<LookupUserByPhoneResult> lookupUserByPhone(
      {required String phoneNumber}) {
    return customSelect(
        'SELECT"users"."user_id" AS "nested_0.user_id", "users"."given_name" AS "nested_0.given_name", "users"."family_name" AS "nested_0.family_name", "users"."time_zone" AS "nested_0.time_zone", "users"."language_code" AS "nested_0.language_code", "users"."create_time" AS "nested_0.create_time", "users"."update_time" AS "nested_0.update_time","user_phone_numbers"."user_id" AS "nested_1.user_id", "user_phone_numbers"."phone_number" AS "nested_1.phone_number", "user_phone_numbers"."is_verified" AS "nested_1.is_verified", "user_phone_numbers"."is_primary" AS "nested_1.is_primary" FROM users INNER JOIN user_phone_numbers ON users.user_id = user_phone_numbers.user_id WHERE user_phone_numbers.phone_number = ?1 AND user_phone_numbers.is_verified ORDER BY user_phone_numbers.is_primary DESC',
        variables: [
          i0.Variable<String>(phoneNumber)
        ],
        readsFrom: {
          users,
          userPhoneNumbers,
        }).asyncMap((i0.QueryRow row) async => LookupUserByPhoneResult(
          users: await users.mapFromRow(row, tablePrefix: 'nested_0'),
          userPhoneNumbers:
              await userPhoneNumbers.mapFromRow(row, tablePrefix: 'nested_1'),
        ));
  }

  Future<int> deleteUserPhoneNumber(
      {required String userId, required String phoneNumber}) {
    return customUpdate(
      'DELETE FROM user_phone_numbers WHERE user_id = ?1 AND phone_number = ?2',
      variables: [
        i0.Variable<String>(userId),
        i0.Variable<String>(phoneNumber)
      ],
      updates: {userPhoneNumbers},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i2.Users get users =>
      i4.ReadDatabaseContainer(attachedDatabase).resultSet<i2.Users>('users');
  i2.UserEmails get userEmails => i4.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i2.UserEmails>('user_emails');
  i2.UserPhoneNumbers get userPhoneNumbers =>
      i4.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.UserPhoneNumbers>('user_phone_numbers');
}

class LookupUserByEmailResult {
  final i1.User users;
  final i1.Email userEmails;
  LookupUserByEmailResult({
    required this.users,
    required this.userEmails,
  });
}

class LookupUserByPhoneResult {
  final i1.User users;
  final i1.PhoneNumber userPhoneNumbers;
  LookupUserByPhoneResult({
    required this.users,
    required this.userPhoneNumbers,
  });
}

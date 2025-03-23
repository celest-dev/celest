// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cloud_auth/src/crypto/crypto_key_model.dart' as i1;
import 'dart:typed_data' as i2;
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart' as i3;
import 'package:celest_cloud_auth/src/authentication/authentication_model.dart'
    as i4;
import 'package:celest_cloud_auth/src/database/database_model.dart' as i5;
import 'package:celest_cloud_auth/src/database/schema/converters/auth_converters.dart'
    as i6;
import 'package:drift/internal/modular.dart' as i7;
import 'dart:async' as i8;
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart' as i9;
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart' as i10;

typedef $CryptoKeysCreateCompanionBuilder = i3.CryptoKeysCompanion Function({
  required i2.Uint8List cryptoKeyId,
  required String keyPurpose,
  required String keyAlgorithm,
  i0.Value<i2.Uint8List?> keyMaterial,
  i0.Value<String?> externalCryptoKeyId,
  i0.Value<int> rowid,
});
typedef $CryptoKeysUpdateCompanionBuilder = i3.CryptoKeysCompanion Function({
  i0.Value<i2.Uint8List> cryptoKeyId,
  i0.Value<String> keyPurpose,
  i0.Value<String> keyAlgorithm,
  i0.Value<i2.Uint8List?> keyMaterial,
  i0.Value<String?> externalCryptoKeyId,
  i0.Value<int> rowid,
});

class $CryptoKeysFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.CryptoKeys> {
  $CryptoKeysFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get keyPurpose => $composableBuilder(
      column: $table.keyPurpose, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get keyAlgorithm => $composableBuilder(
      column: $table.keyAlgorithm,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<i2.Uint8List> get keyMaterial => $composableBuilder(
      column: $table.keyMaterial,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get externalCryptoKeyId => $composableBuilder(
      column: $table.externalCryptoKeyId,
      builder: (column) => i0.ColumnFilters(column));
}

class $CryptoKeysOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.CryptoKeys> {
  $CryptoKeysOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get keyPurpose => $composableBuilder(
      column: $table.keyPurpose,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get keyAlgorithm => $composableBuilder(
      column: $table.keyAlgorithm,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i2.Uint8List> get keyMaterial => $composableBuilder(
      column: $table.keyMaterial,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get externalCryptoKeyId => $composableBuilder(
      column: $table.externalCryptoKeyId,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CryptoKeysAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.CryptoKeys> {
  $CryptoKeysAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId, builder: (column) => column);

  i0.GeneratedColumn<String> get keyPurpose => $composableBuilder(
      column: $table.keyPurpose, builder: (column) => column);

  i0.GeneratedColumn<String> get keyAlgorithm => $composableBuilder(
      column: $table.keyAlgorithm, builder: (column) => column);

  i0.GeneratedColumn<i2.Uint8List> get keyMaterial => $composableBuilder(
      column: $table.keyMaterial, builder: (column) => column);

  i0.GeneratedColumn<String> get externalCryptoKeyId => $composableBuilder(
      column: $table.externalCryptoKeyId, builder: (column) => column);
}

class $CryptoKeysTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i3.CryptoKeys,
    i1.CryptoKey,
    i3.$CryptoKeysFilterComposer,
    i3.$CryptoKeysOrderingComposer,
    i3.$CryptoKeysAnnotationComposer,
    $CryptoKeysCreateCompanionBuilder,
    $CryptoKeysUpdateCompanionBuilder,
    (
      i1.CryptoKey,
      i0.BaseReferences<i0.GeneratedDatabase, i3.CryptoKeys, i1.CryptoKey>
    ),
    i1.CryptoKey,
    i0.PrefetchHooks Function()> {
  $CryptoKeysTableManager(i0.GeneratedDatabase db, i3.CryptoKeys table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i3.$CryptoKeysFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i3.$CryptoKeysOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i3.$CryptoKeysAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<i2.Uint8List> cryptoKeyId = const i0.Value.absent(),
            i0.Value<String> keyPurpose = const i0.Value.absent(),
            i0.Value<String> keyAlgorithm = const i0.Value.absent(),
            i0.Value<i2.Uint8List?> keyMaterial = const i0.Value.absent(),
            i0.Value<String?> externalCryptoKeyId = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i3.CryptoKeysCompanion(
            cryptoKeyId: cryptoKeyId,
            keyPurpose: keyPurpose,
            keyAlgorithm: keyAlgorithm,
            keyMaterial: keyMaterial,
            externalCryptoKeyId: externalCryptoKeyId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required i2.Uint8List cryptoKeyId,
            required String keyPurpose,
            required String keyAlgorithm,
            i0.Value<i2.Uint8List?> keyMaterial = const i0.Value.absent(),
            i0.Value<String?> externalCryptoKeyId = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i3.CryptoKeysCompanion.insert(
            cryptoKeyId: cryptoKeyId,
            keyPurpose: keyPurpose,
            keyAlgorithm: keyAlgorithm,
            keyMaterial: keyMaterial,
            externalCryptoKeyId: externalCryptoKeyId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CryptoKeysProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i3.CryptoKeys,
    i1.CryptoKey,
    i3.$CryptoKeysFilterComposer,
    i3.$CryptoKeysOrderingComposer,
    i3.$CryptoKeysAnnotationComposer,
    $CryptoKeysCreateCompanionBuilder,
    $CryptoKeysUpdateCompanionBuilder,
    (
      i1.CryptoKey,
      i0.BaseReferences<i0.GeneratedDatabase, i3.CryptoKeys, i1.CryptoKey>
    ),
    i1.CryptoKey,
    i0.PrefetchHooks Function()>;
typedef $SessionsCreateCompanionBuilder = i3.SessionsCompanion Function({
  i0.Value<int> rowid,
  required String sessionId,
  required i2.Uint8List cryptoKeyId,
  required String userId,
  i0.Value<i4.SessionClient?> clientInfo,
  required i4.AuthenticationFactor authenticationFactor,
  i0.Value<i4.SessionState?> state,
  i0.Value<String?> ipAddress,
  i0.Value<String?> externalSessionId,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> updateTime,
  required DateTime expireTime,
  i0.Value<DateTime?> cancelTime,
});
typedef $SessionsUpdateCompanionBuilder = i3.SessionsCompanion Function({
  i0.Value<int> rowid,
  i0.Value<String> sessionId,
  i0.Value<i2.Uint8List> cryptoKeyId,
  i0.Value<String> userId,
  i0.Value<i4.SessionClient?> clientInfo,
  i0.Value<i4.AuthenticationFactor> authenticationFactor,
  i0.Value<i4.SessionState?> state,
  i0.Value<String?> ipAddress,
  i0.Value<String?> externalSessionId,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> updateTime,
  i0.Value<DateTime> expireTime,
  i0.Value<DateTime?> cancelTime,
});

class $SessionsFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.Sessions> {
  $SessionsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get rowid => $composableBuilder(
      column: $table.rowid, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i4.SessionClient?, i4.SessionClient,
          i2.Uint8List>
      get clientInfo => $composableBuilder(
          column: $table.clientInfo,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnWithTypeConverterFilters<i4.AuthenticationFactor,
          i4.AuthenticationFactor, i2.Uint8List>
      get authenticationFactor => $composableBuilder(
          column: $table.authenticationFactor,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnWithTypeConverterFilters<i4.SessionState?, i4.SessionState,
          i2.Uint8List>
      get state => $composableBuilder(
          column: $table.state,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get ipAddress => $composableBuilder(
      column: $table.ipAddress, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get externalSessionId => $composableBuilder(
      column: $table.externalSessionId,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get cancelTime => $composableBuilder(
      column: $table.cancelTime, builder: (column) => i0.ColumnFilters(column));
}

class $SessionsOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.Sessions> {
  $SessionsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get rowid => $composableBuilder(
      column: $table.rowid, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i2.Uint8List> get clientInfo => $composableBuilder(
      column: $table.clientInfo,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i2.Uint8List> get authenticationFactor =>
      $composableBuilder(
          column: $table.authenticationFactor,
          builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i2.Uint8List> get state => $composableBuilder(
      column: $table.state, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get ipAddress => $composableBuilder(
      column: $table.ipAddress,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get externalSessionId => $composableBuilder(
      column: $table.externalSessionId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get createTime => $composableBuilder(
      column: $table.createTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get cancelTime => $composableBuilder(
      column: $table.cancelTime,
      builder: (column) => i0.ColumnOrderings(column));
}

class $SessionsAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.Sessions> {
  $SessionsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get rowid =>
      $composableBuilder(column: $table.rowid, builder: (column) => column);

  i0.GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  i0.GeneratedColumn<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId, builder: (column) => column);

  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i4.SessionClient?, i2.Uint8List>
      get clientInfo => $composableBuilder(
          column: $table.clientInfo, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i4.AuthenticationFactor, i2.Uint8List>
      get authenticationFactor => $composableBuilder(
          column: $table.authenticationFactor, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i4.SessionState?, i2.Uint8List>
      get state =>
          $composableBuilder(column: $table.state, builder: (column) => column);

  i0.GeneratedColumn<String> get ipAddress =>
      $composableBuilder(column: $table.ipAddress, builder: (column) => column);

  i0.GeneratedColumn<String> get externalSessionId => $composableBuilder(
      column: $table.externalSessionId, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get cancelTime => $composableBuilder(
      column: $table.cancelTime, builder: (column) => column);
}

class $SessionsTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i3.Sessions,
    i4.Session,
    i3.$SessionsFilterComposer,
    i3.$SessionsOrderingComposer,
    i3.$SessionsAnnotationComposer,
    $SessionsCreateCompanionBuilder,
    $SessionsUpdateCompanionBuilder,
    (
      i4.Session,
      i0.BaseReferences<i0.GeneratedDatabase, i3.Sessions, i4.Session>
    ),
    i4.Session,
    i0.PrefetchHooks Function()> {
  $SessionsTableManager(i0.GeneratedDatabase db, i3.Sessions table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i3.$SessionsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i3.$SessionsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i3.$SessionsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> rowid = const i0.Value.absent(),
            i0.Value<String> sessionId = const i0.Value.absent(),
            i0.Value<i2.Uint8List> cryptoKeyId = const i0.Value.absent(),
            i0.Value<String> userId = const i0.Value.absent(),
            i0.Value<i4.SessionClient?> clientInfo = const i0.Value.absent(),
            i0.Value<i4.AuthenticationFactor> authenticationFactor =
                const i0.Value.absent(),
            i0.Value<i4.SessionState?> state = const i0.Value.absent(),
            i0.Value<String?> ipAddress = const i0.Value.absent(),
            i0.Value<String?> externalSessionId = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> updateTime = const i0.Value.absent(),
            i0.Value<DateTime> expireTime = const i0.Value.absent(),
            i0.Value<DateTime?> cancelTime = const i0.Value.absent(),
          }) =>
              i3.SessionsCompanion(
            rowid: rowid,
            sessionId: sessionId,
            cryptoKeyId: cryptoKeyId,
            userId: userId,
            clientInfo: clientInfo,
            authenticationFactor: authenticationFactor,
            state: state,
            ipAddress: ipAddress,
            externalSessionId: externalSessionId,
            createTime: createTime,
            updateTime: updateTime,
            expireTime: expireTime,
            cancelTime: cancelTime,
          ),
          createCompanionCallback: ({
            i0.Value<int> rowid = const i0.Value.absent(),
            required String sessionId,
            required i2.Uint8List cryptoKeyId,
            required String userId,
            i0.Value<i4.SessionClient?> clientInfo = const i0.Value.absent(),
            required i4.AuthenticationFactor authenticationFactor,
            i0.Value<i4.SessionState?> state = const i0.Value.absent(),
            i0.Value<String?> ipAddress = const i0.Value.absent(),
            i0.Value<String?> externalSessionId = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> updateTime = const i0.Value.absent(),
            required DateTime expireTime,
            i0.Value<DateTime?> cancelTime = const i0.Value.absent(),
          }) =>
              i3.SessionsCompanion.insert(
            rowid: rowid,
            sessionId: sessionId,
            cryptoKeyId: cryptoKeyId,
            userId: userId,
            clientInfo: clientInfo,
            authenticationFactor: authenticationFactor,
            state: state,
            ipAddress: ipAddress,
            externalSessionId: externalSessionId,
            createTime: createTime,
            updateTime: updateTime,
            expireTime: expireTime,
            cancelTime: cancelTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $SessionsProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i3.Sessions,
    i4.Session,
    i3.$SessionsFilterComposer,
    i3.$SessionsOrderingComposer,
    i3.$SessionsAnnotationComposer,
    $SessionsCreateCompanionBuilder,
    $SessionsUpdateCompanionBuilder,
    (
      i4.Session,
      i0.BaseReferences<i0.GeneratedDatabase, i3.Sessions, i4.Session>
    ),
    i4.Session,
    i0.PrefetchHooks Function()>;
typedef $OtpCodesCreateCompanionBuilder = i3.OtpCodesCompanion Function({
  i0.Value<int> rowid,
  required String sessionId,
  i0.Value<int> resendAttempt,
  i0.Value<int> verifyAttempt,
  i0.Value<DateTime> updateTime,
});
typedef $OtpCodesUpdateCompanionBuilder = i3.OtpCodesCompanion Function({
  i0.Value<int> rowid,
  i0.Value<String> sessionId,
  i0.Value<int> resendAttempt,
  i0.Value<int> verifyAttempt,
  i0.Value<DateTime> updateTime,
});

class $OtpCodesFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.OtpCodes> {
  $OtpCodesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get rowid => $composableBuilder(
      column: $table.rowid, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get resendAttempt => $composableBuilder(
      column: $table.resendAttempt,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get verifyAttempt => $composableBuilder(
      column: $table.verifyAttempt,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => i0.ColumnFilters(column));
}

class $OtpCodesOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.OtpCodes> {
  $OtpCodesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get rowid => $composableBuilder(
      column: $table.rowid, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get resendAttempt => $composableBuilder(
      column: $table.resendAttempt,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get verifyAttempt => $composableBuilder(
      column: $table.verifyAttempt,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime,
      builder: (column) => i0.ColumnOrderings(column));
}

class $OtpCodesAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.OtpCodes> {
  $OtpCodesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get rowid =>
      $composableBuilder(column: $table.rowid, builder: (column) => column);

  i0.GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  i0.GeneratedColumn<int> get resendAttempt => $composableBuilder(
      column: $table.resendAttempt, builder: (column) => column);

  i0.GeneratedColumn<int> get verifyAttempt => $composableBuilder(
      column: $table.verifyAttempt, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => column);
}

class $OtpCodesTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i3.OtpCodes,
    i3.OtpCode,
    i3.$OtpCodesFilterComposer,
    i3.$OtpCodesOrderingComposer,
    i3.$OtpCodesAnnotationComposer,
    $OtpCodesCreateCompanionBuilder,
    $OtpCodesUpdateCompanionBuilder,
    (
      i3.OtpCode,
      i0.BaseReferences<i0.GeneratedDatabase, i3.OtpCodes, i3.OtpCode>
    ),
    i3.OtpCode,
    i0.PrefetchHooks Function()> {
  $OtpCodesTableManager(i0.GeneratedDatabase db, i3.OtpCodes table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i3.$OtpCodesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i3.$OtpCodesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i3.$OtpCodesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> rowid = const i0.Value.absent(),
            i0.Value<String> sessionId = const i0.Value.absent(),
            i0.Value<int> resendAttempt = const i0.Value.absent(),
            i0.Value<int> verifyAttempt = const i0.Value.absent(),
            i0.Value<DateTime> updateTime = const i0.Value.absent(),
          }) =>
              i3.OtpCodesCompanion(
            rowid: rowid,
            sessionId: sessionId,
            resendAttempt: resendAttempt,
            verifyAttempt: verifyAttempt,
            updateTime: updateTime,
          ),
          createCompanionCallback: ({
            i0.Value<int> rowid = const i0.Value.absent(),
            required String sessionId,
            i0.Value<int> resendAttempt = const i0.Value.absent(),
            i0.Value<int> verifyAttempt = const i0.Value.absent(),
            i0.Value<DateTime> updateTime = const i0.Value.absent(),
          }) =>
              i3.OtpCodesCompanion.insert(
            rowid: rowid,
            sessionId: sessionId,
            resendAttempt: resendAttempt,
            verifyAttempt: verifyAttempt,
            updateTime: updateTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $OtpCodesProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i3.OtpCodes,
    i3.OtpCode,
    i3.$OtpCodesFilterComposer,
    i3.$OtpCodesOrderingComposer,
    i3.$OtpCodesAnnotationComposer,
    $OtpCodesCreateCompanionBuilder,
    $OtpCodesUpdateCompanionBuilder,
    (
      i3.OtpCode,
      i0.BaseReferences<i0.GeneratedDatabase, i3.OtpCodes, i3.OtpCode>
    ),
    i3.OtpCode,
    i0.PrefetchHooks Function()>;
typedef $CorksCreateCompanionBuilder = i3.CorksCompanion Function({
  required i2.Uint8List corkId,
  required i2.Uint8List cryptoKeyId,
  i0.Value<String?> bearerType,
  i0.Value<String?> bearerId,
  i0.Value<String?> audienceType,
  i0.Value<String?> audienceId,
  i0.Value<String?> issuerType,
  i0.Value<String?> issuerId,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> expireTime,
  i0.Value<DateTime?> lastUseTime,
  i0.Value<int> rowid,
});
typedef $CorksUpdateCompanionBuilder = i3.CorksCompanion Function({
  i0.Value<i2.Uint8List> corkId,
  i0.Value<i2.Uint8List> cryptoKeyId,
  i0.Value<String?> bearerType,
  i0.Value<String?> bearerId,
  i0.Value<String?> audienceType,
  i0.Value<String?> audienceId,
  i0.Value<String?> issuerType,
  i0.Value<String?> issuerId,
  i0.Value<DateTime> createTime,
  i0.Value<DateTime?> expireTime,
  i0.Value<DateTime?> lastUseTime,
  i0.Value<int> rowid,
});

class $CorksFilterComposer extends i0.Composer<i0.GeneratedDatabase, i3.Corks> {
  $CorksFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<i2.Uint8List> get corkId => $composableBuilder(
      column: $table.corkId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get bearerType => $composableBuilder(
      column: $table.bearerType, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get bearerId => $composableBuilder(
      column: $table.bearerId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get audienceType => $composableBuilder(
      column: $table.audienceType,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get audienceId => $composableBuilder(
      column: $table.audienceId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get issuerType => $composableBuilder(
      column: $table.issuerType, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get issuerId => $composableBuilder(
      column: $table.issuerId, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<DateTime> get lastUseTime => $composableBuilder(
      column: $table.lastUseTime,
      builder: (column) => i0.ColumnFilters(column));
}

class $CorksOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.Corks> {
  $CorksOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<i2.Uint8List> get corkId => $composableBuilder(
      column: $table.corkId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get bearerType => $composableBuilder(
      column: $table.bearerType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get bearerId => $composableBuilder(
      column: $table.bearerId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get audienceType => $composableBuilder(
      column: $table.audienceType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get audienceId => $composableBuilder(
      column: $table.audienceId,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get issuerType => $composableBuilder(
      column: $table.issuerType,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get issuerId => $composableBuilder(
      column: $table.issuerId, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get createTime => $composableBuilder(
      column: $table.createTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<DateTime> get lastUseTime => $composableBuilder(
      column: $table.lastUseTime,
      builder: (column) => i0.ColumnOrderings(column));
}

class $CorksAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i3.Corks> {
  $CorksAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<i2.Uint8List> get corkId =>
      $composableBuilder(column: $table.corkId, builder: (column) => column);

  i0.GeneratedColumn<i2.Uint8List> get cryptoKeyId => $composableBuilder(
      column: $table.cryptoKeyId, builder: (column) => column);

  i0.GeneratedColumn<String> get bearerType => $composableBuilder(
      column: $table.bearerType, builder: (column) => column);

  i0.GeneratedColumn<String> get bearerId =>
      $composableBuilder(column: $table.bearerId, builder: (column) => column);

  i0.GeneratedColumn<String> get audienceType => $composableBuilder(
      column: $table.audienceType, builder: (column) => column);

  i0.GeneratedColumn<String> get audienceId => $composableBuilder(
      column: $table.audienceId, builder: (column) => column);

  i0.GeneratedColumn<String> get issuerType => $composableBuilder(
      column: $table.issuerType, builder: (column) => column);

  i0.GeneratedColumn<String> get issuerId =>
      $composableBuilder(column: $table.issuerId, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createTime => $composableBuilder(
      column: $table.createTime, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get expireTime => $composableBuilder(
      column: $table.expireTime, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get lastUseTime => $composableBuilder(
      column: $table.lastUseTime, builder: (column) => column);
}

class $CorksTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i3.Corks,
    i3.Cork,
    i3.$CorksFilterComposer,
    i3.$CorksOrderingComposer,
    i3.$CorksAnnotationComposer,
    $CorksCreateCompanionBuilder,
    $CorksUpdateCompanionBuilder,
    (i3.Cork, i0.BaseReferences<i0.GeneratedDatabase, i3.Corks, i3.Cork>),
    i3.Cork,
    i0.PrefetchHooks Function()> {
  $CorksTableManager(i0.GeneratedDatabase db, i3.Corks table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i3.$CorksFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i3.$CorksOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i3.$CorksAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<i2.Uint8List> corkId = const i0.Value.absent(),
            i0.Value<i2.Uint8List> cryptoKeyId = const i0.Value.absent(),
            i0.Value<String?> bearerType = const i0.Value.absent(),
            i0.Value<String?> bearerId = const i0.Value.absent(),
            i0.Value<String?> audienceType = const i0.Value.absent(),
            i0.Value<String?> audienceId = const i0.Value.absent(),
            i0.Value<String?> issuerType = const i0.Value.absent(),
            i0.Value<String?> issuerId = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> expireTime = const i0.Value.absent(),
            i0.Value<DateTime?> lastUseTime = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i3.CorksCompanion(
            corkId: corkId,
            cryptoKeyId: cryptoKeyId,
            bearerType: bearerType,
            bearerId: bearerId,
            audienceType: audienceType,
            audienceId: audienceId,
            issuerType: issuerType,
            issuerId: issuerId,
            createTime: createTime,
            expireTime: expireTime,
            lastUseTime: lastUseTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required i2.Uint8List corkId,
            required i2.Uint8List cryptoKeyId,
            i0.Value<String?> bearerType = const i0.Value.absent(),
            i0.Value<String?> bearerId = const i0.Value.absent(),
            i0.Value<String?> audienceType = const i0.Value.absent(),
            i0.Value<String?> audienceId = const i0.Value.absent(),
            i0.Value<String?> issuerType = const i0.Value.absent(),
            i0.Value<String?> issuerId = const i0.Value.absent(),
            i0.Value<DateTime> createTime = const i0.Value.absent(),
            i0.Value<DateTime?> expireTime = const i0.Value.absent(),
            i0.Value<DateTime?> lastUseTime = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i3.CorksCompanion.insert(
            corkId: corkId,
            cryptoKeyId: cryptoKeyId,
            bearerType: bearerType,
            bearerId: bearerId,
            audienceType: audienceType,
            audienceId: audienceId,
            issuerType: issuerType,
            issuerId: issuerId,
            createTime: createTime,
            expireTime: expireTime,
            lastUseTime: lastUseTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $CorksProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i3.Corks,
    i3.Cork,
    i3.$CorksFilterComposer,
    i3.$CorksOrderingComposer,
    i3.$CorksAnnotationComposer,
    $CorksCreateCompanionBuilder,
    $CorksUpdateCompanionBuilder,
    (i3.Cork, i0.BaseReferences<i0.GeneratedDatabase, i3.Corks, i3.Cork>),
    i3.Cork,
    i0.PrefetchHooks Function()>;

class CryptoKeys extends i0.Table with i0.TableInfo<CryptoKeys, i1.CryptoKey> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  CryptoKeys(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<i2.Uint8List> cryptoKeyId =
      i0.GeneratedColumn<i2.Uint8List>('crypto_key_id', aliasedName, false,
          type: i0.DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<String> keyPurpose = i0.GeneratedColumn<String>(
      'key_purpose', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> keyAlgorithm =
      i0.GeneratedColumn<String>('key_algorithm', aliasedName, false,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<i2.Uint8List> keyMaterial =
      i0.GeneratedColumn<i2.Uint8List>('key_material', aliasedName, true,
          type: i0.DriftSqlType.blob,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> externalCryptoKeyId =
      i0.GeneratedColumn<String>('external_crypto_key_id', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: 'UNIQUE');
  @override
  List<i0.GeneratedColumn> get $columns =>
      [cryptoKeyId, keyPurpose, keyAlgorithm, keyMaterial, externalCryptoKeyId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crypto_keys';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {cryptoKeyId};
  @override
  i1.CryptoKey map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CryptoKey(
      cryptoKeyId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}crypto_key_id'])!,
      keyPurpose: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}key_purpose'])!,
      keyAlgorithm: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}key_algorithm'])!,
      keyMaterial: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}key_material']),
      externalCryptoKeyId: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}external_crypto_key_id']),
    );
  }

  @override
  CryptoKeys createAlias(String alias) {
    return CryptoKeys(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CHECK(key_material IS NOT NULL OR external_crypto_key_id IS NOT NULL)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CryptoKeysCompanion extends i0.UpdateCompanion<i1.CryptoKey> {
  final i0.Value<i2.Uint8List> cryptoKeyId;
  final i0.Value<String> keyPurpose;
  final i0.Value<String> keyAlgorithm;
  final i0.Value<i2.Uint8List?> keyMaterial;
  final i0.Value<String?> externalCryptoKeyId;
  final i0.Value<int> rowid;
  const CryptoKeysCompanion({
    this.cryptoKeyId = const i0.Value.absent(),
    this.keyPurpose = const i0.Value.absent(),
    this.keyAlgorithm = const i0.Value.absent(),
    this.keyMaterial = const i0.Value.absent(),
    this.externalCryptoKeyId = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CryptoKeysCompanion.insert({
    required i2.Uint8List cryptoKeyId,
    required String keyPurpose,
    required String keyAlgorithm,
    this.keyMaterial = const i0.Value.absent(),
    this.externalCryptoKeyId = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : cryptoKeyId = i0.Value(cryptoKeyId),
        keyPurpose = i0.Value(keyPurpose),
        keyAlgorithm = i0.Value(keyAlgorithm);
  static i0.Insertable<i1.CryptoKey> custom({
    i0.Expression<i2.Uint8List>? cryptoKeyId,
    i0.Expression<String>? keyPurpose,
    i0.Expression<String>? keyAlgorithm,
    i0.Expression<i2.Uint8List>? keyMaterial,
    i0.Expression<String>? externalCryptoKeyId,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (cryptoKeyId != null) 'crypto_key_id': cryptoKeyId,
      if (keyPurpose != null) 'key_purpose': keyPurpose,
      if (keyAlgorithm != null) 'key_algorithm': keyAlgorithm,
      if (keyMaterial != null) 'key_material': keyMaterial,
      if (externalCryptoKeyId != null)
        'external_crypto_key_id': externalCryptoKeyId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i3.CryptoKeysCompanion copyWith(
      {i0.Value<i2.Uint8List>? cryptoKeyId,
      i0.Value<String>? keyPurpose,
      i0.Value<String>? keyAlgorithm,
      i0.Value<i2.Uint8List?>? keyMaterial,
      i0.Value<String?>? externalCryptoKeyId,
      i0.Value<int>? rowid}) {
    return i3.CryptoKeysCompanion(
      cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
      keyPurpose: keyPurpose ?? this.keyPurpose,
      keyAlgorithm: keyAlgorithm ?? this.keyAlgorithm,
      keyMaterial: keyMaterial ?? this.keyMaterial,
      externalCryptoKeyId: externalCryptoKeyId ?? this.externalCryptoKeyId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (cryptoKeyId.present) {
      map['crypto_key_id'] = i0.Variable<i2.Uint8List>(cryptoKeyId.value);
    }
    if (keyPurpose.present) {
      map['key_purpose'] = i0.Variable<String>(keyPurpose.value);
    }
    if (keyAlgorithm.present) {
      map['key_algorithm'] = i0.Variable<String>(keyAlgorithm.value);
    }
    if (keyMaterial.present) {
      map['key_material'] = i0.Variable<i2.Uint8List>(keyMaterial.value);
    }
    if (externalCryptoKeyId.present) {
      map['external_crypto_key_id'] =
          i0.Variable<String>(externalCryptoKeyId.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CryptoKeysCompanion(')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('keyPurpose: $keyPurpose, ')
          ..write('keyAlgorithm: $keyAlgorithm, ')
          ..write('keyMaterial: $keyMaterial, ')
          ..write('externalCryptoKeyId: $externalCryptoKeyId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get cryptoKeysExternalCryptoKeyIdIdx => i0.Index(
    'crypto_keys_external_crypto_key_id_idx',
    'CREATE INDEX IF NOT EXISTS crypto_keys_external_crypto_key_id_idx ON crypto_keys (external_crypto_key_id)');

class Sessions extends i0.Table with i0.TableInfo<Sessions, i4.Session> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Sessions(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<int> rowid = i0.GeneratedColumn<int>(
      'rowid', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  late final i0.GeneratedColumn<String> sessionId = i0.GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final i0.GeneratedColumn<i2.Uint8List> cryptoKeyId =
      i0.GeneratedColumn<i2.Uint8List>('crypto_key_id', aliasedName, false,
          type: i0.DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> userId = i0.GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final i0
      .GeneratedColumnWithTypeConverter<i4.SessionClient?, i2.Uint8List>
      clientInfo = i0.GeneratedColumn<i2.Uint8List>(
              'client_info', aliasedName, true,
              type: i0.DriftSqlType.blob,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<i4.SessionClient?>(i3.Sessions.$converterclientInfon);
  late final i0
      .GeneratedColumnWithTypeConverter<i4.AuthenticationFactor, i2.Uint8List>
      authenticationFactor = i0.GeneratedColumn<i2.Uint8List>(
              'authentication_factor', aliasedName, false,
              type: i0.DriftSqlType.blob,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<i4.AuthenticationFactor>(
              i3.Sessions.$converterauthenticationFactor);
  late final i0.GeneratedColumnWithTypeConverter<i4.SessionState?, i2.Uint8List>
      state = i0.GeneratedColumn<i2.Uint8List>('state', aliasedName, true,
              type: i0.DriftSqlType.blob,
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<i4.SessionState?>(i3.Sessions.$converterstaten);
  late final i0.GeneratedColumn<String> ipAddress = i0.GeneratedColumn<String>(
      'ip_address', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> externalSessionId =
      i0.GeneratedColumn<String>('external_session_id', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<DateTime> createTime =
      i0.GeneratedColumn<DateTime>(
          'create_time', aliasedName, false,
          type: const i5.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
          defaultValue:
              const i0.CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final i0.GeneratedColumn<DateTime> updateTime =
      i0.GeneratedColumn<DateTime>('update_time', aliasedName, true,
          type: const i5.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<DateTime> expireTime =
      i0.GeneratedColumn<DateTime>('expire_time', aliasedName, false,
          type: const i5.TimestampType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<DateTime> cancelTime =
      i0.GeneratedColumn<DateTime>('cancel_time', aliasedName, true,
          type: const i5.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<i0.GeneratedColumn> get $columns => [
        rowid,
        sessionId,
        cryptoKeyId,
        userId,
        clientInfo,
        authenticationFactor,
        state,
        ipAddress,
        externalSessionId,
        createTime,
        updateTime,
        expireTime,
        cancelTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {rowid};
  @override
  i4.Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i4.Session(
      sessionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      cryptoKeyId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}crypto_key_id'])!,
      userId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      expireTime: attachedDatabase.typeMapping.read(
          const i5.TimestampType(), data['${effectivePrefix}expire_time'])!,
      authenticationFactor: i3.Sessions.$converterauthenticationFactor.fromSql(
          attachedDatabase.typeMapping.read(i0.DriftSqlType.blob,
              data['${effectivePrefix}authentication_factor'])!),
      state: i3.Sessions.$converterstaten.fromSql(attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}state'])),
      clientInfo: i3.Sessions.$converterclientInfon.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}client_info'])),
      ipAddress: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}ip_address']),
      externalSessionId: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}external_session_id']),
    );
  }

  @override
  Sessions createAlias(String alias) {
    return Sessions(attachedDatabase, alias);
  }

  static i0.TypeConverter<i4.SessionClient, i2.Uint8List> $converterclientInfo =
      const i6.SessionClientConverter();
  static i0.TypeConverter<i4.SessionClient?, i2.Uint8List?>
      $converterclientInfon =
      i0.NullAwareTypeConverter.wrap($converterclientInfo);
  static i0.TypeConverter<i4.AuthenticationFactor, i2.Uint8List>
      $converterauthenticationFactor = const i6.AuthenticationFactorConverter();
  static i0.TypeConverter<i4.SessionState, i2.Uint8List> $converterstate =
      const i6.SessionStateConverter();
  static i0.TypeConverter<i4.SessionState?, i2.Uint8List?> $converterstaten =
      i0.NullAwareTypeConverter.wrap($converterstate);
  @override
  List<String> get customConstraints => const [
        'CONSTRAINT sessions_user_fk FOREIGN KEY(user_id)REFERENCES users(user_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT sessions_key_fk FOREIGN KEY(crypto_key_id)REFERENCES crypto_keys(crypto_key_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class SessionsCompanion extends i0.UpdateCompanion<i4.Session> {
  final i0.Value<int> rowid;
  final i0.Value<String> sessionId;
  final i0.Value<i2.Uint8List> cryptoKeyId;
  final i0.Value<String> userId;
  final i0.Value<i4.SessionClient?> clientInfo;
  final i0.Value<i4.AuthenticationFactor> authenticationFactor;
  final i0.Value<i4.SessionState?> state;
  final i0.Value<String?> ipAddress;
  final i0.Value<String?> externalSessionId;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime?> updateTime;
  final i0.Value<DateTime> expireTime;
  final i0.Value<DateTime?> cancelTime;
  const SessionsCompanion({
    this.rowid = const i0.Value.absent(),
    this.sessionId = const i0.Value.absent(),
    this.cryptoKeyId = const i0.Value.absent(),
    this.userId = const i0.Value.absent(),
    this.clientInfo = const i0.Value.absent(),
    this.authenticationFactor = const i0.Value.absent(),
    this.state = const i0.Value.absent(),
    this.ipAddress = const i0.Value.absent(),
    this.externalSessionId = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    this.expireTime = const i0.Value.absent(),
    this.cancelTime = const i0.Value.absent(),
  });
  SessionsCompanion.insert({
    this.rowid = const i0.Value.absent(),
    required String sessionId,
    required i2.Uint8List cryptoKeyId,
    required String userId,
    this.clientInfo = const i0.Value.absent(),
    required i4.AuthenticationFactor authenticationFactor,
    this.state = const i0.Value.absent(),
    this.ipAddress = const i0.Value.absent(),
    this.externalSessionId = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
    required DateTime expireTime,
    this.cancelTime = const i0.Value.absent(),
  })  : sessionId = i0.Value(sessionId),
        cryptoKeyId = i0.Value(cryptoKeyId),
        userId = i0.Value(userId),
        authenticationFactor = i0.Value(authenticationFactor),
        expireTime = i0.Value(expireTime);
  static i0.Insertable<i4.Session> custom({
    i0.Expression<int>? rowid,
    i0.Expression<String>? sessionId,
    i0.Expression<i2.Uint8List>? cryptoKeyId,
    i0.Expression<String>? userId,
    i0.Expression<i2.Uint8List>? clientInfo,
    i0.Expression<i2.Uint8List>? authenticationFactor,
    i0.Expression<i2.Uint8List>? state,
    i0.Expression<String>? ipAddress,
    i0.Expression<String>? externalSessionId,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? updateTime,
    i0.Expression<DateTime>? expireTime,
    i0.Expression<DateTime>? cancelTime,
  }) {
    return i0.RawValuesInsertable({
      if (rowid != null) 'rowid': rowid,
      if (sessionId != null) 'session_id': sessionId,
      if (cryptoKeyId != null) 'crypto_key_id': cryptoKeyId,
      if (userId != null) 'user_id': userId,
      if (clientInfo != null) 'client_info': clientInfo,
      if (authenticationFactor != null)
        'authentication_factor': authenticationFactor,
      if (state != null) 'state': state,
      if (ipAddress != null) 'ip_address': ipAddress,
      if (externalSessionId != null) 'external_session_id': externalSessionId,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (expireTime != null) 'expire_time': expireTime,
      if (cancelTime != null) 'cancel_time': cancelTime,
    });
  }

  i3.SessionsCompanion copyWith(
      {i0.Value<int>? rowid,
      i0.Value<String>? sessionId,
      i0.Value<i2.Uint8List>? cryptoKeyId,
      i0.Value<String>? userId,
      i0.Value<i4.SessionClient?>? clientInfo,
      i0.Value<i4.AuthenticationFactor>? authenticationFactor,
      i0.Value<i4.SessionState?>? state,
      i0.Value<String?>? ipAddress,
      i0.Value<String?>? externalSessionId,
      i0.Value<DateTime>? createTime,
      i0.Value<DateTime?>? updateTime,
      i0.Value<DateTime>? expireTime,
      i0.Value<DateTime?>? cancelTime}) {
    return i3.SessionsCompanion(
      rowid: rowid ?? this.rowid,
      sessionId: sessionId ?? this.sessionId,
      cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
      userId: userId ?? this.userId,
      clientInfo: clientInfo ?? this.clientInfo,
      authenticationFactor: authenticationFactor ?? this.authenticationFactor,
      state: state ?? this.state,
      ipAddress: ipAddress ?? this.ipAddress,
      externalSessionId: externalSessionId ?? this.externalSessionId,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      expireTime: expireTime ?? this.expireTime,
      cancelTime: cancelTime ?? this.cancelTime,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    if (sessionId.present) {
      map['session_id'] = i0.Variable<String>(sessionId.value);
    }
    if (cryptoKeyId.present) {
      map['crypto_key_id'] = i0.Variable<i2.Uint8List>(cryptoKeyId.value);
    }
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (clientInfo.present) {
      map['client_info'] = i0.Variable<i2.Uint8List>(
          i3.Sessions.$converterclientInfon.toSql(clientInfo.value));
    }
    if (authenticationFactor.present) {
      map['authentication_factor'] = i0.Variable<i2.Uint8List>(i3
          .Sessions.$converterauthenticationFactor
          .toSql(authenticationFactor.value));
    }
    if (state.present) {
      map['state'] = i0.Variable<i2.Uint8List>(
          i3.Sessions.$converterstaten.toSql(state.value));
    }
    if (ipAddress.present) {
      map['ip_address'] = i0.Variable<String>(ipAddress.value);
    }
    if (externalSessionId.present) {
      map['external_session_id'] = i0.Variable<String>(externalSessionId.value);
    }
    if (createTime.present) {
      map['create_time'] =
          i0.Variable<DateTime>(createTime.value, const i5.TimestampType());
    }
    if (updateTime.present) {
      map['update_time'] =
          i0.Variable<DateTime>(updateTime.value, const i5.TimestampType());
    }
    if (expireTime.present) {
      map['expire_time'] =
          i0.Variable<DateTime>(expireTime.value, const i5.TimestampType());
    }
    if (cancelTime.present) {
      map['cancel_time'] =
          i0.Variable<DateTime>(cancelTime.value, const i5.TimestampType());
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('userId: $userId, ')
          ..write('clientInfo: $clientInfo, ')
          ..write('authenticationFactor: $authenticationFactor, ')
          ..write('state: $state, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('externalSessionId: $externalSessionId, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('cancelTime: $cancelTime')
          ..write(')'))
        .toString();
  }
}

i0.Index get sessionsUserIdx => i0.Index('sessions_user_idx',
    'CREATE INDEX IF NOT EXISTS sessions_user_idx ON sessions (user_id)');
i0.Index get sessionsCryptoKeyIdx => i0.Index('sessions_crypto_key_idx',
    'CREATE INDEX IF NOT EXISTS sessions_crypto_key_idx ON sessions (crypto_key_id)');
i0.Index get sessionsExternalSessionIdIdx => i0.Index(
    'sessions_external_session_id_idx',
    'CREATE INDEX IF NOT EXISTS sessions_external_session_id_idx ON sessions (external_session_id)');
i0.Trigger get authSessionsUpdateTime => i0.Trigger(
    'CREATE TRIGGER IF NOT EXISTS auth_sessions_update_time AFTER UPDATE ON sessions BEGIN UPDATE sessions SET update_time = unixepoch(\'now\', \'subsec\') WHERE "rowid" = OLD."rowid";END',
    'auth_sessions_update_time');

class OtpCodes extends i0.Table with i0.TableInfo<OtpCodes, i3.OtpCode> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  OtpCodes(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<int> rowid = i0.GeneratedColumn<int>(
      'rowid', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  late final i0.GeneratedColumn<String> sessionId = i0.GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final i0.GeneratedColumn<int> resendAttempt = i0.GeneratedColumn<int>(
      'resend_attempt', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const i0.CustomExpression('0'));
  late final i0.GeneratedColumn<int> verifyAttempt = i0.GeneratedColumn<int>(
      'verify_attempt', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const i0.CustomExpression('0'));
  late final i0.GeneratedColumn<DateTime> updateTime =
      i0.GeneratedColumn<DateTime>(
          'update_time', aliasedName, false,
          type: const i5.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
          defaultValue:
              const i0.CustomExpression('unixepoch(\'now\', \'subsec\')'));
  @override
  List<i0.GeneratedColumn> get $columns =>
      [rowid, sessionId, resendAttempt, verifyAttempt, updateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'otp_codes';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {rowid};
  @override
  i3.OtpCode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i3.OtpCode(
      rowid: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}rowid'])!,
      sessionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      resendAttempt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}resend_attempt'])!,
      verifyAttempt: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}verify_attempt'])!,
      updateTime: attachedDatabase.typeMapping.read(
          const i5.TimestampType(), data['${effectivePrefix}update_time'])!,
    );
  }

  @override
  OtpCodes createAlias(String alias) {
    return OtpCodes(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT otp_codes_session_fk FOREIGN KEY(session_id)REFERENCES sessions(session_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class OtpCode extends i0.DataClass implements i0.Insertable<i3.OtpCode> {
  final int rowid;

  /// The ID of the session.
  final String sessionId;

  /// The counter value for the HOTP code.
  final int resendAttempt;

  /// The throttling parameter for bruteforce prevention.
  final int verifyAttempt;

  /// The time the HOTP code was last used.
  final DateTime updateTime;
  const OtpCode(
      {required this.rowid,
      required this.sessionId,
      required this.resendAttempt,
      required this.verifyAttempt,
      required this.updateTime});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['rowid'] = i0.Variable<int>(rowid);
    map['session_id'] = i0.Variable<String>(sessionId);
    map['resend_attempt'] = i0.Variable<int>(resendAttempt);
    map['verify_attempt'] = i0.Variable<int>(verifyAttempt);
    map['update_time'] =
        i0.Variable<DateTime>(updateTime, const i5.TimestampType());
    return map;
  }

  factory OtpCode.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return OtpCode(
      rowid: serializer.fromJson<int>(json['rowid']),
      sessionId: serializer.fromJson<String>(json['session_id']),
      resendAttempt: serializer.fromJson<int>(json['resend_attempt']),
      verifyAttempt: serializer.fromJson<int>(json['verify_attempt']),
      updateTime: serializer.fromJson<DateTime>(json['update_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowid': serializer.toJson<int>(rowid),
      'session_id': serializer.toJson<String>(sessionId),
      'resend_attempt': serializer.toJson<int>(resendAttempt),
      'verify_attempt': serializer.toJson<int>(verifyAttempt),
      'update_time': serializer.toJson<DateTime>(updateTime),
    };
  }

  i3.OtpCode copyWith(
          {int? rowid,
          String? sessionId,
          int? resendAttempt,
          int? verifyAttempt,
          DateTime? updateTime}) =>
      i3.OtpCode(
        rowid: rowid ?? this.rowid,
        sessionId: sessionId ?? this.sessionId,
        resendAttempt: resendAttempt ?? this.resendAttempt,
        verifyAttempt: verifyAttempt ?? this.verifyAttempt,
        updateTime: updateTime ?? this.updateTime,
      );
  OtpCode copyWithCompanion(i3.OtpCodesCompanion data) {
    return OtpCode(
      rowid: data.rowid.present ? data.rowid.value : this.rowid,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      resendAttempt: data.resendAttempt.present
          ? data.resendAttempt.value
          : this.resendAttempt,
      verifyAttempt: data.verifyAttempt.present
          ? data.verifyAttempt.value
          : this.verifyAttempt,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OtpCode(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('resendAttempt: $resendAttempt, ')
          ..write('verifyAttempt: $verifyAttempt, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(rowid, sessionId, resendAttempt, verifyAttempt, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i3.OtpCode &&
          other.rowid == this.rowid &&
          other.sessionId == this.sessionId &&
          other.resendAttempt == this.resendAttempt &&
          other.verifyAttempt == this.verifyAttempt &&
          other.updateTime == this.updateTime);
}

class OtpCodesCompanion extends i0.UpdateCompanion<i3.OtpCode> {
  final i0.Value<int> rowid;
  final i0.Value<String> sessionId;
  final i0.Value<int> resendAttempt;
  final i0.Value<int> verifyAttempt;
  final i0.Value<DateTime> updateTime;
  const OtpCodesCompanion({
    this.rowid = const i0.Value.absent(),
    this.sessionId = const i0.Value.absent(),
    this.resendAttempt = const i0.Value.absent(),
    this.verifyAttempt = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
  });
  OtpCodesCompanion.insert({
    this.rowid = const i0.Value.absent(),
    required String sessionId,
    this.resendAttempt = const i0.Value.absent(),
    this.verifyAttempt = const i0.Value.absent(),
    this.updateTime = const i0.Value.absent(),
  }) : sessionId = i0.Value(sessionId);
  static i0.Insertable<i3.OtpCode> custom({
    i0.Expression<int>? rowid,
    i0.Expression<String>? sessionId,
    i0.Expression<int>? resendAttempt,
    i0.Expression<int>? verifyAttempt,
    i0.Expression<DateTime>? updateTime,
  }) {
    return i0.RawValuesInsertable({
      if (rowid != null) 'rowid': rowid,
      if (sessionId != null) 'session_id': sessionId,
      if (resendAttempt != null) 'resend_attempt': resendAttempt,
      if (verifyAttempt != null) 'verify_attempt': verifyAttempt,
      if (updateTime != null) 'update_time': updateTime,
    });
  }

  i3.OtpCodesCompanion copyWith(
      {i0.Value<int>? rowid,
      i0.Value<String>? sessionId,
      i0.Value<int>? resendAttempt,
      i0.Value<int>? verifyAttempt,
      i0.Value<DateTime>? updateTime}) {
    return i3.OtpCodesCompanion(
      rowid: rowid ?? this.rowid,
      sessionId: sessionId ?? this.sessionId,
      resendAttempt: resendAttempt ?? this.resendAttempt,
      verifyAttempt: verifyAttempt ?? this.verifyAttempt,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    if (sessionId.present) {
      map['session_id'] = i0.Variable<String>(sessionId.value);
    }
    if (resendAttempt.present) {
      map['resend_attempt'] = i0.Variable<int>(resendAttempt.value);
    }
    if (verifyAttempt.present) {
      map['verify_attempt'] = i0.Variable<int>(verifyAttempt.value);
    }
    if (updateTime.present) {
      map['update_time'] =
          i0.Variable<DateTime>(updateTime.value, const i5.TimestampType());
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OtpCodesCompanion(')
          ..write('rowid: $rowid, ')
          ..write('sessionId: $sessionId, ')
          ..write('resendAttempt: $resendAttempt, ')
          ..write('verifyAttempt: $verifyAttempt, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }
}

i0.Index get otpCodesSessionIdx => i0.Index('otp_codes_session_idx',
    'CREATE INDEX IF NOT EXISTS otp_codes_session_idx ON otp_codes (session_id)');

class Corks extends i0.Table with i0.TableInfo<Corks, i3.Cork> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Corks(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumn<i2.Uint8List> corkId =
      i0.GeneratedColumn<i2.Uint8List>('cork_id', aliasedName, false,
          type: i0.DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL PRIMARY KEY');
  late final i0.GeneratedColumn<i2.Uint8List> cryptoKeyId =
      i0.GeneratedColumn<i2.Uint8List>('crypto_key_id', aliasedName, false,
          type: i0.DriftSqlType.blob,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final i0.GeneratedColumn<String> bearerType = i0.GeneratedColumn<String>(
      'bearer_type', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> bearerId = i0.GeneratedColumn<String>(
      'bearer_id', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> audienceType =
      i0.GeneratedColumn<String>('audience_type', aliasedName, true,
          type: i0.DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<String> audienceId = i0.GeneratedColumn<String>(
      'audience_id', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> issuerType = i0.GeneratedColumn<String>(
      'issuer_type', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<String> issuerId = i0.GeneratedColumn<String>(
      'issuer_id', aliasedName, true,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final i0.GeneratedColumn<DateTime> createTime =
      i0.GeneratedColumn<DateTime>(
          'create_time', aliasedName, false,
          type: const i5.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints:
              'NOT NULL DEFAULT (unixepoch(\'now\', \'subsec\'))',
          defaultValue:
              const i0.CustomExpression('unixepoch(\'now\', \'subsec\')'));
  late final i0.GeneratedColumn<DateTime> expireTime =
      i0.GeneratedColumn<DateTime>('expire_time', aliasedName, true,
          type: const i5.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints: '');
  late final i0.GeneratedColumn<DateTime> lastUseTime =
      i0.GeneratedColumn<DateTime>('last_use_time', aliasedName, true,
          type: const i5.TimestampType(),
          requiredDuringInsert: false,
          $customConstraints: '');
  @override
  List<i0.GeneratedColumn> get $columns => [
        corkId,
        cryptoKeyId,
        bearerType,
        bearerId,
        audienceType,
        audienceId,
        issuerType,
        issuerId,
        createTime,
        expireTime,
        lastUseTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corks';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {corkId};
  @override
  i3.Cork map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i3.Cork(
      corkId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}cork_id'])!,
      cryptoKeyId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.blob, data['${effectivePrefix}crypto_key_id'])!,
      bearerType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}bearer_type']),
      bearerId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}bearer_id']),
      audienceType: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}audience_type']),
      audienceId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}audience_id']),
      issuerType: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}issuer_type']),
      issuerId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}issuer_id']),
      createTime: attachedDatabase.typeMapping.read(
          const i5.TimestampType(), data['${effectivePrefix}create_time'])!,
      expireTime: attachedDatabase.typeMapping.read(
          const i5.TimestampType(), data['${effectivePrefix}expire_time']),
      lastUseTime: attachedDatabase.typeMapping.read(
          const i5.TimestampType(), data['${effectivePrefix}last_use_time']),
    );
  }

  @override
  Corks createAlias(String alias) {
    return Corks(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT corks_crypto_key_fk FOREIGN KEY(crypto_key_id)REFERENCES crypto_keys(crypto_key_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT corks_bearer_fk FOREIGN KEY(bearer_type, bearer_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT corks_audience_fk FOREIGN KEY(audience_type, audience_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED',
        'CONSTRAINT corks_issuer_fk FOREIGN KEY(issuer_type, issuer_id)REFERENCES cedar_entities(entity_type, entity_id)ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Cork extends i0.DataClass implements i0.Insertable<i3.Cork> {
  /// The unique identifier for the cork and its root key.
  final i2.Uint8List corkId;

  /// The ID of the HMAC key used to sign the cork.
  ///
  /// This is typically derived from the organization's root key.
  final i2.Uint8List cryptoKeyId;

  /// The Cedar type of the bearer entity.
  ///
  /// For example, `Celest::User` or `Celest::ServiceAccount`.
  final String? bearerType;

  /// The unique identifier of the bearer entity.
  final String? bearerId;

  /// The Cedar type of the audience entity.
  ///
  /// For example, `Celest::Service` or `Celest::Api`.
  final String? audienceType;

  /// The unique identifier of the audience entity.
  final String? audienceId;

  /// The Cedar type of the issuer entity.
  ///
  /// For example, `Celest::Organization` or `Celest::Service`.
  final String? issuerType;

  /// The unique identifier of the issuer entity.
  final String? issuerId;

  /// The time the cork was created.
  final DateTime createTime;

  /// The time the cork will expire.
  final DateTime? expireTime;

  /// The time the cork was last used.
  final DateTime? lastUseTime;
  const Cork(
      {required this.corkId,
      required this.cryptoKeyId,
      this.bearerType,
      this.bearerId,
      this.audienceType,
      this.audienceId,
      this.issuerType,
      this.issuerId,
      required this.createTime,
      this.expireTime,
      this.lastUseTime});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['cork_id'] = i0.Variable<i2.Uint8List>(corkId);
    map['crypto_key_id'] = i0.Variable<i2.Uint8List>(cryptoKeyId);
    if (!nullToAbsent || bearerType != null) {
      map['bearer_type'] = i0.Variable<String>(bearerType);
    }
    if (!nullToAbsent || bearerId != null) {
      map['bearer_id'] = i0.Variable<String>(bearerId);
    }
    if (!nullToAbsent || audienceType != null) {
      map['audience_type'] = i0.Variable<String>(audienceType);
    }
    if (!nullToAbsent || audienceId != null) {
      map['audience_id'] = i0.Variable<String>(audienceId);
    }
    if (!nullToAbsent || issuerType != null) {
      map['issuer_type'] = i0.Variable<String>(issuerType);
    }
    if (!nullToAbsent || issuerId != null) {
      map['issuer_id'] = i0.Variable<String>(issuerId);
    }
    map['create_time'] =
        i0.Variable<DateTime>(createTime, const i5.TimestampType());
    if (!nullToAbsent || expireTime != null) {
      map['expire_time'] =
          i0.Variable<DateTime>(expireTime, const i5.TimestampType());
    }
    if (!nullToAbsent || lastUseTime != null) {
      map['last_use_time'] =
          i0.Variable<DateTime>(lastUseTime, const i5.TimestampType());
    }
    return map;
  }

  factory Cork.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Cork(
      corkId: serializer.fromJson<i2.Uint8List>(json['cork_id']),
      cryptoKeyId: serializer.fromJson<i2.Uint8List>(json['crypto_key_id']),
      bearerType: serializer.fromJson<String?>(json['bearer_type']),
      bearerId: serializer.fromJson<String?>(json['bearer_id']),
      audienceType: serializer.fromJson<String?>(json['audience_type']),
      audienceId: serializer.fromJson<String?>(json['audience_id']),
      issuerType: serializer.fromJson<String?>(json['issuer_type']),
      issuerId: serializer.fromJson<String?>(json['issuer_id']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      expireTime: serializer.fromJson<DateTime?>(json['expire_time']),
      lastUseTime: serializer.fromJson<DateTime?>(json['last_use_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cork_id': serializer.toJson<i2.Uint8List>(corkId),
      'crypto_key_id': serializer.toJson<i2.Uint8List>(cryptoKeyId),
      'bearer_type': serializer.toJson<String?>(bearerType),
      'bearer_id': serializer.toJson<String?>(bearerId),
      'audience_type': serializer.toJson<String?>(audienceType),
      'audience_id': serializer.toJson<String?>(audienceId),
      'issuer_type': serializer.toJson<String?>(issuerType),
      'issuer_id': serializer.toJson<String?>(issuerId),
      'create_time': serializer.toJson<DateTime>(createTime),
      'expire_time': serializer.toJson<DateTime?>(expireTime),
      'last_use_time': serializer.toJson<DateTime?>(lastUseTime),
    };
  }

  i3.Cork copyWith(
          {i2.Uint8List? corkId,
          i2.Uint8List? cryptoKeyId,
          i0.Value<String?> bearerType = const i0.Value.absent(),
          i0.Value<String?> bearerId = const i0.Value.absent(),
          i0.Value<String?> audienceType = const i0.Value.absent(),
          i0.Value<String?> audienceId = const i0.Value.absent(),
          i0.Value<String?> issuerType = const i0.Value.absent(),
          i0.Value<String?> issuerId = const i0.Value.absent(),
          DateTime? createTime,
          i0.Value<DateTime?> expireTime = const i0.Value.absent(),
          i0.Value<DateTime?> lastUseTime = const i0.Value.absent()}) =>
      i3.Cork(
        corkId: corkId ?? this.corkId,
        cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
        bearerType: bearerType.present ? bearerType.value : this.bearerType,
        bearerId: bearerId.present ? bearerId.value : this.bearerId,
        audienceType:
            audienceType.present ? audienceType.value : this.audienceType,
        audienceId: audienceId.present ? audienceId.value : this.audienceId,
        issuerType: issuerType.present ? issuerType.value : this.issuerType,
        issuerId: issuerId.present ? issuerId.value : this.issuerId,
        createTime: createTime ?? this.createTime,
        expireTime: expireTime.present ? expireTime.value : this.expireTime,
        lastUseTime: lastUseTime.present ? lastUseTime.value : this.lastUseTime,
      );
  Cork copyWithCompanion(i3.CorksCompanion data) {
    return Cork(
      corkId: data.corkId.present ? data.corkId.value : this.corkId,
      cryptoKeyId:
          data.cryptoKeyId.present ? data.cryptoKeyId.value : this.cryptoKeyId,
      bearerType:
          data.bearerType.present ? data.bearerType.value : this.bearerType,
      bearerId: data.bearerId.present ? data.bearerId.value : this.bearerId,
      audienceType: data.audienceType.present
          ? data.audienceType.value
          : this.audienceType,
      audienceId:
          data.audienceId.present ? data.audienceId.value : this.audienceId,
      issuerType:
          data.issuerType.present ? data.issuerType.value : this.issuerType,
      issuerId: data.issuerId.present ? data.issuerId.value : this.issuerId,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      expireTime:
          data.expireTime.present ? data.expireTime.value : this.expireTime,
      lastUseTime:
          data.lastUseTime.present ? data.lastUseTime.value : this.lastUseTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cork(')
          ..write('corkId: $corkId, ')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('bearerType: $bearerType, ')
          ..write('bearerId: $bearerId, ')
          ..write('audienceType: $audienceType, ')
          ..write('audienceId: $audienceId, ')
          ..write('issuerType: $issuerType, ')
          ..write('issuerId: $issuerId, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('lastUseTime: $lastUseTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      i0.$driftBlobEquality.hash(corkId),
      i0.$driftBlobEquality.hash(cryptoKeyId),
      bearerType,
      bearerId,
      audienceType,
      audienceId,
      issuerType,
      issuerId,
      createTime,
      expireTime,
      lastUseTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i3.Cork &&
          i0.$driftBlobEquality.equals(other.corkId, this.corkId) &&
          i0.$driftBlobEquality.equals(other.cryptoKeyId, this.cryptoKeyId) &&
          other.bearerType == this.bearerType &&
          other.bearerId == this.bearerId &&
          other.audienceType == this.audienceType &&
          other.audienceId == this.audienceId &&
          other.issuerType == this.issuerType &&
          other.issuerId == this.issuerId &&
          other.createTime == this.createTime &&
          other.expireTime == this.expireTime &&
          other.lastUseTime == this.lastUseTime);
}

class CorksCompanion extends i0.UpdateCompanion<i3.Cork> {
  final i0.Value<i2.Uint8List> corkId;
  final i0.Value<i2.Uint8List> cryptoKeyId;
  final i0.Value<String?> bearerType;
  final i0.Value<String?> bearerId;
  final i0.Value<String?> audienceType;
  final i0.Value<String?> audienceId;
  final i0.Value<String?> issuerType;
  final i0.Value<String?> issuerId;
  final i0.Value<DateTime> createTime;
  final i0.Value<DateTime?> expireTime;
  final i0.Value<DateTime?> lastUseTime;
  final i0.Value<int> rowid;
  const CorksCompanion({
    this.corkId = const i0.Value.absent(),
    this.cryptoKeyId = const i0.Value.absent(),
    this.bearerType = const i0.Value.absent(),
    this.bearerId = const i0.Value.absent(),
    this.audienceType = const i0.Value.absent(),
    this.audienceId = const i0.Value.absent(),
    this.issuerType = const i0.Value.absent(),
    this.issuerId = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.expireTime = const i0.Value.absent(),
    this.lastUseTime = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CorksCompanion.insert({
    required i2.Uint8List corkId,
    required i2.Uint8List cryptoKeyId,
    this.bearerType = const i0.Value.absent(),
    this.bearerId = const i0.Value.absent(),
    this.audienceType = const i0.Value.absent(),
    this.audienceId = const i0.Value.absent(),
    this.issuerType = const i0.Value.absent(),
    this.issuerId = const i0.Value.absent(),
    this.createTime = const i0.Value.absent(),
    this.expireTime = const i0.Value.absent(),
    this.lastUseTime = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : corkId = i0.Value(corkId),
        cryptoKeyId = i0.Value(cryptoKeyId);
  static i0.Insertable<i3.Cork> custom({
    i0.Expression<i2.Uint8List>? corkId,
    i0.Expression<i2.Uint8List>? cryptoKeyId,
    i0.Expression<String>? bearerType,
    i0.Expression<String>? bearerId,
    i0.Expression<String>? audienceType,
    i0.Expression<String>? audienceId,
    i0.Expression<String>? issuerType,
    i0.Expression<String>? issuerId,
    i0.Expression<DateTime>? createTime,
    i0.Expression<DateTime>? expireTime,
    i0.Expression<DateTime>? lastUseTime,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (corkId != null) 'cork_id': corkId,
      if (cryptoKeyId != null) 'crypto_key_id': cryptoKeyId,
      if (bearerType != null) 'bearer_type': bearerType,
      if (bearerId != null) 'bearer_id': bearerId,
      if (audienceType != null) 'audience_type': audienceType,
      if (audienceId != null) 'audience_id': audienceId,
      if (issuerType != null) 'issuer_type': issuerType,
      if (issuerId != null) 'issuer_id': issuerId,
      if (createTime != null) 'create_time': createTime,
      if (expireTime != null) 'expire_time': expireTime,
      if (lastUseTime != null) 'last_use_time': lastUseTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i3.CorksCompanion copyWith(
      {i0.Value<i2.Uint8List>? corkId,
      i0.Value<i2.Uint8List>? cryptoKeyId,
      i0.Value<String?>? bearerType,
      i0.Value<String?>? bearerId,
      i0.Value<String?>? audienceType,
      i0.Value<String?>? audienceId,
      i0.Value<String?>? issuerType,
      i0.Value<String?>? issuerId,
      i0.Value<DateTime>? createTime,
      i0.Value<DateTime?>? expireTime,
      i0.Value<DateTime?>? lastUseTime,
      i0.Value<int>? rowid}) {
    return i3.CorksCompanion(
      corkId: corkId ?? this.corkId,
      cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
      bearerType: bearerType ?? this.bearerType,
      bearerId: bearerId ?? this.bearerId,
      audienceType: audienceType ?? this.audienceType,
      audienceId: audienceId ?? this.audienceId,
      issuerType: issuerType ?? this.issuerType,
      issuerId: issuerId ?? this.issuerId,
      createTime: createTime ?? this.createTime,
      expireTime: expireTime ?? this.expireTime,
      lastUseTime: lastUseTime ?? this.lastUseTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (corkId.present) {
      map['cork_id'] = i0.Variable<i2.Uint8List>(corkId.value);
    }
    if (cryptoKeyId.present) {
      map['crypto_key_id'] = i0.Variable<i2.Uint8List>(cryptoKeyId.value);
    }
    if (bearerType.present) {
      map['bearer_type'] = i0.Variable<String>(bearerType.value);
    }
    if (bearerId.present) {
      map['bearer_id'] = i0.Variable<String>(bearerId.value);
    }
    if (audienceType.present) {
      map['audience_type'] = i0.Variable<String>(audienceType.value);
    }
    if (audienceId.present) {
      map['audience_id'] = i0.Variable<String>(audienceId.value);
    }
    if (issuerType.present) {
      map['issuer_type'] = i0.Variable<String>(issuerType.value);
    }
    if (issuerId.present) {
      map['issuer_id'] = i0.Variable<String>(issuerId.value);
    }
    if (createTime.present) {
      map['create_time'] =
          i0.Variable<DateTime>(createTime.value, const i5.TimestampType());
    }
    if (expireTime.present) {
      map['expire_time'] =
          i0.Variable<DateTime>(expireTime.value, const i5.TimestampType());
    }
    if (lastUseTime.present) {
      map['last_use_time'] =
          i0.Variable<DateTime>(lastUseTime.value, const i5.TimestampType());
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorksCompanion(')
          ..write('corkId: $corkId, ')
          ..write('cryptoKeyId: $cryptoKeyId, ')
          ..write('bearerType: $bearerType, ')
          ..write('bearerId: $bearerId, ')
          ..write('audienceType: $audienceType, ')
          ..write('audienceId: $audienceId, ')
          ..write('issuerType: $issuerType, ')
          ..write('issuerId: $issuerId, ')
          ..write('createTime: $createTime, ')
          ..write('expireTime: $expireTime, ')
          ..write('lastUseTime: $lastUseTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

i0.Index get corksCryptoKeyIdx => i0.Index('corks_crypto_key_idx',
    'CREATE INDEX IF NOT EXISTS corks_crypto_key_idx ON corks (crypto_key_id)');
i0.Index get corksBearerIdx => i0.Index('corks_bearer_idx',
    'CREATE INDEX IF NOT EXISTS corks_bearer_idx ON corks (bearer_type, bearer_id)');
i0.Index get corksAudienceIdx => i0.Index('corks_audience_idx',
    'CREATE INDEX IF NOT EXISTS corks_audience_idx ON corks (audience_type, audience_id)');
i0.Index get corksIssuerIdx => i0.Index('corks_issuer_idx',
    'CREATE INDEX IF NOT EXISTS corks_issuer_idx ON corks (issuer_type, issuer_id)');

class AuthDrift extends i7.ModularAccessor {
  AuthDrift(i0.GeneratedDatabase db) : super(db);
  i8.Future<List<i1.CryptoKey>> createCryptoKey(
      {required i2.Uint8List cryptoKeyId,
      required String keyPurpose,
      required String keyAlgorithm,
      i2.Uint8List? keyMaterial,
      String? externalCryptoKeyId}) {
    return customWriteReturning(
        'INSERT INTO crypto_keys (crypto_key_id, key_purpose, key_algorithm, key_material, external_crypto_key_id) VALUES (?1, ?2, ?3, ?4, ?5) ON CONFLICT DO NOTHING RETURNING *',
        variables: [
          i0.Variable<i2.Uint8List>(cryptoKeyId),
          i0.Variable<String>(keyPurpose),
          i0.Variable<String>(keyAlgorithm),
          i0.Variable<i2.Uint8List>(keyMaterial),
          i0.Variable<String>(externalCryptoKeyId)
        ],
        updates: {
          cryptoKeys
        }).then((rows) => Future.wait(rows.map(cryptoKeys.mapFromRow)));
  }

  i0.Selectable<i1.CryptoKey> getCryptoKey(
      {required i2.Uint8List cryptoKeyId}) {
    return customSelect('SELECT * FROM crypto_keys WHERE crypto_key_id = ?1',
        variables: [
          i0.Variable<i2.Uint8List>(cryptoKeyId)
        ],
        readsFrom: {
          cryptoKeys,
        }).asyncMap(cryptoKeys.mapFromRow);
  }

  i0.Selectable<i1.CryptoKey> getExternalCryptoKey(
      {String? externalCryptoKeyId}) {
    return customSelect(
        'SELECT * FROM crypto_keys WHERE external_crypto_key_id = ?1',
        variables: [
          i0.Variable<String>(externalCryptoKeyId)
        ],
        readsFrom: {
          cryptoKeys,
        }).asyncMap(cryptoKeys.mapFromRow);
  }

  i0.Selectable<i1.CryptoKey> findCryptoKey(
      {required String keyPurpose, required String keyAlgorithm}) {
    return customSelect(
        'SELECT * FROM crypto_keys WHERE key_purpose = ?1 AND key_algorithm = ?2',
        variables: [
          i0.Variable<String>(keyPurpose),
          i0.Variable<String>(keyAlgorithm)
        ],
        readsFrom: {
          cryptoKeys,
        }).asyncMap(cryptoKeys.mapFromRow);
  }

  Future<int> deleteCryptoKey({required i2.Uint8List cryptoKeyId}) {
    return customUpdate(
      'DELETE FROM crypto_keys WHERE crypto_key_id = ?1',
      variables: [i0.Variable<i2.Uint8List>(cryptoKeyId)],
      updates: {cryptoKeys},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i8.Future<List<i4.Session>> createSession(
      {required String sessionId,
      required i2.Uint8List cryptoKeyId,
      required String userId,
      i4.SessionClient? clientInfo,
      required i4.AuthenticationFactor authenticationFactor,
      i4.SessionState? state,
      String? ipAddress,
      required DateTime expireTime,
      DateTime? cancelTime,
      String? externalSessionId}) {
    return customWriteReturning(
        'INSERT INTO sessions (session_id, crypto_key_id, user_id, client_info, authentication_factor, state, ip_address, expire_time, cancel_time, external_session_id) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10) RETURNING *',
        variables: [
          i0.Variable<String>(sessionId),
          i0.Variable<i2.Uint8List>(cryptoKeyId),
          i0.Variable<String>(userId),
          i0.Variable<i2.Uint8List>(
              i3.Sessions.$converterclientInfon.toSql(clientInfo)),
          i0.Variable<i2.Uint8List>(i3.Sessions.$converterauthenticationFactor
              .toSql(authenticationFactor)),
          i0.Variable<i2.Uint8List>(i3.Sessions.$converterstaten.toSql(state)),
          i0.Variable<String>(ipAddress),
          i0.Variable<DateTime>(expireTime, const i5.TimestampType()),
          i0.Variable<DateTime>(cancelTime, const i5.TimestampType()),
          i0.Variable<String>(externalSessionId)
        ],
        updates: {
          sessions
        }).then((rows) => Future.wait(rows.map(sessions.mapFromRow)));
  }

  i0.Selectable<i4.Session> getSession({String? sessionId}) {
    return customSelect(
        'SELECT * FROM sessions WHERE(sessions.session_id = ?1 OR sessions.external_session_id = ?1)AND sessions.expire_time > unixepoch(\'now\', \'subsec\') AND sessions.cancel_time IS NULL',
        variables: [
          i0.Variable<String>(sessionId)
        ],
        readsFrom: {
          sessions,
        }).asyncMap(sessions.mapFromRow);
  }

  i8.Future<List<i4.Session>> updateSession(
      {i4.SessionState? state, required String userId, String? sessionId}) {
    return customWriteReturning(
            'UPDATE sessions SET state = ?1, user_id = ?2 WHERE session_id = ?3 OR external_session_id = ?3 RETURNING *',
            variables: [
              i0.Variable<i2.Uint8List>(
                  i3.Sessions.$converterstaten.toSql(state)),
              i0.Variable<String>(userId),
              i0.Variable<String>(sessionId)
            ],
            updates: {sessions},
            updateKind: i0.UpdateKind.update)
        .then((rows) => Future.wait(rows.map(sessions.mapFromRow)));
  }

  Future<int> deleteSession({String? sessionId}) {
    return customUpdate(
      'DELETE FROM sessions WHERE session_id = ?1 OR external_session_id = ?1',
      variables: [i0.Variable<String>(sessionId)],
      updates: {sessions},
      updateKind: i0.UpdateKind.delete,
    );
  }

  Future<int> cancelSession({String? sessionId}) {
    return customUpdate(
      'UPDATE sessions SET cancel_time = unixepoch(\'now\', \'subsec\') WHERE session_id = ?1 OR external_session_id = ?1',
      variables: [i0.Variable<String>(sessionId)],
      updates: {sessions},
      updateKind: i0.UpdateKind.update,
    );
  }

  Future<int> createCork(
      {required i2.Uint8List corkId,
      required i2.Uint8List cryptoKeyId,
      String? bearerType,
      String? bearerId,
      String? audienceType,
      String? audienceId,
      String? issuerType,
      String? issuerId,
      DateTime? expireTime}) {
    return customInsert(
      'INSERT INTO corks (cork_id, crypto_key_id, bearer_type, bearer_id, audience_type, audience_id, issuer_type, issuer_id, expire_time) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9)',
      variables: [
        i0.Variable<i2.Uint8List>(corkId),
        i0.Variable<i2.Uint8List>(cryptoKeyId),
        i0.Variable<String>(bearerType),
        i0.Variable<String>(bearerId),
        i0.Variable<String>(audienceType),
        i0.Variable<String>(audienceId),
        i0.Variable<String>(issuerType),
        i0.Variable<String>(issuerId),
        i0.Variable<DateTime>(expireTime, const i5.TimestampType())
      ],
      updates: {corks},
    );
  }

  Future<int> upsertCork(
      {required i2.Uint8List corkId,
      required i2.Uint8List cryptoKeyId,
      String? bearerType,
      String? bearerId,
      String? audienceType,
      String? audienceId,
      String? issuerType,
      String? issuerId,
      DateTime? expireTime}) {
    return customInsert(
      'INSERT INTO corks (cork_id, crypto_key_id, bearer_type, bearer_id, audience_type, audience_id, issuer_type, issuer_id, expire_time) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9) ON CONFLICT (cork_id) DO UPDATE SET crypto_key_id = excluded.crypto_key_id, bearer_type = excluded.bearer_type, bearer_id = excluded.bearer_id, audience_type = excluded.audience_type, audience_id = excluded.audience_id, issuer_type = excluded.issuer_type, issuer_id = excluded.issuer_id, expire_time = excluded.expire_time',
      variables: [
        i0.Variable<i2.Uint8List>(corkId),
        i0.Variable<i2.Uint8List>(cryptoKeyId),
        i0.Variable<String>(bearerType),
        i0.Variable<String>(bearerId),
        i0.Variable<String>(audienceType),
        i0.Variable<String>(audienceId),
        i0.Variable<String>(issuerType),
        i0.Variable<String>(issuerId),
        i0.Variable<DateTime>(expireTime, const i5.TimestampType())
      ],
      updates: {corks},
    );
  }

  i0.Selectable<i3.Cork> getCork({required i2.Uint8List corkId}) {
    return customSelect('SELECT * FROM corks WHERE cork_id = ?1', variables: [
      i0.Variable<i2.Uint8List>(corkId)
    ], readsFrom: {
      corks,
    }).asyncMap(corks.mapFromRow);
  }

  Future<int> deleteCork({required i2.Uint8List corkId}) {
    return customUpdate(
      'DELETE FROM corks WHERE cork_id = ?1',
      variables: [i0.Variable<i2.Uint8List>(corkId)],
      updates: {corks},
      updateKind: i0.UpdateKind.delete,
    );
  }

  i8.Future<List<i2.Uint8List>> deleteCorksForEntity(
      {String? bearerType,
      String? bearerId,
      String? audienceType,
      String? audienceId,
      String? issuerType,
      String? issuerId}) {
    return customWriteReturning(
            'DELETE FROM corks WHERE(?1 IS NULL OR bearer_type = ?1)AND(?2 IS NULL OR bearer_id = ?2)AND(?3 IS NULL OR audience_type = ?3)AND(?4 IS NULL OR audience_id = ?4)AND(?5 IS NULL OR issuer_type = ?5)AND(?6 IS NULL OR issuer_id = ?6)RETURNING cork_id',
            variables: [
              i0.Variable<String>(bearerType),
              i0.Variable<String>(bearerId),
              i0.Variable<String>(audienceType),
              i0.Variable<String>(audienceId),
              i0.Variable<String>(issuerType),
              i0.Variable<String>(issuerId)
            ],
            updates: {corks},
            updateKind: i0.UpdateKind.delete)
        .then((rows) => rows
            .map((i0.QueryRow row) => row.read<i2.Uint8List>('cork_id'))
            .toList());
  }

  i8.Future<List<i3.OtpCode>> upsertOtpCode(
      {required String sessionId, int? resendAttempt, int? verifyAttempt}) {
    return customWriteReturning(
        'INSERT INTO otp_codes (session_id, resend_attempt, verify_attempt) VALUES (?1, coalesce(?2, 0), coalesce(?3, 0)) ON CONFLICT (session_id) DO UPDATE SET resend_attempt = coalesce(?2, resend_attempt), verify_attempt = coalesce(?3, verify_attempt) RETURNING *',
        variables: [
          i0.Variable<String>(sessionId),
          i0.Variable<int>(resendAttempt),
          i0.Variable<int>(verifyAttempt)
        ],
        updates: {
          otpCodes
        }).then((rows) => Future.wait(rows.map(otpCodes.mapFromRow)));
  }

  i8.Future<List<i3.OtpCode>> updateOtpCode(
      {int? resendAttempt, int? verifyAttempt, required String sessionId}) {
    return customWriteReturning(
            'UPDATE otp_codes SET resend_attempt = coalesce(?1, resend_attempt), verify_attempt = coalesce(?2, verify_attempt) WHERE session_id = ?3 RETURNING *',
            variables: [
              i0.Variable<int>(resendAttempt),
              i0.Variable<int>(verifyAttempt),
              i0.Variable<String>(sessionId)
            ],
            updates: {otpCodes},
            updateKind: i0.UpdateKind.update)
        .then((rows) => Future.wait(rows.map(otpCodes.mapFromRow)));
  }

  i0.Selectable<i3.OtpCode> getOtpCode({required String sessionId}) {
    return customSelect('SELECT * FROM otp_codes WHERE session_id = ?1',
        variables: [
          i0.Variable<String>(sessionId)
        ],
        readsFrom: {
          otpCodes,
        }).asyncMap(otpCodes.mapFromRow);
  }

  i3.CryptoKeys get cryptoKeys => i7.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i3.CryptoKeys>('crypto_keys');
  i3.Sessions get sessions => i7.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i3.Sessions>('sessions');
  i3.Corks get corks =>
      i7.ReadDatabaseContainer(attachedDatabase).resultSet<i3.Corks>('corks');
  i3.OtpCodes get otpCodes => i7.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i3.OtpCodes>('otp_codes');
  i9.CedarDrift get cedarDrift => this.accessor(i9.CedarDrift.new);
  i10.UsersDrift get usersDrift => this.accessor(i10.UsersDrift.new);
}

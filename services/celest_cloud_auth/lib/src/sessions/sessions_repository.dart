import 'package:celest/celest.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/users/users_repository.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:drift/drift.dart';

typedef _Deps = ({
  CorksRepository corks,
  CryptoKeyRepository cryptoKeys,
  CloudAuthDatabaseMixin db,
  UsersRepository users,
});

extension type SessionsRepository._(_Deps _deps) {
  SessionsRepository({
    required CorksRepository corks,
    required CloudAuthDatabaseMixin db,
    required CryptoKeyRepository cryptoKeys,
    required UsersRepository users,
  }) : _deps = (
          corks: corks,
          db: db,
          cryptoKeys: cryptoKeys,
          users: users,
        );

  CorksRepository get _corks => _deps.corks;
  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;
  CryptoKeyRepository get _cryptoKeys => _deps.cryptoKeys;
  UsersRepository get _users => _deps.users;

  Future<Session> createSession({
    required String? userId,
    required AuthenticationFactor factor,
    SessionClient? clientInfo,
    DateTime? expireTime,
    String? ipAddress,
  }) {
    final sessionId = TypeId<Session>();
    expireTime ??= DateTime.timestamp().add(const Duration(minutes: 15));
    return _db.transaction(() async {
      final keyData = await _cryptoKeys.mintHmacKey(
        cryptoKeyId: sessionId.uuid.value,
      );

      final User user;
      if (userId == null) {
        user = await _users.createAnonymousUser();
        userId = user.userId;
      } else {
        final userLookup = await _users.getUser(userId: userId!);
        if (userLookup == null) {
          throw NotFoundException('User not found: $userId');
        }
        user = userLookup;
      }

      final sessions = await _db.cloudAuthCoreDrift.createSession(
        sessionId: sessionId.encoded,
        cryptoKeyId: keyData.cryptoKeyId,
        userId: userId!,
        expireTime: expireTime!,
        authenticationFactor: factor,
        clientInfo: clientInfo,
        ipAddress: ipAddress,
      );
      final session = sessions.first;
      final sessionToken = await _corks.createCork(
        session: session,
        user: user,
      );
      return session.copyWith(sessionToken: sessionToken.toString());
    });
  }

  Future<Session> updateSession({
    required Session session,
    SessionState? state,
    String? userId,
  }) {
    return _db.transaction(() async {
      final sessionToken = session.sessionToken;
      session = (await _db.cloudAuthCoreDrift.updateSession(
        sessionId: session.sessionId.encoded,
        state: state ?? session.state,
        userId: userId ?? session.userId,
      ))
          .first;
      return session.copyWith(sessionToken: sessionToken);
    });
  }

  /// Delete (revoke) the session by removing all records such that existing
  /// corks are invalidated and future attempts to access the session result
  /// in errors.
  Future<void> deleteSession({
    required TypeId<Session> sessionId,
  }) {
    return _db.transaction(() async {
      final session = await _db.cloudAuthCoreDrift
          .getSession(sessionId: sessionId.encoded)
          .getSingleOrNull();
      if (session == null) {
        return;
      }

      // Due to cascade statements, the session and associated cork
      // will be deleted as well.
      await _db.cloudAuthCryptoKeys.deleteWhere(
        (key) => key.cryptoKeyId.equals(session.cryptoKeyId),
      );
      await _db.cedarDrift.deleteEntity(
        entityType: 'Celest::Session',
        entityId: sessionId.encoded,
      );
    });
  }
}

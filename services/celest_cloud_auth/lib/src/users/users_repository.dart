import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';

typedef _Deps = ({
  CloudAuthDatabaseMixin db,
});

extension type UsersRepository._(_Deps _deps) {
  UsersRepository({
    required CloudAuthDatabaseMixin db,
  }) : _deps = (db: db);

  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;

  /// Creates a new user, authenticated by the given [factor].
  Future<User> createUser({
    required AuthenticationFactor factor,
  }) async {
    return _db.transaction(() async {
      return _db.createUser(
        user: User(
          userId: typeId<User>(),
          emails: [
            if (factor case AuthenticationFactorEmailOtp(:final email))
              Email(email: email, isVerified: true, isPrimary: true),
          ],
          phoneNumbers: [
            if (factor case AuthenticationFactorSmsOtp(:final phoneNumber))
              PhoneNumber(
                phoneNumber: phoneNumber,
                isVerified: true,
                isPrimary: true,
              ),
          ],
          roles: const [EntityUid.of('Celest::Role', 'authenticated')],
        ),
      );
    });
  }

  /// Creates a new anonymous user.
  Future<User> createAnonymousUser() async {
    return _db.transaction(() async {
      return _db.createUser(
        user: User(
          userId: typeId<User>(),
          roles: const [EntityUid.of('Celest::Role', 'anonymous')],
        ),
      );
    });
  }

  Future<User?> getUser({required String userId}) async {
    return _db.getUser(userId: userId);
  }

  Future<User> updateUser({
    required String userId,
    required AuthenticationFactor factor,
    required List<EntityUid> roles,
  }) async {
    return _db.transaction(() async {
      switch (factor) {
        case AuthenticationFactorEmailOtp(:final email):
          await _db.usersDrift.upsertUserEmail(
            userId: userId,
            email: email,
            isVerified: true,
          );
        case AuthenticationFactorSmsOtp(:final phoneNumber):
          await _db.usersDrift.upsertUserPhoneNumber(
            userId: userId,
            phoneNumber: phoneNumber,
            isVerified: true,
          );
      }
      await _db.setUserRoles(userId: userId, roles: roles);
      final user = await _db.getUser(userId: userId);
      return user!;
    });
  }

  Future<void> deleteUser({
    required String userId,
  }) async {
    return _db.transaction(() async {
      await _db.cedarDrift.deleteEntity(
        entityType: 'Celest::User',
        entityId: userId,
      );
    });
  }
}

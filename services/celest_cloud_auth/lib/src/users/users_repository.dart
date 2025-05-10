import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:drift/drift.dart';

typedef _Deps = ({CloudAuthDatabaseMixin db});

extension type UsersRepository._(_Deps _deps) {
  UsersRepository({required CloudAuthDatabaseMixin db}) : _deps = (db: db);

  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;

  /// Creates a new user, authenticated by the given [factor].
  Future<User> createUser({required AuthenticationFactor factor}) async {
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
  }

  /// Creates a new anonymous user.
  Future<User> createAnonymousUser() async {
    return _db.createUser(
      user: User(
        userId: typeId<User>(),
        roles: const [EntityUid.of('Celest::Role', 'anonymous')],
      ),
    );
  }

  Future<User?> getUser({required String userId}) async {
    return _db.getUser(userId: userId);
  }

  Future<User> updateUser({
    required String userId,
    required AuthenticationFactor factor,
    required List<EntityUid> roles,
  }) async {
    await _db.batch((b) async {
      switch (factor) {
        case AuthenticationFactorEmailOtp(:final email):
          b.insert<CloudAuthUserEmails, Email>(
            _db.cloudAuthUserEmails,
            CloudAuthUserEmailsCompanion.custom(
              userId: Constant(userId),
              email: Constant(email),
              isVerified: const Constant(true),
              // SELECT COUNT(*) = 0 FROM cloud_auth_user_emails WHERE user_id = ? AND email <> ?
              isPrimary: subqueryExpression(
                _db.cloudAuthUserEmails.selectOnly()
                  ..addColumns([countAll().equalsExp(const Constant(0))])
                  ..where(
                    _db.cloudAuthUserEmails.userId.equals(userId) &
                        _db.cloudAuthUserEmails.email.equals(email).not(),
                  ),
              ),
            ),
            onConflict: DoUpdate.withExcluded(
              (_, excluded) => CloudAuthUserEmailsCompanion.custom(
                isVerified: excluded.isVerified,
                isPrimary: excluded.isPrimary,
              ),
            ),
          );
        case AuthenticationFactorSmsOtp(:final phoneNumber):
          b.insert<CloudAuthUserPhoneNumbers, PhoneNumber>(
            _db.cloudAuthUserPhoneNumbers,
            CloudAuthUserPhoneNumbersCompanion.custom(
              userId: Constant(userId),
              phoneNumber: Constant(phoneNumber),
              isVerified: const Constant(true),
              // SELECT COUNT(*) = 0 FROM cloud_auth_user_phone_numbers WHERE user_id = ? AND phone_number <> ?
              isPrimary: subqueryExpression(
                _db.cloudAuthUserPhoneNumbers.selectOnly()
                  ..addColumns([countAll().equalsExp(const Constant(0))])
                  ..where(
                    _db.cloudAuthUserPhoneNumbers.userId.equals(userId) &
                        _db.cloudAuthUserPhoneNumbers.phoneNumber
                            .equals(phoneNumber)
                            .not(),
                  ),
              ),
            ),
            onConflict: DoUpdate.withExcluded(
              (_, excluded) => CloudAuthUserPhoneNumbersCompanion.custom(
                isVerified: excluded.isVerified,
                isPrimary: excluded.isPrimary,
              ),
            ),
          );
      }
      await _db.setUserRoles(userId: userId, roles: roles, batch: b);
    });
    final user = await _db.getUser(userId: userId);
    return user!;
  }

  Future<void> deleteUser({required String userId}) async {
    await _db.cedarDrift.deleteEntity(
      entityType: 'Celest::User',
      entityId: userId,
    );
  }
}

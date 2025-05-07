import 'package:celest/src/core/context.dart' as celest;
// ignore: invalid_use_of_internal_member
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:celest_cloud_auth/src/authentication/authentication_service.dart';
import 'package:celest_cloud_auth/src/authorization/authorization_middleware.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/email/email_provider.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_cloud_auth/src/otp/otp_repository.dart';
import 'package:celest_cloud_auth/src/sessions/sessions_repository.dart';
import 'package:celest_cloud_auth/src/users/users_repository.dart';
import 'package:celest_cloud_auth/src/users/users_service.dart';
import 'package:celest_core/_internal.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart';

export 'package:celest_cloud_auth/src/authentication/authentication_service.dart';
export 'package:celest_cloud_auth/src/database/auth_database.dart';
export 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
export 'package:celest_cloud_auth/src/email/email_provider.dart';
export 'package:celest_cloud_auth/src/otp/otp_provider.dart';
export 'package:celest_cloud_auth/src/users/users_service.dart';

/// The Celest authentication and authorization service.
final class CelestCloudAuth {
  CelestCloudAuth._({
    required this.db,
    required this.cryptoKeys,
  }) {
    celest.context.put(contextKey, this);
  }

  /// Returns the [CelestCloudAuth] instance from the given [context].
  factory CelestCloudAuth.of(celest.Context context) {
    return context.expect(contextKey);
  }

  static const celest.ContextKey<CelestCloudAuth> contextKey =
      celest.ContextKey('CelestCloudAuth');

  /// Creates a new [CelestCloudAuth] instance which can be added to a Shelf
  /// pipeline using [handler].
  ///
  /// Typical usage:
  ///
  /// ```dart
  /// Future<void> main() async {
  ///   final auth = await CelestCloudAuth.create(
  ///     database: AuthDatabase.memory(),
  ///   );
  ///
  ///   // Adds authentication routes.
  ///   final router = Router();
  ///   router.mount('/v1alpha1/auth/', auth.handler);
  ///
  ///   // Adds authorization middleware.
  ///   final pipeline = const Pipeline().addMiddleware(auth.middleware);
  ///
  ///   final server = await serve(
  ///     pipeline.addHandler(router.call),
  ///     InternetAddress.anyIpV4,
  ///     8080,
  ///   );
  ///   print('Serving at http://${server.address.host}:${server.port}');
  /// }
  /// ```
  static Future<CelestCloudAuth> create({
    required CloudAuthDatabaseMixin database,
    EmailOtpProvider? emailProvider,
  }) async {
    final cryptoKeys = await CryptoKeyRepository.create(db: database);
    if (emailProvider != null) {
      celest.context.put(contextKeyEmailOtpProvider, emailProvider);
    }
    return CelestCloudAuth._(
      db: database,
      cryptoKeys: cryptoKeys,
    );
  }

  @visibleForTesting
  static Future<CelestCloudAuth> test({
    CloudAuthDatabaseMixin? db,
    CryptoKey? rootKey,
  }) async {
    db ??= CloudAuthDatabase.memory();
    final cryptoKeys = await CryptoKeyRepository.create(
      db: db,
      rootKey: rootKey,
    );
    return CelestCloudAuth._(
      db: db,
      cryptoKeys: cryptoKeys,
    );
  }

  /// An authorization middleware which can be added to a Shelf pipeline.
  AuthorizationMiddleware get middleware => authenticationService.middleware;

  @visibleForTesting
  final CloudAuthDatabaseMixin db;

  @visibleForTesting
  final CryptoKeyRepository cryptoKeys;

  @visibleForTesting
  OtpRepository get otp => OtpRepository(cryptoKeys: cryptoKeys, db: db);

  @visibleForTesting
  Authorizer get authorizer => Authorizer(db: db);

  @visibleForTesting
  CorksRepository get corks => CorksRepository(
        issuer: context.rootEntity,
        db: db,
        cryptoKeys: cryptoKeys,
      );

  @visibleForTesting
  SessionsRepository get sessions => SessionsRepository(
        corks: corks,
        db: db,
        cryptoKeys: cryptoKeys,
        users: users,
      );

  @visibleForTesting
  UsersRepository get users => UsersRepository(db: db);

  /// A map of routes to their respective [EntityUid]s.
  @visibleForTesting
  late final RouteMap routeMap = RouteMap.of(context.project);

  @visibleForTesting
  late final AuthenticationService authenticationService =
      AuthenticationService(
    issuer: context.rootEntity,
    routeMap: routeMap,
    otp: otp,
    authorizer: authorizer,
    corks: corks,
    cryptoKeys: cryptoKeys,
    db: db,
    sessions: sessions,
    users: users,
  );

  @visibleForTesting
  late final UsersService usersService = UsersService(
    issuer: context.rootEntity,
    routeMap: routeMap,
    authorizer: authorizer,
    corks: corks,
    cryptoKeys: cryptoKeys,
    users: users,
    db: db,
  );

  Handler get handler {
    final pipeline =
        const Pipeline().addMiddleware(const CloudExceptionMiddleware().call);
    final cascade = Cascade(statusCodes: [HttpStatus.notFound])
        .add(authenticationService.handler)
        .add(usersService.handler)
        .handler;
    return pipeline.addHandler(cascade);
  }

  Future<void> close() async {
    await db.close();
  }
}

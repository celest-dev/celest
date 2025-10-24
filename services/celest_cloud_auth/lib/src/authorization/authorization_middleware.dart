import 'package:cedar/cedar.dart';
import 'package:celest/http.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/http/http_helpers.dart';
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_cloud_auth/src/sessions/sessions_repository.dart';
import 'package:celest_cloud_auth/src/users/users_repository.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/celest_core.dart' as core;
import 'package:celest_core/celest_core.dart';
import 'package:collection/collection.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart' show Handler, Request;

typedef _Deps =
    ({
      RouteMap routeMap,
      CorksRepository corks,
      CryptoKeyRepository cryptoKeys,
      UsersRepository users,
      CloudAuthDatabaseMixin db,
      Authorizer authorizer,
      EntityUid issuer,
    });

/// {@template celest_cloud_auth.request_authorizer}
/// A middleware that authorizes requests based on the current policy set.
/// {@endtemplate}
extension type AuthorizationMiddleware._(_Deps _deps) implements Object {
  /// {@macro celest_cloud_auth.request_authorizer}
  AuthorizationMiddleware({
    required RouteMap routeMap,
    required CorksRepository corks,
    required CryptoKeyRepository cryptoKeys,
    required UsersRepository users,
    required CloudAuthDatabaseMixin db,
    required Authorizer authorizer,
    required EntityUid issuer,
  }) : this._((
         routeMap: routeMap,
         corks: corks,
         cryptoKeys: cryptoKeys,
         users: users,
         db: db,
         authorizer: authorizer,
         issuer: issuer,
       ));

  RouteMap get _routeMap => _deps.routeMap;
  CorksRepository get _corks => _deps.corks;
  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;
  Authorizer get _authorizer => _deps.authorizer;
  SessionsRepository get _sessions => SessionsRepository(
    corks: _corks,
    db: _deps.db,
    cryptoKeys: _deps.cryptoKeys,
    users: _deps.users,
  );

  Handler call(Handler inner) {
    return (request) async {
      final user = await authenticate(request);
      if (user != null) {
        context.setLocal(ContextKey.principal, user);
      }
      return inner(request);
    };
  }

  /// Authenticates the request and returns the user if the request is
  /// authorized.
  ///
  /// Throws an [UnauthorizedException] if the request is not authorized or
  /// a [PermissionDeniedException] if the request is not allowed.
  @useResult
  @visibleForTesting
  Future<core.User?> authenticate(Request request) async {
    final requestPath = request.requestedUri.path;
    final result = _routeMap.lookupRoute(
      request.method as HttpMethod,
      requestPath,
    );
    if (result == null) {
      throw core.NotFoundException(
        'Route not found: ${request.method} $requestPath',
      );
    }
    final (route, routeParameters) = result;
    context.setLocal(contextKeyRouteParameters, routeParameters);

    final (user, principal) = await extractPrincipal(request);

    // Authorizes the request using the current policy set and the invoking
    // `principal`.
    await _authorizer.expectAuthorized(
      principal: principal,
      action: const EntityUid.of('Celest::Action', 'invoke'),
      resource: route.uid,
      context: {'ip': Value.string(request.clientIp)},
    );
    context.logger.finest('Authorized request');

    return user;
  }

  /// Extracts the user and the Cedar principal from the request.
  ///
  /// Celest corks can be passed either through a cookie or the Authorization
  /// header. By default, Celest will use cookies when the client is a browser
  /// and the Authorization header when the client is a non-browser client.
  @useResult
  @visibleForTesting
  Future<(User?, Entity?)> extractPrincipal(Request request) async {
    final cookies = request.cookies;
    CedarCork? cork;
    if (cookies['cork'] case final token?) {
      context.logger.finest('Found cork in cookies');
      cork = CedarCork.parse(token);
    } else if (request.headers['authorization']?.split(' ') case [
      final type,
      final token,
    ] when equalsIgnoreAsciiCase(type, 'bearer')) {
      context.logger.finest('Found cork in headers');
      cork = CedarCork.parse(token);
    }
    if (cork == null) {
      context.logger.finest('No cork found in cookies or headers');
      return const (null, null);
    }
    try {
      await _corks.verify(cork: cork);
    } on InvalidSignatureException catch (e) {
      context.logger.severe('Invalid cork signature: $cork', e);
      throw const UnauthorizedException('Invalid cork signature');
    }

    context.setLocal(contextKeyCork, cork);
    switch (cork.bearer) {
      case EntityUid(type: 'Celest::Session', id: final sessionId):
        final sessionTid = TypeId.tryDecode<Session>(sessionId);
        if (sessionTid == null) {
          context.logger.severe('Invalid session ID: $sessionId');
          throw const UnauthorizedException('Invalid session ID');
        }
        final session = await _sessions.getSession(sessionId: sessionTid);
        if (session == null) {
          throw UnauthorizedException('Invalid session: $sessionId');
        }
        final user = await _db.getUser(userId: session.userId);
        if (user == null) {
          throw UnauthorizedException('Invalid user: ${session.userId}');
        }
        context.logger.finest('Found user for cork: $user');
        return (user, user.toEntity());
      default:
        context.logger.severe('Valid cork but no bearer: $cork');
        return const (null, null);
    }
  }
}

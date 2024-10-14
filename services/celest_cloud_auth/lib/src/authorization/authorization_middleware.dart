import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/database/auth_database.dart';
import 'package:celest_cloud_auth/src/http/http_helpers.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_core/celest_core.dart' as core;
import 'package:celest_core/celest_core.dart';
import 'package:collection/collection.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart' show Handler, Request;

typedef _Deps = ({
  RouteMap routeMap,
  CorksRepository corks,
  AuthDatabase db,
  Authorizer authorizer,
});

/// {@template celest_cloud_auth.request_authorizer}
/// A middleware that authorizes requests based on the current policy set.
/// {@endtemplate}
extension type AuthorizationMiddleware._(_Deps _deps) implements Object {
  /// {@macro celest_cloud_auth.request_authorizer}
  AuthorizationMiddleware({
    required RouteMap routeMap,
    required CorksRepository corks,
    required AuthDatabase db,
    required Authorizer authorizer,
  }) : this._(
          (
            routeMap: routeMap,
            corks: corks,
            db: db,
            authorizer: authorizer,
          ),
        );

  RouteMap get _routeMap => _deps.routeMap;
  CorksRepository get _corks => _deps.corks;
  AuthDatabase get _db => _deps.db;
  Authorizer get _authorizer => _deps.authorizer;

  Handler call(Handler inner) {
    return (request) async {
      final user = await authenticate(request);
      if (user != null) {
        context.put(ContextKey.principal, user);
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
    EntityUid? function;
    for (final MapEntry(key: uid, value: route) in _routeMap.entries) {
      if (route.matches(requestPath)) {
        function = uid;
        break;
      }
    }
    if (function == null) {
      throw core.InternalServerError('Route not found: $requestPath');
    }

    final (user, principal) = await extractPrincipal(request);

    // Authorizes the request using the current policy set and the invoking
    // `principal`.
    await _authorizer.expectAuthorized(
      principal: principal,
      action: const EntityUid.of('Celest::Action', 'invoke'),
      resource: function.uid,
      context: {
        'ip': Value.string(request.clientIp),
      },
      debug: true,
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
    } else if (request.headers['authorization']?.split(' ')
        case [final type, final token]
        when equalsIgnoreAsciiCase(type, 'bearer')) {
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
    switch (cork.bearer) {
      case EntityUid(type: 'Celest::User', id: final userId):
        final user = await _db.getUser(userId: userId);
        context.logger.finest('Found user for cork: $user');
        return (user, cork.claims);
      default:
        context.logger.severe('Valid cork but no bearer: $cork');
        return const (null, null);
    }
  }
}

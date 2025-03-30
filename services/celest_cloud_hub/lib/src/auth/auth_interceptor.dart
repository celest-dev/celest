import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/database/auth_database.dart';
import 'package:celest_cloud_auth/src/model/cookie.dart';
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_core/celest_core.dart' as core;
import 'package:celest_core/celest_core.dart';
import 'package:collection/collection.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';

typedef _Deps = ({CorksRepository corks, AuthDatabase db});

/// {@template celest_cloud_auth.request_authorizer}
/// A middleware that authorizes requests based on the current policy set.
/// {@endtemplate}
extension type AuthorizationMiddleware._(_Deps _deps) implements Object {
  /// {@macro celest_cloud_auth.request_authorizer}
  AuthorizationMiddleware({
    required CorksRepository corks,
    required AuthDatabase db,
  }) : this._((corks: corks, db: db));

  CorksRepository get _corks => _deps.corks;
  AuthDatabase get _db => _deps.db;

  /// Authenticates the request and returns the user if the request is
  /// authorized.
  ///
  /// Throws an [UnauthorizedException] if the request is not authorized or
  /// a [PermissionDeniedException] if the request is not allowed.
  Future<void> authenticate(
    ServiceCall call,
    ServiceMethod<Object?, Object?> method,
  ) async {
    final (user, principal) = await extractPrincipal(call);
    call.user = user;
    call.principal = principal;
  }

  /// Extracts the user and the Cedar principal from the request.
  ///
  /// Celest corks can be passed either through a cookie or the Authorization
  /// header. By default, Celest will use cookies when the client is a browser
  /// and the Authorization header when the client is a non-browser client.
  @useResult
  @visibleForTesting
  Future<(User?, Entity?)> extractPrincipal(ServiceCall request) async {
    final cookies = request.cookies;
    CedarCork? cork;
    if (cookies['cork'] case final token?) {
      context.logger.finest('Found cork in cookies');
      cork = CedarCork.parse(token);
    } else if (request.clientMetadata?['authorization']?.split(' ') case [
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

    request.cork = cork;
    switch (cork.bearer) {
      case EntityUid(type: 'Celest::Session', id: final sessionId):
        final session = await _db.getSession(sessionId: sessionId);
        if (session == null) {
          throw const UnauthorizedException('Invalid session');
        }
        final user = await _db.getUser(userId: session.userId);
        if (user == null) {
          throw const UnauthorizedException('Invalid user');
        }
        context.logger.finest('Found user for cork: $user');
        return (user, user.toEntity());
      default:
        context.logger.severe('Valid cork but no bearer: $cork');
        return const (null, null);
    }
  }
}

extension on ServiceCall {
  Map<String, String> get cookies {
    return parseCookies({
      for (final header in (clientMetadata ?? const {}).entries)
        header.key: [header.value],
    });
  }
}

extension ServiceCallHelpers on ServiceCall {
  static final Expando<core.User> _users = Expando<core.User>();
  static final Expando<CedarCork> _corks = Expando<CedarCork>();
  static final Expando<Entity> _principals = Expando<Entity>();

  core.User? get user => _users[this];

  set user(core.User? user) {
    _users[this] = user;
  }

  CedarCork? get cork => _corks[this];

  set cork(CedarCork? cork) {
    _corks[this] = cork;
  }

  Entity? get principal => _principals[this];

  Entity expectPrincipal() {
    if (principal case final principal?) {
      return principal;
    }
    throw GrpcError.unauthenticated();
  }

  set principal(Entity? principal) {
    _principals[this] = principal;
  }
}

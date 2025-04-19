import 'package:cedar/cedar.dart' hide Value;
// ignore: invalid_use_of_internal_member
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:celest_ast/celest_ast.dart' hide Variable;
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud_auth/src/authorization/authorization_middleware.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/celest_action.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/database/schema/cloud_auth_users.drift.dart';
import 'package:celest_cloud_auth/src/http/http_helpers.dart';
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_cloud_auth/src/model/order_by.dart';
import 'package:celest_cloud_auth/src/model/page_token.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_cloud_auth/src/users/users_repository.dart';
import 'package:celest_core/celest_core.dart';
import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

typedef _Deps = ({
  EntityUid issuer,
  RouteMap routeMap,
  CorksRepository corks,
  CryptoKeyRepository cryptoKeys,
  UsersRepository users,
  CloudAuthDatabaseMixin db,
  Authorizer authorizer,
});

extension type UsersService._(_Deps _deps) implements Object {
  UsersService({
    required EntityUid issuer,
    required RouteMap routeMap,
    required CorksRepository corks,
    required CryptoKeyRepository cryptoKeys,
    required UsersRepository users,
    required CloudAuthDatabaseMixin db,
    required Authorizer authorizer,
  }) : this._(
          (
            issuer: issuer,
            routeMap: routeMap,
            corks: corks,
            cryptoKeys: cryptoKeys,
            users: users,
            db: db,
            authorizer: authorizer,
          ),
        );

  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;
  Authorizer get _authorizer => _deps.authorizer;

  Router get _router {
    return Router()
      ..get('/users/<userId>', handleGetUser)
      ..get('/users', handleListUsers)
      ..patch('/users/<userId>', handleUpdateUser)
      ..delete('/users/<userId>', handleDeleteUser);
  }

  Handler get handler {
    final requestAuthorizer = AuthorizationMiddleware(
      routeMap: _deps.routeMap,
      corks: _deps.corks,
      cryptoKeys: _deps.cryptoKeys,
      users: _deps.users,
      db: _deps.db,
      authorizer: _deps.authorizer,
      issuer: _deps.issuer,
    );
    return const Pipeline()
        .addMiddleware(const CloudExceptionMiddleware().call)
        .addMiddleware(requestAuthorizer.call)
        .addHandler(_router.call);
  }

  static const String apiId = 'celest.cloud.auth.v1alpha1.Users';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: apiId,
    functions: {
      'GetUser': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'GetUser',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'GET',
            path: '/v1alpha1/auth/{name=users/*}',
          ),
        ),
      ),
      'ListUsers': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'ListUsers',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'GET',
            path: '/v1alpha1/auth/users',
          ),
        ),
      ),
      'UpdateUser': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'UpdateUser',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'PATCH',
            path: '/v1alpha1/auth/{user.name=users/*}',
          ),
        ),
      ),
      'DeleteUser': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'DeleteUser',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'DELETE',
            path: '/v1alpha1/auth/{name=users/*}',
          ),
        ),
      ),
    },
    policySet: PolicySet(
      templateLinks: [
        TemplateLink(
          templateId: 'cloud.functions.anonymous',
          newId: apiId,
          values: {SlotId.resource: apiUid},
        ),
      ],
    ),
  );

  static final RegExp _validUserId = RegExp(r'^[a-zA-Z0-9_-]+$');

  EntityUid _getResource(Request request) {
    final userId = request.params['userId'];
    if (userId == null) {
      throw BadRequestException(
        'Invalid name. Expected $_validUserId, got "$userId"',
      );
    }
    if (!_validUserId.hasMatch(userId)) {
      throw BadRequestException(
        'Invalid name. Expected $_validUserId, got "$userId"',
      );
    }
    return EntityUid.of('Celest::User', userId);
  }

  @visibleForTesting
  Future<User> getUser({
    required String userId,
  }) async {
    final user = await _db.getUser(userId: userId);
    if (user == null) {
      throw NotFoundException('User not found. userId=$userId');
    }
    return user;
  }

  Future<Response> handleGetUser(Request request) async {
    final principal = context.get(ContextKey.principal);
    final user = await getUser(
      userId: switch (context.routeParameters['name']!.split('/')) {
        ['users', 'me'] when principal != null => principal.id,
        ['users', final userId] => userId,
        final badName => throw BadRequestException(
            'Invalid user: $badName. Expected users/{user_id}',
          ),
      },
    );

    await _authorizer.expectAuthorized(
      principal: principal?.uid,
      resource: EntityUid.of('Celest::User', user.id),
      action: CelestAction.get,
    );
    return user.toProto().jsonResponse();
  }

  @visibleForTesting
  Future<pb.ListUsersResponse> listUsers({
    String? parent,
    int? pageSize,
    String? pageToken,
    String? filter,
    String? orderBy,
  }) async {
    final pageData = pageToken != null ? PageToken.parse(pageToken) : null;
    final pageOffset = pageData?.offset ?? 0;
    const defaultPageSize = 10;
    pageSize ??= defaultPageSize;
    final startTime =
        pageData?.startTime ?? clock.now().add(const Duration(seconds: 1));

    OrderByClause? orderByClause;
    if (orderBy != null) {
      orderByClause = OrderByClause.parse(orderBy);
    }

    final rows = await _db.cloudAuthUsersDrift
        .listUsers(
          startTime: startTime,
          offset: pageOffset,
          limit: pageSize,
          order_by: (tbl) => switch (orderByClause) {
            final orderBy? => OrderBy(orderBy.toOrderingTerms(tbl).toList()),
            _ => OrderBy([
                OrderingTerm(
                  expression: tbl.createTime,
                  mode: OrderingMode.desc,
                ),
              ]),
          },
        )
        .get();
    final users = rows
        .map((row) => row.cloudAuthUsers
            .copyWith(emails: row.emails, phoneNumbers: row.phoneNumbers)
            .toProto())
        .toList();
    final nextPageToken = rows.isEmpty || rows.length < pageSize
        ? null
        : PageToken(
            startTime: startTime,
            offset: rows.last.rowNum,
          ).encode();
    return pb.ListUsersResponse(
      users: users,
      nextPageToken: nextPageToken,
    );
  }

  Future<Response> handleListUsers(Request request) async {
    final principal = context.get(ContextKey.principal);
    await _authorizer.expectAuthorized(
      principal: principal?.uid,
      action: CelestAction.list,
    );
    final response = await listUsers(
      parent: request.url.queryParameters['parent'],
      filter: request.url.queryParameters['filter'],
      orderBy: request.url.queryParameters['orderBy'],
      pageSize: switch (request.url.queryParameters['pageSize']) {
        final pageSize? => int.parse(pageSize),
        _ => null,
      },
      pageToken: request.url.queryParameters['pageToken'],
    );
    return response.jsonResponse();
  }

  @visibleForTesting
  Future<User> updateUser({
    required String userId,
    String? givenName,
    String? familyName,
    String? timeZone,
    String? languageCode,
    List<String>? updateMask,
  }) async {
    Value<T> mask<T extends Object?>(String field, T value) {
      final include = updateMask == null ||
          updateMask.isEmpty ||
          updateMask.contains(field);
      if (!include) {
        return const Value.absent();
      }
      return Value(value);
    }

    final update = CloudAuthUsersCompanion(
      givenName: mask('given_name', givenName),
      familyName: mask('family_name', familyName),
      timeZone: mask('time_zone', timeZone),
      languageCode: mask('language_code', languageCode),
      updateTime: Value(clock.now()),
    );

    await (_db.update(_db.cloudAuthUsers)
          ..where((tbl) => tbl.userId.equals(userId)))
        .write(update);
    final updated = await _db.getUser(userId: userId);
    return updated!;
  }

  Future<Response> handleUpdateUser(Request request) async {
    final principal = context.get(ContextKey.principal);
    final resource = _getResource(request);
    await _authorizer.expectAuthorized(
      principal: principal?.uid,
      resource: resource,
      action: CelestAction.update,
    );
    final jsonRequest = await JsonUtf8.decodeStream(request.read());
    final pbRequest = pb.User()..mergeFromProto3Json(jsonRequest);
    final updateMask = request.url.queryParametersAll['updateMask']
        ?.expand((it) => it.split(','));
    final response = await updateUser(
      userId: resource.id,
      givenName: pbRequest.hasGivenName() ? pbRequest.givenName : null,
      familyName: pbRequest.hasFamilyName() ? pbRequest.familyName : null,
      timeZone: pbRequest.hasTimeZone() ? pbRequest.timeZone : null,
      languageCode: pbRequest.hasLanguageCode() ? pbRequest.languageCode : null,
      updateMask: updateMask?.toList(),
    );
    return response.toProto().jsonResponse();
  }

  @visibleForTesting
  Future<void> deleteUser({
    required String userId,
    String? etag,
  }) async {
    final deleteEntities = await _db.transaction(() async {
      final user = await _db.getUser(userId: userId);
      if (user == null) {
        throw NotFoundException('User not found. id=$userId');
      }
      if (etag != null) {
        assert(user.etag != null, 'Missing etag to compare against');
        if (user.etag != etag) {
          throw const FailedPreconditionException('Etag mismatch');
        }
      }

      return (_db.delete(_db.cloudAuthUsers)
            ..where((t) => t.userId.equals(userId)))
          .go();
    });
    switch (deleteEntities) {
      case 0:
        throw NotFoundException('User not found. id=$userId');
      case 1:
        return;
      default:
        context.logger.shout(
          'Deleted $deleteEntities entities for user $userId',
        );
    }
  }

  Future<Response> handleDeleteUser(Request request) async {
    final principal = context.get(ContextKey.principal);
    final resource = _getResource(request);
    await _authorizer.expectAuthorized(
      principal: principal?.uid,
      resource: resource,
      action: CelestAction.delete,
    );
    await deleteUser(
      userId: resource.id,
      etag: request.url.queryParameters['etag'],
    );
    return pb.Empty().jsonResponse();
  }
}

extension on User {
  EntityUid get uid => EntityUid.of('Celest::User', userId);
}

import 'package:cedar/ast.dart' hide Value;
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
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/database/schema/users.drift.dart';
import 'package:celest_cloud_auth/src/http/http_helpers.dart';
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_cloud_auth/src/model/order_by.dart';
import 'package:celest_cloud_auth/src/model/page_token.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_core/celest_core.dart';
import 'package:drift/drift.dart' as drift;
import 'package:drift/drift.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

typedef _Deps = ({
  EntityUid issuer,
  RouteMap routeMap,
  CorksRepository corks,
  CloudAuthDatabaseMixin db,
  Authorizer authorizer,
});

extension type UsersService._(_Deps _deps) implements Object {
  UsersService({
    required EntityUid issuer,
    required RouteMap routeMap,
    required CorksRepository corks,
    required CloudAuthDatabaseMixin db,
    required Authorizer authorizer,
  }) : this._(
          (
            issuer: issuer,
            routeMap: routeMap,
            corks: corks,
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
      policies: {
        apiId: Policy(
          effect: Effect.permit,
          principal: const PrincipalIs('Celest::User'),
          action: const ActionEquals(CelestAction.invoke),
          annotations: Annotations({
            'id': apiId,
          }),
          resource: const ResourceIn(apiUid),
          conditions: [],
        ),
      },
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
    final resource = _getResource(request);
    await _authorizer.expectAuthorized(
      principal: principal?.uid,
      resource: resource,
      action: CelestAction.get,
    );
    final response = await getUser(userId: principal!.userId);
    return response.toProto().jsonResponse();
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
    final startTime = pageData?.startTime ??
        DateTime.timestamp().add(const Duration(seconds: 1));

    /*
    Roughly, we're trying to construct the query:

      WITH rowed AS(
          SELECT 
              ROW_NUMBER() OVER (ORDER BY create_time DESC) AS row_num,
              id,
              create_time
          FROM users
          WHERE create_time <= coalesce(:start_time, unixepoch('now', '+1 second', 'subsec'))
      )
      SELECT 
          row_num, 
          users.*
      FROM users
      JOIN rowed ON users.id = rowed.id
      WHERE row_num > coalesce(:page_offset, 0)
      ORDER BY :order_by
      LIMIT :page_size;

    Since we want a dynamic `ORDER BY` clause, we need to construct the query
    programmatically. We can't pass `:order_by` as a variable to Drift.
    */

    const rowNum = CustomExpression<int>(
      'ROW_NUMBER() OVER (ORDER BY create_time DESC)',
    );
    final rowedQuery = Subquery(
      _db.users.selectOnly()
        ..addColumns([
          rowNum,
          _db.users.userId,
          _db.users.createTime,
        ])
        ..where(
          _db.users.createTime.isSmallerThanValue(startTime),
        ),
      'rowed',
    );

    final query = _db.usersDrift.select(_db.users).join([
      innerJoin(
        rowedQuery,
        _db.users.userId.equalsExp(rowedQuery.ref(_db.users.userId)),
        useColumns: false,
      ),
    ])
      ..addColumns([rowedQuery.ref(rowNum)])
      ..where(
        rowedQuery.ref(rowNum).isBiggerThanValue(pageOffset),
      );

    if (orderBy != null) {
      final clause = OrderByClause.parse(orderBy);
      query.orderBy(clause.toOrderingTerms(_db.users).toList());
    }

    query.limit(pageSize);
    final rows = await query.get();
    final users =
        rows.map((user) => user.readTable(_db.users).toProto()).toList();
    final nextPageToken = rows.isEmpty || rows.length < pageSize
        ? null
        : PageToken(
            startTime: startTime,
            offset: rows.last.read(rowedQuery.ref(rowNum))!,
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

    final update = UsersCompanion(
      givenName: mask('given_name', givenName),
      familyName: mask('family_name', familyName),
      timeZone: mask('time_zone', timeZone),
      languageCode: mask('language_code', languageCode),
      updateTime: Value(DateTime.timestamp()),
    );

    await (_db.update(_db.users)..where((tbl) => tbl.userId.equals(userId)))
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

      return (_db.delete(_db.users)..where((t) => t.userId.equals(userId)))
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

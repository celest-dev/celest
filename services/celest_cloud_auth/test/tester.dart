import 'dart:async';
import 'dart:convert';

import 'package:cedar/cedar.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/runtime/serve.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/celest_cloud.dart' show CelestCloud, ClientType;
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/authorization/authorization_middleware.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/cedar_interop.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/sessions/sessions_repository.dart';
import 'package:celest_cloud_auth/src/users/users_repository.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/_internal.dart';
import 'package:checks/checks.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart' as t;

// Roles
const roleAdmin = EntityUid.of('Celest::Role', 'admin');
const roleAuthenticated = EntityUid.of('Celest::Role', 'authenticated');
const roleAnonymous = EntityUid.of('Celest::Role', 'anonymous');

// Users
const userAlice = EntityUid.of('Celest::User', 'alice');
const userBob = EntityUid.of('Celest::User', 'bob');
const userCharlie = EntityUid.of('Celest::User', 'charlie');

// Actions
const actionCreate = EntityUid.of('Celest::Action', 'create');
const actionGet = EntityUid.of('Celest::Action', 'get');
const actionUpdate = EntityUid.of('Celest::Action', 'update');
const actionDelete = EntityUid.of('Celest::Action', 'delete');
const actionList = EntityUid.of('Celest::Action', 'list');
const actionInvoke = EntityUid.of('Celest::Action', 'invoke');

// APIs
const apiTest = EntityUid.of('Celest::Api', 'test');

// Functions
const functionAdmin = EntityUid.of('Celest::Function', 'test/admin');
const functionAuthenticated =
    EntityUid.of('Celest::Function', 'test/authenticated');
const functionPublic = EntityUid.of('Celest::Function', 'test/public');

final defaultProject = ResolvedProject(
  projectId: 'test',
  environmentId: 'production',
  sdkConfig: SdkConfiguration(
    celest: Version(1, 0, 0),
    dart: Sdk(
      type: SdkType.dart,
      version: Version(3, 5, 0),
    ),
  ),
  apis: {
    AuthenticationService.api.apiId: AuthenticationService.api,
    UsersService.api.apiId: UsersService.api,
    'test': ResolvedApi(
      apiId: 'test',
      functions: {
        'admin': ResolvedCloudFunction(
          apiId: 'test',
          functionId: 'admin',
          httpConfig: ResolvedHttpConfig(
            route: ResolvedHttpRoute(path: '/test/admin'),
          ),
          policySet: PolicySet(
            templateLinks: const [
              TemplateLink(
                templateId: 'cloud.functions.admin',
                newId: 'test/admin',
                values: {
                  SlotId.resource: functionAdmin,
                },
              ),
            ],
          ),
        ),
        'authenticated': ResolvedCloudFunction(
          apiId: 'test',
          functionId: 'authenticated',
          httpConfig: ResolvedHttpConfig(
            route: ResolvedHttpRoute(path: '/test/authenticated'),
          ),
          policySet: PolicySet(
            templateLinks: const [
              TemplateLink(
                templateId: 'cloud.functions.authenticated',
                newId: 'test/authenticated',
                values: {
                  SlotId.resource: functionAuthenticated,
                },
              ),
            ],
          ),
        ),
        'public': ResolvedCloudFunction(
          apiId: 'test',
          functionId: 'public',
          httpConfig: ResolvedHttpConfig(
            route: ResolvedHttpRoute(path: '/test/public'),
          ),
          policySet: PolicySet(
            templateLinks: const [
              TemplateLink(
                templateId: 'cloud.functions.public',
                newId: 'test/public',
                values: {
                  SlotId.resource: functionPublic,
                },
              ),
            ],
          ),
        ),
      },
    ),
  },
);

typedef Route = (String method, String route);

final class AuthorizationTester {
  AuthorizationTester({
    ResolvedProject? project,
    this.additionalEntities = const [],
    this.persistData = false,
  }) : project = project ?? defaultProject {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.message}');
      if (record.error case final error?) {
        print(error);
      }
      if (record.stackTrace case final stackTrace?) {
        print(stackTrace);
      }
    });
  }

  static const List<Entity> defaultEntities = [
    Entity(uid: userAlice, parents: [roleAdmin]),
    Entity(uid: userBob, parents: [roleAuthenticated]),
    Entity(uid: userCharlie, parents: [roleAnonymous]),
  ];

  final ResolvedProject project;
  final List<Entity> additionalEntities;
  final bool persistData;

  late CelestCloudAuth _authService;

  AuthenticationService get authenticationService =>
      _authService.authenticationService;
  UsersService get usersService => _authService.usersService;
  CloudAuthDatabaseAccessors get db => _authService.db.cloudAuth;
  AuthorizationMiddleware get middleware => _authService.middleware;
  Authorizer get authorizer => _authService.authorizer;
  CryptoKeyRepository get cryptoKeys => _authService.cryptoKeys;
  CryptoKey get rootKey => _authService.cryptoKeys.rootKey;
  Signer get signer => rootKey.signer;
  CorksRepository get corks => _authService.corks;
  SessionsRepository get sessions => _authService.sessions;
  UsersRepository get users => _authService.users;

  late CelestService _service;
  Uri get address => Uri.http('localhost:${_service.port}');

  CelestCloud cloud({Cork? cork}) => CelestCloud(
        uri: address,
        authenticator: Authenticator.static(token: cork?.toString()),
        clientType: ClientType.HEADLESS,
      );

  Future<void> _createEntities() async {
    for (final entity in [
      ...defaultEntities,
      for (final api in project.apis.values) ...[
        for (final function in api.functions.values)
          Entity(uid: function.uid, parents: [api.uid]),
      ],
      ...additionalEntities,
    ]) {
      await db.createEntity(entity);
    }
  }

  Map<String, CloudFunctionTarget> get _targets {
    return {
      for (final api in project.apis.values)
        if (api.apiId != AuthenticationService.api.apiId &&
            api.apiId != UsersService.api.apiId)
          for (final function in api.functions.values)
            function.httpConfig.route.path: _DummyTarget(
              function.functionId,
              [Middleware.shelf(middleware.call)],
            ),
    };
  }

  Otp? lastSentCode;

  void setUp() {
    t.tearDown(() {
      lastSentCode = null;
    });

    t.setUp(() async {
      final initCompleter = Completer<void>();
      _service = await serve(
        targets: {},
        config: project,
        port: 0,
        setup: (context) async {
          context.put(env.environment, 'local');
          context.put(
            contextKeyEmailOtpProvider,
            EmailOtpProvider((otp) async => lastSentCode = otp),
          );
          context.put(ContextKey.project, project);

          CloudAuthDatabase db;
          if (persistData) {
            final directory = context.fileSystem.currentDirectory
                .childDirectory('.dart_tool')
                .childDirectory('celest');
            if (directory.existsSync()) {
              directory.deleteSync(recursive: true);
            }
            directory.createSync();
            db = CloudAuthDatabase.localDir(
              directory,
              verbose: true,
            );
          } else {
            db = CloudAuthDatabase.memory(
              verbose: true,
            );
          }
          _authService = await CelestCloudAuth.test(db: db);
          t.addTearDown(_authService.close);

          await _createEntities();
          for (final target in _targets.entries) {
            target.value.apply(context.router, target.key);
          }
          context.router.mount('/v1alpha1/auth/', _authService.handler);

          initCompleter.complete();
        },
      );

      await initCompleter.future;
      t.addTearDown(_service.close);
    });
  }

  Future<void> httpTest(
    Map<Route, void Function(Subject<http.Response> res)> checks, {
    Cork? cork,
    Map<String, String>? query,
    Object? body,
  }) async {
    for (final MapEntry(key: (method, path), value: checkRes)
        in checks.entries) {
      final uri = address.resolve(path).replace(queryParameters: query);
      print('$method $uri');
      final request = http.Request(method, uri)
        ..headers.addAll({
          if (cork != null) 'Authorization': 'Bearer $cork',
        });
      if (body != null) {
        request.body = jsonEncode(body);
        request.headers['Content-Type'] = 'application/json';
      }
      final response = await context.httpClient.send(request);
      final responseBody = await response.stream.bytesToString();
      print('${response.statusCode} $responseBody');
      checkRes(check(http.Response(responseBody, response.statusCode)));
    }
  }

  Future<(User, Cork)> createUser({
    String? userId,
    String email = 'test@celest.dev',
    required List<EntityUid> roles,
  }) async {
    userId ??= typeId<User>();
    final user = await db.createUser(
      user: User(
        userId: userId,
        roles: roles,
        emails: [
          Email(email: email, isPrimary: true),
        ],
      ),
    );
    final session = await sessions.createSession(
      userId: userId,
      factor: AuthenticationFactorEmailOtp(email: email),
    );
    final cork = await corks.createCork(
      user: user,
      session: session,
    );
    t.addTearDown(() async {
      await sessions.deleteSession(sessionId: session.sessionId);
      await users.deleteUser(userId: userId!);
    });
    return (user, cork);
  }
}

void Function(Subject<http.Response>) expectAll(
  List<void Function(Subject<http.Response>)> checks,
) {
  return (res) {
    for (final check in checks) {
      check(res);
    }
  };
}

void Function(Subject<http.Response>) expectStatus(int statusCode) {
  return (res) => res.hasStatus(statusCode);
}

void Function(Subject<http.Response>) expectBody(Map<String, Object?>? o) {
  return (res) => res.hasJsonBody(o);
}

void Function(Subject<http.Response>) expectBodyHas(
  List<void Function(Subject<Map<String, Object?>>)> conditions,
) {
  return (res) {
    res
        .has((it) => jsonDecode(it.body), 'body')
        .isA<Map<String, Object?>>()
        .which((it) {
      for (final condition in conditions) {
        condition(it);
      }
    });
  };
}

extension ResponseChecks on Subject<http.Response> {
  void hasStatus(int statusCode) {
    has((res) => res.statusCode, 'statusCode').equals(statusCode);
  }

  void hasJsonBody(Map<String, Object?>? o) {
    if (o == null) {
      return has((res) => res.body, 'body').equals('');
    }
    has((res) => jsonDecode(res.body), 'json')
        .isA<Map<String, Object?>>()
        .deepEquals(o);
  }
}

final class _DummyTarget extends CloudFunctionHttpTarget {
  _DummyTarget(this.name, this.middlewares);

  @override
  final String name;

  @override
  String get method => 'POST';

  @override
  final List<Middleware> middlewares;

  @override
  Future<Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) {
    return Future.value(Response.ok(''));
  }
}

typedef Otp = ({String to, String code});

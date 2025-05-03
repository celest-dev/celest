import 'package:celest/celest.dart' show env, Environment;
import 'package:celest/src/core/context.dart' as core;
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api_client.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_ctl.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_gql.dart';
import 'package:celest_cloud_hub/src/deploy/turso/turso_api_client.dart';
import 'package:graphql/client.dart';

export 'package:celest/src/core/context.dart' show ContextKey;

Context get context => Context.current;

extension type Context._(core.Context _ctx) implements core.Context {
  static Context get root => Context._(core.Context.root);

  static set root(core.Context ctx) {
    core.Context.root = ctx;
  }

  static Context get current => Context._(core.Context.current);

  void _failInProd(String message) {
    if (current.get(env.environment) == Environment.production) {
      throw StateError(message);
    } else {
      logger.warning(message);
    }
  }

  String? get sentryDsn {
    final dsn = _ctx.get(const env('SENTRY_DSN'));
    if (dsn == null) {
      _failInProd('Missing SENTRY_DSN');
    }
    return dsn;
  }

  String? get flyAuthToken {
    final token = _ctx.get(const env('FLY_API_TOKEN'));
    if (token == null) {
      _failInProd('Missing FLY_API_TOKEN');
    }
    return token;
  }

  String get flyOrgSlug => 'celest-809';

  FlyApiClient get fly {
    const contextKey = core.ContextKey<FlyApiClient>('FlyMachinesApiClient');
    if (_ctx.get(contextKey) case final flyApi?) {
      return flyApi;
    }
    final flyApi = FlyApiClient(authToken: flyAuthToken, orgSlug: flyOrgSlug);
    return _ctx.put(contextKey, flyApi);
  }

  FlyGql get flyGql {
    const contextKey = core.ContextKey<FlyGql>('FlyGqlClient');
    if (_ctx.get(contextKey) case final flyGql?) {
      return flyGql;
    }
    final client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: AuthLink(
        getToken: () => 'FlyV1 $flyAuthToken',
      ).concat(HttpLink('https://api.fly.io/graphql')),
    );
    final flyGql = FlyGql(client);
    return _ctx.put(contextKey, flyGql);
  }

  FlyCtl get flyCtl {
    const contextKey = core.ContextKey<FlyCtl>('FlyCtl');
    if (_ctx.get(contextKey) case final flyCtl?) {
      return flyCtl;
    }
    final flyCtl = FlyCtl(flyAuthToken: flyAuthToken);
    return _ctx.put(contextKey, flyCtl);
  }

  String? get tursoApiToken {
    final token = _ctx.get(const env('TURSO_API_TOKEN'));
    if (token == null) {
      _failInProd('Missing TURSO_API_TOKEN');
    }
    return token;
  }

  String get tursoOrgSlug => 'celest-dev';

  TursoApiClient get turso {
    const contextKey = core.ContextKey<TursoApiClient>('TursoApiClient');
    if (_ctx.get(contextKey) case final tursoApi?) {
      return tursoApi;
    }
    final tursoApi = TursoApiClient(
      authToken: tursoApiToken,
      orgSlug: tursoOrgSlug,
    );
    return _ctx.put(contextKey, tursoApi);
  }

  Entity get rootOrg {
    final rootOrgId =
        _ctx.get(const env('CELEST_ORGANIZATION_ID')) ?? 'celest-dev';
    return Entity(uid: EntityUid.of('Celest::Organization', rootOrgId));
  }
}

/// Prefix used for test resources.
///
/// This is used to identify test resources in Fly.
///
/// This is safe because customer resources cannot contain
/// `celest` in their names.
const kCelestTest = 'celest-test';

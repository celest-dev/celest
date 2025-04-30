import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart' as core;
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_ctl.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_gql.dart';
import 'package:graphql/client.dart';

export 'package:celest/src/core/context.dart' show ContextKey;

Context get context => Context._(core.Context.current);

extension type Context._(core.Context _ctx) implements core.Context {
  static const core.ContextKey<FlyMachinesApiClient> _flyContextKey =
      core.ContextKey<FlyMachinesApiClient>('FlyMachinesApiClient');

  String get flyAuthToken => _ctx.expect(const env('FLY_API_TOKEN'));
  String get flyOrgSlug => 'celest-809';

  FlyMachinesApiClient get fly {
    if (_ctx.get(_flyContextKey) case final flyApi?) {
      return flyApi;
    }
    final flyApi = FlyMachinesApiClient(
      authToken: flyAuthToken,
      client: _ctx.httpClient,
    );
    return _ctx.put(_flyContextKey, flyApi);
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
}

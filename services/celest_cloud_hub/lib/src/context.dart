import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart' as core;
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';

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
}

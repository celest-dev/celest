import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_auth/src/authorization/cedar_interop.dart';
import 'package:celest_cloud_auth/src/model/route.dart';

/// A map of routes to their respective [EntityUid]s.
extension type const RouteMap(Map<EntityUid, Route> _routes)
    implements Map<EntityUid, Route> {
  /// Computes the route map for the given [project].
  ///
  /// Optionally, [additionalRoutes] can be provided to be included in the map.
  factory RouteMap.of(
    ResolvedProject project, {
    RouteMap additionalRoutes = const RouteMap({}),
  }) {
    final collector = _RouteCollector();
    project.accept(collector);
    final routeMap = RouteMap({
      ...collector._routes,
      ...additionalRoutes,
    });
    print(routeMap);
    return routeMap;
  }
}

final class _RouteCollector extends ResolvedAstVisitor<void> {
  final Map<EntityUid, Route> _routes = {};

  @override
  void visitProject(ResolvedProject project) {
    project.apis.values.forEach(visitApi);
  }

  @override
  void visitApi(ResolvedApi api) {
    api.functions.values.forEach(visitFunction);
  }

  @override
  void visitAuth(ResolvedAuth auth) {}

  @override
  void visitAuthProvider(ResolvedAuthProvider provider) {}

  @override
  void visitVariable(ResolvedVariable variable) {}

  @override
  void visitFunction(ResolvedCloudFunction function) {
    _routes[function.uid] = Route.parse(function.httpConfig.route.path);
  }

  @override
  void visitDatabase(ResolvedDatabase database) {}

  @override
  void visitDatabaseSchema(ResolvedDatabaseSchema schema) {}

  @override
  void visitExternalAuthProvider(ResolvedExternalAuthProvider provider) {}

  @override
  void visitSecret(ResolvedSecret secret) {}
}

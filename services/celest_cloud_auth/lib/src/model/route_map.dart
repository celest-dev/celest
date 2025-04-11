import 'package:cedar/cedar.dart';
import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_auth/src/authorization/cedar_interop.dart';
import 'package:celest_cloud_auth/src/model/route.dart';
import 'package:collection/collection.dart';

/// A map of routes to their respective [EntityUid]s.
class RouteMap extends DelegatingMap<EntityUid, List<(HttpMethod, Route)>> {
  RouteMap(super.base);

  /// Computes the route map for the given [project].
  ///
  /// Optionally, [additionalRoutes] can be provided to be included in the map.
  factory RouteMap.of(
    ResolvedProject project, {
    RouteMap? additionalRoutes,
  }) {
    final collector = _RouteCollector();
    project.accept(collector);
    return RouteMap({
      ...collector._routes,
      ...?additionalRoutes,
    });
  }

  /// Lookup index for finding a route ID by path.
  final Map<(HttpMethod, String), (EntityUid, Route)?> _lookupIndex = {};

  /// Finds a route by [path].
  ///
  /// Returns the entity ID of the route and any parameters parsed from the
  /// route.
  (EntityUid uid, Map<String, String> params)? lookupRoute(
    HttpMethod method,
    String path,
  ) {
    if (_lookupIndex.containsKey((method, path))) {
      final cached = _lookupIndex[(method, path)];
      if (cached == null) {
        return null;
      }
      final (uid, route) = cached;
      return (uid, route.match(path)!);
    }
    for (final MapEntry(key: uid, value: routes) in entries) {
      for (final (thisMethod, route) in routes) {
        if (method != thisMethod) {
          continue;
        }
        if (route.match(path) case final params?) {
          _lookupIndex[(method, path)] = (uid, route);
          return (uid, params);
        }
      }
    }
    return _lookupIndex[(method, path)] = null;
  }
}

final class _RouteCollector extends ResolvedAstVisitor<void> {
  final Map<EntityUid, List<(HttpMethod, Route)>> _routes = {};

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
    _routes[function.uid] = [
      for (final route in [
        function.httpConfig.route,
        ...function.httpConfig.additionalRoutes
      ])
        (
          route.method as HttpMethod,
          Route.parse(route.path),
        )
    ];
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

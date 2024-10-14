import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:shelf/shelf.dart' as shelf show Middleware;
import 'package:shelf/shelf.dart';

/// {@template celest.runtime.middleware}
/// A middleware that can be applied to a [Handler].
/// {@endtemplate}
abstract interface class Middleware {
  /// {@macro celest.runtime.shelf_middleware}
  const factory Middleware.shelf(shelf.Middleware middleware) = ShelfMiddleware;

  /// Implements the [shelf.Middleware] interface.
  Handler call(Handler inner);
}

// Interface guard
// ignore: unused_element
final shelf.Middleware _ = const _NoOpMiddleware().call;

final class _NoOpMiddleware implements Middleware {
  const _NoOpMiddleware();

  @override
  Handler call(Handler inner) {
    return inner;
  }
}

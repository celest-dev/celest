import 'package:celest/src/core/context.dart';
import 'package:celest/src/functions/http/http_status.dart';
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:meta/meta.dart';
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

abstract base class Listener implements Middleware {
  const Listener();

  Future<Handle> handle(Request request) async {
    final stopwatch = Stopwatch()..start();
    context.after((_) {
      stopwatch.stop();
      context.log(
        'Request completed in ${stopwatch.elapsedMilliseconds}ms',
      );
    });
    return const Handle.next();
  }

  @override
  @nonVirtual
  Handler call(Handler inner) {
    return (request) async {
      final handle = await this.handle(request);
      return switch (handle) {
        _HandleNext() => inner(request),
        _HandleChange(:final change) => inner(change),
        _HandleRedirect(:final to, :final status) =>
          Response(status, headers: {'location': to}),
      };
    };
  }
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

sealed class Handle {
  const Handle();

  const factory Handle.next() = _HandleNext;
  const factory Handle.change(Request change) = _HandleChange;
  const factory Handle.redirect({
    required String to,
    HttpStatus status,
  }) = _HandleRedirect;
}

final class _HandleNext extends Handle {
  const _HandleNext();
}

final class _HandleChange extends Handle {
  const _HandleChange(this.change);

  final Request change;
}

final class _HandleRedirect extends Handle {
  const _HandleRedirect({
    required this.to,
    this.status = HttpStatus.found,
  });

  final String to;
  final HttpStatus status;
}

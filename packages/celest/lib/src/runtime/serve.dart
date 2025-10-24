// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/configuration.dart';
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:celest/src/runtime/http/middleware.dart';
import 'package:celest/src/runtime/json_utils.dart';
import 'package:celest/src/runtime/sse/sse_handler.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_core/_internal.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart' hide Middleware;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

export 'auth/auth_middleware.dart';
export 'auth/firebase/firebase_auth_middleware.dart';
export 'auth/supabase/supabase_auth_middleware.dart';
export 'http/middleware.dart';

part 'targets.dart';

/// The default port on which Celest runs locally.
const int defaultCelestPort = 7777;

/// Serves [targets] on a local HTTP server.
///
/// If [setup] is provided, it is called before the service starts with the root
/// [Context]. This can be used to configure dependencies and environment
/// parameters for the service.
Future<CelestService> serve({
  required Map<String, CloudFunctionTarget> targets,
  ast.ResolvedProject? config,
  FutureOr<void> Function(Context context)? setup,
  int? port,
}) async {
  final ContextOverrides overrides = await configure(config: config);
  return Context.run(
    overrides: {...overrides, ContextKey.router: Router()},
    body: (context) async {
      if (setup != null) {
        try {
          await setup(context);
        } on Object catch (e, st) {
          Logger.root.severe('Failed to setup', e, st);
          rethrow;
        }
      }
      for (final MapEntry(key: route, value: target) in targets.entries) {
        target.apply(context.router, route);
      }
      context.router.get('/v1/healthz', (_) => Response.ok('OK'));

      final Handler pipeline = const Pipeline()
          .addMiddleware(const RootMiddleware().call)
          .addMiddleware(const CorsMiddleware().call)
          .addMiddleware(const CloudExceptionMiddleware().call)
          .addHandler(context.router.call);
      port ??= switch (Platform.environment['PORT']) {
        final String port? =>
          int.tryParse(port) ?? (throw StateError('Invalid PORT set: "$port"')),
        _ => defaultCelestPort,
      };
      final HttpServer server = await shelf_io.serve(
        pipeline,
        InternetAddress.anyIPv4,
        port!,
        poweredByHeader: 'Celest, the Flutter cloud platform',
      );
      print('Serving on http://localhost:${server.port}');
      unawaited(
        StreamGroup.merge([
          ProcessSignal.sigint.watch(),
          if (!Platform.isWindows) ProcessSignal.sigterm.watch(),
        ]).first.then((signal) {
          return server.close(force: true);
        }),
      );
      return CelestService._(server);
    },
  );
}

/// {@template celest.runtime.celest_service}
/// A running instance of a Celest service.
/// {@endtemplate}
final class CelestService {
  /// {@macro celest.runtime.celest_service}
  CelestService._(this._server);

  final HttpServer _server;

  /// The address of the running service.
  InternetAddress get address => _server.address;

  /// The port on which Celest is running.
  int get port => _server.port;

  /// Closes the Celest service.
  Future<void> close({bool force = false}) {
    print('Shutting down...');
    return _server.close(force: force);
  }
}

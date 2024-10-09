// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/runtime/gcp/gcp.dart';
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:celest/src/runtime/http/logging.dart';
import 'package:celest/src/runtime/http/middleware.dart';
import 'package:celest/src/runtime/json_utils.dart';
import 'package:celest/src/runtime/sse/sse_handler.dart';
import 'package:celest_core/_internal.dart';
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
Future<void> serve({
  required Map<String, CloudFunctionTarget> targets,
}) async {
  configureLogging();
  final projectId = await googleCloudProject();
  if (projectId != null) {
    Context.root.put(googleCloudProjectKey, projectId);
  }
  final router = Router()..get('/v1/healthz', (_) => Response.ok('OK'));
  for (final MapEntry(key: route, value: target) in targets.entries) {
    target._apply(router, route);
  }
  final pipeline = const Pipeline()
      .addMiddleware(const RootMiddleware().call)
      .addMiddleware(const CorsMiddleware().call)
      .addMiddleware(const CloudExceptionMiddleware().call)
      .addHandler(router.call);
  final port = switch (Platform.environment['PORT']) {
    final port? =>
      int.tryParse(port) ?? (throw StateError('Invalid PORT set: "$port"')),
    _ => defaultCelestPort,
  };
  final server = await shelf_io.serve(
    pipeline,
    InternetAddress.anyIPv4,
    port,
    shared: true,
    poweredByHeader: 'Celest, the Flutter cloud platform',
  );
  print('Serving on http://localhost:$port');
  await StreamGroup.merge([
    ProcessSignal.sigint.watch(),
    if (!Platform.isWindows) ProcessSignal.sigterm.watch(),
  ]).first;
  print('Shutting down...');
  await server.close();
}

// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/runtime/json_utils.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

/// The default port on which Celest runs locally.
const int defaultCelestPort = 7777;

/// Serves [targets] on a local HTTP server.
Future<void> serve({
  required Map<String, CloudFunctionTarget> targets,
}) async {
  final router = Router()..get('/_health', (_) => Response.ok('OK'));
  for (final MapEntry(key: route, value: target) in targets.entries) {
    router.post(route, target._handler);
  }
  final pipeline = const Pipeline()
      .addMiddleware(_heartbeatMiddleware)
      .addMiddleware(_corsMiddleware)
      .addMiddleware(_cloudExceptionMiddleware)
      .addHandler(router.call);
  final port = switch (Platform.environment['PORT']) {
    final port? =>
      int.tryParse(port) ?? (throw StateError('Invalid PORT set: $port')),
    _ => defaultCelestPort,
  };
  final server = await shelf_io.serve(
    pipeline,
    InternetAddress.anyIPv4,
    port,
  );
  print('Serving on http://localhost:$port');
  await StreamGroup.merge([
    ProcessSignal.sigint.watch(),
    if (!Platform.isWindows) ProcessSignal.sigterm.watch(),
  ]).first;
  await server.close();
}

/// The response of a [CloudFunctionTarget].
typedef CelestResponse = ({int statusCode, Object? body});

/// {@template celest.runtime.cloud_function_target}
/// An instantiation of a [CloudFunction].
/// {@endtemplate}
abstract base class CloudFunctionTarget {
  /// {@macro celest.runtime.cloud_function_target}
  CloudFunctionTarget() {
    init();
  }

  Future<Response> _handler(Request request) async {
    final bodyJson = await request.decodeJson();
    final response = await runZoned(
      () => handle(bodyJson),
      zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, message) {
          parent.print(zone, '[$name] $message');
        },
      ),
    );
    return Response(
      response.statusCode,
      body: jsonEncode(response.body),
      headers: {
        contentTypeHeader: jsonContentType,
      },
    );
  }

  /// The name of the [CloudFunction] this class targets.
  String get name;

  /// Initializes this target.
  ///
  /// This is called once when the target is instantiated.
  void init() {}

  /// Handles a JSON [request] to this target.
  Future<CelestResponse> handle(Map<String, Object?> request);
}

Handler _heartbeatMiddleware(Handler inner) {
  return (request) async {
    print(request.requestedUri.path);
    return inner(request);
  };
}

/// Serves CORS headers on the local server so that Web clients can access it.
Handler _corsMiddleware(Handler inner) {
  const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST',
    'Access-Control-Allow-Headers': '*',
  };
  return (request) async {
    if (request.method == 'OPTIONS') {
      return Response.ok(
        null,
        headers: corsHeaders,
      );
    }
    final response = await inner(request);
    return response.change(
      headers: corsHeaders,
    );
  };
}

/// Handles common exception types and maps exceptions to HTTP responses.
Handler _cloudExceptionMiddleware(Handler inner) {
  return (request) async {
    try {
      return await inner(request);
    } on BadRequestException catch (e) {
      print('Bad request: ${e.message}');
      return _badRequest(
        code: 'BadRequestException',
        details: Serializers.instance.serialize(e),
      );
    } on InternalServerException catch (e) {
      print('Internal server error: ${e.message}');
      return _internalServerError(
        code: 'InternalServerException',
        details: Serializers.instance.serialize(e),
      );
    } on Exception catch (e, st) {
      print('An unexpected error occurred: $e');
      print(st);
      return _badRequest(
        code: e.runtimeType.toString(),
      );
    } on Error catch (e, st) {
      print('An unexpected error occurred: $e');
      print(st);
      return _internalServerError(
        code: e.runtimeType.toString(),
      );
    }
  };
}

Response _badRequest({
  required String code,
  Object? details,
}) {
  return Response.badRequest(
    headers: {
      contentTypeHeader: jsonContentType,
    },
    body: jsonEncode({
      'error': {
        'code': code,
        if (details != null) 'details': details,
      },
    }),
  );
}

Response _internalServerError({
  required String code,
  Object? details,
}) {
  return Response.internalServerError(
    headers: {
      contentTypeHeader: jsonContentType,
    },
    body: jsonEncode({
      'error': {
        'code': code,
        if (details != null) 'details': details,
      },
    }),
  );
}

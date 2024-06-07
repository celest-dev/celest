// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest/celest.dart';
import 'package:celest/src/runtime/json_utils.dart';
import 'package:celest/src/runtime/sse/sse_handler.dart';
import 'package:celest_core/_internal.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// The default port on which Celest runs locally.
const int defaultCelestPort = 7777;

/// Serves [targets] on a local HTTP server.
Future<void> serve({
  required Map<String, CloudFunctionTarget> targets,
}) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log(
      record.message,
      time: record.time,
      sequenceNumber: record.sequenceNumber,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error?.toString(),
      stackTrace: record.stackTrace,
    );
  });
  final router = Router()..get('/_health', (_) => Response.ok('OK'));
  for (final MapEntry(key: route, value: target) in targets.entries) {
    target._apply(router, route);
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
    shared: true,
    poweredByHeader: 'Celest, the Flutter cloud platform',
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

  static const _contextHeaderPrefix = 'X-Context-';
  static final _contextHeaderMatcher = RegExp(
    _contextHeaderPrefix,
    caseSensitive: false,
  );
  Map<String, String> _contextForRequest(Map<String, List<String>> headers) {
    final context = <String, String>{};
    headers.forEach((key, value) {
      key = key.toLowerCase();
      if (key.startsWith(_contextHeaderMatcher)) {
        context[key.substring(_contextHeaderPrefix.length)] = value.join(', ');
      }
    });
    return context;
  }

  /// The name of the [CloudFunction] this class targets.
  String get name;

  /// Initializes this target.
  ///
  /// This is called once when the target is instantiated.
  void init() {}

  void _apply(Router router, String route);
}

/// {@template celest.runtime.cloud_function_http_target}
/// A [CloudFunctionTarget] that handles HTTP requests.
/// {@endtemplate}
abstract base class CloudFunctionHttpTarget extends CloudFunctionTarget {
  Future<Response> _handler(Request request) async {
    final bodyJson = await request.decodeJson();
    final context = _contextForRequest(request.headersAll);
    final response = await runZoned(
      () => handle(
        bodyJson,
        context: context,
        headers: request.headersAll,
        queryParameters: request.url.queryParametersAll,
      ),
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

  /// The HTTP method of the [CloudFunction] this class targets.
  String get method => 'POST';

  @override
  void _apply(Router router, String route) {
    router.add(method, route, _handler);
  }

  /// Handles a JSON [request] to this target.
  Future<CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  });
}

/// {@template celest.runtime.cloud_event_source_target}
/// A [CloudFunctionTarget] that handles Server-Sent Events (SSE) and WebSocket
/// event producers.
/// {@endtemplate}
abstract base class CloudEventSourceTarget extends CloudFunctionTarget {
  @override
  void _apply(Router router, String route) {
    router.add('GET', route, _handler);
    router.add('POST', route, _sseHandler);
  }

  late final Handler _sseHandler = sseHandler(_handleConnection);
  late final Handler _wsHandler = webSocketHandler(
    (WebSocketChannel webSocket) {
      _handleConnection(
        webSocket.transform(
          StreamChannelTransformer(
            StreamTransformer.fromHandlers(
              handleData: (data, sink) {
                sink.add(JsonUtf8.decodeAny(data));
              },
            ),
            StreamSinkTransformer.fromHandlers(
              handleData: (data, sink) {
                sink.add(jsonEncode(data));
              },
            ),
          ),
        ),
      );
    },
  );

  Future<void> _handleConnection(
    StreamChannel<Map<String, Object?>> connection,
  ) async {
    await runZonedGuarded(
      () async {
        final requests = StreamQueue(connection.stream);
        var request = const <String, Object?>{};
        if (hasBody) {
          request = await requests.next;
        }
        final (headers, queryParameters) = switch (connection) {
          SseConnection(:final headers, :final queryParameters) => (
              headers,
              queryParameters
            ),
          _ => (
              Zone.current[#_headers] as Map<String, List<String>>,
              Zone.current[#_queryParameters] as Map<String, List<String>>,
            ),
        };
        final context = _contextForRequest(headers);
        final stream = handle(
          request,
          headers: headers,
          queryParameters: queryParameters,
          context: context,
        );
        stream.listen(
          connection.sink.add,
          onDone: connection.sink.close,
          // Should never emit an error.
        );
      },
      zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, message) {
          parent.print(zone, '[$name] $message');
        },
      ),
      (Object e, StackTrace st) {
        print('An unexpected error occurred: $e');
        print(st);
        connection.sink.addError(e, st);
        connection.sink.close();
      },
    );
  }

  Future<Response> _handler(Request request) async {
    if (request.method == 'GET' && request.headers['Upgrade'] == 'websocket') {
      return runZoned(
        () => _wsHandler(request),
        zoneValues: {
          #_headers: request.headersAll,
          #_queryParameters: request.url.queryParametersAll,
        },
      );
    }
    return _sseHandler(request);
  }

  /// Whether the target has a body.
  ///
  /// If this is `true`, the target will wait for an initial message sent by
  /// the client with the body of the request.
  ///
  /// If this is `false`, for example the cloud function takes no parameters
  /// or all parameters are mapped to headers or query parameters, then the
  /// target will immediately start sending events.
  bool get hasBody;

  /// Handles a JSON [request] to this target.
  Stream<Map<String, Object?>> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
    required Map<String, String> context,
  });
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
    } on Exception catch (e, st) {
      if (e is HijackException) rethrow;
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

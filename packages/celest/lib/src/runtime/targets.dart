part of 'serve.dart';

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
    final response = await handle(
      bodyJson,
      headers: request.headersAll,
      queryParameters: request.url.queryParametersAll,
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
              context.currentRequest.headersAll,
              context.currentRequest.url.queryParametersAll,
            ),
        };
        final stream = handle(
          request,
          headers: headers,
          queryParameters: queryParameters,
        );
        stream.listen(
          connection.sink.add,
          onDone: connection.sink.close,
          // Should never emit an error.
        );
      },
      (Object e, StackTrace st) {
        stderr.writeln('An unexpected error occurred: $e');
        stderr.writeln(st);
        connection.sink.addError(e, st);
        connection.sink.close();
      },
    );
  }

  Future<Response> _handler(Request request) async {
    if (request.method == 'GET' && request.headers['Upgrade'] == 'websocket') {
      return _wsHandler(request);
    } else {
      return _sseHandler(request);
    }
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
  });
}

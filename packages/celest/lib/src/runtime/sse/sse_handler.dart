// A partial reconstruction of `package:sse`'s SseHandler which provides
// better control over SSE connections and HTTP metadata.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:celest_core/_internal.dart';
import 'package:collection/collection.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:stream_channel/stream_channel.dart';

typedef _SseMessage = ({int id, Object? message});

/// {@template celest.runtime.sse_connection}
/// A Server-Sent Events (SSE) connection.
/// {@endtemplate}
final class SseConnection with StreamChannelMixin<Object?> {
  /// {@macro celest.runtime.sse_connection}
  SseConnection(
    this._socket, {
    required this.clientId,
    required this.headers,
    required this.queryParameters,
  }) {
    _logger.finest('Created connection');
    _handleOutgoing();
  }

  /// The ID of the connected client.
  final String clientId;

  late final Logger _logger = Logger('SseServer.$clientId');

  /// The headers of the request that initiated the connection.
  final Map<String, List<String>> headers;

  /// The query parameters of the request that initiated the connection.
  final Map<String, List<String>> queryParameters;

  final Socket _socket;

  /// Incoming messages from the client.
  late final _incomingController = StreamController<Object?>(
    onCancel: () => close(force: true),
  );

  /// Outgoing messages to the client.
  late final _outgoingController = StreamController<Object?>();

  /// The id of the last processed incoming message.
  int _lastProcessedId = -1;

  /// Incoming messages that have yet to be processed.
  final _pendingMessages =
      HeapPriorityQueue<_SseMessage>((a, b) => a.id.compareTo(b.id));

  final _closedCompleter = Completer<void>();
  final _haltOutgoingQueue = Completer<void>();

  void _handleOutgoing() {
    final subscription = _outgoingController.stream.listen(
      (message) {
        if (_haltOutgoingQueue.isCompleted) {
          _logger.finest('Message queued after close: $message');
          return;
        }
        _logger.finest('Sending message: $message');
        _socket
          ..add('data: '.codeUnits)
          ..add(JsonUtf8.encode(message))
          ..add('\n\n'.codeUnits);
        _socket.flush().ignore();
      },
    );
    _haltOutgoingQueue.future.whenComplete(subscription.cancel);
  }

  void _handleIncoming(int id, Object? message) {
    _pendingMessages.add((id: id, message: message));
    while (_pendingMessages.isNotEmpty) {
      final pendingMessage = _pendingMessages.first;
      // Only process the next incremental message.
      if (pendingMessage.id - _lastProcessedId <= 1) {
        _logger.finest(
          'Received message (id=${pendingMessage.id}): '
          '${pendingMessage.message}',
        );
        _incomingController.sink.add(pendingMessage.message);
        _lastProcessedId = pendingMessage.id;
        _pendingMessages.removeFirst();
      } else {
        // A message came out of order. Wait until we receive the previous
        // messages to process.
        break;
      }
    }
  }

  @override
  Stream<Object?> get stream => _incomingController.stream;

  @override
  late final StreamSink<Object?> sink = _outgoingController.sink.transform(
    StreamSinkTransformer.fromHandlers(
      handleError: (error, stackTrace, sink) {
        _logger.warning('Error handling SSE', error, stackTrace);
        close(force: true);
      },
      handleDone: (sink) => close(),
    ),
  );

  /// Closes the connection.
  ///
  /// If [force] is `true`, the connection will be closed immediately without
  /// waiting for the outgoing queue to finish.
  Future<void> close({bool force = false}) async {
    if (_closedCompleter.isCompleted) return;
    _logger.fine('Closing connection (force=$force)');
    _closedCompleter.complete();
    if (force) {
      _haltOutgoingQueue.complete();
    }
    if (!_outgoingController.isClosed) {
      await _outgoingController.close();
    }
    if (!_incomingController.isClosed) {
      unawaited(_incomingController.close());
    }
    // Send a control message to signal the client to close the connection.
    //
    // This is necessary to ensure that the client does not attempt to
    // reconnect after the connection is closed, since EventSource provides
    // no built-in way to signal a successful connection close.
    _socket.add('event: control\ndata: close\n\n'.codeUnits);
    await _socket.flush();
    await _socket.close();
    _logger.finest('Connection closed');
  }
}

/// {@template celest.runtime.sse_handler}
/// A handler for Server-Sent Events (SSE) connections.
/// {@endtemplate}
Handler sseHandler(SseHandler handler) => _SseHandler(handler).handle;

/// {@macro celest.runtime.sse_handler}
typedef SseHandler = FutureOr<void> Function(SseConnection);

final class _SseHandler {
  _SseHandler(this._handler);

  final FutureOr<void> Function(SseConnection) _handler;

  final _connections = <String, SseConnection>{};

  // RFC 2616 requires carriage return delimiters.
  static String _sseHeaders(Request request) => 'HTTP/1.1 200 OK\r\n'
      'Content-Type: text/event-stream\r\n'
      'Cache-Control: no-cache\r\n'
      'Connection: keep-alive\r\n'
      '${_corsHeaders(request).toHttp()}\r\n'
      '\r\n\r\n';

  static final _badJson = Response.badRequest(
    body: 'Message must be a valid JSON object',
  );

  static Map<String, String> _corsHeaders(Request request) => {
        'Access-Control-Allow-Credentials': 'true',
        if (request.headers['origin'] case final origin?)
          'Access-Control-Allow-Origin': origin,
      };

  Response _createConnection(Request request) {
    final clientId = request.url.queryParameters['sseClientId'];
    if (clientId == null) {
      return Response.badRequest(
        body: 'sseClientId query parameter is required',
      );
    }
    request.hijack((socket) {
      socket.sink.add(_sseHeaders(request).codeUnits);
      final connection = _connections[clientId] ??= SseConnection(
        socket.sink as Socket,
        clientId: clientId,
        headers: request.headersAll,
        queryParameters: request.url.queryParametersAll,
      );
      unawaited(
        connection._closedCompleter.future.whenComplete(() {
          connection._logger.finest('Removing connection');
          _connections.remove(clientId);
        }),
      );
      socket.stream.drain<void>().whenComplete(() {
        connection.close(force: true);
      });
      _handler(connection);
    });
  }

  static final _jsonUtf8Decoder =
      utf8.decoder.fuse(json.decoder).cast<Uint8List, Object?>();

  Future<Response> _handleIncomingMessage(Request request) async {
    final clientId = request.url.queryParameters['sseClientId'];
    if (clientId == null) {
      return Response.badRequest(
        body: 'sseClientId query parameter is required',
      );
    }
    final connection = _connections[clientId];
    if (connection == null) {
      return Response.notFound(
        'No connection found for clientId: $clientId',
      );
    }
    final messageId = int.parse(
      request.url.queryParameters['messageId'] ?? '0',
    );
    try {
      final message = await request.read().transform(_jsonUtf8Decoder).first;
      connection._handleIncoming(messageId, message);
      return Response(HttpStatus.accepted);
    } on Object catch (e, st) {
      connection._logger.warning('Failed to decode JSON', e, st);
      return _badJson;
    }
  }

  /// The shelf [Handler] for the SSE server.
  Future<Response> handle(Request request) async {
    final response = await _innerHandle(request);
    return response.change(
      headers: {
        ..._corsHeaders(request),
        ...response.headers,
      },
    );
  }

  Future<Response> _innerHandle(Request request) async {
    if (request.method == 'OPTIONS') {
      return Response(
        HttpStatus.noContent,
        headers: {
          ..._corsHeaders(request),
          'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
          if (request.headers['access-control-request-headers']
              case final requestedHeaders?)
            'Access-Control-Allow-Headers': requestedHeaders,
        },
      );
    }
    if (request.method == 'GET' &&
        request.headers['accept'] == 'text/event-stream') {
      return _createConnection(request);
    }
    if (request.method == 'POST') {
      final contentType = MediaType.parse(
        request.headers['content-type'] ?? 'text/plain',
      );
      if (contentType.mimeType != 'application/json') {
        return _badJson;
      }
      return _handleIncomingMessage(request);
    }
    return Response.notFound(null);
  }
}

extension on Map<String, String> {
  String toHttp() => entries.map((e) => '${e.key}: ${e.value}').join('\r\n');
}

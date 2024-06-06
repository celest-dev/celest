// A partial reconstruction of `package:sse`'s SseClient which provides
// better control over SSE connections and HTTP.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:js_interop';

import 'package:async/async.dart';
import 'package:celest_core/_internal.dart';
import 'package:http/browser_client.dart' as http;
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:web/web.dart' as web;

/// {@template celest.runtime.sse_client}
/// A Server-Sent Events (SSE) client.
/// {@endtemplate}
final class SseClientPlatform extends SseClient {
  /// Creates a new [SseClient] connected to the server at [serverUri].
  factory SseClientPlatform({
    required Uri serverUri,
    http.Client? httpClient,
    String? clientId,
  }) {
    clientId ??= Uuid.v7().toString();
    serverUri = serverUri.replace(
      queryParameters: {
        ...serverUri.queryParameters,
        'sseClientId': clientId,
      },
    );
    return SseClientPlatform._(serverUri, clientId: clientId);
  }

  SseClientPlatform._(
    this.serverUri, {
    required this.clientId,
    http.Client? httpClient,
  })  : _httpClient =
            httpClient ?? (http.BrowserClient()..withCredentials = true),
        super.base() {
    _init();
  }

  /// The URI of the connected server endpoint.
  final Uri serverUri;

  @override
  final String clientId;

  late final Logger _logger = Logger('SseClient.$clientId');

  final http.Client _httpClient;
  late final web.EventSource _eventSource;

  var _lastMessageId = -1;

  late final StreamController<Map<String, Object?>> _incomingController =
      StreamController(onCancel: close);

  @override
  Stream<Map<String, Object?>> get stream => _incomingController.stream;

  late final StreamController<Map<String, Object?>> _outgoingController =
      StreamController();

  @override
  late final StreamSink<Map<String, Object?>> sink =
      _outgoingController.sink.transform(
    StreamSinkTransformer.fromHandlers(
      handleError: (error, stackTrace, sink) {
        _closeWithError(error, stackTrace);
      },
      handleDone: (sink) {
        close();
      },
    ),
  );

  final Completer<void> _onConnected = Completer();

  @override
  Future<void> get onConnected => _onConnected.future;

  void _init() {
    _eventSource = web.EventSource(
      serverUri.toString(),
      web.EventSourceInit(withCredentials: true),
    );
    _eventSource.onOpen.first.whenComplete(() {
      _logger.fine('Established connection');
      _onConnected.complete();
      _outgoingController.stream.listen(_onOutgoingMessage, onDone: close);
    });
    _eventSource.onError.first.whenComplete(() {
      _closeWithError(
        StateError('Failed to connect to server'),
      );
    });
    _eventSource.onMessage.listen(_onIncomingMessage);
    _eventSource.addEventListener('control', _onIncomingControlMessage.toJS);
  }

  void _onIncomingControlMessage(web.MessageEvent event) {
    final data = event.data.dartify();
    _logger.finest('Control event: $data');
    if (data == 'close') {
      return close();
    }
    _closeWithError(
      UnsupportedError('[$clientId] Illegal Control Message "$data"'),
    );
  }

  void _onIncomingMessage(web.MessageEvent event) {
    final data = (event.data as JSString).toDart;
    _logger.finest('Message event: $data');
    try {
      final message = jsonDecode(data);
      if (message is! Map<String, Object?>) {
        throw FormatException('Expected a Map, got ${message.runtimeType}');
      }
      _incomingController.add(message);
    } on Object catch (e, st) {
      _logger.severe('Invalid message: $data', e, st);
      _closeWithError(
        FormatException('[$clientId] Invalid JSON message'),
        st,
      );
    }
  }

  Future<void> _onOutgoingMessage(Map<String, Object?> message) async {
    final uri = serverUri.replace(
      queryParameters: {
        ...serverUri.queryParameters,
        'messageId': '${++_lastMessageId}',
      },
    );
    final response = await _httpClient.post(
      uri,
      headers: {
        'content-type': 'application/json',
      },
      body: jsonEncode(message),
    );
    if (response.statusCode != 202) {
      _closeWithError(
        http.ClientException(
          '${response.statusCode}: ${response.body}',
          uri,
        ),
      );
    }
  }

  @override
  void close() {
    if (_eventSource.readyState == web.EventSource.CLOSED) {
      return;
    }
    _logger.fine('Closing connection');
    _eventSource.close();
    if (!_onConnected.isCompleted) {
      _outgoingController.stream.drain<void>();
    }
    _incomingController.close();
    _outgoingController.close();
  }

  void _closeWithError(Object error, [StackTrace? stackTrace]) {
    _logger.severe('Closing with error', error, stackTrace);
    if (!_onConnected.isCompleted) {
      _onConnected.completeError(error, stackTrace);
    }
    if (_incomingController.hasListener) {
      _incomingController.addError(error, stackTrace);
    }
    close();
  }
}

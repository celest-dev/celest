import 'dart:async';
import 'dart:convert';
import 'dart:io' as io show WebSocket;
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_core/_internal.dart';
import 'package:celest_core/src/events/event_channel.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final class EventChannelPlatform extends EventChannel {
  EventChannelPlatform._(this._ws);

  factory EventChannelPlatform.connect(
    Uri uri, {
    Authenticator? authenticator,
    http.Client? httpClient,
  }) {
    final ws = Future(
      () async => io.WebSocket.connect(
        uri.replace(scheme: uri.isScheme('https') ? 'wss' : 'ws').toString(),
        headers: {
          if (await authenticator?.token case final token?)
            HttpHeaders.authorizationHeader: token,
        },
      ),
    );
    return EventChannelPlatform._(IOWebSocketChannel(ws));
  }

  final WebSocketChannel _ws;
  late final StreamSink<Map<String, Object?>> _wsSink =
      _ws.sink.rejectErrors().transform(
    StreamSinkTransformer.fromHandlers(
      handleData: (data, sink) {
        sink.add(jsonEncode(data));
      },
    ),
  );

  @override
  Stream<Map<String, Object?>> get stream => _ws.stream.map(JsonUtf8.decodeMap);

  @override
  StreamSink<Map<String, Object?>> get sink => _wsSink;

  @override
  void close() {
    _ws.sink.close(WebSocketStatus.goingAway).then((_) {
      return _wsSink.close();
    }).ignore();
  }
}

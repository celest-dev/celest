@TestOn('browser')
library;

import 'dart:js_interop';

import 'package:async/async.dart';
import 'package:celest_core/_internal.dart';
import 'package:logging/logging.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:test/test.dart';
import 'package:web/web.dart' as web;

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    web.console.log(
      '[${event.loggerName}] ${event.level.name}: ${event.message}'.toJS,
    );
  });

  group('SSE', () {
    late Uri uri;

    setUpAll(() async {
      final channel = spawnHybridUri('sse_server.dart');
      final queue = StreamQueue(channel.stream);
      final port = (await queue.next as num).toInt();
      uri = Uri.parse('http://localhost:$port');
      queue.rest.listen(
        (Object? log) => web.console.warn(log.toString().toJS),
      );
    });

    test('ping pong', () async {
      final client = SseClient(serverUri: uri.resolve('/ping-pong'));
      addTearDown(client.close);
      const messages = [
        {'a': 1},
        {'b': 2},
        {'c': 3},
      ];
      expect(client.stream, emitsInOrder(messages));
      for (final message in messages) {
        client.sink.add(message);
      }
    });

    test('one-n-done', () async {
      final client = SseClient(serverUri: uri.resolve('/one-n-done'));
      addTearDown(client.close);
      const message = {'a': 1};
      client.sink.add(message);
      await expectLater(
          client.stream.tap((msg) => web.console.log(msg.jsify())),
          emitsInOrder([message, emitsDone]));
    });
  });
}

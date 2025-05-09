import 'dart:io';

import 'package:celest/src/runtime/sse/sse_handler.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:stream_channel/stream_channel.dart';

Future<void> hybridMain(StreamChannel<Object?> channel) async {
  final router =
      Router()
        ..all(
          '/ping-pong',
          sseHandler((conn) async {
            await for (final Object? message in conn.stream) {
              conn.sink.add(message);
            }
          }),
        )
        ..all(
          '/one-n-done',
          sseHandler((conn) {
            conn.stream.listen((message) {
              conn.sink.add(message);
              conn.close();
            });
          }),
        );
  final HttpServer server = await serve(
    router.call,
    InternetAddress.loopbackIPv4,
    0,
  );
  channel.sink.add(server.port);

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    channel.sink.add(
      '[${event.loggerName}] ${event.level.name}: ${event.message}',
    );
  });
}

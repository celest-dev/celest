import 'package:stream_channel/stream_channel.dart';

import '../tester.dart';

Future<void> hybridMain(StreamChannel<Object?> channel) async {
  final tester = AuthorizationTester();
  await tester.start();

  channel.sink.add(tester.port);
  await for (final _ in channel.stream) {
    channel.sink.add(tester.lastSentCode!.code);
  }
}

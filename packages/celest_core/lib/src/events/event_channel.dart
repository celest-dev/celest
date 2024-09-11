import 'package:celest_core/src/auth/authenticator.dart';
import 'package:celest_core/src/events/event_channel.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/events/event_channel.web.dart';
import 'package:http/http.dart' as http;
import 'package:stream_channel/stream_channel.dart';

abstract class EventChannel with StreamChannelMixin<Map<String, Object?>> {
  EventChannel();
  factory EventChannel.connect(
    Uri uri, {
    Authenticator? authenticator,
    http.Client? httpClient,
  }) = EventChannelPlatform.connect;

  void close();
}

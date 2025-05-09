import 'package:celest_core/src/auth/authenticator.dart';
import 'package:celest_core/src/base/celest_base.dart';
import 'package:celest_core/src/events/event_channel.dart';
import 'package:http/http.dart' as http;

final class EventClient {
  EventClient({required this.httpClient, required this.authenticator});

  final http.Client httpClient;
  final Authenticator authenticator;

  EventChannel connect(Uri uri) => EventChannel.connect(
    uri,
    authenticator: authenticator,
    httpClient: httpClient,
  );
}

extension CelestEventClient on CelestBase {
  EventClient get eventClient => EventClient(
    httpClient: httpClient,
    authenticator: Authenticator(secureStorage: nativeStorage.secure),
  );
}

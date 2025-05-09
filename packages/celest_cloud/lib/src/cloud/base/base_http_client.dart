import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final class AuthenticatingHttpClient extends http.BaseClient {
  AuthenticatingHttpClient({
    required Authenticator authenticator,
    required http.Client client,
    Logger? logger,
  }) : _authenticator = authenticator,
       _inner = client,
       _logger = logger;

  final http.Client _inner;
  final Authenticator _authenticator;
  final Logger? _logger;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final String? token = await _authenticator.token;
    if (token != null) {
      request.headers['authorization'] = 'Bearer $token';
    }
    return _inner.send(request).then((response) async {
      if (response.statusCode == HttpStatus.unauthorized) {
        _logger?.finer('Revoking token');
        await _authenticator.revoke();
      }
      return response;
    });
  }
}

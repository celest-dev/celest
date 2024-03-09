import 'package:celest_auth/src/auth.dart';
import 'package:celest_auth/src/flows/email_flow.dart';
import 'package:celest_cli/src/context.dart';
import 'package:http/http.dart' as http;

final auth = _CliAuth(
  baseUri: baseUri,
  httpClient: httpClient,
);

extension type _CliAuth._(AuthImpl _hub) implements Auth {
  _CliAuth({
    required Uri baseUri,
    required http.Client httpClient,
  }) : _hub = AuthImpl(
          baseUri: baseUri,
          httpClient: httpClient,
          secureStorage: storage,
        );

  Email get email => Email(_hub);
}

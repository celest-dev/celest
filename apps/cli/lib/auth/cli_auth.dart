import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;

final auth = _CliAuth();

final class _CliClient with CelestBase {
  const _CliClient();

  @override
  Uri get baseUri => ctx.baseUri;

  @override
  http.Client get httpClient => ctx.httpClient;
}

extension type _CliAuth._(AuthImpl _hub) implements Auth {
  _CliAuth()
      : _hub = AuthImpl(
          const _CliClient(),
          secureStorage: ctx.storage,
        );

  Email get email => Email(_hub);
}

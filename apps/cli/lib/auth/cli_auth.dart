import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;

final auth = _CliAuth();

final class _CliClient with CelestBase {
  _CliClient();

  @override
  Uri get baseUri => ctx.baseUri;

  @override
  late final http.Client httpClient = CelestHttpClient(
    secureStorage: ctx.secureStorage,
    baseClient: ctx.httpClient,
  );
}

extension type _CliAuth._(AuthImpl _hub) implements Auth {
  _CliAuth()
      : _hub = AuthImpl(
          _CliClient(),
          storage: ctx.secureStorage,
        );

  Email get email => Email(_hub);
}

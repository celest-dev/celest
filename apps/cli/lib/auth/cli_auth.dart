import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_cli/src/context.dart';
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;

export 'package:celest_cli/src/context.dart' show cloud;

final CliAuth auth = CliAuth();
final Authenticator authenticator = Authenticator(
  secureStorage: ctx.secureStorage,
  // ignore: unnecessary_lambdas
  onRevoke: () => auth.signOut(),
);

final class _CliClient with CelestBase {
  _CliClient();

  @override
  Uri get baseUri => ctx.baseUri;

  @override
  late final http.Client httpClient = CelestHttpClient(
    secureStorage: ctx.secureStorage,
    baseClient: ctx.httpClient,
  );

  @override
  NativeSecureStorage get nativeStorage => ctx.secureStorage;
}

extension type CliAuth._(AuthImpl _hub) implements Auth {
  CliAuth()
      : _hub = AuthImpl(
          _CliClient(),
          cloud: cloud,
          storage: ctx.secureStorage,
        );

  Email get email => Email(_hub);
}

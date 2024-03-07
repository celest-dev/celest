import 'package:celest_auth/src/auth.dart';
import 'package:celest_auth/src/flows/email_flow.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/src/storage/storage.dart';

final auth = _CliAuth(
  baseUri: baseUri,
  httpClient: httpClient,
);

final class _CliAuth extends AuthImpl with Email {
  _CliAuth({
    required super.baseUri,
    required super.httpClient,
  });

  @override
  // ignore: overridden_fields
  final Storage secureStorage = storage;
}

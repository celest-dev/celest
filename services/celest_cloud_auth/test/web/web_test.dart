@TestOn('browser')
@Timeout(Duration(minutes: 5))
library;

import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_core/_internal.dart';
import 'package:checks/checks.dart';
import 'package:logging/logging.dart';
import 'package:native_storage/native_storage.dart';
import 'package:test/test.dart';

import '../checks.dart';

// Smoke test for browser functionality, specifically cookies which are only
// used in the browser.
void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.message}');
  });
  final http = CelestHttpClient();

  test('sign up', () async {
    final channel = spawnHybridUri('web_server.dart');
    final stream = channel.stream.asBroadcastStream();
    final port = (await stream.first as num).toInt();

    // Make public call
    final public = await http.post(
      Uri.parse('http://localhost:$port/test/public'),
      body: '{}',
    );
    check(public).hasStatus(200);

    // Make pre-authenticated call
    final preAuth = await http.post(
      Uri.parse('http://localhost:$port/test/authenticated'),
      body: '{}',
    );
    check(preAuth).hasStatus(401);

    // Create account
    final cloud = CelestCloud.http(
      Uri.parse('http://localhost:$port'),
      authenticator: Authenticator(secureStorage: NativeSecureStorage()),
      clientType: ClientType.HEADLESS,
      logger: Logger.root,
    );

    final state = await cloud.authentication.email.start(
      email: 'test@example.com',
    );
    check(state).isA<EmailSessionVerifyCode>();
    channel.sink.add(null);
    final otpCode = await stream.first as String;

    final result = await cloud.authentication.email.verifyCode(
      state: state as EmailSessionVerifyCode,
      code: otpCode,
    );
    check(result)
        .has((success) => success.user.emails.firstOrNull?.email, 'email')
        .equals('test@example.com');

    // Make post-authenticated call
    final postAuth = await http.post(
      Uri.parse('http://localhost:$port/test/authenticated'),
      body: '{}',
    );
    check(postAuth).hasStatus(200);
  });
}

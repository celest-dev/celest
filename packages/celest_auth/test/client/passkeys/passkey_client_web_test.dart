@TestOn('browser')
library;

import 'dart:convert';

import 'package:celest_auth/src/client/passkeys/passkey_client.web.dart';
import 'package:celest_auth/src/client/passkeys/passkey_models.dart';
import 'package:test/test.dart';

void main() {
  group('PasskeyClient', () {
    group('register', () {
      test('can register a new passkey', () async {
        final client = PasskeyClientWeb();
        final registrationResponse = await client.register(
          PasskeyRegistrationOptions(
            rpName: 'Celest',
            rpId: 'localhost',
            userId: 'test',
            userName: 'alice',
          ),
        );
        print('Got response: $registrationResponse');
        print(
          'Got response JSON: ${_prettyJson(registrationResponse.toJson())}',
        );
      });
    });
  });
}

String _prettyJson(Object? o) => const JsonEncoder.withIndent('  ').convert(o);

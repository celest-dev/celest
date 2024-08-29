// ignore_for_file: avoid_print

@Timeout.none
library;

import 'package:celest_cloud/celest_cloud.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void main() {
  final logger = Logger.root;
  logger.level = Level.ALL;
  logger.onRecord.listen((log) {
    print('[${log.level.name}] ${log.message}');
    if (log.error != null) {
      print(log.error);
      if (log.stackTrace != null) {
        print(log.stackTrace);
      }
    }
  });
  group('AuthClient', () {
    final celest = CelestCloud(
      uri: Uri.parse('http://localhost:8081'),
      clientType: ClientType.HEADLESS,
      logger: logger,
    );

    group('IDP', () {
      test('get authorization url', () async {
        final state = await celest.authentication.idp.start(
          provider: IdentityProviderType.GOOGLE,
          redirectUri: Uri.parse('http://localhost:7777/auth/callback'),
        );
        expect(state.uri.toString(), contains('google.com'));
      });
    });

    group('Organizations', () {
      test('create organization (validate-only)', () async {
        await celest.organizations.create(
          organizationId: 'test-organization',
          organization: Organization(
            displayName: 'Test Organization',
          ),
          validateOnly: true,
        );
        expect(
          await celest.organizations.get('organizations/test-organization'),
          isNull,
        );
      });

      test('create organization', () async {
        final organization = await celest.organizations.create(
          organizationId: 'test-organization',
          organization: Organization(
            displayName: 'Test Organization',
          ),
        );
        expect(
          organization,
          isA<Organization>()
              .having(
                (org) => org.organizationId,
                'organizationId',
                'test-organization',
              )
              .having(
                (org) => org.displayName,
                'displayName',
                'Test Organization',
              ),
        );
        expect(
          await celest.organizations.get('organizations/test-organization'),
          isA<Organization>()
              .having(
                (org) => org.organizationId,
                'organizationId',
                'test-organization',
              )
              .having(
                (org) => org.displayName,
                'displayName',
                'Test Organization',
              ),
        );
      });
    });
  });
}

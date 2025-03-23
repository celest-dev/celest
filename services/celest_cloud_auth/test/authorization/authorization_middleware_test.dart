import 'package:celest_cloud_auth/src/authentication/authentication_model.dart';
import 'package:test/test.dart';

import '../tester.dart';

void main() {
  final tester = AuthorizationTester(persistData: true);

  group('AuthorizationMiddleware', () {
    tester.setUp();

    const public = ('POST', '/test/public');
    const authenticated = ('POST', '/test/authenticated');
    const admin = ('POST', '/test/admin');

    test('unauthenticated', () async {
      await tester.httpTest({
        public: expectStatus(200),
        authenticated: expectStatus(401),
        admin: expectStatus(401),
      });
    });

    test('anonymous', () async {
      final session = await tester.sessions.createSession(
        userId: null,
        factor: AuthenticationFactorEmailOtp(email: 'test@example.com'),
      );
      await tester.httpTest(cork: session.sessionCork, {
        public: expectStatus(200),
        authenticated: expectStatus(403),
        admin: expectStatus(403),
      });
    });

    test('authenticated', () async {
      final (_, cork) = await tester.createUser(
        roles: [roleAuthenticated],
      );
      await tester.httpTest(cork: cork, {
        public: expectStatus(200),
        authenticated: expectStatus(200),
        admin: expectStatus(403),
      });
    });

    test('admin', () async {
      final (_, cork) = await tester.createUser(
        roles: [roleAdmin],
      );
      await tester.httpTest(cork: cork, {
        public: expectStatus(200),
        authenticated: expectStatus(200),
        admin: expectStatus(200),
      });
    });
  });
}

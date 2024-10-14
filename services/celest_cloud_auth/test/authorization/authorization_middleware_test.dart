import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/celest_core.dart';
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
        authenticated: expectStatus(403),
        admin: expectStatus(403),
      });
    });

    test('anonymous', () async {
      final userId = typeId<User>();
      final cork = await tester.corks.createUserCork(
        user: User(
          userId: userId,
          roles: const [roleAnonymous],
        ),
      );
      await tester.httpTest(cork: cork, {
        public: expectStatus(200),
        authenticated: expectStatus(403),
        admin: expectStatus(403),
      });
    });

    test('authenticated', () async {
      final userId = typeId<User>();
      final user = await tester.db.createUser(
        user: User(
          userId: userId,
          roles: const [roleAuthenticated],
        ),
      );
      final cork = await tester.corks.createUserCork(user: user);
      await tester.httpTest(cork: cork, {
        public: expectStatus(200),
        authenticated: expectStatus(200),
        admin: expectStatus(403),
      });
    });

    test('admin', () async {
      final userId = typeId<User>();
      final user = await tester.db.createUser(
        user: User(
          userId: userId,
          roles: const [roleAdmin],
        ),
      );
      final cork = await tester.corks.createUserCork(user: user);
      await tester.httpTest(cork: cork, {
        public: expectStatus(200),
        authenticated: expectStatus(200),
        admin: expectStatus(200),
      });
    });
  });
}

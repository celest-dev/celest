import 'package:celest/celest.dart';
import 'package:test/test.dart';

import '../../functions/greeting.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(
        await sayHello(
          user: User(
            userId: '123',
            email: 'test@celest.dev',
            emailVerified: true,
            displayName: 'Celest',
          ),
        ),
        'Hello, Celest!',
      );
    });
    test('sayHello (email not verified)', () async {
      expect(
        sayHello(
          user: User(
            userId: '123',
            email: 'test@celest.dev',
            emailVerified: false,
            displayName: 'Celest',
          ),
        ),
        throwsA(isA<UnauthorizedException>()),
      );
    });
  });
}

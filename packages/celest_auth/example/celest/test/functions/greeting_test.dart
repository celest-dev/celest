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
            emails: [
              Email(
                email: 'test@celest.dev',
                isPrimary: true,
                isVerified: true,
              ),
            ],
            givenName: 'Celest',
          ),
        ),
        'Hello, Celest!',
      );
    });
    test('sayHello (no email)', () async {
      expect(
        sayHello(
          user: User(
            userId: '123',
            givenName: 'Celest',
          ),
        ),
        throwsA(isA<UnauthorizedException>()),
      );
    });
  });
}

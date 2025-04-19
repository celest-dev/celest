import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/sessions/sessions_repository.dart';
import 'package:checks/checks.dart';
import 'package:clock/clock.dart';
import 'package:test/test.dart';

import '../tester.dart';

void main() {
  final tester = AuthorizationTester(persistData: false);

  group('SessionsRepository', () {
    tester.setUp();

    test('sessionDuration', () async {
      final session = await tester.sessions.createSession(
        userId: null,
        factor: AuthenticationFactorEmailOtp(email: 'test@celest.dev'),
        sessionDuration: SessionsRepository.preAuthSessionDuration,
      );
      await check(tester.sessions.getSession(sessionId: session.sessionId))
          .completes((it) => it.isNotNull());
      await withClock(
        Clock.fixed(
          clock
              .now()
              .add(SessionsRepository.preAuthSessionDuration)
              .add(const Duration(seconds: 1)),
        ),
        () async {
          await check(tester.sessions.getSession(sessionId: session.sessionId))
              .completes((it) => it.isNull());
        },
      );

      await tester.sessions.updateSession(
        session: session,
        sessionDuration: SessionsRepository.preAuthSessionDuration,
      );
      await check(tester.sessions.getSession(sessionId: session.sessionId))
          .completes((it) => it.isNotNull());
      await withClock(
        Clock.fixed(
          clock
              .now()
              .add(SessionsRepository.preAuthSessionDuration)
              .add(const Duration(seconds: 1)),
        ),
        () async {
          await check(tester.sessions.getSession(sessionId: session.sessionId))
              .completes((it) => it.isNull());
        },
      );
    });
  });
}

import 'dart:math';

import 'package:cedar/ast.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb;
import 'package:celest_cloud_auth/src/authentication/authentication_model.dart';
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_core/celest_core.dart';
import 'package:checks/checks.dart';
import 'package:clock/clock.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:test/test.dart';

import '../tester.dart';

void main() {
  final tester = AuthorizationTester(persistData: true);

  group('AuthenticationService', () {
    tester.setUp();

    group('getOpenIdUserInfo', () {
      const route = ('GET', '/v1alpha1/auth/userinfo');

      test('unauthenticated', () async {
        await tester.httpTest({
          route: expectStatus(401),
        });
      });

      test('authenticated', () async {
        final (user, cork) = await tester.createUser(
          roles: const [roleAuthenticated],
        );
        await tester.httpTest(cork: cork, {
          route: expectAll([
            expectStatus(200),
            expectBody({
              'sub': user.userId,
              'email': 'test@celest.dev',
              'email_verified': false,
            }),
          ]),
        });
      });

      test('admin', () async {
        const email = 'admin@celest.dev';
        final (user, cork) = await tester.createUser(
          email: email,
          roles: const [roleAdmin],
        );
        await tester.httpTest(cork: cork, {
          route: expectAll([
            expectStatus(200),
            expectBody({
              'sub': user.userId,
              'email': email,
              'email_verified': false,
            }),
          ]),
        });
      });
    });

    test('create account', () async {
      final email = 'test-${Random().nextInt(100000)}@celest.dev';

      final session = await tester.authenticationService.startSession(
        factor: AuthenticationFactorEmailOtp(email: email),
        clientInfo: SessionClient(
          clientId: 'test',
          callbacks: SessionCallbacks(
            successUri: Uri.parse('https://celest.dev'),
          ),
        ),
      );

      check(session.sessionToken).isNotNull();
      final sessionCork = CedarCork.parse(session.sessionToken!);
      final expireTime =
          (sessionCork.claims!.attributes['expireTime'] as LongValue)
              .value
              .toInt();
      check(session.state)
          .isA<SessionStateNeedsProof>()
          .has((s) => s.factor, 'factor')
          .isA<AuthenticationFactorEmailOtp>();

      final (to: _, :code) = tester.lastSentCode!;

      await Future<void>.delayed(const Duration(seconds: 1));
      final result = await tester.authenticationService.continueSession(
        sessionId: session.sessionId,
        sessionToken: session.sessionToken!,
        proof: AuthenticationFactorEmailOtp(email: email, code: code),
      );

      check(result.state).isA<SessionStateSuccess>()
        ..has((s) => s.isNewUser, 'isNewUser').isTrue()
        ..has((s) => s.user.primaryEmail, 'email').equals(
          Email(email: email, isVerified: true, isPrimary: true),
        )
        ..has(
          (s) =>
              CedarCork(s.cork).bearer ==
              EntityUid.of('Celest::Session', session.sessionId.encoded),
          'cork bearer == sessionId',
        ).isTrue()
        ..has(
          (s) => CedarCork(s.cork)
              .claims
              ?.parents
              .contains(EntityUid.of('Celest::User', s.user.userId)),
          'cork <: user',
        ).isNotNull().isTrue()
        ..has((s) => s.cork.toString(), 'cork != original sessionToken').not(
          (it) => it.equals(session.sessionToken!),
        );

      check(result.sessionToken).isNotNull();
      check(result.sessionToken).not((it) => it.equals(session.sessionToken));
      final updatedCork = CedarCork.parse(result.sessionToken!);
      check(updatedCork.claims!.attributes['expireTime'])
          .isNotNull()
          .isA<LongValue>()
          .has((it) => it.value.toInt(), 'expireTime')
          .not((it) => it.equals(expireTime));
    });

    test('re-authenticate', () async {
      final email = 'test-${Random().nextInt(100000)}@celest.dev';

      final session = await tester.authenticationService.startSession(
        factor: AuthenticationFactorEmailOtp(email: email),
        clientInfo: SessionClient(
          clientId: 'test',
          callbacks: SessionCallbacks(
            successUri: Uri.parse('https://celest.dev'),
          ),
        ),
      );

      check(session.sessionToken).isNotNull();
      check(session.state)
          .isA<SessionStateNeedsProof>()
          .has((s) => s.factor, 'factor')
          .isA<AuthenticationFactorEmailOtp>();

      final (to: _, :code) = tester.lastSentCode!;

      final result = await tester.authenticationService.continueSession(
        sessionId: session.sessionId,
        sessionToken: session.sessionToken!,
        proof: AuthenticationFactorEmailOtp(email: email, code: code),
      );

      check(result.state).isA<SessionStateSuccess>()
        ..has((s) => s.isNewUser, 'isNewUser').isTrue()
        ..has((s) => s.user.primaryEmail, 'email').equals(
          Email(email: email, isVerified: true, isPrimary: true),
        );

      final session2 = await tester.authenticationService.startSession(
        factor: AuthenticationFactorEmailOtp(email: email),
        clientInfo: SessionClient(
          clientId: 'test',
          callbacks: SessionCallbacks(
            successUri: Uri.parse('https://celest.dev'),
          ),
        ),
      );

      check(() => session2.sessionToken).returnsNormally();
      check(session2.state)
          .isA<SessionStateNeedsProof>()
          .has((s) => s.factor, 'factor')
          .isA<AuthenticationFactorEmailOtp>();

      final (to: _, code: code2) = tester.lastSentCode!;

      final result2 = await tester.authenticationService.continueSession(
        sessionId: session2.sessionId,
        sessionToken: session2.sessionToken!,
        proof: AuthenticationFactorEmailOtp(email: email, code: code2),
      );

      check(result2.state).isA<SessionStateSuccess>()
        ..has((s) => s.isNewUser, 'isNewUser').isFalse()
        ..has((s) => s.user, 'user')
            .equals((result.state as SessionStateSuccess).user);
    });

    test('resend otp', () async {
      final email = 'test-${Random().nextInt(100000)}@celest.dev';

      check(tester.lastSentCode).isNull();

      final session = await tester.authenticationService.startSession(
        factor: AuthenticationFactorEmailOtp(email: email),
        clientInfo: SessionClient(
          clientId: 'test',
          callbacks: SessionCallbacks(
            successUri: Uri.parse('https://celest.dev'),
          ),
        ),
      );

      check(session.sessionToken).isNotNull();
      check(session.state)
          .isA<SessionStateNeedsProof>()
          .has((s) => s.factor, 'factor')
          .isA<AuthenticationFactorEmailOtp>();

      check(tester.lastSentCode).isNotNull();

      final nextResend = DateTime.now().add(const Duration(minutes: 1));
      await withClock(Clock.fixed(nextResend), () async {
        final result = await tester.authenticationService.continueSession(
          sessionId: session.sessionId,
          sessionToken: session.sessionToken!,
          resend: AuthenticationFactorEmailOtp(email: email),
        );
        check(result.state).isA<SessionStateNeedsProof>();
      });

      final (to: _, :code) = tester.lastSentCode!;

      final result2 = await tester.authenticationService.continueSession(
        sessionId: session.sessionId,
        sessionToken: session.sessionToken!,
        proof: AuthenticationFactorEmailOtp(email: email, code: code),
      );

      check(result2.state).isA<SessionStateSuccess>()
        ..has((s) => s.isNewUser, 'isNewUser').isTrue()
        ..has((s) => s.user.primaryEmail, 'email').equals(
          Email(email: email, isVerified: true, isPrimary: true),
        );
    });

    group('startSession', () {
      const route = ('POST', '/v1alpha1/auth/sessions:startSession');

      group('cloud', () {
        test('unauthenticated', () async {
          final cloud = tester.cloud();
          await check(
            cloud.authentication.email.start(email: 'test@celest.dev'),
          ).completes();
        });

        test('authenticated', () async {
          final (user, cork) = await tester.createUser(
            roles: const [roleAuthenticated],
          );

          final cloud = tester.cloud(cork: cork);
          await check(
            cloud.authentication.email.start(email: 'test@celest.dev'),
          ).completes();
        });

        test('create account', () async {
          const email = 'test@celest.dev';
          final cloud = tester.cloud();

          final state = await cloud.authentication.email.start(email: email);
          check(state)
              .isA<pb.EmailSessionVerifyCode>()
              .has((it) => it.sessionToken, 'sessionToken')
              .isNotEmpty();

          final (to: _, :code) = tester.lastSentCode!;
          await check(
            cloud.authentication.email.verifyCode(
              state: state as pb.EmailSessionVerifyCode,
              code: code,
            ),
          ).completes(
            (result) => result.isA<pb.EmailSessionSuccess>()
              ..has((it) => it.isNewUser, 'isNewUser').isTrue()
              ..has((it) => it.user.toModel().primaryEmail, 'email').equals(
                const Email(email: email, isVerified: true, isPrimary: true),
              ),
          );
        });
      });

      group('authorization', () {
        const request = {
          'emailOtp': {
            'email': 'test@celest.dev',
          },
          'client': {
            'clientId': 'test',
            'clientType': 'HEADLESS',
            'callbacks': {
              'successUri': 'https://celest.dev',
            },
          },
        };

        test('unauthenticated', () async {
          await tester.httpTest(body: request, {
            route: expectAll([
              expectStatus(200),
              expectBodyHas([
                (it) => it.containsKey('sessionId'),
                (it) => it.containsKey('sessionToken'),
                (it) => it.containsKey('expireTime'),
                (it) => it
                        .has((it) => it['nextStep'], 'nextStep')
                        .isA<Map<String, Object?>>()
                        .deepEquals({
                      'needsProof': {
                        'emailOtp': {
                          'email': 'test@celest.dev',
                        },
                      },
                    }),
              ]),
            ]),
          });
          check(tester.lastSentCode)
              .isNotNull()
              .has((it) => it.to, 'to')
              .equals('test@celest.dev');
        });

        test('re-authenticate', () async {
          final (user, cork) = await tester.createUser(
            roles: const [roleAuthenticated],
          );

          await tester.httpTest(cork: cork, body: request, {
            route: expectAll([
              expectStatus(200),
              expectBodyHas([
                (it) => it.containsKey('sessionId'),
                (it) => it.containsKey('sessionToken'),
                (it) => it.containsKey('expireTime'),
                (it) => it
                        .has((it) => it['nextStep'], 'nextStep')
                        .isA<Map<String, Object?>>()
                        .deepEquals({
                      'needsProof': {
                        'emailOtp': {
                          'email': 'test@celest.dev',
                        },
                      },
                    }),
              ]),
            ]),
          });
          check(tester.lastSentCode)
              .isNotNull()
              .has((it) => it.to, 'to')
              .equals('test@celest.dev');
        });
      });
    });

    group('endSession', () {
      test('unauthenticated', () async {
        final session = await tester.authenticationService.startSession(
          factor: const AuthenticationFactorEmailOtp(email: 'test@celest.dev'),
          clientInfo: SessionClient(
            clientId: 'test',
            callbacks: SessionCallbacks(
              successUri: Uri.parse('https://celest.dev'),
            ),
          ),
        );

        check(session.sessionToken).isNotNull();
        await check(
          tester.authenticationService.endSession(
            sessionId: session.sessionId,
            sessionToken: session.sessionToken,
          ),
        ).completes();
      });

      // test('bad sessionToken', skip: true, () async {
      //   final session = await tester.authenticationService.startSession(
      //     factor: const AuthenticationFactorEmailOtp(email: 'test@celest.dev'),
      //     clientInfo: SessionClient(
      //       clientId: 'test',
      //       callbacks: SessionCallbacks(
      //         successUri: Uri.parse('https://celest.dev'),
      //       ),
      //     ),
      //   );

      //   final cork = await tester.corks.createSessionCork(
      //     session: Session(
      //       sessionId: typeId<Session>(),
      //       cryptoKeyId: Uint8List(0),
      //       expireTime: DateTime.now().add(const Duration(days: 1)),
      //       authenticationFactor: const AuthenticationFactorEmailOtp(
      //         email: 'test@celest.dev',
      //       ),
      //       clientInfo: SessionClient(
      //         clientId: 'test',
      //         callbacks: SessionCallbacks(
      //           successUri: Uri.parse('https://celest.dev'),
      //         ),
      //       ),
      //     ),
      //   );

      //   await check(
      //     tester.authenticationService.endSession(
      //       sessionId: session.sessionId,
      //       sessionToken: cork.toString(),
      //     ),
      //   ).throws<InvalidSignatureException>();
      // });
    });
  });
}

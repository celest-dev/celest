import 'package:celest_auth_example/main.dart';
import 'package:celest_auth_example/test_keys.dart';
import 'package:celest_auth_example_client/celest_auth_example_client.dart';
import 'package:celest_test/celest_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('errors when unauthenticated', (tester) async {
    celest.init();
    await tester.pumpWidget(MainApp());
    await tester.pumpAndSettle();

    // Initial state is signed out.
    expect(find.byKey(TestKeys.txtSignedOut), findsOne);

    // Send an unauthenticated request.
    await tester.tap(find.byKey(TestKeys.btnMakeRequest));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byKey(TestKeys.wMakeRequestResponse),
        matching: find.textContaining('Error'),
      ),
      findsOne,
    );
  });

  testWidgets('sends OTP code', (tester) async {
    celest.init();
    final celestTester = await CelestTester.connect();

    await tester.pumpWidget(MainApp());
    await tester.pumpAndSettle();

    // Initial state is signed out.
    expect(find.byKey(TestKeys.txtSignedOut), findsOne);

    // Sign in with email.
    await tester.enterText(
      find.byKey(TestKeys.inEmail),
      'test@example.com',
    );
    expectLater(
      celestTester.auth.onSentOtp,
      emits(
        isA<Otp>().having((it) => it.to, 'to', 'test@example.com'),
      ),
    );

    await tester.tap(find.byKey(TestKeys.btnSignIn));

    await expectLater(
      celest.auth.authStateChanges,
      emitsThrough(isA<AuthFlowInProgress>()),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(TestKeys.inOtp), findsOne);
    expect(find.byKey(TestKeys.btnVerifyOtp), findsOne);
  });

  testWidgets('signs in/out', (tester) async {
    celest.init();
    final celestTester = await CelestTester.connect();

    await tester.pumpWidget(MainApp());
    await tester.pumpAndSettle();

    // Initial state is signed out.
    expect(find.byKey(TestKeys.txtSignedOut), findsOne);

    // Sign in with email.
    await tester.enterText(
      find.byKey(TestKeys.inEmail),
      'test@example.com',
    );
    final otpCode = celestTester.auth.onSentOtp.first;
    await tester.tap(find.byKey(TestKeys.btnSignIn));

    await expectLater(
      celest.auth.authStateChanges,
      emitsThrough(isA<AuthFlowInProgress>()),
    );
    await tester.pumpAndSettle();

    // Enter OTP code received.
    await tester.enterText(find.byKey(TestKeys.inOtp), (await otpCode).code);
    await tester.tap(find.byKey(TestKeys.btnVerifyOtp));

    await expectLater(
      celest.auth.authStateChanges,
      emitsThrough(isA<Authenticated>()),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(TestKeys.txtSignedIn), findsOne);

    // Make authenticated request
    await tester.tap(find.byKey(TestKeys.btnMakeRequest));
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byKey(TestKeys.wMakeRequestResponse),
        matching: find.textContaining('Response'),
      ),
      findsOne,
    );

    // Sign out
    await tester.tap(find.byKey(TestKeys.btnSignOut));

    await expectLater(
      celest.auth.authStateChanges,
      emitsThrough(isA<Unauthenticated>()),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(TestKeys.txtSignedOut), findsOne);
  });
}

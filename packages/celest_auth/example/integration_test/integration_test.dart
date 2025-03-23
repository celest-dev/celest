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
    expect(find.byKey(TestKeys.txtSignedOut), findsOneWidget);

    // Send an unauthenticated request.
    await tester.tap(find.byKey(TestKeys.btnMakeRequest));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byKey(TestKeys.wMakeRequestResponse),
        matching: find.textContaining('Error'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('sends OTP code', (tester) async {
    celest.init();
    final celestTester = await CelestTester.connect();

    await tester.pumpWidget(MainApp());
    await tester.pumpAndSettle();

    // Initial state is signed out.
    expect(find.byKey(TestKeys.txtSignedOut), findsOneWidget);

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
    await tester.pumpAndSettle();

    expect(find.byKey(TestKeys.inOtp), findsOneWidget);
    expect(find.byKey(TestKeys.btnVerifyOtp), findsOneWidget);
  });

  testWidgets('signs in/out', (tester) async {
    celest.init();
    final celestTester = await CelestTester.connect();

    await tester.pumpWidget(MainApp());
    await tester.pumpAndSettle();

    // Initial state is signed out.
    expect(find.byKey(TestKeys.txtSignedOut), findsOneWidget);

    // Sign in with email.
    await tester.enterText(
      find.byKey(TestKeys.inEmail),
      'test@example.com',
    );
    final otpCode = celestTester.auth.onSentOtp.first;
    await tester.tap(find.byKey(TestKeys.btnSignIn));
    await tester.pumpAndSettle();

    // Enter OTP code received.
    await tester.enterText(find.byKey(TestKeys.inOtp), (await otpCode).code);
    await tester.tap(find.byKey(TestKeys.btnVerifyOtp));
    await tester.pumpAndSettle();

    expect(find.byKey(TestKeys.txtSignedIn), findsOneWidget);

    // Make authenticated request
    await tester.tap(find.byKey(TestKeys.btnMakeRequest));
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byKey(TestKeys.wMakeRequestResponse),
        matching: find.textContaining('Response'),
      ),
      findsOneWidget,
    );

    // Sign out
    await tester.tap(find.byKey(TestKeys.btnSignOut));
    await tester.pumpAndSettle();

    expect(find.byKey(TestKeys.txtSignedOut), findsOneWidget);
  });
}

import 'package:celest_auth/celest_auth.dart';
import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:email_validator/email_validator.dart';

base mixin Authenticate on CelestCommand {
  Future<int> signUp() async {
    cliLogger.info(
      "Welcome! To get started with Celest Cloud, we'll need to verify your "
      'email.',
    );
    String? email;
    while (email == null) {
      final input = cliLogger.prompt('Email:');
      if (input.isEmpty || !EmailValidator.validate(input, true)) {
        cliLogger.err('Invalid email address');
        continue;
      }
      email = input;
    }
    analytics.identifyUser(
      set: {
        'email': email,
      },
    );
    analytics.capture('sign_up_started');
    try {
      final flow = await auth.email.authenticate(email: email);
      cliLogger.info(
        'We have sent you an email with a verification code. '
        'Please enter it below to accept the invite.',
      );
      final verificationCode = cliLogger.prompt('Verification code:');
      if (verificationCode.isEmpty) {
        return 1;
      }
      final user = await flow.verify(otpCode: verificationCode);

      analytics.capture(
        'sign_up_succeeded',
        properties: {
          'user_id': user.userId,
        },
      );
      return 0;
    } on Object catch (e) {
      analytics.capture(
        'sign_up_failed',
        properties: {
          'error': e.toString(),
        },
      );
      rethrow;
    }
  }

  /// Retrieves the authenticated user or signs up a new user.
  Future<int> authenticate() async {
    final authState = await auth.init();
    if (authState is Unauthenticated) {
      logger.finest('Unauthenticated user. Signing up...');
      final res = await signUp();
      if (res != 0) {
        return res;
      }
    }
    return 0;
  }
}

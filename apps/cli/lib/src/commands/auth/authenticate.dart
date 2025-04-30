import 'package:celest_auth/celest_auth.dart';
import 'package:celest_cli/src/commands/auth/cli_auth.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_core/celest_core.dart';
import 'package:email_validator/email_validator.dart';

base mixin Authenticate on CelestCommand {
  static final RegExp _validOtp = RegExp(r'^\d{6}$');

  Future<int> signUp() async {
    cliLogger.success(
      "Welcome! To get started with Celest Cloud, we'll need to verify your "
      'email.',
    );
    String email;
    for (;;) {
      email = cliLogger.prompt('What is your email?');
      if (EmailValidator.validate(email.trim(), true)) {
        break;
      }
      cliLogger.warn('Invalid email address.');
    }
    analytics.identifyUser(set: {'email': email});
    analytics.capture('sign_up_started');
    try {
      final flow = await auth.email.authenticate(email: email);
      cliLogger.info(
        'We have sent you an email with a verification code. '
        'Please enter it below to verify your account.',
      );
      String verificationCode;
      for (;;) {
        verificationCode = cliLogger.prompt('Verification Code:');
        if (_validOtp.hasMatch(verificationCode.trim())) {
          break;
        }
        cliLogger.warn('Invalid code. It should be 6 digits.');
      }
      final user = await flow.verify(otpCode: verificationCode);

      analytics.capture(
        'sign_up_succeeded',
        properties: {'user_id': user.userId},
      );
      return 0;
    } on Object catch (e) {
      analytics.capture('sign_up_failed', properties: {'error': e.toString()});
      rethrow;
    }
  }

  Future<User?> authenticateUser() async {
    final authState = await auth.init();
    if (authState case Authenticated(:final user)) {
      return user;
    }
    return null;
  }

  Future<bool> get isAuthenticated async {
    final state = await auth.init();
    return state is Authenticated;
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

  /// Asserts the user is authenticated.
  Future<User> assertAuthenticated() async {
    final authState = await auth.init();
    if (authState case Authenticated(:final user)) {
      return user;
    }
    throw const CliException(
      'You must be logged in to run this command. '
      'Run `celest auth login` to log in or create an account.',
    );
  }
}

import 'package:celest_auth/celest_auth.dart';
import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_core/celest_core.dart';
import 'package:dcli/dcli.dart';
import 'package:email_validator/email_validator.dart';

base mixin Authenticate on CelestCommand {
  Future<int> signUp() async {
    cliLogger.success(
      "Welcome! To get started with Celest Cloud, we'll need to verify your "
      'email.',
    );
    final email = ask(
      'What is your email?',
      required: true,
      validator: const AskEmailValidator(),
    );
    analytics.identifyUser(set: {'email': email});
    analytics.capture('sign_up_started');
    try {
      final flow = await auth.email.authenticate(email: email);
      cliLogger.info(
        'We have sent you an email with a verification code. '
        'Please enter it below to verify your account.',
      );
      final verificationCode = ask(
        'Verification Code:',
        required: true,
        validator: const AskOtpValidator(),
      );
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

final class AskEmailValidator implements AskValidator {
  const AskEmailValidator();

  @override
  String validate(String line, {String? customErrorMessage}) {
    if (!EmailValidator.validate(line.trim(), true)) {
      throw AskValidatorException(
        customErrorMessage ?? 'Invalid email address',
      );
    }
    return line;
  }
}

final class AskOtpValidator implements AskValidator {
  const AskOtpValidator();

  static final _validOtp = RegExp(r'^\d{6}$');

  @override
  String validate(String line, {String? customErrorMessage}) {
    if (!_validOtp.hasMatch(line.trim())) {
      throw AskValidatorException(
        customErrorMessage ?? 'Invalid code. It should be 6 digits.',
      );
    }
    return line;
  }
}

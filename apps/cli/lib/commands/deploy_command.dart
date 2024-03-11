import 'package:celest_auth/celest_auth.dart';
import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:email_validator/email_validator.dart';

final class DeployCommand extends CelestCommand with Configure, Migrate {
  @override
  String get name => 'deploy';

  @override
  String get description => 'Deploys your Celest project to the cloud.';

  @override
  String get category => 'Project';

  Future<int> signUp() async {
    cliLogger.warn(
      'Celest Cloud is available now for our early-bird customers. '
      'If you have an invite code, please enter it below.',
    );
    String? email;
    while (email == null) {
      final input = cliLogger.prompt('Invite code:');
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

  @override
  Future<int> run() async {
    await super.run();
    await configure(
      createProject: () {
        throw const CelestException(
          'No Celest project found in the current directory. '
          'To create a new project, run `celest start`.',
        );
      },
      migrateProject: migrateProject,
    );

    AuthState initialState;
    try {
      initialState = await auth.init();
    } on Exception {
      initialState = const Unauthenticated();
    }

    if (initialState is Unauthenticated) {
      logger.finest('Unauthenticated user. Signing up...');
      final res = await signUp();
      if (res != 0) {
        return res;
      }
    }

    return CelestFrontend().build();
  }
}

import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:dcli/dcli.dart';

final class ExperimentsCommand extends CelestCommand {
  @override
  String get name => 'experiments';

  @override
  String get description => 'Experiments';

  @override
  bool get hidden => true;

  @override
  Future<int> run() async {
    await super.run();

    final name = ask('What is your name?');
    print('Hello $name');

    final password = ask('What is your password?', hidden: true);
    print('Your password is $password');

    final createAccount = confirm(
      green('Do you want to create an account?', bold: true),
      defaultValue: true,
    );
    if (!createAccount) {
      return 0;
    }

    final email = ask(
      'What is your email?',
      validator: const AskEmailValidator(),
      required: true,
    );
    print('We sent a verification email to $email');

    final verificationCode = ask(
      'Verification Code:',
      validator: const AskOtpValidator(),
      required: true,
    );
    print('You entered $verificationCode');
    return 0;
  }
}

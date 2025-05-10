import '../../../common/common.dart';
import '../../../common/test_cloud.dart';

final class LoginCommandTest extends E2ETest with TestCloud {
  LoginCommandTest(super.target);

  @override
  String get name => 'login';

  @override
  Future<void> run() async {
    final nextOtpCode = tester.auth.onSentOtp.first;
    final command = celestCommand(
      'auth',
      'login',
    ).start().expectLater('What is your email?');
    await command.flush();

    // Invalid email
    await command.writeLine('bademail').expectNext('Invalid email').flush();

    // Valid email
    await command
        .writeLine('test@example.com')
        .expectLater('We have sent you an email')
        .flush();

    // Invalid code
    await command
        .writeLine('badcode')
        .expectLater('Invalid code. It should be 6 digits.')
        .flush();

    // TODO(dnys1): Allow multiple retries on same auth flow object.
    // // Incorrect code
    // await command
    //     .writeLine('123456')
    //     .expectLater('Invalid code. Please try again.')
    //     .flush();

    // // Must wait 10 seconds before verifying again.
    // await Future<void>.delayed(OtpRepository.verifyDelay);

    // Correct code
    final otpCode = (await nextOtpCode).code;
    await command
        .writeLine(otpCode)
        .expectLater('Welcome to Celest Cloud')
        .flush();

    // Create organization
    await command
        .writeLine('test-org')
        .expectLater('Created organization')
        .expectNext('You have been logged in!')
        .run();

    // Check that calling login again works.
    await celestCommand(
      'auth',
      'login',
    ).start().expectLater('You are already logged in as').run();
  }
}

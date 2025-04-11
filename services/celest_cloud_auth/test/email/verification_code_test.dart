import 'package:celest_cloud_auth/src/email/templates/verification_code.dart';
import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group('VerificationCode', () {
    for (final type in VerificationCodeEmailType.values) {
      final testCases = [
        (
          name: 'missing name, logo',
          params: VerificationCodeEmailParams(
            type: type,
            email: 'test@example.com',
            code: '123456',
            organizationName: 'Test',
            name: null,
            logoUrl: null,
          ),
        ),
        (
          name: 'all params',
          params: VerificationCodeEmailParams(
            type: type,
            email: 'test@example.com',
            code: '123456',
            organizationName: 'Test',
            name: 'Test User',
            logoUrl: celestLogo,
          ),
        ),
      ];

      for (final (:name, :params) in testCases) {
        test('${type.name} $name', () {
          check(() => const VerificationCodeEmail().render(params))
              .returnsNormally();
        });
      }
    }
  });
}

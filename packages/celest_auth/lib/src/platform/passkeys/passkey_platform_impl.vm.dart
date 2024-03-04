import 'package:celest_auth/src/platform/passkeys/passkey_platform.android.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_platform.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_platform.darwin.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class PasskeyPlatformImpl extends PasskeyPlatform {
  factory PasskeyPlatformImpl() {
    if (os.isIOS || os.isMacOS) {
      return PasskeyPlatformDarwin();
    }
    if (os.isAndroid) {
      return PasskeyPlatformAndroid();
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  PasskeyPlatformImpl.base() : super.base();
}

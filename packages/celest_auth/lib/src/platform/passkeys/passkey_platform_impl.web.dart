import 'package:celest_auth/src/platform/passkeys/passkey_platform.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_platform.web.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class PasskeyPlatformImpl extends PasskeyPlatform {
  factory PasskeyPlatformImpl() {
    if (kIsWeb) {
      return PasskeyPlatformWeb();
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  PasskeyPlatformImpl.base() : super.base();
}

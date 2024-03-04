import 'package:celest_auth/src/client/passkeys/passkey_platform.android.dart';
import 'package:celest_auth/src/client/passkeys/passkey_platform.dart';
import 'package:celest_auth/src/client/passkeys/passkey_platform.darwin.dart';
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class PasskeyPlatformImpl extends PasskeyPlatform {
  factory PasskeyPlatformImpl({
    required PasskeyProtocol protocol,
  }) {
    if (os.isIOS || os.isMacOS) {
      return PasskeyPlatformDarwin(protocol: protocol);
    }
    if (os.isAndroid) {
      return PasskeyPlatformAndroid(protocol: protocol);
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  PasskeyPlatformImpl.base({
    required super.protocol,
  }) : super.base();
}

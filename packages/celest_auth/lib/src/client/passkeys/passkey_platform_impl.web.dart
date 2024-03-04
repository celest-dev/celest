import 'package:celest_auth/src/client/passkeys/passkey_platform.dart';
import 'package:celest_auth/src/client/passkeys/passkey_platform.web.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class PasskeyPlatformImpl extends PasskeyPlatform {
  factory PasskeyPlatformImpl({
    required PasskeyProtocol protocol,
  }) {
    if (kIsWeb) {
      return PasskeyPlatformWeb(protocol: protocol);
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

import 'package:celest_auth/src/client/passkeys/passkey_client.android.dart';
import 'package:celest_auth/src/client/passkeys/passkey_client.dart';
import 'package:celest_auth/src/client/passkeys/passkey_client.darwin.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class PasskeyClientPlatform extends PasskeyClient {
  factory PasskeyClientPlatform() {
    if (kIsFlutter) {
      if (os.isIOS || os.isMacOS) {
        return PasskeyClientDarwin();
      }
      if (os.isAndroid) {
        return PasskeyClientAndroid();
      }
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  PasskeyClientPlatform.base() : super.base();
}

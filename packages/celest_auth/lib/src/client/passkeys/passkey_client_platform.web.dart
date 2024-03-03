import 'package:celest_auth/src/client/passkeys/passkey_client.dart';
import 'package:celest_auth/src/client/passkeys/passkey_client.web.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class PasskeyClientPlatform extends PasskeyClient {
  factory PasskeyClientPlatform({
    required PasskeyProtocol protocol,
  }) {
    if (kIsWeb) {
      return PasskeyClientWeb(protocol: protocol);
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  PasskeyClientPlatform.base({
    required super.protocol,
  }) : super.base();
}

import 'package:celest_auth/src/client/auth_client.android.dart';
import 'package:celest_auth/src/client/auth_client.dart';
import 'package:celest_auth/src/client/auth_client.darwin.dart';
import 'package:celest_auth/src/client/auth_client.native.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class AuthClientPlatform extends AuthClient {
  factory AuthClientPlatform() {
    if (kIsDartNative) {
      return AuthClientNative();
    }
    if (os.isIOS || os.isMacOS) {
      return AuthClientDarwin();
    }
    if (os.isAndroid) {
      return AuthClientAndroid();
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  AuthClientPlatform.base() : super.base();
}

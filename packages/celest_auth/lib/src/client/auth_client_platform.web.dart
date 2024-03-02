import 'package:celest_auth/src/client/auth_client.dart';
import 'package:celest_auth/src/client/auth_client.web.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class AuthClientPlatform extends AuthClient {
  factory AuthClientPlatform() {
    if (kIsWeb) {
      return AuthClientWeb();
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  AuthClientPlatform.base() : super.base();
}

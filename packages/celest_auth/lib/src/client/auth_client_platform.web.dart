import 'package:celest_auth/src/client/auth_client.dart';
import 'package:celest_auth/src/client/auth_client.web.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class AuthClientPlatform extends AuthClient {
  factory AuthClientPlatform({
    required AuthProtocol protocol,
  }) {
    if (kIsWeb) {
      return AuthClientWeb(protocol: protocol);
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  AuthClientPlatform.base({
    required super.protocol,
  }) : super.base();
}

import 'package:celest_auth/src/client/auth_client.android.dart';
import 'package:celest_auth/src/client/auth_client.dart';
import 'package:celest_auth/src/client/auth_client.darwin.dart';
import 'package:celest_auth/src/client/auth_client.native.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class AuthClientPlatform extends AuthClient {
  factory AuthClientPlatform({
    required AuthProtocol protocol,
  }) {
    if (kIsDartNative) {
      return AuthClientNative(protocol: protocol);
    }
    if (os.isIOS || os.isMacOS) {
      return AuthClientDarwin(protocol: protocol);
    }
    if (os.isAndroid) {
      return AuthClientAndroid(protocol: protocol);
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

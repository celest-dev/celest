import 'package:celest_auth/src/platform/auth_platform.dart';
import 'package:celest_auth/src/platform/auth_platform.web.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class AuthPlatformImpl extends AuthPlatform {
  factory AuthPlatformImpl({
    required AuthProtocol protocol,
  }) {
    if (kIsWeb) {
      return AuthPlatformWeb(protocol: protocol);
    }
    throw UnsupportedError(
      'The current platform is not supported: ${os.operatingSystem}',
    );
  }

  @protected
  AuthPlatformImpl.base({
    required super.protocol,
  }) : super.base();
}

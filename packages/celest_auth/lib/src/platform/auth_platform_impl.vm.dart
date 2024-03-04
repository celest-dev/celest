import 'package:celest_auth/src/platform/auth_platform.android.dart';
import 'package:celest_auth/src/platform/auth_platform.dart';
import 'package:celest_auth/src/platform/auth_platform.darwin.dart';
import 'package:celest_auth/src/platform/auth_platform.native.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract base class AuthPlatformImpl extends AuthPlatform {
  factory AuthPlatformImpl({
    required AuthProtocol protocol,
  }) {
    if (kIsDartNative) {
      return AuthPlatformNative(protocol: protocol);
    }
    if (os.isIOS || os.isMacOS) {
      return AuthPlatformDarwin(protocol: protocol);
    }
    if (os.isAndroid) {
      return AuthPlatformAndroid(protocol: protocol);
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

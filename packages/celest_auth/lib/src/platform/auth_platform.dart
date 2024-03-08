import 'package:celest_auth/src/platform/auth_platform_impl.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/platform/auth_platform_impl.web.dart';
// ignore: implementation_imports
import 'package:celest_core/src/auth/auth_protocol.dart';
import 'package:meta/meta.dart';

abstract base class AuthPlatform {
  factory AuthPlatform({
    required AuthProtocol protocol,
  }) = AuthPlatformImpl;

  @protected
  AuthPlatform.base({
    required this.protocol,
  });

  @protected
  final AuthProtocol protocol;
}

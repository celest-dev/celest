import 'package:celest_auth/src/client/auth_client_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/client/auth_client_platform.web.dart';
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';

abstract base class AuthClient {
  factory AuthClient({
    required AuthProtocol protocol,
  }) = AuthClientPlatform;

  @protected
  AuthClient.base({
    required this.protocol,
  });

  @protected
  final AuthProtocol protocol;
}

import 'package:celest_auth/src/client/auth_client_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_auth/src/client/auth_client_platform.web.dart';
import 'package:meta/meta.dart';

abstract base class AuthClient {
  factory AuthClient() = AuthClientPlatform;

  @protected
  AuthClient.base();
}

import 'package:celest_auth/src/client/auth_client_platform.web.dart';
import 'package:path/path.dart';
import 'package:web/web.dart';

final class AuthClientWeb extends AuthClientPlatform {
  AuthClientWeb() : super.base();

  String get _baseUrl {
    final baseElement = document.querySelector('base') as HTMLBaseElement?;
    final basePath = baseElement?.href ?? '/';
    return url.join(window.location.origin, basePath);
  }

  Future<Map<String, String>> startSignIn({
    required Uri uri,
    String? callbackUrlScheme,
  }) async {
    throw UnimplementedError();
  }
}

import 'package:celest_auth/src/client/auth_platform_impl.web.dart';
import 'package:path/path.dart';
import 'package:web/web.dart';

final class AuthPlatformWeb extends AuthPlatformImpl {
  AuthPlatformWeb({
    required super.protocol,
  }) : super.base();

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

import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:celest_auth/src/client/auth_platform_impl.vm.dart';
import 'package:celest_auth/src/platform/darwin/authentication_services.ffi.dart';

final class AuthPlatformDarwin extends AuthPlatformImpl {
  AuthPlatformDarwin({
    required super.protocol,
  }) : super.base();

  final _authenticationServices =
      AuthenticationServices(DynamicLibrary.process());

  Future<Map<String, String>> startSignIn({
    required Uri uri,
    String? callbackUrlScheme,
  }) async {
    final url = NSURL.URLWithString_(
      _authenticationServices,
      uri.toString().toNSString(_authenticationServices),
    );
    if (url == null) {
      throw ArgumentError.value(uri, 'uri', 'Invalid URI');
    }
    final parameters = Completer<Map<String, String>>();
    final session = ASWebAuthenticationSession.alloc(_authenticationServices)
        .initWithURL_callbackURLScheme_completionHandler_(
      url,
      callbackUrlScheme?.toNSString(_authenticationServices),
      DartASWebAuthenticationSessionCompletionHandler.listener(
        _authenticationServices,
        (url, error) {
          if (error case final error?) {
            return parameters.completeError(error);
          }
          if (url?.absoluteString case final url?) {
            final uri = Uri.parse(url.toString());
            return parameters.complete(uri.queryParameters);
          }
          parameters.completeError(
            StateError('Invalid response from authentication session'),
          );
        },
      ),
    );

    NSObject? presentationAnchor;
    if (Platform.isMacOS) {
      final windows =
          NSApplication.getSharedApplication(_authenticationServices).windows;
      for (var i = 0; i < windows.count; i++) {
        final window = NSWindow.castFrom(windows.objectAtIndex_(i));
        presentationAnchor ??= window;
        if (window.keyWindow) {
          presentationAnchor = window;
          break;
        }
      }
    }
    session.presentationContextProvider = presentationAnchor;
    session.prefersEphemeralWebBrowserSession = false;
    if (!session.start()) {
      throw StateError('Failed to start authentication session');
    }
    return parameters.future;
  }
}

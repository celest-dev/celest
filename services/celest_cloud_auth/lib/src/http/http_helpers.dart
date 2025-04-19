import 'dart:io';

import 'package:celest_cloud_auth/src/http/cookie_cork.dart';
import 'package:celest_cloud_auth/src/model/cookie.dart';
import 'package:celest_core/_internal.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:protobuf/protobuf.dart';
import 'package:shelf/shelf.dart';

extension RequestHelpers on Request {
  static final Expando<Map<String, String>> _cookiesExpando = Expando();

  /// Returns the cookies sent with this request.
  Map<String, String> get cookies =>
      _cookiesExpando[this] ??= parseCookies(headersAll);

  /// Returns the IP address of the client who initiated this request.
  String get clientIp {
    final connectionInfo =
        context['shelf.io.connection_info'] as HttpConnectionInfo;
    return switch (headers['x-forwarded-for']?.split(',').firstOrNull?.trim()) {
      final ip? when ip.isNotEmpty => ip,
      _ => connectionInfo.remoteAddress.address,
    };
  }
}

extension ResponseHelpers on Response {
  /// Adds a `Set-Cookie` header with the given [cookie].
  Response setCookie(Cookie cookie) {
    return change(
      headers: {
        ...headers,
        HttpHeaders.setCookieHeader: [
          ...?headersAll[HttpHeaders.setCookieHeader],
          cookie.toString(),
        ],
      },
    );
  }

  /// Adds a `Set-Cookie` header with the given [cork].
  Response setCork(CedarCork cork) {
    return setCookie(Corkie.set(cork));
  }

  /// Adds a `Set-Cookie` header to clear the user's cork.
  Response clearCork() {
    return setCookie(Corkie.clear());
  }
}

extension GeneratedMessageHelpers on GeneratedMessage {
  Response jsonResponse() {
    return Response.ok(
      JsonUtf8.encode(toProto3Json()),
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}

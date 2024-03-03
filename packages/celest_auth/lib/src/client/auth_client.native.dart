import 'dart:io';

import 'package:celest_auth/src/client/auth_client_platform.vm.dart';

final class AuthClientNative extends AuthClientPlatform {
  AuthClientNative({
    required super.protocol,
  }) : super.base();

  // /// Launches the given URL.
  // Future<void> _launchUrl(String url) async {
  //   final String command;
  //   if (os.isWindows) {
  //     command = 'powershell';
  //   } else if (os.isLinux) {
  //     command = 'xdg-open';
  //   } else if (os.isMacOS) {
  //     command = 'open';
  //   } else {
  //     throw UnsupportedError('Unsupported OS: ${os.operatingSystem}');
  //   }

  //   final arguments = os.isWindows ? ['start-process', '"$url"'] : [url];
  //   final couldNotLaunch = '"$command ${arguments.join(' ')}" command failed';
  //   try {
  //     final res = await Process.run(
  //       command,
  //       arguments,
  //       stdoutEncoding: utf8,
  //       stderrEncoding: utf8,
  //     );
  //     if (res.exitCode != 0) {
  //       throw UrlLauncherException(
  //         couldNotLaunch,
  //         underlyingException: '${res.stdout}\n${res.stderr}',
  //       );
  //     }
  //   } on Exception catch (e) {
  //     throw UrlLauncherException(
  //       couldNotLaunch,
  //       underlyingException: e,
  //     );
  //   }
  // }

  // @override
  // Future<Map<String, String>> startSignIn({
  //   required Uri uri,
  //   String? callbackUrlScheme,
  // }) async {
  //   final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  //   await _launchUrl(uri.toString());
  //   await for (final request in server) {
  //     final method = request.method;
  //     if (method != 'GET') {
  //       await request.respond(
  //         HttpStatus.methodNotAllowed,
  //         'Request must be GET',
  //       );
  //       continue;
  //     }
  //     if (request.uri.path != signInRedirectUri.path) {
  //       await request.respond(HttpStatus.notFound, 'Not found');
  //       continue;
  //     }
  //     final queryParams = request.uri.queryParameters;
  //     if ((!queryParams.containsKey('code') &&
  //             !queryParams.containsKey('error')) ||
  //         !queryParams.containsKey('state')) {
  //       await request.respond(
  //         HttpStatus.badRequest,
  //         'Missing parameter',
  //       );
  //       continue;
  //     }
  //     await request.respond(
  //       HttpStatus.ok,
  //       _htmlForParams(queryParams, signIn: true),
  //       headers: {
  //         'Content-Type': 'text/html',
  //       },
  //     );
  //     return queryParams;
  //   }
  // }
}

extension on HttpRequest {
  Future<void> respond(
    int statusCode,
    String body, {
    Map<String, String>? headers,
  }) async {
    response.statusCode = statusCode;
    headers?.forEach(response.headers.add);
    response.writeln(body);
    await response.flush();
    await response.close();
  }
}

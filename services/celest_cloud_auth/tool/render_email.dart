import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cloud_auth/src/email/templates/verification_code.dart';

Future<void> main() async {
  final server = await HttpServer.bind(
    InternetAddress.anyIPv4,
    9999,
  );
  print('Listening on http://localhost:${server.port}');
  unawaited(_handleRequests(server));

  await StreamGroup.merge([
    ProcessSignal.sigint.watch(),
    ProcessSignal.sigterm.watch(),
  ]).first;
  await server.close(force: true);
}

Future<void> _handleRequests(HttpServer server) async {
  await for (final request in server) {
    print('${request.method} ${request.uri}');
    switch (request.method) {
      case 'GET':
        final url = request.uri.pathSegments.lastOrNull;
        final template = templates[url];
        if (template == null) {
          print('Not found: $url');
          request.response.statusCode = HttpStatus.notFound;
          await request.response.close();
          break;
        }
        final email = template.$1.render(template.$2);
        request.response.headers.contentType = ContentType.html;
        request.response.write(email);
        await request.response.flush();
        await request.response.close();
    }
  }
}

final templates = {
  'VerificationCode': (
    const VerificationCodeEmail(),
    const VerificationCodeEmailParams(
      email: 'test@celest.dev',
      code: '123456',
      organizationName: 'Celest',
      name: 'Test User',
      logoUrl: celestLogo,
    ),
  ),
};

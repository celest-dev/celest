import 'dart:convert';
import 'dart:io';

import 'package:celest_db_studio/celest_db_studio.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf_io.dart';
import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:test/test.dart';

void main() {
  group('CelestDbStudio', () {
    for (final basePath in const ['', '/_admin/studio']) {
      group(basePath, () {
        late HttpServer server;
        late Uri uri;
        late http.Client client;

        setUpAll(() async {
          final CelestDbStudio studio = await CelestDbStudio.create(
            databaseUri: Uri.parse('file::memory:'),
          );
          final Future<Response> Function(Request request) handler =
              basePath.isEmpty
                  ? studio.call
                  : (Router()..mount(basePath, studio.call)).call;
          server = await serve(handler, InternetAddress.loopbackIPv4, 0);
          uri = Uri.parse('http://localhost:${server.port}$basePath');
          client = http.Client();
        });

        tearDownAll(() async {
          await server.close(force: true);
          client.close();
        });

        const validUrls = ['', '/', '/index.html'];

        for (final url in validUrls) {
          test('GET $url', () async {
            final http.StreamedResponse response = await client.send(
              http.Request('GET', Uri.parse('$uri$url'))
                ..followRedirects = true,
            );
            expect(response.statusCode, 200);
            expect(response.headers['content-type'], contains('text/html'));
            expect(
              await response.stream.bytesToString(),
              contains('<title>DB Studio</title>'),
            );
          });
        }

        test('POST /query', () async {
          final http.Response response = await client.post(
            Uri.parse('$uri/query'),
            body: jsonEncode({
              'id': 1,
              'type': 'query',
              'statement': 'SELECT 1',
            }),
            headers: {'Content-Type': 'application/json'},
          );
          expect(response.statusCode, 200);
          expect(
            response.headers['content-type'],
            contains('application/json'),
          );
          expect(jsonDecode(response.body), contains('data'));
        });

        const invalidUrls = ['./invalid', './index.js'];

        for (final url in invalidUrls) {
          test('GET $url', () async {
            final http.Response response = await client.get(uri.resolve(url));
            expect(response.statusCode, 404);
            expect(response.body, contains('Route not found'));
          });
        }
      });
    }
  });
}

import 'dart:io';

import 'package:celest_db_studio/celest_db_studio.dart';
import 'package:http/http.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:test/test.dart';

void main() {
  group('CelestDbStudio', () {
    for (final basePath in const ['', '/_admin/studio/']) {
      group(basePath, () {
        late HttpServer server;
        late Uri uri;

        setUpAll(() async {
          final studio = await CelestDbStudio.create(
            databaseUri: Uri.parse('file::memory:'),
          );
          final handler =
              basePath.isEmpty
                  ? studio.call
                  : (Router()..mount(basePath, studio.call)).call;
          server = await serve(handler, InternetAddress.loopbackIPv4, 0);
          uri = Uri.parse('http://localhost:${server.port}$basePath');
        });

        tearDownAll(() async {
          await server.close(force: true);
        });

        const validUrls = ['', './', './index.html'];

        for (final url in validUrls) {
          test('GET $url', () async {
            final response = await get(uri.resolve(url));
            expect(response.statusCode, 200);
            expect(response.headers['content-type'], contains('text/html'));
            expect(response.body, contains('<title>DB Studio</title>'));
          });
        }

        const invalidUrls = [
          '/invalid',
          '/index.js',
          './invalid',
          './index.js',
        ];

        for (final url in invalidUrls) {
          test('GET $url', () async {
            final response = await get(uri.resolve(url));
            expect(response.statusCode, 404);
            expect(response.body, contains('Route not found'));
          });
        }
      });
    }
  });
}

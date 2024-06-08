import 'dart:convert';

import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

class Celest extends CelestBase {
  Celest({
    required Client httpClient,
  }) {
    this.httpClient = CelestHttpClient(
      secureStorage: nativeStorage,
      baseClient: httpClient,
    );
  }

  @override
  Uri get baseUri => Uri.parse('');

  @override
  late final Client httpClient;

  @override
  final NativeMemoryStorage nativeStorage = NativeMemoryStorage();
}

final unauthorized = Response(
  jsonEncode({
    'error': {
      'code': 'UnauthorizedException',
      'details': {'message': 'Unauthorized'},
    },
  }),
  401,
);
final ok = Response('{}', 200);

final class MockAuth extends BaseClient {
  MockAuth({
    this.signOut = _default,
    this.userInfo = _default,
  });

  static Future<Response> _default(Request request) async => Response('', 404);

  final MockClientHandler signOut;
  final MockClientHandler userInfo;

  @override
  Future<StreamedResponse> send(BaseRequest baseRequest) async {
    final bodyBytes = await baseRequest.finalize().toBytes();
    var request = Request(baseRequest.method, baseRequest.url)
      ..persistentConnection = baseRequest.persistentConnection
      ..followRedirects = baseRequest.followRedirects
      ..maxRedirects = baseRequest.maxRedirects
      ..headers.addAll(baseRequest.headers)
      ..bodyBytes = bodyBytes
      ..finalize();
    final handler = switch (request.url.path) {
      '/_auth/sign-out' => signOut,
      '/_auth/userinfo' => userInfo,
      _ => _default,
    };
    final response = await handler(request);
    return StreamedResponse(
      ByteStream.fromBytes(response.bodyBytes),
      response.statusCode,
      contentLength: response.contentLength,
      request: response.request,
      headers: response.headers,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
    );
  }
}

void main() {
  group('AuthImpl', () {
    tearDown(() {
      NativeStorage.instances.clear();
    });

    group('init', () {
      test('no session', () async {
        final celest = Celest(
          httpClient: MockAuth(
            userInfo: expectAsync1((request) async {
              expect(request.headers, isNot(contains('authorization')));
              return unauthorized;
            }),
            signOut: expectAsync1((request) async {
              expect(request.headers, isNot(contains('authorization')));
              return ok;
            }),
          ),
        );
        final auth = AuthImpl(celest);
        addTearDown(auth.close);

        final state = await auth.init();
        expect(state, isA<Unauthenticated>());
      });

      test('invalid session', () async {
        final celest = Celest(
          httpClient: MockAuth(
            userInfo: expectAsync1((request) async {
              expect(
                request.headers,
                containsPair('authorization', 'Bearer invalid'),
              );
              return unauthorized;
            }),
            signOut: expectAsync1((request) async {
              expect(request.headers, isNot(contains('authorization')));
              return ok;
            }),
          ),
        );
        final auth = AuthImpl(celest);
        addTearDown(auth.close);

        await auth.secureStorage.write('cork', 'invalid');

        final state = await auth.init();
        expect(state, isA<Unauthenticated>());
      });
    });

    group('close', () {
      test('without init', () {
        final celest = Celest(
          httpClient: MockAuth(),
        );
        final auth = AuthImpl(celest);
        expect(auth.close(), completes);
      });

      test('called multiple times', () async {
        final celest = Celest(
          httpClient: MockAuth(),
        );
        final auth = AuthImpl(celest);
        await expectLater(auth.close(), completes);
        await expectLater(auth.close(), completes);
      });

      test('called multiple times synchronously', () {
        final celest = Celest(
          httpClient: MockAuth(),
        );
        final auth = AuthImpl(celest);
        expect(Future.wait([auth.close(), auth.close()]), completes);
      });
    });
  });
}

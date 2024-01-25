import 'package:test/test.dart';

import '../../functions/greeting.dart';

// TODO: Fix tests
void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(await openAIRequest('Celest', openApiKey: "openAPIKey"),
          'Hello, Celest!');
    });
  });
}

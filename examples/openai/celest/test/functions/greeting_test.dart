import 'package:test/test.dart';

import '../../functions/greeting.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(await openAIRequest('Celest', openApiKey: "openAPIKey"),
          'Hello, Celest!');
    });
  });
}

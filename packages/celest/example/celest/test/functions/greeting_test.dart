import 'package:test/test.dart';

import '../../functions/greeting.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(await sayHello('Celest'), 'Hello, Celest!');
    });
  });
}

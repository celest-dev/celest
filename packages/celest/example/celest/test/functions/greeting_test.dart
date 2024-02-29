import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:celest_backend/models/person.dart';
import 'package:test/test.dart';

import '../../functions/greeting.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(await sayHello(person: Person(name: 'Celest')), 'Hello, Celest!');
    });
    test('sayHello (empty name)', () async {
      expect(
        sayHello(person: Person(name: '')),
        throwsA(isA<BadNameException>()),
      );
    });
  });
}

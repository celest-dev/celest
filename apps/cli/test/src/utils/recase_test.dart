import 'package:celest_cli/src/utils/recase.dart';
import 'package:test/test.dart';

void main() {
  group('recase', () {
    test('camel -> param', () {
      const camelCase = 'camelCase';
      const paramCase = 'camel-case';
      expect(camelCase.paramCase, paramCase);

      const camelCase2 = 'camelC';
      const paramCase2 = 'camel-c';
      expect(camelCase2.paramCase, paramCase2);
    });
  });
}

import 'package:celest_cli/src/utils/recase.dart';
import 'package:test/test.dart';

void main() {
  group('recase', () {
    group('groupIntoWords', () {
      test('handles dash case', () {
        const input = 'param-case';
        expect(input.groupIntoWords(), equals(['param', 'case']));
      });

      test('handles snake case', () {
        const input = 'snake_case';
        expect(input.groupIntoWords(), equals(['snake', 'case']));
      });

      test('splits camel case', () {
        const input = 'helloWorld';
        expect(input.groupIntoWords(), equals(['hello', 'World']));
      });

      test('splits acronyms from words', () {
        const input = 'ACMSuccess';
        expect(input.groupIntoWords(), equals(['ACM', 'Success']));
      });

      test('splits numbers in the middle', () {
        const input = 's3ec2';
        expect(input.groupIntoWords(), equals(['s3', 'ec2']));
      });

      test('separates standalone v before a number', () {
        const upper = 'TestV4';
        const lower = 'TESTv4';
        expect(upper.groupIntoWords(), equals(['Test', 'V4']));
        expect(lower.groupIntoWords(), equals(['TEST', 'v4']));
      });

      test('strips apostrophes', () {
        const input = "dillon's project";
        expect(input.groupIntoWords(), equals(['dillons', 'project']));
      });
    });

    group('capitalized', () {
      test('capitalizes first character', () {
        const input = 'celest';
        expect(input.capitalized, 'Celest');
      });

      test('returns upper case for single letter', () {
        const input = 'c';
        expect(input.capitalized, 'C');
      });
    });

    group('case conversions', () {
      test('camel -> param', () {
        const input = 'camelCase';
        expect(input.paramCase, 'camel-case');
      });

      test('dash -> camel', () {
        const input = 'param-case';
        expect(input.camelCase, 'paramCase');
      });

      test('snake -> pascal', () {
        const input = 'snake_case';
        expect(input.pascalCase, 'SnakeCase');
      });

      test('words -> screaming', () {
        const input = 'param case';
        expect(input.screamingCase, 'PARAM_CASE');
      });

      test('acronym + word -> param', () {
        const input = 'ACMSuccess';
        expect(input.paramCase, 'acm-success');
      });

      test('standalone v before number -> param', () {
        const input = 'TestV4';
        expect(input.paramCase, 'test-v4');
      });

      test('acronym -> camel', () {
        const input = 'SCREAMING_CASE';
        expect(input.camelCase, 'screamingCase');
      });

      test('mixed separators -> snake', () {
        const input = 'MixedValue-test case';
        expect(input.snakeCase, 'mixed_value_test_case');
      });
    });
  });
}

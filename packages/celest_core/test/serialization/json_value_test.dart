// Ignore const so we can test equality.
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:celest_core/src/serialization/json_value.dart';
import 'package:test/test.dart';

void main() {
  group('JsonValue', () {
    test('primitives', () {
      expect(
        JsonValue('abc'),
        isA<JsonString>().having((j) => j.value, 'value', 'abc'),
      );
      expect(
        JsonValue(123),
        isA<JsonInt>().having((j) => j.value, 'value', 123),
      );
      expect(
        JsonValue(123.456),
        isA<JsonDouble>().having((j) => j.value, 'value', 123.456),
      );
      expect(
        JsonValue(true),
        isA<JsonBool>().having((j) => j.value, 'value', true),
      );
      expect(
        JsonValue([1, 2, 3]),
        isA<JsonList>().having(
          (j) => j.value,
          'value',
          [1, 2, 3],
        ),
      );
      expect(
        JsonValue({'a': 1, 'b': 2, 'c': 3}),
        isA<JsonMap>().having(
          (j) => j.value,
          'value',
          {'a': 1, 'b': 2, 'c': 3},
        ),
      );
      expect(
        () => JsonValue(RegExp('unsupported')),
        throwsA(isA<FormatException>()),
      );
    });

    test('JsonList', () {
      expect(
        JsonValue([1, 2, 3]),
        orderedEquals([
          JsonInt(1),
          JsonInt(2),
          JsonInt(3),
        ]),
      );
      expect(
        JsonValue([
          'a',
          1,
          1.23,
          true,
          null,
        ]),
        orderedEquals([
          JsonString('a'),
          JsonInt(1),
          JsonDouble(1.23),
          JsonBool(true),
          null,
        ]),
      );
    });

    test('JsonMap', () {
      expect(
        JsonValue({'a': 1, 'b': 2, 'c': 3}),
        equals({
          'a': JsonInt(1),
          'b': JsonInt(2),
          'c': JsonInt(3),
        }),
      );
      final allTypes = {
        'a': 'a',
        'b': 1,
        'c': 1.23,
        'd': true,
        'e': null,
        'f': [1, 2, 3],
        'g': {'a': 1},
      };
      final allTypesJson = JsonValue(allTypes) as JsonMap;
      expect(
        allTypesJson,
        equals({
          'a': JsonString('a'),
          'b': JsonInt(1),
          'c': JsonDouble(1.23),
          'd': JsonBool(true),
          'e': null,
          'f': JsonList([1, 2, 3]),
          'g': JsonMap({
            'a': 1,
          }),
        }),
      );

      expect(
        allTypesJson.optionalString('a'),
        isA<JsonString>().having((j) => j.value, 'value', 'a'),
      );
      expect(
        allTypesJson.optionalInt('b'),
        isA<JsonInt>().having((j) => j.value, 'value', 1),
      );
      expect(
        allTypesJson.optionalDouble('c'),
        isA<JsonDouble>().having((j) => j.value, 'value', 1.23),
      );
      expect(
        allTypesJson.optionalBool('d'),
        isA<JsonBool>().having((j) => j.value, 'value', true),
      );
      expect(
        allTypesJson.optionalList('f'),
        isA<JsonList>().having(
          (j) => j.value,
          'value',
          [1, 2, 3],
        ),
      );
      expect(
        allTypesJson.optionalMap('g'),
        isA<JsonMap>().having(
          (j) => j.value,
          'value',
          {'a': 1},
        ),
      );

      expect(
        allTypesJson.requiredString('a'),
        isA<JsonString>().having((j) => j.value, 'value', 'a'),
      );
      expect(
        allTypesJson.requiredInt('b'),
        isA<JsonInt>().having((j) => j.value, 'value', 1),
      );
      expect(
        allTypesJson.requiredDouble('c'),
        isA<JsonDouble>().having((j) => j.value, 'value', 1.23),
      );
      expect(
        allTypesJson.requiredBool('d'),
        isA<JsonBool>().having((j) => j.value, 'value', true),
      );
      expect(
        allTypesJson.requiredList('f'),
        isA<JsonList>().having(
          (j) => j.value,
          'value',
          [1, 2, 3],
        ),
      );
      expect(
        allTypesJson.requiredMap('g'),
        isA<JsonMap>().having(
          (j) => j.value,
          'value',
          {'a': 1},
        ),
      );

      expect(
        () => allTypesJson.requiredString('b'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => allTypesJson.requiredInt('a'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => allTypesJson.requiredDouble('a'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => allTypesJson.requiredBool('a'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => allTypesJson.requiredList('a'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => allTypesJson.requiredMap('a'),
        throwsA(isA<FormatException>()),
      );

      final nested = {
        'aMap': {
          'aNestedMap': {
            'aNestedKey': 'abc',
          },
        },
      };
      final nestedJson = JsonMap(nested);

      expect(
        nestedJson
            .requiredMap('aMap')
            .requiredMap('aNestedMap')
            .requiredString('aNestedKey'),
        isA<JsonString>().having((j) => j.value, 'value', 'abc'),
      );
      expect(
        nestedJson
            .requiredMap('aMap')
            .optionalMap('aNestedMap')
            ?.optionalString('aNestedKey'),
        isA<JsonString>().having((j) => j.value, 'value', 'abc'),
      );
    });
  });
}

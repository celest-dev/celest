// Ignore const so we can test equality.
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:celest_core/src/serialization/json_value.dart';
import 'package:test/test.dart';

void main() {
  group('JsonValue', () {
    test('primitives', () {
      expect(
        JsonValue.from('abc'),
        isA<JsonString>().having((j) => j.wrapped, 'value', 'abc'),
      );
      expect(
        JsonValue.from(123),
        isA<JsonInt>().having((j) => j.wrapped, 'value', 123),
      );
      expect(
        JsonValue.from(123.456),
        isA<JsonDouble>().having((j) => j.wrapped, 'value', 123.456),
      );
      expect(
        JsonValue.from(true),
        isA<JsonBool>().having((j) => j.wrapped, 'value', true),
      );
      expect(
        JsonValue.from(null),
        isNull,
      );
      expect(
        JsonValue.from([1, 2, 3]),
        isA<JsonList>().having(
          (j) => j.wrapped,
          'value',
          [1, 2, 3],
        ),
      );
      expect(
        JsonValue.from({'a': 1, 'b': 2, 'c': 3}),
        isA<JsonMap>().having(
          (j) => j.wrapped,
          'value',
          {'a': 1, 'b': 2, 'c': 3},
        ),
      );
      expect(
        () => JsonValue.from(RegExp('unsupported')),
        throwsA(isA<FormatException>()),
      );
    });

    test('JsonList', () {
      expect(
        JsonValue.from([1, 2, 3]),
        orderedEquals([
          JsonInt(1),
          JsonInt(2),
          JsonInt(3),
        ]),
      );
      expect(
        JsonValue.from([
          'a',
          1,
          1.23,
          true,
          null,
          [1, 2, 3],
          {'a': 1},
        ]),
        orderedEquals([
          JsonString('a'),
          JsonInt(1),
          JsonDouble(1.23),
          JsonBool(true),
          null,
          JsonList([1, 2, 3]),
          JsonMap({
            'a': 1,
          }),
        ]),
      );
    });

    test('JsonMap', () {
      expect(
        JsonValue.from({'a': 1, 'b': 2, 'c': 3}),
        equals({
          'a': JsonInt(1),
          'b': JsonInt(2),
          'c': JsonInt(3),
        }),
      );
      final allTypes = <Object?, Object?>{
        'a': 'a',
        'b': 1,
        'c': 1.23,
        'd': true,
        'e': null,
        'f': [1, 2, 3],
        'g': {'a': 1},
      };
      final allTypesJson = JsonValue.from(allTypes) as JsonMap;
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
        allTypesJson.values,
        orderedEquals([
          JsonString('a'),
          JsonInt(1),
          JsonDouble(1.23),
          JsonBool(true),
          null,
          JsonList([1, 2, 3]),
          JsonMap({
            'a': 1,
          }),
        ]),
      );

      expect(
        allTypesJson.optionalString('a'),
        isA<JsonString>().having((j) => j.wrapped, 'value', 'a'),
      );
      expect(
        allTypesJson.optionalInt('b'),
        isA<JsonInt>().having((j) => j.wrapped, 'value', 1),
      );
      expect(
        allTypesJson.optionalDouble('c'),
        isA<JsonDouble>().having((j) => j.wrapped, 'value', 1.23),
      );
      expect(
        allTypesJson.optionalBool('d'),
        isA<JsonBool>().having((j) => j.wrapped, 'value', true),
      );
      expect(
        allTypesJson.optionalList('f'),
        isA<JsonList>().having(
          (j) => j.wrapped,
          'value',
          [1, 2, 3],
        ),
      );
      expect(
        allTypesJson.optionalMap('g'),
        isA<JsonMap>().having(
          (j) => j.wrapped,
          'value',
          {'a': 1},
        ),
      );

      expect(
        allTypesJson.requiredString('a'),
        isA<JsonString>().having((j) => j.wrapped, 'value', 'a'),
      );
      expect(
        allTypesJson.requiredInt('b'),
        isA<JsonInt>().having((j) => j.wrapped, 'value', 1),
      );
      expect(
        allTypesJson.requiredDouble('c'),
        isA<JsonDouble>().having((j) => j.wrapped, 'value', 1.23),
      );
      expect(
        allTypesJson.requiredBool('d'),
        isA<JsonBool>().having((j) => j.wrapped, 'value', true),
      );
      expect(
        allTypesJson.requiredList('f'),
        isA<JsonList>().having(
          (j) => j.wrapped,
          'value',
          [1, 2, 3],
        ),
      );
      expect(
        allTypesJson.requiredMap('g'),
        isA<JsonMap>().having(
          (j) => j.wrapped,
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
        isA<JsonString>().having((j) => j.wrapped, 'value', 'abc'),
      );
      expect(
        nestedJson
            .requiredMap('aMap')
            .optionalMap('aNestedMap')
            ?.optionalString('aNestedKey'),
        isA<JsonString>().having((j) => j.wrapped, 'value', 'abc'),
      );
      expect(
        () => nestedJson
            .requiredMap('aMap')
            .requiredMap('aNestedMap')
            .requiredString('aNonExistentKey'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('aMap.aNestedMap.aNonExistentKey'),
          ),
        ),
        reason: 'Accessing a non-existent key on a nested map should throw '
            'an exception with the path to the requested key.',
      );
    });
  });
}

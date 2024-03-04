import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cedar_common/cedar_common.dart';
import 'package:corks/corks.dart';
import 'package:test/test.dart';

final random = Random.secure();
Uint8List get secretKey {
  const size = 32;
  final key = Uint8List(size);
  for (var i = 0; i < size; i++) {
    key[i] = random.nextInt(256);
  }
  return key;
}

final secretKeys = {
  'a': secretKey,
  'b': secretKey,
  'c': secretKey,
};

extension on String {
  Uint8List get bytes => Uint8List.fromList(codeUnits);
}

void main() {
  group('Cork', () {
    group('build and verify', () {
      const keyId = 'a';
      final key = secretKeys[keyId]!;

      test('no bearer/id', () async {
        final cork = await Cork.builder(
          keyId: keyId.bytes,
        ).build(Signer(key));
        expect(await cork.verify(Signer(key)), isTrue);
        expect(await cork.verify(Signer(secretKeys['b']!)), isFalse);
      });

      test('with id', () async {
        final cork = await Cork.builder(
          id: utf8.encode(jsonEncode(const CedarEntityId('User', 'alice'))),
          keyId: keyId.bytes,
        ).build(Signer(key));
        expect(await cork.verify(Signer(key)), isTrue);
        expect(await cork.verify(Signer(secretKeys['b']!)), isFalse);
      });

      test('with bearer', () async {
        final cork = await Cork.builder(
          keyId: keyId.bytes,
          bearer: Bearer.entityId(
            entityId: const CedarEntityId('User', 'alice'),
          ),
        ).build(Signer(key));
        expect(await cork.verify(Signer(key)), isTrue);
        expect(await cork.verify(Signer(secretKeys['b']!)), isFalse);
      });

      test('with id and bearer', () async {
        final cork = await Cork.builder(
          id: utf8.encode(jsonEncode(const CedarEntityId('User', 'alice'))),
          keyId: keyId.bytes,
          bearer: Bearer.entityId(
            entityId: const CedarEntityId('User', 'alice'),
          ),
        ).build(Signer(key));
        expect(await cork.verify(Signer(key)), isTrue);
        expect(await cork.verify(Signer(secretKeys['b']!)), isFalse);
      });
    });
  });
}

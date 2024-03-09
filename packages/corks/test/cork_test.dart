import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cedar/cedar.dart';
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

extension on String {
  Uint8List get bytes => Uint8List.fromList(codeUnits);
}

void main() {
  group('Cork', () {
    group('build and verify', () {
      final aId = 'a'.bytes;
      final aKey = secretKey;
      final bId = 'b'.bytes;
      final bKey = secretKey;

      test('no bearer/id', () async {
        final cork = await Cork.builder().build(Signer(aId, aKey));
        expect(await cork.verify(Signer(aId, aKey)), isTrue);
        expect(await cork.verify(Signer(bId, bKey)), isFalse);
      });

      test('with id', () async {
        final cork = await Cork.builder(
          id: utf8.encode(jsonEncode(CedarEntityId('User', 'alice'))),
        ).build(Signer(aId, aKey));
        expect(await cork.verify(Signer(aId, aKey)), isTrue);
        expect(await cork.verify(Signer(bId, bKey)), isFalse);
      });

      test('with bearer', () async {
        final cork = await Cork.builder(
          bearer: Bearer.entityId(
            entityId: CedarEntityId('User', 'alice'),
          ),
        ).build(Signer(aId, aKey));
        expect(await cork.verify(Signer(aId, aKey)), isTrue);
        expect(await cork.verify(Signer(bId, bKey)), isFalse);
      });

      test('with id and bearer', () async {
        final cork = await Cork.builder(
          id: utf8.encode(jsonEncode(CedarEntityId('User', 'alice'))),
          bearer: Bearer.entityId(
            entityId: CedarEntityId('User', 'alice'),
          ),
        ).build(Signer(aId, aKey));
        expect(await cork.verify(Signer(aId, aKey)), isTrue);
        expect(await cork.verify(Signer(bId, bKey)), isFalse);
      });
    });
  });
}

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:corks/corks_proto.dart' as proto;
import 'package:corks/src/interop/to_proto.dart';
import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';

mixin Signable implements ToProto {
  Future<SignedBlock> sign(Signer signer) async {
    final proto = toProto();
    final typeUrl = 'dev.celest/${proto.info_.qualifiedMessageName}';
    await signer.sign(utf8.encode(typeUrl));
    final bytes = proto.writeToBuffer();
    final signature = await signer.sign(bytes);
    return SignedBlock(
      block: bytes,
      typeUrl: typeUrl,
      signature: signature,
    );
  }
}

@immutable
final class SignedBlock implements ToProto<proto.SignedBlock> {
  const SignedBlock({
    required this.block,
    required this.typeUrl,
    required this.signature,
  });

  factory SignedBlock.fromProto(proto.SignedBlock proto) => SignedBlock(
        block: Uint8List.fromList(proto.block),
        typeUrl: utf8.decode(proto.typeUrl),
        signature: Uint8List.fromList(proto.signature),
      );

  Future<bool> verify(Signer signer) async {
    await signer.sign(utf8.encode(typeUrl));
    final signature = await signer.sign(block);
    return Digest(signature) == Digest(signature);
  }

  final Uint8List block;
  final String typeUrl;
  final Uint8List signature;

  @override
  proto.SignedBlock toProto() => proto.SignedBlock(
        block: block,
        typeUrl: utf8.encode(typeUrl),
        signature: signature,
      );
}

abstract interface class Signer {
  factory Signer(Uint8List keyId, Uint8List key) = _Signer;
  const Signer._();

  Uint8List get keyId;
  Future<Uint8List> sign(Uint8List bytes);
  Future<Uint8List> close();
}

final class _Signer extends Signer {
  _Signer(this.keyId, Uint8List key)
      : hmac = Hmac(sha256, key),
        super._();

  @override
  final Uint8List keyId;

  Hmac hmac;
  late Uint8List signature;
  var closed = false;

  @override
  Future<Uint8List> sign(Uint8List bytes) async {
    if (closed) {
      throw StateError('Signer is closed');
    }
    signature = await Future(() => hmac.convert(bytes).bytes as Uint8List);
    hmac = Hmac(sha256, signature);
    return signature;
  }

  @override
  Future<Uint8List> close() async {
    closed = true;
    return signature;
  }
}

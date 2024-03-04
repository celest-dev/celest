import 'dart:async';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';

abstract interface class Signable<S extends Signed> {
  S signed(Uint8List signature);
  Uint8List encode();
}

final class SignableBytes implements Signable<SignedBytes> {
  const SignableBytes(this.bytes);

  final Uint8List bytes;

  @override
  Uint8List encode() => bytes;

  @override
  SignedBytes signed(Uint8List signature) => SignedBytes(
        block: this,
        signature: signature,
      );
}

@immutable
abstract interface class Signed {
  Signable get block;
  Uint8List get signature;
}

final class SignedBytes implements Signed {
  const SignedBytes({
    required this.block,
    required this.signature,
  });

  @override
  final SignableBytes block;

  @override
  final Uint8List signature;
}

abstract interface class Signer {
  factory Signer(Uint8List key) = _Signer;
  const Signer._();

  Future<S> sign<S extends Signed>(Signable<S> block);
  Future<Uint8List> close();
}

final class _Signer extends Signer {
  _Signer(Uint8List key)
      : _hmac = Hmac(sha256, key),
        super._();

  Hmac _hmac;
  late Uint8List _signature;
  var _closed = false;

  @override
  Future<S> sign<S extends Signed>(Signable<S> block) async {
    if (_closed) {
      throw StateError('Signer is closed');
    }
    final bytes = block.encode();
    _signature = await Future(() => _hmac.convert(bytes).bytes as Uint8List);
    _hmac = Hmac(sha256, _signature);
    return block.signed(_signature);
  }

  @override
  Future<Uint8List> close() async {
    _closed = true;
    return _signature;
  }
}

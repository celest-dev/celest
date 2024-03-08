import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cedar_common/cedar_common.dart' as cedar;
import 'package:corks/src/interop/proto_interop.dart';
import 'package:corks/src/interop/to_proto.dart';
import 'package:corks/src/proto/cedar/v3/policy.pb.dart' as proto;
import 'package:corks/src/proto/corks/v1/cork.pb.dart' as proto;
import 'package:corks/src/signer.dart';
import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';

@immutable
final class Cork {
  const Cork._({
    required this.id,
    required this.keyId,
    this.bearer,
    required List<SignedCaveat> caveats,
    required this.signature,
  }) : _caveats = caveats;

  factory Cork.parse(String base64) => Cork.decode(base64Url.decode(base64));

  factory Cork.decode(Uint8List bytes) {
    final message = proto.Cork.fromBuffer(bytes);
    return Cork.fromProto(message);
  }

  factory Cork.fromProto(proto.Cork proto) => Cork._(
        id: Uint8List.fromList(proto.id),
        keyId: Uint8List.fromList(proto.keyId),
        bearer: proto.hasBearer() ? SignedBearer.fromProto(proto.bearer) : null,
        caveats: [
          for (final caveat in proto.caveats) SignedCaveat.fromProto(caveat),
        ],
        signature: Uint8List.fromList(proto.signature),
      );

  static CorkBuilder builder({
    Uint8List? id,
    Bearer? bearer,
  }) =>
      CorkBuilder(
        id: id,
        bearer: bearer,
      );

  final Uint8List id;
  final Uint8List keyId;
  final SignedBearer? bearer;
  final List<SignedCaveat> _caveats;
  List<SignedCaveat> get caveats => UnmodifiableListView(_caveats);
  final Uint8List signature;

  proto.Cork toProto() => proto.Cork(
        id: id,
        keyId: keyId,
        bearer: bearer?.toProto(),
        caveats: _caveats.map((caveat) => caveat.toProto()),
        signature: signature,
      );

  Uint8List encode() => toProto().writeToBuffer();

  Future<bool> verify(Signer signer) async {
    if (Digest(signer.keyId) != Digest(keyId)) {
      return false;
    }

    await signer.sign(SignableBytes(id));

    if (bearer case final bearer?) {
      await signer.sign(bearer.block);
    }
    for (final caveat in _caveats) {
      await signer.sign(caveat.block);
    }
    return Digest(await signer.close()) == Digest(signature);
  }

  @override
  String toString() => base64Url.encode(encode());
}

final class CorkBuilder {
  factory CorkBuilder({
    Uint8List? id,
    Bearer? bearer,
  }) {
    if (id == null) {
      const nonceSize = 32;
      id = Uint8List(nonceSize);
      for (var i = 0; i < nonceSize; i++) {
        id[i] = _secureRandom.nextInt(256);
      }
    }
    return CorkBuilder._(id, bearer);
  }

  CorkBuilder._(
    this._id,
    this._bearer,
  );

  static final _secureRandom = Random.secure();

  final Uint8List _id;
  final Bearer? _bearer;
  final List<Caveat> _caveats = [];

  void addPolicyCaveat(cedar.CedarPolicy policy) =>
      _caveats.add(_PolicyCaveat(policy: policy.toProto()));

  Future<Cork> build(Signer signer) async {
    await signer.sign(SignableBytes(_id));

    SignedBearer? signedBearer;
    if (_bearer case final bearer?) {
      signedBearer = await signer.sign(bearer);
    }
    final signedCaveats = <SignedCaveat>[];
    for (final caveat in _caveats) {
      signedCaveats.add(await signer.sign(caveat));
    }
    return Cork._(
      id: _id,
      keyId: signer.keyId,
      bearer: signedBearer,
      caveats: signedCaveats,
      signature: await signer.close(),
    );
  }
}

@immutable
sealed class Bearer implements Signable<SignedBearer> {
  const Bearer();

  factory Bearer.entity({
    required cedar.CedarEntity entity,
  }) =>
      EntityBearer(entity: entity);

  factory Bearer.entityId({
    required cedar.CedarEntityId entityId,
  }) =>
      EntityBearer(entity: cedar.CedarEntity(id: entityId));
}

final class EntityBearer extends Bearer {
  const EntityBearer({
    required this.entity,
  });

  final cedar.CedarEntity entity;

  @override
  Uint8List encode() => entity.toProto().writeToBuffer();

  @override
  SignedBearer signed(Uint8List signature) => SignedBearer(
        block: this,
        signature: signature,
      );
}

final class SignedBearer implements Signed, ToProto<proto.Bearer> {
  const SignedBearer({
    required this.block,
    required this.signature,
  });

  factory SignedBearer.fromProto(proto.Bearer proto) => SignedBearer(
        block: EntityBearer(entity: proto.entity.fromProto()),
        signature: Uint8List.fromList(proto.signature),
      );

  @override
  final Bearer block;

  @override
  final Uint8List signature;

  @override
  proto.Bearer toProto() {
    final message = proto.Bearer(signature: signature);
    return switch (block) {
      EntityBearer(:final entity) => message..entity = entity.toProto(),
    };
  }
}

@immutable
sealed class Caveat implements Signable<SignedCaveat> {
  const Caveat();
}

final class _PolicyCaveat extends Caveat {
  const _PolicyCaveat({
    required this.policy,
  });

  final proto.Policy policy;

  @override
  SignedCaveat signed(Uint8List signature) => SignedCaveat(
        block: this,
        signature: signature,
      );

  @override
  Uint8List encode() => policy.writeToBuffer();
}

final class SignedCaveat implements Signed, ToProto<proto.Caveat> {
  const SignedCaveat({
    required this.block,
    required this.signature,
  });

  factory SignedCaveat.fromProto(proto.Caveat proto) => SignedCaveat(
        block: _PolicyCaveat(policy: proto.policy),
        signature: Uint8List.fromList(proto.signature),
      );

  @override
  final Caveat block;

  @override
  final Uint8List signature;

  @override
  proto.Caveat toProto() {
    final message = proto.Caveat(
      signature: signature,
    );
    return switch (block) {
      _PolicyCaveat(:final policy) => message..policy = policy,
    };
  }
}

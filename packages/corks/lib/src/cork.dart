import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cedar_core/cedar_core.dart' as cedar;
import 'package:corks/corks_proto.dart' as proto;
import 'package:corks/src/interop/proto_interop.dart';
import 'package:corks/src/proto/google/protobuf/any.pb.dart' as proto;
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
    await signer.sign(id);
    if (bearer != null) {
      if (!await bearer.verify(signer)) {
        return false;
      }
    }
    for (final caveat in _caveats) {
      if (!await caveat.verify(signer)) {
        return false;
      }
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

  void addPolicyCaveat(cedar.CedarPolicy policy) {
    if (policy.effect != cedar.CedarPolicyEffect.forbid) {
      throw ArgumentError('Policy must have effect "forbid"');
    }
    _caveats.add(Caveat.policy(policy: policy));
  }

  Future<Cork> build(Signer signer) async {
    await signer.sign(_id);

    SignedBearer? signedBearer;
    if (_bearer case final bearer?) {
      signedBearer = SignedBearer(await bearer.sign(signer));
    }
    final signedCaveats = <SignedCaveat>[];
    for (final caveat in _caveats) {
      signedCaveats.add(SignedCaveat(await caveat.sign(signer)));
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
sealed class Bearer with Signable {
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
  proto.Entity toProto() => entity.toProto();
}

extension type SignedBearer(SignedBlock _block) implements SignedBlock {
  SignedBearer.fromProto(proto.SignedBlock proto)
      : _block = SignedBlock.fromProto(proto);

  Bearer get bearer {
    final any = proto.Any(
      typeUrl: typeUrl,
      value: block,
    );
    final entity = proto.Entity();
    if (!any.canUnpackInto(entity)) {
      throw ArgumentError('Invalid bearer type: $typeUrl');
    }
    any.unpackInto(entity);
    return Bearer.entity(
      entity: entity.fromProto(),
    );
  }
}

@immutable
sealed class Caveat with Signable {
  const Caveat();

  factory Caveat.policy({
    required cedar.CedarPolicy policy,
  }) =>
      PolicyCaveat(policy: policy);
}

final class PolicyCaveat extends Caveat {
  const PolicyCaveat({
    required this.policy,
  });

  final cedar.CedarPolicy policy;

  @override
  proto.Policy toProto() => policy.toProto();
}

extension type SignedCaveat(SignedBlock _block) implements SignedBlock {
  SignedCaveat.fromProto(proto.SignedBlock proto)
      : _block = SignedBlock.fromProto(proto);

  Caveat get caveat {
    final any = proto.Any(
      typeUrl: typeUrl,
      value: block,
    );
    final policy = proto.Policy();
    if (!any.canUnpackInto(policy)) {
      throw ArgumentError('Invalid caveat type: $typeUrl');
    }
    any.unpackInto(policy);
    return PolicyCaveat(policy: policy.fromProto());
  }
}

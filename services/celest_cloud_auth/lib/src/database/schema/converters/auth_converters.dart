import 'package:celest_cloud_auth/src/authentication/authentication_model.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:drift/drift.dart';
import 'package:protobuf/protobuf.dart';

final typeRegistry = TypeRegistry([
  pb.AuthenticationSuccess(),
  pb.AuthenticationFactor(),
  pb.AuthenticationFactorEmailOtp(),
  pb.AuthenticationFactorSmsOtp(),
  pb.Session(),
  pb.SessionClient(),
  pb.SessionCallbacks(),
]);

final class SessionClientConverter
    implements TypeConverter<SessionClient, Uint8List> {
  const SessionClientConverter();

  @override
  SessionClient fromSql(Uint8List fromDb) {
    return SessionClient.fromProto(pb.SessionClient.fromBuffer(fromDb));
  }

  @override
  Uint8List toSql(SessionClient value) {
    return value.toProto().writeToBuffer();
  }
}

final class AuthenticationFactorConverter
    implements TypeConverter<AuthenticationFactor, Uint8List> {
  const AuthenticationFactorConverter();

  @override
  AuthenticationFactor fromSql(Uint8List fromDb) {
    return AuthenticationFactor.fromProto(
      pb.AuthenticationFactor.fromBuffer(fromDb),
    );
  }

  @override
  Uint8List toSql(AuthenticationFactor value) {
    return value.toProto().writeToBuffer();
  }
}

final class SessionStateConverter
    implements TypeConverter<SessionState, Uint8List> {
  const SessionStateConverter();

  @override
  SessionState fromSql(Uint8List fromDb) {
    final message = pb.Any.fromBuffer(fromDb);
    final nextStep = pb.AuthenticationStep();
    if (message.canUnpackInto(nextStep)) {
      return SessionStateNextStep.fromProto(message.unpackInto(nextStep));
    }
    final success = pb.AuthenticationSuccess();
    if (message.canUnpackInto(success)) {
      return SessionStateSuccess.fromProto(message.unpackInto(success));
    }
    throw ArgumentError('Invalid SessionState: ${message.typeUrl}');
  }

  @override
  Uint8List toSql(SessionState value) {
    final proto = value.toProto();
    final any = pb.Any();
    pb.AnyMixin.packIntoAny(any, proto);
    return any.writeToBuffer();
  }
}

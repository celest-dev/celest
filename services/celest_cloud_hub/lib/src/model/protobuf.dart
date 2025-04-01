import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud/src/proto/google/protobuf/duration.pb.dart' as pb;
import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

extension AnyHelper<T extends GeneratedMessage> on T {
  /// Unpacks an [Any] message into this message.
  T unpackAny(Any any) {
    if (!any.canUnpackInto(this)) {
      throw ArgumentError('Cannot unpack ${any.typeUrl} into $runtimeType');
    }
    any.unpackInto(this);
    return this;
  }

  /// Packs this message into an [Any] message.
  Any packIntoAny() => switch (this) {
    final Any any => any,
    final AnyMixin anotherAny => Any()..mergeFromMessage(anotherAny),
    _ => Any.pack(this),
  };
}

extension DurationToProto on Duration {
  pb.Duration toProto() {
    return pb.Duration()
      ..seconds = Int64(inSeconds)
      ..nanos = inMicroseconds.remainder(Duration.microsecondsPerSecond) * 1000;
  }
}

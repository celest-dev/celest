import 'package:celest_cloud/src/proto.dart';
import 'package:celest_cloud/src/proto/google/protobuf/duration.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';

extension DateTimeProto on DateTime {
  Timestamp toProto() {
    final ts = Timestamp();
    TimestampMixin.setFromDateTime(ts, this);
    return ts;
  }
}

extension DurationProto on Duration {
  pb.Duration toProto() {
    return pb.Duration()
      ..seconds = Int64(inSeconds)
      ..nanos = inMicroseconds.remainder(Duration.microsecondsPerSecond) * 1000;
  }
}

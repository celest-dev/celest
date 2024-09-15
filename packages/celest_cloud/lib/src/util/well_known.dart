import 'package:celest_cloud/src/proto.dart';
import 'package:celest_cloud/src/proto/google/protobuf/timestamp.pb.dart';

extension DateTimeProto on DateTime {
  Timestamp toProto() {
    final ts = Timestamp();
    TimestampMixin.setFromDateTime(ts, this);
    return ts;
  }
}

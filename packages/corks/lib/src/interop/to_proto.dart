import 'package:protobuf/protobuf.dart' as proto;

abstract interface class ToProto<M extends proto.GeneratedMessage> {
  M toProto();
}

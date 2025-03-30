import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud/src/proto/google/protobuf/duration.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/empty.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/field_mask.pb.dart'
    as pb;
import 'package:celest_cloud/src/proto/google/protobuf/struct.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/timestamp.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/wrappers.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/rpc/status.pb.dart' as pb;
import 'package:protobuf/protobuf.dart';

final TypeRegistry typeRegistry = TypeRegistry([
  // Cloud
  OperationMetadata(),
  ProjectEnvironment(),

  // RPC
  pb.Status(),

  // Well-known types
  pb.BoolValue(),
  pb.StringValue(),
  pb.Int32Value(),
  pb.Int64Value(),
  pb.FloatValue(),
  pb.DoubleValue(),
  pb.Timestamp(),
  pb.BytesValue(),
  pb.Duration(),
  pb.FieldMask(),
  pb.Empty(),
  pb.Struct(),
  pb.ListValue(),
  pb.Value(),
]);

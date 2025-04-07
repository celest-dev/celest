//
//  Generated code. Do not modify.
//  source: grpc/health/v1/health.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class HealthCheckResponse_ServingStatus extends $pb.ProtobufEnum {
  static const HealthCheckResponse_ServingStatus UNKNOWN = HealthCheckResponse_ServingStatus._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const HealthCheckResponse_ServingStatus SERVING = HealthCheckResponse_ServingStatus._(1, _omitEnumNames ? '' : 'SERVING');
  static const HealthCheckResponse_ServingStatus NOT_SERVING = HealthCheckResponse_ServingStatus._(2, _omitEnumNames ? '' : 'NOT_SERVING');
  static const HealthCheckResponse_ServingStatus SERVICE_UNKNOWN = HealthCheckResponse_ServingStatus._(3, _omitEnumNames ? '' : 'SERVICE_UNKNOWN');

  static const $core.List<HealthCheckResponse_ServingStatus> values = <HealthCheckResponse_ServingStatus> [
    UNKNOWN,
    SERVING,
    NOT_SERVING,
    SERVICE_UNKNOWN,
  ];

  static final $core.Map<$core.int, HealthCheckResponse_ServingStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HealthCheckResponse_ServingStatus? valueOf($core.int value) => _byValue[value];

  const HealthCheckResponse_ServingStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

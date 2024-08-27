//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/operations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use operationStateDescriptor instead')
const OperationState$json = {
  '1': 'OperationState',
  '2': [
    {'1': 'OPERATION_STATE_UNSPECIFIED', '2': 0},
    {'1': 'PENDING', '2': 1},
    {'1': 'RUNNING', '2': 2},
    {'1': 'SUCCEEDED', '2': 3},
    {'1': 'FAILED', '2': 4},
    {'1': 'CANCELLED', '2': 5},
  ],
};

/// Descriptor for `OperationState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List operationStateDescriptor = $convert.base64Decode(
    'Cg5PcGVyYXRpb25TdGF0ZRIfChtPUEVSQVRJT05fU1RBVEVfVU5TUEVDSUZJRUQQABILCgdQRU'
    '5ESU5HEAESCwoHUlVOTklORxACEg0KCVNVQ0NFRURFRBADEgoKBkZBSUxFRBAEEg0KCUNBTkNF'
    'TExFRBAF');

@$core.Deprecated('Use operationMetadataDescriptor instead')
const OperationMetadata$json = {
  '1': 'OperationMetadata',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'type'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'parent', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'trigger', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'trigger'},
    {'1': 'request_id', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'requestId'},
    {
      '1': 'create_time',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'createTime'
    },
    {
      '1': 'start_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'startTime'
    },
    {
      '1': 'end_time',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'endTime'
    },
    {
      '1': 'progress',
      '3': 9,
      '4': 1,
      '5': 5,
      '8': {},
      '9': 0,
      '10': 'progress',
      '17': true
    },
  ],
  '8': [
    {'1': '_progress'},
  ],
};

/// Descriptor for `OperationMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operationMetadataDescriptor = $convert.base64Decode(
    'ChFPcGVyYXRpb25NZXRhZGF0YRIaCgR0eXBlGAEgASgJQgbgQQLgQQNSBHR5cGUSGgoEbmFtZR'
    'gCIAEoCUIG4EEC4EEDUgRuYW1lEh4KBnBhcmVudBgDIAEoCUIG4EEB4EEDUgZwYXJlbnQSIAoH'
    'dHJpZ2dlchgEIAEoCUIG4EEB4EEDUgd0cmlnZ2VyEi0KCnJlcXVlc3RfaWQYBSABKAlCDuBBAe'
    'BBA+KMz9cIAggBUglyZXF1ZXN0SWQSQwoLY3JlYXRlX3RpbWUYBiABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wQgbgQQLgQQNSCmNyZWF0ZVRpbWUSQQoKc3RhcnRfdGltZRgHIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCBuBBAeBBA1IJc3RhcnRUaW1lEj0KCGVuZF90'
    'aW1lGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIG4EEB4EEDUgdlbmRUaW1lEi'
    'cKCHByb2dyZXNzGAkgASgFQgbgQQHgQQNIAFIIcHJvZ3Jlc3OIAQFCCwoJX3Byb2dyZXNz');

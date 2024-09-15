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
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'resource',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '8': {},
      '10': 'resource'
    },
    {
      '1': 'state',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.OperationState',
      '8': {},
      '10': 'state'
    },
    {'1': 'request_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'requestId'},
    {
      '1': 'create_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'createTime'
    },
    {
      '1': 'start_time',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'startTime'
    },
    {
      '1': 'end_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'endTime'
    },
    {
      '1': 'progress',
      '3': 8,
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
    'ChFPcGVyYXRpb25NZXRhZGF0YRIeCgZwYXJlbnQYASABKAlCBuBBAuBBA1IGcGFyZW50EjgKCH'
    'Jlc291cmNlGAIgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUIG4EEB4EEDUghyZXNvdXJjZRJD'
    'CgVzdGF0ZRgDIAEoDjIlLmNlbGVzdC5jbG91ZC52MWFscGhhMS5PcGVyYXRpb25TdGF0ZUIG4E'
    'EC4EEDUgVzdGF0ZRItCgpyZXF1ZXN0X2lkGAQgASgJQg7gQQHgQQPijM/XCAIIAVIJcmVxdWVz'
    'dElkEkMKC2NyZWF0ZV90aW1lGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIG4E'
    'EC4EEDUgpjcmVhdGVUaW1lEkEKCnN0YXJ0X3RpbWUYBiABKAsyGi5nb29nbGUucHJvdG9idWYu'
    'VGltZXN0YW1wQgbgQQHgQQNSCXN0YXJ0VGltZRI9CghlbmRfdGltZRgHIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBCBuBBAeBBA1IHZW5kVGltZRIwCghwcm9ncmVzcxgIIAEoBUIP'
    '4EEB4EEDukgGGgQYZCgASABSCHByb2dyZXNziAEBQgsKCV9wcm9ncmVzcw==');

// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use regionDescriptor instead')
const Region$json = {
  '1': 'Region',
  '2': [
    {'1': 'REGION_UNSPECIFIED', '2': 0},
    {'1': 'NORTH_AMERICA', '2': 1},
    {'1': 'EUROPE', '2': 2},
    {'1': 'ASIA_PACIFIC', '2': 3},
  ],
};

/// Descriptor for `Region`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List regionDescriptor = $convert.base64Decode(
    'CgZSZWdpb24SFgoSUkVHSU9OX1VOU1BFQ0lGSUVEEAASEQoNTk9SVEhfQU1FUklDQRABEgoKBk'
    'VVUk9QRRACEhAKDEFTSUFfUEFDSUZJQxAD');

@$core.Deprecated('Use lifecycleStateDescriptor instead')
const LifecycleState$json = {
  '1': 'LifecycleState',
  '2': [
    {'1': 'LIFECYCLE_STATE_UNSPECIFIED', '2': 0},
    {'1': 'CREATING', '2': 1},
    {'1': 'CREATION_FAILED', '2': 2},
    {'1': 'ACTIVE', '2': 3},
    {'1': 'UPDATING', '2': 4},
    {'1': 'UPDATE_FAILED', '2': 5},
    {'1': 'DELETING', '2': 6},
    {'1': 'DELETION_FAILED', '2': 7},
    {'1': 'DELETED', '2': 8},
  ],
};

/// Descriptor for `LifecycleState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List lifecycleStateDescriptor = $convert.base64Decode(
    'Cg5MaWZlY3ljbGVTdGF0ZRIfChtMSUZFQ1lDTEVfU1RBVEVfVU5TUEVDSUZJRUQQABIMCghDUk'
    'VBVElORxABEhMKD0NSRUFUSU9OX0ZBSUxFRBACEgoKBkFDVElWRRADEgwKCFVQREFUSU5HEAQS'
    'EQoNVVBEQVRFX0ZBSUxFRBAFEgwKCERFTEVUSU5HEAYSEwoPREVMRVRJT05fRkFJTEVEEAcSCw'
    'oHREVMRVRFRBAI');

@$core.Deprecated('Use pageTokenDescriptor instead')
const PageToken$json = {
  '1': 'PageToken',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    {
      '1': 'start_time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startTime'
    },
    {'1': 'show_deleted', '3': 3, '4': 1, '5': 8, '10': 'showDeleted'},
  ],
  '7': {},
};

/// Descriptor for `PageToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageTokenDescriptor = $convert.base64Decode(
    'CglQYWdlVG9rZW4SFgoGb2Zmc2V0GAEgASgDUgZvZmZzZXQSOQoKc3RhcnRfdGltZRgCIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0YXJ0VGltZRIhCgxzaG93X2RlbGV0ZWQY'
    'AyABKAhSC3Nob3dEZWxldGVkOhD60uSTAgoSCElOVEVSTkFM');

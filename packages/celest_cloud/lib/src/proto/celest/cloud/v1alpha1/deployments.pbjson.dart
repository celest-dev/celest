//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/deployments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deploymentDescriptor instead')
const Deployment$json = {
  '1': 'Deployment',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'uid'},
    {'1': 'parent', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'deployment_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'deploymentId'
    },
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
      '1': 'update_time',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'updateTime'
    },
    {
      '1': 'resolved_ast',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedProject',
      '8': {},
      '10': 'resolvedAst'
    },
  ],
  '4': [Deployment_State$json],
  '7': {},
};

@$core.Deprecated('Use deploymentDescriptor instead')
const Deployment_State$json = {
  '1': 'State',
  '2': [
    {'1': 'STATE_UNSPECIFIED', '2': 0},
    {'1': 'PENDING', '2': 1},
    {'1': 'RUNNING', '2': 2},
    {'1': 'SUCCEEDED', '2': 3},
    {'1': 'FAILED', '2': 4},
    {'1': 'CANCELLED', '2': 5},
    {'1': 'DELETED', '2': 6},
  ],
};

/// Descriptor for `Deployment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deploymentDescriptor = $convert.base64Decode(
    'CgpEZXBsb3ltZW50EhcKBG5hbWUYASABKAlCA+BBCFIEbmFtZRIdCgN1aWQYAiABKAlCC+BBA+'
    'KMz9cIAggBUgN1aWQSPAoGcGFyZW50GAMgASgJQiTgQQL6QR4KHGNsb3VkLmNlbGVzdC5kZXYv'
    'RW52aXJvbm1lbnRSBnBhcmVudBIrCg1kZXBsb3ltZW50X2lkGAQgASgJQgbgQQXgQQNSDGRlcG'
    'xveW1lbnRJZBJACgtjcmVhdGVfdGltZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
    'bXBCA+BBA1IKY3JlYXRlVGltZRJACgt1cGRhdGVfdGltZRgGIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBCA+BBA1IKdXBkYXRlVGltZRJJCgxyZXNvbHZlZF9hc3QYDiABKAsyHi5j'
    'ZWxlc3QuYXN0LnYxLlJlc29sdmVkUHJvamVjdEIG4EEC4EEEUgtyZXNvbHZlZEFzdCJvCgVTdG'
    'F0ZRIVChFTVEFURV9VTlNQRUNJRklFRBAAEgsKB1BFTkRJTkcQARILCgdSVU5OSU5HEAISDQoJ'
    'U1VDQ0VFREVEEAMSCgoGRkFJTEVEEAQSDQoJQ0FOQ0VMTEVEEAUSCwoHREVMRVRFRBAGOoEB6k'
    'F+ChtjbG91ZC5jZWxlc3QuZGV2L0RlcGxveW1lbnQSRnByb2plY3RzL3twcm9qZWN0fS9lbnZp'
    'cm9ubWVudHMve2Vudmlyb25tZW50fS9kZXBsb3ltZW50cy97ZGVwbG95bWVudH0qC2RlcGxveW'
    '1lbnRzMgpkZXBsb3ltZW50');

@$core.Deprecated('Use createDeploymentRequestDescriptor instead')
const CreateDeploymentRequest$json = {
  '1': 'CreateDeploymentRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'deployment',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Deployment',
      '8': {},
      '10': 'deployment'
    },
  ],
};

/// Descriptor for `CreateDeploymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDeploymentRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVEZXBsb3ltZW50UmVxdWVzdBI7CgZwYXJlbnQYASABKAlCI+BBAvpBHRIbY2xvdW'
    'QuY2VsZXN0LmRldi9EZXBsb3ltZW50UgZwYXJlbnQSRgoKZGVwbG95bWVudBgCIAEoCzIhLmNl'
    'bGVzdC5jbG91ZC52MWFscGhhMS5EZXBsb3ltZW50QgPgQQJSCmRlcGxveW1lbnQ=');

@$core.Deprecated('Use getDeploymentRequestDescriptor instead')
const GetDeploymentRequest$json = {
  '1': 'GetDeploymentRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetDeploymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeploymentRequestDescriptor = $convert.base64Decode(
    'ChRHZXREZXBsb3ltZW50UmVxdWVzdBI3CgRuYW1lGAEgASgJQiPgQQL6QR0KG2Nsb3VkLmNlbG'
    'VzdC5kZXYvRGVwbG95bWVudFIEbmFtZQ==');

@$core.Deprecated('Use listDeploymentsRequestDescriptor instead')
const ListDeploymentsRequest$json = {
  '1': 'ListDeploymentsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListDeploymentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeploymentsRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0RGVwbG95bWVudHNSZXF1ZXN0EjsKBnBhcmVudBgBIAEoCUIj4EEC+kEdEhtjbG91ZC'
    '5jZWxlc3QuZGV2L0RlcGxveW1lbnRSBnBhcmVudBIgCglwYWdlX3NpemUYAiABKAVCA+BBAVII'
    'cGFnZVNpemUSIgoKcGFnZV90b2tlbhgDIAEoCUID4EEBUglwYWdlVG9rZW4=');

@$core.Deprecated('Use listDeploymentsResponseDescriptor instead')
const ListDeploymentsResponse$json = {
  '1': 'ListDeploymentsResponse',
  '2': [
    {
      '1': 'deployments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Deployment',
      '10': 'deployments'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListDeploymentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeploymentsResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0RGVwbG95bWVudHNSZXNwb25zZRJDCgtkZXBsb3ltZW50cxgBIAMoCzIhLmNlbGVzdC'
    '5jbG91ZC52MWFscGhhMS5EZXBsb3ltZW50UgtkZXBsb3ltZW50cxImCg9uZXh0X3BhZ2VfdG9r'
    'ZW4YAiABKAlSDW5leHRQYWdlVG9rZW4=');

@$core.Deprecated('Use deleteDeploymentRequestDescriptor instead')
const DeleteDeploymentRequest$json = {
  '1': 'DeleteDeploymentRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `DeleteDeploymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeploymentRequestDescriptor =
    $convert.base64Decode(
        'ChdEZWxldGVEZXBsb3ltZW50UmVxdWVzdBI3CgRuYW1lGAEgASgJQiPgQQL6QR0KG2Nsb3VkLm'
        'NlbGVzdC5kZXYvRGVwbG95bWVudFIEbmFtZQ==');

@$core.Deprecated('Use watchDeploymentRequestDescriptor instead')
const WatchDeploymentRequest$json = {
  '1': 'WatchDeploymentRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `WatchDeploymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchDeploymentRequestDescriptor =
    $convert.base64Decode(
        'ChZXYXRjaERlcGxveW1lbnRSZXF1ZXN0EjcKBG5hbWUYASABKAlCI+BBAvpBHQobY2xvdWQuY2'
        'VsZXN0LmRldi9EZXBsb3ltZW50UgRuYW1l');

@$core.Deprecated('Use watchDeploymentResponseDescriptor instead')
const WatchDeploymentResponse$json = {
  '1': 'WatchDeploymentResponse',
  '2': [
    {
      '1': 'metadata',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.DeploymentOperationMetadata',
      '8': {},
      '10': 'metadata'
    },
    {
      '1': 'logs',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.google.logging.v2.LogEntry',
      '8': {},
      '10': 'logs'
    },
  ],
};

/// Descriptor for `WatchDeploymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchDeploymentResponseDescriptor = $convert.base64Decode(
    'ChdXYXRjaERlcGxveW1lbnRSZXNwb25zZRJTCghtZXRhZGF0YRgBIAEoCzIyLmNlbGVzdC5jbG'
    '91ZC52MWFscGhhMS5EZXBsb3ltZW50T3BlcmF0aW9uTWV0YWRhdGFCA+BBA1IIbWV0YWRhdGES'
    'NAoEbG9ncxgCIAMoCzIbLmdvb2dsZS5sb2dnaW5nLnYyLkxvZ0VudHJ5QgPgQQNSBGxvZ3M=');

@$core.Deprecated('Use deploymentOperationMetadataDescriptor instead')
const DeploymentOperationMetadata$json = {
  '1': 'DeploymentOperationMetadata',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'state',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.Deployment.State',
      '8': {},
      '10': 'state'
    },
    {
      '1': 'create_time',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'createTime'
    },
    {
      '1': 'end_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'endTime'
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.rpc.Status',
      '8': {},
      '10': 'status'
    },
  ],
};

/// Descriptor for `DeploymentOperationMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deploymentOperationMetadataDescriptor = $convert.base64Decode(
    'ChtEZXBsb3ltZW50T3BlcmF0aW9uTWV0YWRhdGESGwoGcGFyZW50GAEgASgJQgPgQQNSBnBhcm'
    'VudBJCCgVzdGF0ZRgCIAEoDjInLmNlbGVzdC5jbG91ZC52MWFscGhhMS5EZXBsb3ltZW50LlN0'
    'YXRlQgPgQQNSBXN0YXRlEkAKC2NyZWF0ZV90aW1lGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcEID4EEDUgpjcmVhdGVUaW1lEjoKCGVuZF90aW1lGAQgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcEID4EEDUgdlbmRUaW1lEi8KBnN0YXR1cxgFIAEoCzISLmdvb2dsZS'
    '5ycGMuU3RhdHVzQgPgQQNSBnN0YXR1cw==');

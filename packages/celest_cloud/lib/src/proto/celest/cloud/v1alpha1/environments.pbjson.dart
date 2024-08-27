//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/environments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use environmentDescriptor instead')
const Environment$json = {
  '1': 'Environment',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'uid'},
    {'1': 'parent', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'environment_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'environmentId'
    },
    {'1': 'display_name', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'displayName'},
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
      '1': 'update_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'updateTime'
    },
    {
      '1': 'delete_time',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'deleteTime'
    },
    {'1': 'etag', '3': 9, '4': 1, '5': 9, '8': {}, '10': 'etag'},
    {
      '1': 'annotations',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Environment.AnnotationsEntry',
      '8': {},
      '10': 'annotations'
    },
    {'1': 'reconciling', '3': 11, '4': 1, '5': 8, '8': {}, '10': 'reconciling'},
  ],
  '3': [Environment_AnnotationsEntry$json],
  '7': {},
};

@$core.Deprecated('Use environmentDescriptor instead')
const Environment_AnnotationsEntry$json = {
  '1': 'AnnotationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Environment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List environmentDescriptor = $convert.base64Decode(
    'CgtFbnZpcm9ubWVudBIXCgRuYW1lGAEgASgJQgPgQQhSBG5hbWUSHQoDdWlkGAIgASgJQgvgQQ'
    'PijM/XCAIIAVIDdWlkEjgKBnBhcmVudBgDIAEoCUIg4EEC+kEaChhjbG91ZC5jZWxlc3QuZGV2'
    'L1Byb2plY3RSBnBhcmVudBItCg5lbnZpcm9ubWVudF9pZBgEIAEoCUIG4EEF4EEDUg1lbnZpcm'
    '9ubWVudElkEiYKDGRpc3BsYXlfbmFtZRgFIAEoCUID4EEBUgtkaXNwbGF5TmFtZRJACgtjcmVh'
    'dGVfdGltZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCA+BBA1IKY3JlYXRlVG'
    'ltZRJACgt1cGRhdGVfdGltZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCA+BB'
    'A1IKdXBkYXRlVGltZRJACgtkZWxldGVfdGltZRgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW'
    '1lc3RhbXBCA+BBA1IKZGVsZXRlVGltZRIXCgRldGFnGAkgASgJQgPgQQNSBGV0YWcSWgoLYW5u'
    'b3RhdGlvbnMYCiADKAsyMy5jZWxlc3QuY2xvdWQudjFhbHBoYTEuRW52aXJvbm1lbnQuQW5ub3'
    'RhdGlvbnNFbnRyeUID4EEBUgthbm5vdGF0aW9ucxIlCgtyZWNvbmNpbGluZxgLIAEoCEID4EED'
    'UgtyZWNvbmNpbGluZxo+ChBBbm5vdGF0aW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBX'
    'ZhbHVlGAIgASgJUgV2YWx1ZToCOAE6bupBawocY2xvdWQuY2VsZXN0LmRldi9FbnZpcm9ubWVu'
    'dBItcHJvamVjdHMve3Byb2plY3R9L2Vudmlyb25tZW50cy97ZW52aXJvbm1lbnR9KgxlbnZpcm'
    '9ubWVudHMyC2Vudmlyb25tZW50UgEB');

@$core.Deprecated('Use createEnvironmentRequestDescriptor instead')
const CreateEnvironmentRequest$json = {
  '1': 'CreateEnvironmentRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'environment',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Environment',
      '8': {},
      '10': 'environment'
    },
    {
      '1': 'environment_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'environmentId'
    },
    {'1': 'request_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'requestId'},
    {
      '1': 'validate_only',
      '3': 5,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
  ],
};

/// Descriptor for `CreateEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEnvironmentRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVFbnZpcm9ubWVudFJlcXVlc3QSOAoGcGFyZW50GAEgASgJQiDgQQL6QRoKGGNsb3'
    'VkLmNlbGVzdC5kZXYvUHJvamVjdFIGcGFyZW50EkkKC2Vudmlyb25tZW50GAIgASgLMiIuY2Vs'
    'ZXN0LmNsb3VkLnYxYWxwaGExLkVudmlyb25tZW50QgPgQQJSC2Vudmlyb25tZW50EioKDmVudm'
    'lyb25tZW50X2lkGAMgASgJQgPgQQJSDWVudmlyb25tZW50SWQSKgoKcmVxdWVzdF9pZBgEIAEo'
    'CUIL4EEB4ozP1wgCCAFSCXJlcXVlc3RJZBIoCg12YWxpZGF0ZV9vbmx5GAUgASgIQgPgQQFSDH'
    'ZhbGlkYXRlT25seQ==');

@$core.Deprecated('Use createEnvironmentMetadataDescriptor instead')
const CreateEnvironmentMetadata$json = {
  '1': 'CreateEnvironmentMetadata',
  '2': [
    {'1': 'environment', '3': 1, '4': 1, '5': 9, '10': 'environment'},
    {
      '1': 'create_time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createTime'
    },
    {
      '1': 'end_time',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endTime'
    },
  ],
};

/// Descriptor for `CreateEnvironmentMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEnvironmentMetadataDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVFbnZpcm9ubWVudE1ldGFkYXRhEiAKC2Vudmlyb25tZW50GAEgASgJUgtlbnZpcm'
    '9ubWVudBI7CgtjcmVhdGVfdGltZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBS'
    'CmNyZWF0ZVRpbWUSNQoIZW5kX3RpbWUYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW'
    '1wUgdlbmRUaW1l');

@$core.Deprecated('Use getEnvironmentRequestDescriptor instead')
const GetEnvironmentRequest$json = {
  '1': 'GetEnvironmentRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEnvironmentRequestDescriptor = $convert.base64Decode(
    'ChVHZXRFbnZpcm9ubWVudFJlcXVlc3QSOAoEbmFtZRgBIAEoCUIk4EEC+kEeChxjbG91ZC5jZW'
    'xlc3QuZGV2L0Vudmlyb25tZW50UgRuYW1l');

@$core.Deprecated('Use updateEnvironmentRequestDescriptor instead')
const UpdateEnvironmentRequest$json = {
  '1': 'UpdateEnvironmentRequest',
  '2': [
    {
      '1': 'environment',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Environment',
      '8': {},
      '10': 'environment'
    },
    {
      '1': 'update_mask',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.FieldMask',
      '8': {},
      '10': 'updateMask'
    },
    {'1': 'request_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'requestId'},
    {
      '1': 'allow_missing',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'allowMissing'
    },
    {
      '1': 'validate_only',
      '3': 5,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
  ],
};

/// Descriptor for `UpdateEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEnvironmentRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVFbnZpcm9ubWVudFJlcXVlc3QSSQoLZW52aXJvbm1lbnQYASABKAsyIi5jZWxlc3'
    'QuY2xvdWQudjFhbHBoYTEuRW52aXJvbm1lbnRCA+BBAlILZW52aXJvbm1lbnQSQAoLdXBkYXRl'
    'X21hc2sYAiABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrQgPgQQFSCnVwZGF0ZU1hc2'
    'sSKgoKcmVxdWVzdF9pZBgDIAEoCUIL4EEB4ozP1wgCCAFSCXJlcXVlc3RJZBIoCg1hbGxvd19t'
    'aXNzaW5nGAQgASgIQgPgQQFSDGFsbG93TWlzc2luZxIoCg12YWxpZGF0ZV9vbmx5GAUgASgIQg'
    'PgQQFSDHZhbGlkYXRlT25seQ==');

@$core.Deprecated('Use listEnvironmentsRequestDescriptor instead')
const ListEnvironmentsRequest$json = {
  '1': 'ListEnvironmentsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'orderBy'},
  ],
};

/// Descriptor for `ListEnvironmentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEnvironmentsRequestDescriptor = $convert.base64Decode(
    'ChdMaXN0RW52aXJvbm1lbnRzUmVxdWVzdBI4CgZwYXJlbnQYASABKAlCIOBBAvpBGgoYY2xvdW'
    'QuY2VsZXN0LmRldi9Qcm9qZWN0UgZwYXJlbnQSIAoJcGFnZV9zaXplGAIgASgFQgPgQQFSCHBh'
    'Z2VTaXplEiIKCnBhZ2VfdG9rZW4YAyABKAlCA+BBAVIJcGFnZVRva2VuEhsKBmZpbHRlchgEIA'
    'EoCUID4EEBUgZmaWx0ZXISHgoIb3JkZXJfYnkYBSABKAlCA+BBAVIHb3JkZXJCeQ==');

@$core.Deprecated('Use listEnvironmentsResponseDescriptor instead')
const ListEnvironmentsResponse$json = {
  '1': 'ListEnvironmentsResponse',
  '2': [
    {
      '1': 'environments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Environment',
      '10': 'environments'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListEnvironmentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEnvironmentsResponseDescriptor = $convert.base64Decode(
    'ChhMaXN0RW52aXJvbm1lbnRzUmVzcG9uc2USRgoMZW52aXJvbm1lbnRzGAEgAygLMiIuY2VsZX'
    'N0LmNsb3VkLnYxYWxwaGExLkVudmlyb25tZW50UgxlbnZpcm9ubWVudHMSJgoPbmV4dF9wYWdl'
    'X3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');

@$core.Deprecated('Use deleteEnvironmentRequestDescriptor instead')
const DeleteEnvironmentRequest$json = {
  '1': 'DeleteEnvironmentRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'request_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'requestId'},
    {'1': 'etag', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'etag'},
    {
      '1': 'allow_missing',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'allowMissing'
    },
    {
      '1': 'validate_only',
      '3': 5,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
  ],
};

/// Descriptor for `DeleteEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEnvironmentRequestDescriptor = $convert.base64Decode(
    'ChhEZWxldGVFbnZpcm9ubWVudFJlcXVlc3QSOAoEbmFtZRgBIAEoCUIk4EEC+kEeChxjbG91ZC'
    '5jZWxlc3QuZGV2L0Vudmlyb25tZW50UgRuYW1lEioKCnJlcXVlc3RfaWQYAiABKAlCC+BBAeKM'
    'z9cIAggBUglyZXF1ZXN0SWQSFwoEZXRhZxgDIAEoCUID4EEBUgRldGFnEigKDWFsbG93X21pc3'
    'NpbmcYBCABKAhCA+BBAVIMYWxsb3dNaXNzaW5nEigKDXZhbGlkYXRlX29ubHkYBSABKAhCA+BB'
    'AVIMdmFsaWRhdGVPbmx5');

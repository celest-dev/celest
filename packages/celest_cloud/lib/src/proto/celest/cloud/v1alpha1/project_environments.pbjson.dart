//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/project_environments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use projectEnvironmentDescriptor instead')
const ProjectEnvironment$json = {
  '1': 'ProjectEnvironment',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'uid'},
    {'1': 'parent', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'project_environment_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'projectEnvironmentId'
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
      '6': '.celest.cloud.v1alpha1.ProjectEnvironment.AnnotationsEntry',
      '8': {},
      '10': 'annotations'
    },
    {'1': 'reconciling', '3': 11, '4': 1, '5': 8, '8': {}, '10': 'reconciling'},
    {
      '1': 'state',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.LifecycleState',
      '8': {},
      '10': 'state'
    },
  ],
  '3': [ProjectEnvironment_AnnotationsEntry$json],
  '7': {},
};

@$core.Deprecated('Use projectEnvironmentDescriptor instead')
const ProjectEnvironment_AnnotationsEntry$json = {
  '1': 'AnnotationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ProjectEnvironment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectEnvironmentDescriptor = $convert.base64Decode(
    'ChJQcm9qZWN0RW52aXJvbm1lbnQSFwoEbmFtZRgBIAEoCUID4EEIUgRuYW1lEh0KA3VpZBgCIA'
    'EoCUIL4EED4ozP1wgCCAFSA3VpZBI4CgZwYXJlbnQYAyABKAlCIOBBAvpBGgoYY2xvdWQuY2Vs'
    'ZXN0LmRldi9Qcm9qZWN0UgZwYXJlbnQSPAoWcHJvamVjdF9lbnZpcm9ubWVudF9pZBgEIAEoCU'
    'IG4EEF4EEDUhRwcm9qZWN0RW52aXJvbm1lbnRJZBImCgxkaXNwbGF5X25hbWUYBSABKAlCA+BB'
    'AVILZGlzcGxheU5hbWUSQAoLY3JlYXRlX3RpbWUYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wQgPgQQNSCmNyZWF0ZVRpbWUSQAoLdXBkYXRlX3RpbWUYByABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wQgPgQQNSCnVwZGF0ZVRpbWUSQAoLZGVsZXRlX3RpbWUYCCABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgPgQQNSCmRlbGV0ZVRpbWUSFwoEZXRhZxgJ'
    'IAEoCUID4EEDUgRldGFnEuIDCgthbm5vdGF0aW9ucxgKIAMoCzI6LmNlbGVzdC5jbG91ZC52MW'
    'FscGhhMS5Qcm9qZWN0RW52aXJvbm1lbnQuQW5ub3RhdGlvbnNFbnRyeUKDA+BBAbpI/AKaAfgC'
    'EEAizQG6AckBChR2YWxpZF9hbm5vdGF0aW9uX2tleRKHAWtleXMgbXVzdCBiZSAxLTYzIGNoYX'
    'JhY3RlcnMgYW5kIGhhdmUgb25seSBsb3dlcmNhc2UgbGV0dGVycywgbnVtZXJpY3MsIHVuZGVy'
    'c2NvcmVzLCBhbmQgZGFzaGVzLCBhbmQgbXVzdCBzdGFydCB3aXRoIGEgbG93ZXJjYXNlIGxldH'
    'RlchondGhpcy5tYXRjaGVzKCdeW2Etel1bYS16MC05Xy1dezAsNjJ9JCcpKqMBugGfAQoWdmFs'
    'aWRfYW5ub3RhdGlvbl92YWx1ZRJhdmFsdWVzIG11c3QgYmUgMC02MyBjaGFyYWN0ZXJzIGFuZC'
    'BoYXZlIG9ubHkgbG93ZXJjYXNlIGxldHRlcnMsIG51bWVyaWNzLCB1bmRlcnNjb3JlcywgYW5k'
    'IGRhc2hlcxoidGhpcy5tYXRjaGVzKCdeW2EtejAtOV8tXXswLDYzfSQnKVILYW5ub3RhdGlvbn'
    'MSJQoLcmVjb25jaWxpbmcYCyABKAhCA+BBA1ILcmVjb25jaWxpbmcSQAoFc3RhdGUYDCABKA4y'
    'JS5jZWxlc3QuY2xvdWQudjFhbHBoYTEuTGlmZWN5Y2xlU3RhdGVCA+BBA1IFc3RhdGUaPgoQQW'
    '5ub3RhdGlvbnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6'
    'AjgBOoQB6kGAAQojY2xvdWQuY2VsZXN0LmRldi9Qcm9qZWN0RW52aXJvbm1lbnQSLXByb2plY3'
    'RzL3twcm9qZWN0fS9lbnZpcm9ubWVudHMve2Vudmlyb25tZW50fSoTcHJvamVjdEVudmlyb25t'
    'ZW50czIScHJvamVjdEVudmlyb25tZW50UgEB');

@$core.Deprecated('Use createProjectEnvironmentRequestDescriptor instead')
const CreateProjectEnvironmentRequest$json = {
  '1': 'CreateProjectEnvironmentRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'project_environment',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.ProjectEnvironment',
      '8': {},
      '10': 'projectEnvironment'
    },
    {
      '1': 'project_environment_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'projectEnvironmentId'
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

/// Descriptor for `CreateProjectEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProjectEnvironmentRequestDescriptor = $convert.base64Decode(
    'Ch9DcmVhdGVQcm9qZWN0RW52aXJvbm1lbnRSZXF1ZXN0Ep0BCgZwYXJlbnQYASABKAlChAHgQQ'
    'L6QRoKGGNsb3VkLmNlbGVzdC5kZXYvUHJvamVjdLpIYboBXgoNdmFsaWRfcHJvamVjdBIscGFy'
    'ZW50IG11c3QgYmUgYSB2YWxpZCBwcm9qZWN0IHJlc291cmNlIG5hbWUaH3RoaXMubWF0Y2hlcy'
    'gncHJvamVjdHMvW14vXSskJylSBnBhcmVudBJfChNwcm9qZWN0X2Vudmlyb25tZW50GAIgASgL'
    'MikuY2VsZXN0LmNsb3VkLnYxYWxwaGExLlByb2plY3RFbnZpcm9ubWVudEID4EECUhJwcm9qZW'
    'N0RW52aXJvbm1lbnQSrgEKFnByb2plY3RfZW52aXJvbm1lbnRfaWQYAyABKAlCeOBBArpIcroB'
    'bwoXdmFsaWRfZW52aXJvbm1lbnRfYWxpYXMSLHByb2plY3RfZW52aXJvbm1lbnRfaWQgbXVzdC'
    'BiZSBhIHZhbGlkIGFsaWFzGiZ0aGlzLm1hdGNoZXMoJ15bYS16XVthLXowLTktXXsyLDI5fSQn'
    'KVIUcHJvamVjdEVudmlyb25tZW50SWQSKgoKcmVxdWVzdF9pZBgEIAEoCUIL4EEB4ozP1wgCCA'
    'FSCXJlcXVlc3RJZBIoCg12YWxpZGF0ZV9vbmx5GAUgASgIQgPgQQFSDHZhbGlkYXRlT25seQ==');

@$core.Deprecated('Use getProjectEnvironmentRequestDescriptor instead')
const GetProjectEnvironmentRequest$json = {
  '1': 'GetProjectEnvironmentRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetProjectEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectEnvironmentRequestDescriptor = $convert.base64Decode(
    'ChxHZXRQcm9qZWN0RW52aXJvbm1lbnRSZXF1ZXN0EsUBCgRuYW1lGAEgASgJQrAB4EEC+kElCi'
    'NjbG91ZC5jZWxlc3QuZGV2L1Byb2plY3RFbnZpcm9ubWVudLpIgQG6AX4KGXZhbGlkX3Byb2pl'
    'Y3RfZW52aXJvbm1lbnQSLW5hbWUgbXVzdCBiZSBhIHZhbGlkIHByb2plY3QgZW52aXJvbm1lbn'
    'QgbmFtZRoydGhpcy5tYXRjaGVzKCdwcm9qZWN0cy9bXi9dKy9lbnZpcm9ubWVudHMvW14vXSsk'
    'JylSBG5hbWU=');

@$core.Deprecated('Use updateProjectEnvironmentRequestDescriptor instead')
const UpdateProjectEnvironmentRequest$json = {
  '1': 'UpdateProjectEnvironmentRequest',
  '2': [
    {
      '1': 'project_environment',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.ProjectEnvironment',
      '8': {},
      '10': 'projectEnvironment'
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
  '7': {},
};

/// Descriptor for `UpdateProjectEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectEnvironmentRequestDescriptor = $convert.base64Decode(
    'Ch9VcGRhdGVQcm9qZWN0RW52aXJvbm1lbnRSZXF1ZXN0El8KE3Byb2plY3RfZW52aXJvbm1lbn'
    'QYASABKAsyKS5jZWxlc3QuY2xvdWQudjFhbHBoYTEuUHJvamVjdEVudmlyb25tZW50QgPgQQJS'
    'EnByb2plY3RFbnZpcm9ubWVudBJACgt1cGRhdGVfbWFzaxgCIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5GaWVsZE1hc2tCA+BBAVIKdXBkYXRlTWFzaxIqCgpyZXF1ZXN0X2lkGAMgASgJQgvgQQHi'
    'jM/XCAIIAVIJcmVxdWVzdElkEigKDWFsbG93X21pc3NpbmcYBCABKAhCA+BBAVIMYWxsb3dNaX'
    'NzaW5nEigKDXZhbGlkYXRlX29ubHkYBSABKAhCA+BBAVIMdmFsaWRhdGVPbmx5Op4CukiaAhpy'
    'Cg12YWxpZF9vcHRpb25zEi1jYW5ub3Qgc2V0IGJvdGggYWxsb3dfbWlzc2luZyBhbmQgdXBkYX'
    'RlX21hc2saMnRoaXMuYWxsb3dfbWlzc2luZyA/ICFoYXModGhpcy51cGRhdGVfbWFzaykgOiB0'
    'cnVlGqMBChF2YWxpZF91cGRhdGVfbWFzaxI7dXBkYXRlX21hc2sgbWF5IG9ubHkgaW5jbHVkZT'
    'ogJ2Rpc3BsYXlfbmFtZScsICdhbm5vdGF0aW9ucycaUXRoaXMudXBkYXRlX21hc2sucGF0aHMu'
    'YWxsKHBhdGgsIHBhdGggaW4gWyduYW1lJywgJ2Rpc3BsYXlfbmFtZScsICdhbm5vdGF0aW9ucy'
    'ddKQ==');

@$core.Deprecated('Use listProjectEnvironmentsRequestDescriptor instead')
const ListProjectEnvironmentsRequest$json = {
  '1': 'ListProjectEnvironmentsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'orderBy'},
  ],
};

/// Descriptor for `ListProjectEnvironmentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectEnvironmentsRequestDescriptor = $convert.base64Decode(
    'Ch5MaXN0UHJvamVjdEVudmlyb25tZW50c1JlcXVlc3QSnAEKBnBhcmVudBgBIAEoCUKDAeBBAv'
    'pBGgoYY2xvdWQuY2VsZXN0LmRldi9Qcm9qZWN0ukhgugFdCgx2YWxpZF9wYXJlbnQSLHBhcmVu'
    'dCBtdXN0IGJlIGEgdmFsaWQgcHJvamVjdCByZXNvdXJjZSBuYW1lGh90aGlzLm1hdGNoZXMoJ3'
    'Byb2plY3RzL1teL10rJCcpUgZwYXJlbnQSJwoJcGFnZV9zaXplGAIgASgFQgrgQQG6SAQaAigA'
    'UghwYWdlU2l6ZRIiCgpwYWdlX3Rva2VuGAMgASgJQgPgQQFSCXBhZ2VUb2tlbhIbCgZmaWx0ZX'
    'IYBCABKAlCA+BBAVIGZmlsdGVyEh4KCG9yZGVyX2J5GAUgASgJQgPgQQFSB29yZGVyQnk=');

@$core.Deprecated('Use listProjectEnvironmentsResponseDescriptor instead')
const ListProjectEnvironmentsResponse$json = {
  '1': 'ListProjectEnvironmentsResponse',
  '2': [
    {
      '1': 'project_environments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.ProjectEnvironment',
      '10': 'projectEnvironments'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListProjectEnvironmentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectEnvironmentsResponseDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0UHJvamVjdEVudmlyb25tZW50c1Jlc3BvbnNlElwKFHByb2plY3RfZW52aXJvbm1lbn'
        'RzGAEgAygLMikuY2VsZXN0LmNsb3VkLnYxYWxwaGExLlByb2plY3RFbnZpcm9ubWVudFITcHJv'
        'amVjdEVudmlyb25tZW50cxImCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlSDW5leHRQYWdlVG9rZW'
        '4=');

@$core.Deprecated('Use deleteProjectEnvironmentRequestDescriptor instead')
const DeleteProjectEnvironmentRequest$json = {
  '1': 'DeleteProjectEnvironmentRequest',
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

/// Descriptor for `DeleteProjectEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProjectEnvironmentRequestDescriptor = $convert.base64Decode(
    'Ch9EZWxldGVQcm9qZWN0RW52aXJvbm1lbnRSZXF1ZXN0Es8BCgRuYW1lGAEgASgJQroB4EEC+k'
    'ElCiNjbG91ZC5jZWxlc3QuZGV2L1Byb2plY3RFbnZpcm9ubWVudLpIiwG6AYcBChl2YWxpZF9w'
    'cm9qZWN0X2Vudmlyb25tZW50EjZuYW1lIG11c3QgYmUgYSB2YWxpZCBwcm9qZWN0IGVudmlyb2'
    '5tZW50IHJlc291cmNlIG5hbWUaMnRoaXMubWF0Y2hlcygncHJvamVjdHMvW14vXSsvZW52aXJv'
    'bm1lbnRzL1teL10rJCcpUgRuYW1lEioKCnJlcXVlc3RfaWQYAiABKAlCC+BBAeKMz9cIAggBUg'
    'lyZXF1ZXN0SWQSFwoEZXRhZxgDIAEoCUID4EEBUgRldGFnEigKDWFsbG93X21pc3NpbmcYBCAB'
    'KAhCA+BBAVIMYWxsb3dNaXNzaW5nEigKDXZhbGlkYXRlX29ubHkYBSABKAhCA+BBAVIMdmFsaW'
    'RhdGVPbmx5');

@$core.Deprecated('Use projectAssetDescriptor instead')
const ProjectAsset$json = {
  '1': 'ProjectAsset',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.ProjectAsset.Type',
      '8': {},
      '10': 'type'
    },
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'filename'},
    {'1': 'inline', '3': 3, '4': 1, '5': 12, '9': 0, '10': 'inline'},
    {'1': 'etag', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'etag'},
  ],
  '4': [ProjectAsset_Type$json],
  '8': [
    {'1': 'asset'},
  ],
};

@$core.Deprecated('Use projectAssetDescriptor instead')
const ProjectAsset_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'TYPE_UNSPECIFIED', '2': 0},
    {'1': 'DART_KERNEL', '2': 1},
  ],
};

/// Descriptor for `ProjectAsset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectAssetDescriptor = $convert.base64Decode(
    'CgxQcm9qZWN0QXNzZXQSQQoEdHlwZRgBIAEoDjIoLmNlbGVzdC5jbG91ZC52MWFscGhhMS5Qcm'
    '9qZWN0QXNzZXQuVHlwZUID4EECUgR0eXBlEh8KCGZpbGVuYW1lGAIgASgJQgPgQQJSCGZpbGVu'
    'YW1lEhgKBmlubGluZRgDIAEoDEgAUgZpbmxpbmUSFwoEZXRhZxgEIAEoCUID4EECUgRldGFnIi'
    '0KBFR5cGUSFAoQVFlQRV9VTlNQRUNJRklFRBAAEg8KC0RBUlRfS0VSTkVMEAFCBwoFYXNzZXQ=');

@$core.Deprecated('Use deployProjectEnvironmentRequestDescriptor instead')
const DeployProjectEnvironmentRequest$json = {
  '1': 'DeployProjectEnvironmentRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'request_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'requestId'},
    {
      '1': 'validate_only',
      '3': 3,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
    {'1': 'etag', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'etag'},
    {
      '1': 'resolved_project_ast',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedProject',
      '8': {},
      '10': 'resolvedProjectAst'
    },
    {
      '1': 'assets',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.ProjectAsset',
      '8': {},
      '10': 'assets'
    },
  ],
};

/// Descriptor for `DeployProjectEnvironmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deployProjectEnvironmentRequestDescriptor = $convert.base64Decode(
    'Ch9EZXBsb3lQcm9qZWN0RW52aXJvbm1lbnRSZXF1ZXN0EtMBCgZwYXJlbnQYASABKAlCugHgQQ'
    'L6QSUKI2Nsb3VkLmNlbGVzdC5kZXYvUHJvamVjdEVudmlyb25tZW50ukiLAboBhwEKGXZhbGlk'
    'X3Byb2plY3RfZW52aXJvbm1lbnQSNm5hbWUgbXVzdCBiZSBhIHZhbGlkIHByb2plY3QgZW52aX'
    'Jvbm1lbnQgcmVzb3VyY2UgbmFtZRoydGhpcy5tYXRjaGVzKCdwcm9qZWN0cy9bXi9dKy9lbnZp'
    'cm9ubWVudHMvW14vXSskJylSBnBhcmVudBIqCgpyZXF1ZXN0X2lkGAIgASgJQgvgQQHijM/XCA'
    'IIAVIJcmVxdWVzdElkEigKDXZhbGlkYXRlX29ubHkYAyABKAhCA+BBAVIMdmFsaWRhdGVPbmx5'
    'EhcKBGV0YWcYBCABKAlCA+BBAVIEZXRhZxJVChRyZXNvbHZlZF9wcm9qZWN0X2FzdBgFIAEoCz'
    'IeLmNlbGVzdC5hc3QudjEuUmVzb2x2ZWRQcm9qZWN0QgPgQQJSEnJlc29sdmVkUHJvamVjdEFz'
    'dBKdAQoGYXNzZXRzGAYgAygLMiMuY2VsZXN0LmNsb3VkLnYxYWxwaGExLlByb2plY3RBc3NldE'
    'Jg4EECukhakgFXCAEQASJRugFOCgt2YWxpZF9hc3NldBIvb25seSBEYXJ0IGtlcm5lbCBhc3Nl'
    'dHMgYXJlIHN1cHBvcnRlZCBjdXJyZW50bHkaDnRoaXMudHlwZSA9PSAxUgZhc3NldHM=');

@$core.Deprecated('Use deployProjectEnvironmentResponseDescriptor instead')
const DeployProjectEnvironmentResponse$json = {
  '1': 'DeployProjectEnvironmentResponse',
};

/// Descriptor for `DeployProjectEnvironmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deployProjectEnvironmentResponseDescriptor =
    $convert.base64Decode('CiBEZXBsb3lQcm9qZWN0RW52aXJvbm1lbnRSZXNwb25zZQ==');

// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/organizations.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use organizationDescriptor instead')
const Organization$json = {
  '1': 'Organization',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'uid'},
    {'1': 'parent', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'organization_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'organizationId'
    },
    {
      '1': 'state',
      '3': 13,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.LifecycleState',
      '8': {},
      '10': 'state'
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
    {
      '1': 'purge_time',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'purgeTime'
    },
    {'1': 'etag', '3': 9, '4': 1, '5': 9, '8': {}, '10': 'etag'},
    {
      '1': 'annotations',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Organization.AnnotationsEntry',
      '8': {},
      '10': 'annotations'
    },
    {'1': 'reconciling', '3': 11, '4': 1, '5': 8, '8': {}, '10': 'reconciling'},
    {
      '1': 'primary_region',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.Region',
      '8': {},
      '10': 'primaryRegion'
    },
  ],
  '3': [Organization_AnnotationsEntry$json],
  '7': {},
};

@$core.Deprecated('Use organizationDescriptor instead')
const Organization_AnnotationsEntry$json = {
  '1': 'AnnotationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Organization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List organizationDescriptor = $convert.base64Decode(
    'CgxPcmdhbml6YXRpb24SFwoEbmFtZRgBIAEoCUID4EEIUgRuYW1lEh0KA3VpZBgCIAEoCUIL4E'
    'ED4ozP1wgCCAFSA3VpZBIbCgZwYXJlbnQYAyABKAlCA+BBAVIGcGFyZW50Ei8KD29yZ2FuaXph'
    'dGlvbl9pZBgEIAEoCUIG4EEF4EEDUg5vcmdhbml6YXRpb25JZBJACgVzdGF0ZRgNIAEoDjIlLm'
    'NlbGVzdC5jbG91ZC52MWFscGhhMS5MaWZlY3ljbGVTdGF0ZUID4EEDUgVzdGF0ZRImCgxkaXNw'
    'bGF5X25hbWUYBSABKAlCA+BBAlILZGlzcGxheU5hbWUSQAoLY3JlYXRlX3RpbWUYBiABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgPgQQNSCmNyZWF0ZVRpbWUSQAoLdXBkYXRlX3Rp'
    'bWUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgPgQQNSCnVwZGF0ZVRpbWUSQA'
    'oLZGVsZXRlX3RpbWUYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgPgQQNSCmRl'
    'bGV0ZVRpbWUSPgoKcHVyZ2VfdGltZRgOIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbX'
    'BCA+BBA1IJcHVyZ2VUaW1lEhcKBGV0YWcYCSABKAlCA+BBA1IEZXRhZxLcAwoLYW5ub3RhdGlv'
    'bnMYCiADKAsyNC5jZWxlc3QuY2xvdWQudjFhbHBoYTEuT3JnYW5pemF0aW9uLkFubm90YXRpb2'
    '5zRW50cnlCgwPgQQG6SPwCmgH4AhBAIs0BugHJAQoUdmFsaWRfYW5ub3RhdGlvbl9rZXkShwFr'
    'ZXlzIG11c3QgYmUgMS02MyBjaGFyYWN0ZXJzIGFuZCBoYXZlIG9ubHkgbG93ZXJjYXNlIGxldH'
    'RlcnMsIG51bWVyaWNzLCB1bmRlcnNjb3JlcywgYW5kIGRhc2hlcywgYW5kIG11c3Qgc3RhcnQg'
    'd2l0aCBhIGxvd2VyY2FzZSBsZXR0ZXIaJ3RoaXMubWF0Y2hlcygnXlthLXpdW2EtejAtOV8tXX'
    'swLDYyfSQnKSqjAboBnwEKFnZhbGlkX2Fubm90YXRpb25fdmFsdWUSYXZhbHVlcyBtdXN0IGJl'
    'IDAtNjMgY2hhcmFjdGVycyBhbmQgaGF2ZSBvbmx5IGxvd2VyY2FzZSBsZXR0ZXJzLCBudW1lcm'
    'ljcywgdW5kZXJzY29yZXMsIGFuZCBkYXNoZXMaInRoaXMubWF0Y2hlcygnXlthLXowLTlfLV17'
    'MCw2M30kJylSC2Fubm90YXRpb25zEiUKC3JlY29uY2lsaW5nGAsgASgIQgPgQQNSC3JlY29uY2'
    'lsaW5nEkkKDnByaW1hcnlfcmVnaW9uGAwgASgOMh0uY2VsZXN0LmNsb3VkLnYxYWxwaGExLlJl'
    'Z2lvbkID4EECUg1wcmltYXJ5UmVnaW9uGj4KEEFubm90YXRpb25zRW50cnkSEAoDa2V5GAEgAS'
    'gJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ATpg6kFdCh1jbG91ZC5jZWxlc3QuZGV2'
    'L09yZ2FuaXphdGlvbhIcb3JnYW5pemF0aW9ucy97b3JnYW5pemF0aW9ufSoNb3JnYW5pemF0aW'
    '9uczIMb3JnYW5pemF0aW9uUgEB');

@$core.Deprecated('Use createOrganizationRequestDescriptor instead')
const CreateOrganizationRequest$json = {
  '1': 'CreateOrganizationRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'organization_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'organizationId'
    },
    {
      '1': 'organization',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Organization',
      '8': {},
      '10': 'organization'
    },
    {
      '1': 'validate_only',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
  ],
};

/// Descriptor for `CreateOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrganizationRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVPcmdhbml6YXRpb25SZXF1ZXN0ErwBCgZwYXJlbnQYASABKAlCowHgQQH6QR8SHW'
    'Nsb3VkLmNlbGVzdC5kZXYvT3JnYW5pemF0aW9uukh7ugF1Chl2YWxpZF9vcmdhbml6YXRpb25f'
    'cGFyZW50EjFwYXJlbnQgbXVzdCBiZSBlbXB0eSBvciBhIHZhbGlkIG9yZ2FuaXphdGlvbiBuYW'
    '1lGiV0aGlzLm1hdGNoZXMoJ15vcmdhbml6YXRpb25zL1teL10rJCcp2AEBUgZwYXJlbnQSqAEK'
    'D29yZ2FuaXphdGlvbl9pZBgCIAEoCUJ/4EECukh5ugF2Chh2YWxpZF9vcmdhbml6YXRpb25fYW'
    'xpYXMSMm9yZ2FuaXphdGlvbl9pZCBtdXN0IGJlIGEgdmFsaWQgb3JnYW5pemF0aW9uIGFsaWFz'
    'GiZ0aGlzLm1hdGNoZXMoJ15bYS16XVthLXowLTktXXs1LDI5fSQnKVIOb3JnYW5pemF0aW9uSW'
    'QSTAoMb3JnYW5pemF0aW9uGAMgASgLMiMuY2VsZXN0LmNsb3VkLnYxYWxwaGExLk9yZ2FuaXph'
    'dGlvbkID4EECUgxvcmdhbml6YXRpb24SKAoNdmFsaWRhdGVfb25seRgEIAEoCEID4EEBUgx2YW'
    'xpZGF0ZU9ubHk=');

@$core.Deprecated('Use updateOrganizationRequestDescriptor instead')
const UpdateOrganizationRequest$json = {
  '1': 'UpdateOrganizationRequest',
  '2': [
    {
      '1': 'organization',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Organization',
      '8': {},
      '10': 'organization'
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
    {
      '1': 'allow_missing',
      '3': 3,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'allowMissing'
    },
    {
      '1': 'validate_only',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
  ],
  '7': {},
};

/// Descriptor for `UpdateOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOrganizationRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVPcmdhbml6YXRpb25SZXF1ZXN0EkwKDG9yZ2FuaXphdGlvbhgBIAEoCzIjLmNlbG'
    'VzdC5jbG91ZC52MWFscGhhMS5Pcmdhbml6YXRpb25CA+BBAlIMb3JnYW5pemF0aW9uEkAKC3Vw'
    'ZGF0ZV9tYXNrGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza0ID4EEBUgp1cGRhdG'
    'VNYXNrEigKDWFsbG93X21pc3NpbmcYAyABKAhCA+BBAVIMYWxsb3dNaXNzaW5nEigKDXZhbGlk'
    'YXRlX29ubHkYBCABKAhCA+BBAVIMdmFsaWRhdGVPbmx5Op0CukiZAhpyCg12YWxpZF9vcHRpb2'
    '5zEi1jYW5ub3Qgc2V0IGJvdGggYWxsb3dfbWlzc2luZyBhbmQgdXBkYXRlX21hc2saMnRoaXMu'
    'YWxsb3dfbWlzc2luZyA/ICFoYXModGhpcy51cGRhdGVfbWFzaykgOiB0cnVlGqIBChB2YWxpZF'
    '9maWVsZF9tYXNrEjt1cGRhdGVfbWFzayBtYXkgb25seSBpbmNsdWRlOiAnZGlzcGxheV9uYW1l'
    'JywgJ2Fubm90YXRpb25zJxpRdGhpcy51cGRhdGVfbWFzay5wYXRocy5hbGwocGF0aCwgcGF0aC'
    'BpbiBbJ25hbWUnLCAnZGlzcGxheV9uYW1lJywgJ2Fubm90YXRpb25zJ10p');

@$core.Deprecated('Use getOrganizationRequestDescriptor instead')
const GetOrganizationRequest$json = {
  '1': 'GetOrganizationRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrganizationRequestDescriptor = $convert.base64Decode(
    'ChZHZXRPcmdhbml6YXRpb25SZXF1ZXN0EqMBCgRuYW1lGAEgASgJQo4B4EEC+kEfCh1jbG91ZC'
    '5jZWxlc3QuZGV2L09yZ2FuaXphdGlvbrpIZroBYwoSdmFsaWRfb3JnYW5pemF0aW9uEiZuYW1l'
    'IG11c3QgYmUgYSB2YWxpZCBvcmdhbml6YXRpb24gbmFtZRoldGhpcy5tYXRjaGVzKCdeb3JnYW'
    '5pemF0aW9ucy9bXi9dKyQnKVIEbmFtZQ==');

@$core.Deprecated('Use listOrganizationsRequestDescriptor instead')
const ListOrganizationsRequest$json = {
  '1': 'ListOrganizationsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'orderBy'},
    {'1': 'show_deleted', '3': 6, '4': 1, '5': 8, '8': {}, '10': 'showDeleted'},
  ],
};

/// Descriptor for `ListOrganizationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOrganizationsRequestDescriptor = $convert.base64Decode(
    'ChhMaXN0T3JnYW5pemF0aW9uc1JlcXVlc3QSmwEKBnBhcmVudBgBIAEoCUKCAeBBAfpBHxIdY2'
    'xvdWQuY2VsZXN0LmRldi9Pcmdhbml6YXRpb266SFq6AVQKDHZhbGlkX3BhcmVudBIdcGFyZW50'
    'IG11c3QgYmUgYSB2YWxpZCBwYXJlbnQaJXRoaXMubWF0Y2hlcygnXm9yZ2FuaXphdGlvbnMvW1'
    '4vXSskJynYAQFSBnBhcmVudBInCglwYWdlX3NpemUYAiABKAVCCuBBAbpIBBoCKABSCHBhZ2VT'
    'aXplEiIKCnBhZ2VfdG9rZW4YAyABKAlCA+BBAVIJcGFnZVRva2VuEhsKBmZpbHRlchgEIAEoCU'
    'ID4EEBUgZmaWx0ZXISHgoIb3JkZXJfYnkYBSABKAlCA+BBAVIHb3JkZXJCeRImCgxzaG93X2Rl'
    'bGV0ZWQYBiABKAhCA+BBAVILc2hvd0RlbGV0ZWQ=');

@$core.Deprecated('Use listOrganizationsResponseDescriptor instead')
const ListOrganizationsResponse$json = {
  '1': 'ListOrganizationsResponse',
  '2': [
    {
      '1': 'organizations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Organization',
      '10': 'organizations'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListOrganizationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOrganizationsResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0T3JnYW5pemF0aW9uc1Jlc3BvbnNlEkkKDW9yZ2FuaXphdGlvbnMYASADKAsyIy5jZW'
    'xlc3QuY2xvdWQudjFhbHBoYTEuT3JnYW5pemF0aW9uUg1vcmdhbml6YXRpb25zEiYKD25leHRf'
    'cGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use deleteOrganizationRequestDescriptor instead')
const DeleteOrganizationRequest$json = {
  '1': 'DeleteOrganizationRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'force', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'force'},
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

/// Descriptor for `DeleteOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOrganizationRequestDescriptor = $convert.base64Decode(
    'ChlEZWxldGVPcmdhbml6YXRpb25SZXF1ZXN0EqMBCgRuYW1lGAEgASgJQo4B4EEC+kEfCh1jbG'
    '91ZC5jZWxlc3QuZGV2L09yZ2FuaXphdGlvbrpIZroBYwoSdmFsaWRfb3JnYW5pemF0aW9uEiZu'
    'YW1lIG11c3QgYmUgYSB2YWxpZCBvcmdhbml6YXRpb24gbmFtZRoldGhpcy5tYXRjaGVzKCdeb3'
    'JnYW5pemF0aW9ucy9bXi9dKyQnKVIEbmFtZRIZCgVmb3JjZRgCIAEoCEID4EEBUgVmb3JjZRIX'
    'CgRldGFnGAMgASgJQgPgQQFSBGV0YWcSKAoNYWxsb3dfbWlzc2luZxgEIAEoCEID4EEBUgxhbG'
    'xvd01pc3NpbmcSKAoNdmFsaWRhdGVfb25seRgFIAEoCEID4EEBUgx2YWxpZGF0ZU9ubHk=');

@$core.Deprecated('Use undeleteOrganizationRequestDescriptor instead')
const UndeleteOrganizationRequest$json = {
  '1': 'UndeleteOrganizationRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'validate_only',
      '3': 2,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
    {'1': 'etag', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'etag'},
  ],
};

/// Descriptor for `UndeleteOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undeleteOrganizationRequestDescriptor = $convert.base64Decode(
    'ChtVbmRlbGV0ZU9yZ2FuaXphdGlvblJlcXVlc3QSowEKBG5hbWUYASABKAlCjgHgQQL6QR8KHW'
    'Nsb3VkLmNlbGVzdC5kZXYvT3JnYW5pemF0aW9uukhmugFjChJ2YWxpZF9vcmdhbml6YXRpb24S'
    'Jm5hbWUgbXVzdCBiZSBhIHZhbGlkIG9yZ2FuaXphdGlvbiBuYW1lGiV0aGlzLm1hdGNoZXMoJ1'
    '5vcmdhbml6YXRpb25zL1teL10rJCcpUgRuYW1lEigKDXZhbGlkYXRlX29ubHkYAiABKAhCA+BB'
    'AVIMdmFsaWRhdGVPbmx5EhcKBGV0YWcYAyABKAlCA+BBAVIEZXRhZw==');

@$core.Deprecated('Use renameOrganizationRequestDescriptor instead')
const RenameOrganizationRequest$json = {
  '1': 'RenameOrganizationRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'organization_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'organizationId'
    },
    {'1': 'etag', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'etag'},
    {
      '1': 'validate_only',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
  ],
};

/// Descriptor for `RenameOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameOrganizationRequestDescriptor = $convert.base64Decode(
    'ChlSZW5hbWVPcmdhbml6YXRpb25SZXF1ZXN0EqMBCgRuYW1lGAEgASgJQo4B4EEC+kEfCh1jbG'
    '91ZC5jZWxlc3QuZGV2L09yZ2FuaXphdGlvbrpIZroBYwoSdmFsaWRfb3JnYW5pemF0aW9uEiZu'
    'YW1lIG11c3QgYmUgYSB2YWxpZCBvcmdhbml6YXRpb24gbmFtZRoldGhpcy5tYXRjaGVzKCdeb3'
    'JnYW5pemF0aW9ucy9bXi9dKyQnKVIEbmFtZRKoAQoPb3JnYW5pemF0aW9uX2lkGAIgASgJQn/g'
    'QQK6SHm6AXYKGHZhbGlkX29yZ2FuaXphdGlvbl9hbGlhcxIyb3JnYW5pemF0aW9uX2lkIG11c3'
    'QgYmUgYSB2YWxpZCBvcmdhbml6YXRpb24gYWxpYXMaJnRoaXMubWF0Y2hlcygnXlthLXpdW2Et'
    'ejAtOS1dezUsMjl9JCcpUg5vcmdhbml6YXRpb25JZBIXCgRldGFnGAMgASgJQgPgQQFSBGV0YW'
    'cSKAoNdmFsaWRhdGVfb25seRgEIAEoCEID4EEBUgx2YWxpZGF0ZU9ubHk=');

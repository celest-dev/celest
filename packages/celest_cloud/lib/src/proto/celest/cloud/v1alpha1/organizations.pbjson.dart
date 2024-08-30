//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/organizations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

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
      '6': '.celest.cloud.v1alpha1.Organization.State',
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
      '1': 'default_region',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.Region',
      '8': {},
      '10': 'defaultRegion'
    },
  ],
  '3': [Organization_AnnotationsEntry$json],
  '4': [Organization_State$json],
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

@$core.Deprecated('Use organizationDescriptor instead')
const Organization_State$json = {
  '1': 'State',
  '2': [
    {'1': 'STATE_UNSPECIFIED', '2': 0},
    {'1': 'CREATING', '2': 1},
    {'1': 'CREATION_FAILED', '2': 2},
    {'1': 'ACTIVE', '2': 3},
    {'1': 'DELETED', '2': 4},
  ],
};

/// Descriptor for `Organization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List organizationDescriptor = $convert.base64Decode(
    'CgxPcmdhbml6YXRpb24SFwoEbmFtZRgBIAEoCUID4EEIUgRuYW1lEh0KA3VpZBgCIAEoCUIL4E'
    'ED4ozP1wgCCAFSA3VpZBIbCgZwYXJlbnQYAyABKAlCA+BBAVIGcGFyZW50Ei8KD29yZ2FuaXph'
    'dGlvbl9pZBgEIAEoCUIG4EEF4EEDUg5vcmdhbml6YXRpb25JZBJECgVzdGF0ZRgNIAEoDjIpLm'
    'NlbGVzdC5jbG91ZC52MWFscGhhMS5Pcmdhbml6YXRpb24uU3RhdGVCA+BBA1IFc3RhdGUSKQoM'
    'ZGlzcGxheV9uYW1lGAUgASgJQgbgQQLgQQRSC2Rpc3BsYXlOYW1lEkAKC2NyZWF0ZV90aW1lGA'
    'YgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEID4EEDUgpjcmVhdGVUaW1lEkAKC3Vw'
    'ZGF0ZV90aW1lGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEID4EEDUgp1cGRhdG'
    'VUaW1lEkAKC2RlbGV0ZV90aW1lGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEID'
    '4EEDUgpkZWxldGVUaW1lEj4KCnB1cmdlX3RpbWUYDiABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wQgPgQQNSCXB1cmdlVGltZRIXCgRldGFnGAkgASgJQgPgQQNSBGV0YWcS3AMKC2Fu'
    'bm90YXRpb25zGAogAygLMjQuY2VsZXN0LmNsb3VkLnYxYWxwaGExLk9yZ2FuaXphdGlvbi5Bbm'
    '5vdGF0aW9uc0VudHJ5QoMD4EEBukj8ApoB+AIQQCLNAboByQEKFHZhbGlkX2Fubm90YXRpb25f'
    'a2V5EocBa2V5cyBtdXN0IGJlIDEtNjMgY2hhcmFjdGVycyBhbmQgaGF2ZSBvbmx5IGxvd2VyY2'
    'FzZSBsZXR0ZXJzLCBudW1lcmljcywgdW5kZXJzY29yZXMsIGFuZCBkYXNoZXMsIGFuZCBtdXN0'
    'IHN0YXJ0IHdpdGggYSBsb3dlcmNhc2UgbGV0dGVyGid0aGlzLm1hdGNoZXMoJ15bYS16XVthLX'
    'owLTlfLV17MCw2Mn0kJykqowG6AZ8BChZ2YWxpZF9hbm5vdGF0aW9uX3ZhbHVlEmF2YWx1ZXMg'
    'bXVzdCBiZSAwLTYzIGNoYXJhY3RlcnMgYW5kIGhhdmUgb25seSBsb3dlcmNhc2UgbGV0dGVycy'
    'wgbnVtZXJpY3MsIHVuZGVyc2NvcmVzLCBhbmQgZGFzaGVzGiJ0aGlzLm1hdGNoZXMoJ15bYS16'
    'MC05Xy1dezAsNjN9JCcpUgthbm5vdGF0aW9ucxIlCgtyZWNvbmNpbGluZxgLIAEoCEID4EEDUg'
    'tyZWNvbmNpbGluZxJJCg5kZWZhdWx0X3JlZ2lvbhgMIAEoDjIdLmNlbGVzdC5jbG91ZC52MWFs'
    'cGhhMS5SZWdpb25CA+BBAVINZGVmYXVsdFJlZ2lvbho+ChBBbm5vdGF0aW9uc0VudHJ5EhAKA2'
    'tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAEiWgoFU3RhdGUSFQoRU1RB'
    'VEVfVU5TUEVDSUZJRUQQABIMCghDUkVBVElORxABEhMKD0NSRUFUSU9OX0ZBSUxFRBACEgoKBk'
    'FDVElWRRADEgsKB0RFTEVURUQQBDpg6kFdCh1jbG91ZC5jZWxlc3QuZGV2L09yZ2FuaXphdGlv'
    'bhIcb3JnYW5pemF0aW9ucy97b3JnYW5pemF0aW9ufSoNb3JnYW5pemF0aW9uczIMb3JnYW5pem'
    'F0aW9uUgEB');

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
    'ChlDcmVhdGVPcmdhbml6YXRpb25SZXF1ZXN0EskBCgZwYXJlbnQYASABKAlCsAHgQQH6QR8SHW'
    'Nsb3VkLmNlbGVzdC5kZXYvT3JnYW5pemF0aW9uukiHAboBgwEKGXZhbGlkX29yZ2FuaXphdGlv'
    'bl9wYXJlbnQSMXBhcmVudCBtdXN0IGJlIGVtcHR5IG9yIGEgdmFsaWQgb3JnYW5pemF0aW9uIG'
    '5hbWUaM3RoaXMgPT0gJycgfHwgdGhpcy5tYXRjaGVzKCdeb3JnYW5pemF0aW9ucy9bXi9dKyQn'
    'KVIGcGFyZW50EqgBCg9vcmdhbml6YXRpb25faWQYAiABKAlCf+BBArpIeboBdgoYdmFsaWRfb3'
    'JnYW5pemF0aW9uX2FsaWFzEjJvcmdhbml6YXRpb25faWQgbXVzdCBiZSBhIHZhbGlkIG9yZ2Fu'
    'aXphdGlvbiBhbGlhcxomdGhpcy5tYXRjaGVzKCdeW2Etel1bYS16MC05LV17NSwyOX0kJylSDm'
    '9yZ2FuaXphdGlvbklkEkwKDG9yZ2FuaXphdGlvbhgDIAEoCzIjLmNlbGVzdC5jbG91ZC52MWFs'
    'cGhhMS5Pcmdhbml6YXRpb25CA+BBAlIMb3JnYW5pemF0aW9uEigKDXZhbGlkYXRlX29ubHkYBC'
    'ABKAhCA+BBAVIMdmFsaWRhdGVPbmx5');

@$core.Deprecated('Use createOrganizationMetadataDescriptor instead')
const CreateOrganizationMetadata$json = {
  '1': 'CreateOrganizationMetadata',
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
      '1': 'state',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.OperationState',
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
      '1': 'start_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'startTime'
    },
    {
      '1': 'end_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'endTime'
    },
  ],
};

/// Descriptor for `CreateOrganizationMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrganizationMetadataDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVPcmdhbml6YXRpb25NZXRhZGF0YRJMCgxvcmdhbml6YXRpb24YASABKAsyIy5jZW'
    'xlc3QuY2xvdWQudjFhbHBoYTEuT3JnYW5pemF0aW9uQgPgQQNSDG9yZ2FuaXphdGlvbhJACgVz'
    'dGF0ZRgCIAEoDjIlLmNlbGVzdC5jbG91ZC52MWFscGhhMS5PcGVyYXRpb25TdGF0ZUID4EEDUg'
    'VzdGF0ZRJACgtjcmVhdGVfdGltZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBC'
    'A+BBA1IKY3JlYXRlVGltZRI+CgpzdGFydF90aW1lGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcEID4EEDUglzdGFydFRpbWUSOgoIZW5kX3RpbWUYBSABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wQgPgQQNSB2VuZFRpbWU=');

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
    'YXRlX29ubHkYBCABKAhCA+BBAVIMdmFsaWRhdGVPbmx5OsECuki9AhpyCg12YWxpZF9vcHRpb2'
    '5zEi1jYW5ub3Qgc2V0IGJvdGggYWxsb3dfbWlzc2luZyBhbmQgdXBkYXRlX21hc2saMnRoaXMu'
    'YWxsb3dfbWlzc2luZyA/ICFoYXModGhpcy51cGRhdGVfbWFzaykgOiB0cnVlGsYBChB2YWxpZF'
    '9maWVsZF9tYXNrEk11cGRhdGVfbWFzayBtYXkgb25seSBpbmNsdWRlOiAnZGlzcGxheV9uYW1l'
    'JywgJ2Fubm90YXRpb25zJywgJ2RlZmF1bHRfcmVnaW9uJxpjdGhpcy51cGRhdGVfbWFzay5wYX'
    'Rocy5hbGwocGF0aCwgcGF0aCBpbiBbJ25hbWUnLCAnZGlzcGxheV9uYW1lJywgJ2Fubm90YXRp'
    'b25zJywgJ2RlZmF1bHRfcmVnaW9uJ10p');

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
    'ChhMaXN0T3JnYW5pemF0aW9uc1JlcXVlc3QSlwEKBnBhcmVudBgBIAEoCUJ/4EEB+kEfEh1jbG'
    '91ZC5jZWxlc3QuZGV2L09yZ2FuaXphdGlvbrpIV7oBVAoMdmFsaWRfcGFyZW50Eh1wYXJlbnQg'
    'bXVzdCBiZSBhIHZhbGlkIHBhcmVudBoldGhpcy5tYXRjaGVzKCdeb3JnYW5pemF0aW9ucy9bXi'
    '9dKyQnKVIGcGFyZW50EicKCXBhZ2Vfc2l6ZRgCIAEoBUIK4EEBukgEGgIoAFIIcGFnZVNpemUS'
    'IgoKcGFnZV90b2tlbhgDIAEoCUID4EEBUglwYWdlVG9rZW4SGwoGZmlsdGVyGAQgASgJQgPgQQ'
    'FSBmZpbHRlchIeCghvcmRlcl9ieRgFIAEoCUID4EEBUgdvcmRlckJ5EiYKDHNob3dfZGVsZXRl'
    'ZBgGIAEoCEID4EEBUgtzaG93RGVsZXRlZA==');

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

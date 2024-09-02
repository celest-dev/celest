//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/projects.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use projectDescriptor instead')
const Project$json = {
  '1': 'Project',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'uid'},
    {'1': 'parent', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'project_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'projectId'},
    {
      '1': 'state',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.Project.State',
      '8': {},
      '10': 'state'
    },
    {'1': 'display_name', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'displayName'},
    {
      '1': 'create_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'createTime'
    },
    {
      '1': 'update_time',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'updateTime'
    },
    {
      '1': 'delete_time',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'deleteTime'
    },
    {
      '1': 'purge_time',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'purgeTime'
    },
    {'1': 'etag', '3': 11, '4': 1, '5': 9, '8': {}, '10': 'etag'},
    {
      '1': 'annotations',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Project.AnnotationsEntry',
      '8': {},
      '10': 'annotations'
    },
    {'1': 'reconciling', '3': 13, '4': 1, '5': 8, '8': {}, '10': 'reconciling'},
    {
      '1': 'region',
      '3': 14,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.Region',
      '8': {},
      '10': 'region'
    },
  ],
  '3': [Project_AnnotationsEntry$json],
  '4': [Project_State$json],
  '7': {},
};

@$core.Deprecated('Use projectDescriptor instead')
const Project_AnnotationsEntry$json = {
  '1': 'AnnotationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use projectDescriptor instead')
const Project_State$json = {
  '1': 'State',
  '2': [
    {'1': 'STATE_UNSPECIFIED', '2': 0},
    {'1': 'CREATING', '2': 1},
    {'1': 'CREATION_FAILED', '2': 2},
    {'1': 'ACTIVE', '2': 3},
    {'1': 'DELETED', '2': 4},
  ],
};

/// Descriptor for `Project`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectDescriptor = $convert.base64Decode(
    'CgdQcm9qZWN0EhcKBG5hbWUYASABKAlCA+BBCFIEbmFtZRIdCgN1aWQYAiABKAlCC+BBA+KMz9'
    'cIAggBUgN1aWQSGwoGcGFyZW50GAMgASgJQgPgQQFSBnBhcmVudBIlCgpwcm9qZWN0X2lkGAQg'
    'ASgJQgbgQQXgQQNSCXByb2plY3RJZBI/CgVzdGF0ZRgFIAEoDjIkLmNlbGVzdC5jbG91ZC52MW'
    'FscGhhMS5Qcm9qZWN0LlN0YXRlQgPgQQNSBXN0YXRlEiYKDGRpc3BsYXlfbmFtZRgGIAEoCUID'
    '4EEBUgtkaXNwbGF5TmFtZRJACgtjcmVhdGVfdGltZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBCA+BBA1IKY3JlYXRlVGltZRJACgt1cGRhdGVfdGltZRgIIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBCA+BBA1IKdXBkYXRlVGltZRJACgtkZWxldGVfdGltZRgJIA'
    'EoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCA+BBA1IKZGVsZXRlVGltZRI+CgpwdXJn'
    'ZV90aW1lGAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEID4EEDUglwdXJnZVRpbW'
    'USFwoEZXRhZxgLIAEoCUID4EEDUgRldGFnEtcDCgthbm5vdGF0aW9ucxgMIAMoCzIvLmNlbGVz'
    'dC5jbG91ZC52MWFscGhhMS5Qcm9qZWN0LkFubm90YXRpb25zRW50cnlCgwPgQQG6SPwCmgH4Ah'
    'BAIs0BugHJAQoUdmFsaWRfYW5ub3RhdGlvbl9rZXkShwFrZXlzIG11c3QgYmUgMS02MyBjaGFy'
    'YWN0ZXJzIGFuZCBoYXZlIG9ubHkgbG93ZXJjYXNlIGxldHRlcnMsIG51bWVyaWNzLCB1bmRlcn'
    'Njb3JlcywgYW5kIGRhc2hlcywgYW5kIG11c3Qgc3RhcnQgd2l0aCBhIGxvd2VyY2FzZSBsZXR0'
    'ZXIaJ3RoaXMubWF0Y2hlcygnXlthLXpdW2EtejAtOV8tXXswLDYyfSQnKSqjAboBnwEKFnZhbG'
    'lkX2Fubm90YXRpb25fdmFsdWUSYXZhbHVlcyBtdXN0IGJlIDAtNjMgY2hhcmFjdGVycyBhbmQg'
    'aGF2ZSBvbmx5IGxvd2VyY2FzZSBsZXR0ZXJzLCBudW1lcmljcywgdW5kZXJzY29yZXMsIGFuZC'
    'BkYXNoZXMaInRoaXMubWF0Y2hlcygnXlthLXowLTlfLV17MCw2M30kJylSC2Fubm90YXRpb25z'
    'EiUKC3JlY29uY2lsaW5nGA0gASgIQgPgQQNSC3JlY29uY2lsaW5nEj0KBnJlZ2lvbhgOIAEoDj'
    'IdLmNlbGVzdC5jbG91ZC52MWFscGhhMS5SZWdpb25CBuBBAeBBBVIGcmVnaW9uGj4KEEFubm90'
    'YXRpb25zRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AS'
    'JaCgVTdGF0ZRIVChFTVEFURV9VTlNQRUNJRklFRBAAEgwKCENSRUFUSU5HEAESEwoPQ1JFQVRJ'
    'T05fRkFJTEVEEAISCgoGQUNUSVZFEAMSCwoHREVMRVRFRBAEOmTqQWEKGGNsb3VkLmNlbGVzdC'
    '5kZXYvUHJvamVjdBIvb3JnYW5pemF0aW9ucy97b3JnYW5pemF0aW9ufS9wcm9qZWN0cy97cHJv'
    'amVjdH0qCHByb2plY3RzMgdwcm9qZWN0UgEB');

@$core.Deprecated('Use createProjectRequestDescriptor instead')
const CreateProjectRequest$json = {
  '1': 'CreateProjectRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'project_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'projectId'},
    {
      '1': 'project',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Project',
      '8': {},
      '10': 'project'
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

/// Descriptor for `CreateProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProjectRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQcm9qZWN0UmVxdWVzdBLBAQoGcGFyZW50GAEgASgJQqgB4EEC+kE5Ch1jbG91ZC'
    '5jZWxlc3QuZGV2L09yZ2FuaXphdGlvbhIYY2xvdWQuY2VsZXN0LmRldi9Qcm9qZWN0ukhmugFj'
    'ChJ2YWxpZF9vcmdhbml6YXRpb24SJm5hbWUgbXVzdCBiZSBhIHZhbGlkIG9yZ2FuaXphdGlvbi'
    'BuYW1lGiV0aGlzLm1hdGNoZXMoJ15vcmdhbml6YXRpb25zL1teL10rJCcpUgZwYXJlbnQShwEK'
    'CnByb2plY3RfaWQYAiABKAlCaOBBArpIYroBXwoTdmFsaWRfcHJvamVjdF9hbGlhcxIgcHJvam'
    'VjdF9pZCBtdXN0IGJlIGEgdmFsaWQgYWxpYXMaJnRoaXMubWF0Y2hlcygnXlthLXpdW2EtejAt'
    'OS1dezUsMjl9JCcpUglwcm9qZWN0SWQSPQoHcHJvamVjdBgDIAEoCzIeLmNlbGVzdC5jbG91ZC'
    '52MWFscGhhMS5Qcm9qZWN0QgPgQQJSB3Byb2plY3QSKAoNdmFsaWRhdGVfb25seRgEIAEoCEID'
    '4EEBUgx2YWxpZGF0ZU9ubHk=');

@$core.Deprecated('Use getProjectRequestDescriptor instead')
const GetProjectRequest$json = {
  '1': 'GetProjectRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQcm9qZWN0UmVxdWVzdBKjAQoEbmFtZRgBIAEoCUKOAeBBAvpBGgoYY2xvdWQuY2VsZX'
    'N0LmRldi9Qcm9qZWN0ukhrugFoCg12YWxpZF9wcm9qZWN0EiFuYW1lIG11c3QgYmUgYSB2YWxp'
    'ZCBwcm9qZWN0IG5hbWUaNHRoaXMubWF0Y2hlcygnXm9yZ2FuaXphdGlvbnMvW14vXSsvcHJvam'
    'VjdHMvW14vXSskJylSBG5hbWU=');

@$core.Deprecated('Use listProjectsRequestDescriptor instead')
const ListProjectsRequest$json = {
  '1': 'ListProjectsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'orderBy'},
    {'1': 'show_deleted', '3': 6, '4': 1, '5': 8, '8': {}, '10': 'showDeleted'},
  ],
};

/// Descriptor for `ListProjectsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0UHJvamVjdHNSZXF1ZXN0Er0BCgZwYXJlbnQYASABKAlCpAHgQQL6QTkKHWNsb3VkLm'
    'NlbGVzdC5kZXYvT3JnYW5pemF0aW9uEhhjbG91ZC5jZWxlc3QuZGV2L1Byb2plY3S6SGK6AV8K'
    'DHZhbGlkX3BhcmVudBIocGFyZW50IG11c3QgYmUgYSB2YWxpZCBvcmdhbml6YXRpb24gbmFtZR'
    'oldGhpcy5tYXRjaGVzKCdeb3JnYW5pemF0aW9ucy9bXi9dKyQnKVIGcGFyZW50EicKCXBhZ2Vf'
    'c2l6ZRgCIAEoBUIK4EEBukgEGgIoAFIIcGFnZVNpemUSIgoKcGFnZV90b2tlbhgDIAEoCUID4E'
    'EBUglwYWdlVG9rZW4SGwoGZmlsdGVyGAQgASgJQgPgQQFSBmZpbHRlchIeCghvcmRlcl9ieRgF'
    'IAEoCUID4EEBUgdvcmRlckJ5EiYKDHNob3dfZGVsZXRlZBgGIAEoCEID4EEBUgtzaG93RGVsZX'
    'RlZA==');

@$core.Deprecated('Use listProjectsResponseDescriptor instead')
const ListProjectsResponse$json = {
  '1': 'ListProjectsResponse',
  '2': [
    {
      '1': 'projects',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Project',
      '10': 'projects'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListProjectsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProjectsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0UHJvamVjdHNSZXNwb25zZRI6Cghwcm9qZWN0cxgBIAMoCzIeLmNlbGVzdC5jbG91ZC'
    '52MWFscGhhMS5Qcm9qZWN0Ughwcm9qZWN0cxImCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlSDW5l'
    'eHRQYWdlVG9rZW4=');

@$core.Deprecated('Use updateProjectRequestDescriptor instead')
const UpdateProjectRequest$json = {
  '1': 'UpdateProjectRequest',
  '2': [
    {
      '1': 'project',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Project',
      '8': {},
      '10': 'project'
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

/// Descriptor for `UpdateProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProjectRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9qZWN0UmVxdWVzdBI9Cgdwcm9qZWN0GAEgASgLMh4uY2VsZXN0LmNsb3VkLn'
    'YxYWxwaGExLlByb2plY3RCA+BBAlIHcHJvamVjdBJACgt1cGRhdGVfbWFzaxgCIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tCA+BBAVIKdXBkYXRlTWFzaxIoCg1hbGxvd19taXNzaW'
    '5nGAMgASgIQgPgQQFSDGFsbG93TWlzc2luZxIoCg12YWxpZGF0ZV9vbmx5GAQgASgIQgPgQQFS'
    'DHZhbGlkYXRlT25seTqdArpImQIacgoNdmFsaWRfb3B0aW9ucxItY2Fubm90IHNldCBib3RoIG'
    'FsbG93X21pc3NpbmcgYW5kIHVwZGF0ZV9tYXNrGjJ0aGlzLmFsbG93X21pc3NpbmcgPyAhaGFz'
    'KHRoaXMudXBkYXRlX21hc2spIDogdHJ1ZRqiAQoQdmFsaWRfZmllbGRfbWFzaxI7dXBkYXRlX2'
    '1hc2sgbWF5IG9ubHkgaW5jbHVkZTogJ2Rpc3BsYXlfbmFtZScsICdhbm5vdGF0aW9ucycaUXRo'
    'aXMudXBkYXRlX21hc2sucGF0aHMuYWxsKHBhdGgsIHBhdGggaW4gWyduYW1lJywgJ2Rpc3BsYX'
    'lfbmFtZScsICdhbm5vdGF0aW9ucyddKQ==');

@$core.Deprecated('Use deleteProjectRequestDescriptor instead')
const DeleteProjectRequest$json = {
  '1': 'DeleteProjectRequest',
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

/// Descriptor for `DeleteProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProjectRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVQcm9qZWN0UmVxdWVzdBKjAQoEbmFtZRgBIAEoCUKOAeBBAvpBGgoYY2xvdWQuY2'
    'VsZXN0LmRldi9Qcm9qZWN0ukhrugFoCg12YWxpZF9wcm9qZWN0EiFuYW1lIG11c3QgYmUgYSB2'
    'YWxpZCBwcm9qZWN0IG5hbWUaNHRoaXMubWF0Y2hlcygnXm9yZ2FuaXphdGlvbnMvW14vXSsvcH'
    'JvamVjdHMvW14vXSskJylSBG5hbWUSGQoFZm9yY2UYAiABKAhCA+BBAVIFZm9yY2USFwoEZXRh'
    'ZxgDIAEoCUID4EEBUgRldGFnEigKDWFsbG93X21pc3NpbmcYBCABKAhCA+BBAVIMYWxsb3dNaX'
    'NzaW5nEigKDXZhbGlkYXRlX29ubHkYBSABKAhCA+BBAVIMdmFsaWRhdGVPbmx5');

@$core.Deprecated('Use undeleteProjectRequestDescriptor instead')
const UndeleteProjectRequest$json = {
  '1': 'UndeleteProjectRequest',
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

/// Descriptor for `UndeleteProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undeleteProjectRequestDescriptor = $convert.base64Decode(
    'ChZVbmRlbGV0ZVByb2plY3RSZXF1ZXN0EqMBCgRuYW1lGAEgASgJQo4B4EEC+kEaChhjbG91ZC'
    '5jZWxlc3QuZGV2L1Byb2plY3S6SGu6AWgKDXZhbGlkX3Byb2plY3QSIW5hbWUgbXVzdCBiZSBh'
    'IHZhbGlkIHByb2plY3QgbmFtZRo0dGhpcy5tYXRjaGVzKCdeb3JnYW5pemF0aW9ucy9bXi9dKy'
    '9wcm9qZWN0cy9bXi9dKyQnKVIEbmFtZRIoCg12YWxpZGF0ZV9vbmx5GAIgASgIQgPgQQFSDHZh'
    'bGlkYXRlT25seRIXCgRldGFnGAMgASgJQgPgQQFSBGV0YWc=');

@$core.Deprecated('Use renameProjectRequestDescriptor instead')
const RenameProjectRequest$json = {
  '1': 'RenameProjectRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'project_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'projectId'},
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

/// Descriptor for `RenameProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameProjectRequestDescriptor = $convert.base64Decode(
    'ChRSZW5hbWVQcm9qZWN0UmVxdWVzdBKjAQoEbmFtZRgBIAEoCUKOAeBBAvpBGgoYY2xvdWQuY2'
    'VsZXN0LmRldi9Qcm9qZWN0ukhrugFoCg12YWxpZF9wcm9qZWN0EiFuYW1lIG11c3QgYmUgYSB2'
    'YWxpZCBwcm9qZWN0IG5hbWUaNHRoaXMubWF0Y2hlcygnXm9yZ2FuaXphdGlvbnMvW14vXSsvcH'
    'JvamVjdHMvW14vXSskJylSBG5hbWUShwEKCnByb2plY3RfaWQYAiABKAlCaOBBArpIYroBXwoT'
    'dmFsaWRfcHJvamVjdF9hbGlhcxIgcHJvamVjdF9pZCBtdXN0IGJlIGEgdmFsaWQgYWxpYXMaJn'
    'RoaXMubWF0Y2hlcygnXlthLXpdW2EtejAtOS1dezUsMjl9JCcpUglwcm9qZWN0SWQSFwoEZXRh'
    'ZxgDIAEoCUID4EEBUgRldGFnEigKDXZhbGlkYXRlX29ubHkYBCABKAhCA+BBAVIMdmFsaWRhdG'
    'VPbmx5');

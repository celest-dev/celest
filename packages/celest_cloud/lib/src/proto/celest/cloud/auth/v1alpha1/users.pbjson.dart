//
//  Generated code. Do not modify.
//  source: celest/cloud/auth/v1alpha1/users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use identityProviderTypeDescriptor instead')
const IdentityProviderType$json = {
  '1': 'IdentityProviderType',
  '2': [
    {'1': 'IDENTITY_PROVIDER_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'GOOGLE', '2': 1},
    {'1': 'APPLE', '2': 2},
    {'1': 'GITHUB', '2': 3},
  ],
};

/// Descriptor for `IdentityProviderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List identityProviderTypeDescriptor = $convert.base64Decode(
    'ChRJZGVudGl0eVByb3ZpZGVyVHlwZRImCiJJREVOVElUWV9QUk9WSURFUl9UWVBFX1VOU1BFQ0'
    'lGSUVEEAASCgoGR09PR0xFEAESCQoFQVBQTEUQAhIKCgZHSVRIVUIQAw==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'parent', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {
      '1': 'create_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'createTime'
    },
    {
      '1': 'update_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'updateTime'
    },
    {
      '1': 'given_name',
      '3': 6,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'givenName',
      '17': true
    },
    {
      '1': 'family_name',
      '3': 7,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'familyName',
      '17': true
    },
    {
      '1': 'time_zone',
      '3': 8,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 2,
      '10': 'timeZone',
      '17': true
    },
    {
      '1': 'language_code',
      '3': 9,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 3,
      '10': 'languageCode',
      '17': true
    },
    {
      '1': 'email',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.Email',
      '8': {},
      '9': 4,
      '10': 'email',
      '17': true
    },
    {
      '1': 'phone_number',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.PhoneNumber',
      '8': {},
      '9': 5,
      '10': 'phoneNumber',
      '17': true
    },
    {
      '1': 'external_identities',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.ExternalIdentity',
      '8': {},
      '10': 'externalIdentities'
    },
    {
      '1': 'company',
      '3': 13,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 6,
      '10': 'company',
      '17': true
    },
  ],
  '7': {},
  '8': [
    {'1': '_given_name'},
    {'1': '_family_name'},
    {'1': '_time_zone'},
    {'1': '_language_code'},
    {'1': '_email'},
    {'1': '_phone_number'},
    {'1': '_company'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhcKBG5hbWUYASABKAlCA+BBCFIEbmFtZRI1CgZwYXJlbnQYAiABKAlCHeBBAfpBFx'
    'IVY2xvdWQuY2VsZXN0LmRldi9Vc2VyUgZwYXJlbnQSHwoHdXNlcl9pZBgDIAEoCUIG4EEF4EED'
    'UgZ1c2VySWQSQAoLY3JlYXRlX3RpbWUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW'
    '1wQgPgQQNSCmNyZWF0ZVRpbWUSQAoLdXBkYXRlX3RpbWUYBSABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wQgPgQQNSCnVwZGF0ZVRpbWUSJwoKZ2l2ZW5fbmFtZRgGIAEoCUID4EEBSA'
    'BSCWdpdmVuTmFtZYgBARIpCgtmYW1pbHlfbmFtZRgHIAEoCUID4EEBSAFSCmZhbWlseU5hbWWI'
    'AQESJQoJdGltZV96b25lGAggASgJQgPgQQFIAlIIdGltZVpvbmWIAQESLQoNbGFuZ3VhZ2VfY2'
    '9kZRgJIAEoCUID4EEBSANSDGxhbmd1YWdlQ29kZYgBARJBCgVlbWFpbBgKIAEoCzIhLmNlbGVz'
    'dC5jbG91ZC5hdXRoLnYxYWxwaGExLkVtYWlsQgPgQQFIBFIFZW1haWyIAQESVAoMcGhvbmVfbn'
    'VtYmVyGAsgASgLMicuY2VsZXN0LmNsb3VkLmF1dGgudjFhbHBoYTEuUGhvbmVOdW1iZXJCA+BB'
    'AUgFUgtwaG9uZU51bWJlcogBARJiChNleHRlcm5hbF9pZGVudGl0aWVzGAwgAygLMiwuY2VsZX'
    'N0LmNsb3VkLmF1dGgudjFhbHBoYTEuRXh0ZXJuYWxJZGVudGl0eUID4EEDUhJleHRlcm5hbElk'
    'ZW50aXRpZXMSIgoHY29tcGFueRgNIAEoCUID4EEBSAZSB2NvbXBhbnmIAQE6NepBMgoVY2xvdW'
    'QuY2VsZXN0LmRldi9Vc2VyEgx1c2Vycy97dXNlcn0qBXVzZXJzMgR1c2VyQg0KC19naXZlbl9u'
    'YW1lQg4KDF9mYW1pbHlfbmFtZUIMCgpfdGltZV96b25lQhAKDl9sYW5ndWFnZV9jb2RlQggKBl'
    '9lbWFpbEIPCg1fcGhvbmVfbnVtYmVyQgoKCF9jb21wYW55');

@$core.Deprecated('Use emailDescriptor instead')
const Email$json = {
  '1': 'Email',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'email'},
    {'1': 'verified', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'verified'},
    {'1': 'primary', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'primary'},
  ],
};

/// Descriptor for `Email`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailDescriptor = $convert.base64Decode(
    'CgVFbWFpbBJZCgVlbWFpbBgBIAEoCUJD4EECukg9ugE6Cgt2YWxpZF9lbWFpbBIbZW1haWwgbX'
    'VzdCBiZSBhIHZhbGlkIGVtYWlsGg50aGlzLmlzRW1haWwoKVIFZW1haWwSHwoIdmVyaWZpZWQY'
    'AiABKAhCA+BBA1IIdmVyaWZpZWQSHQoHcHJpbWFyeRgDIAEoCEID4EEDUgdwcmltYXJ5');

@$core.Deprecated('Use phoneNumberDescriptor instead')
const PhoneNumber$json = {
  '1': 'PhoneNumber',
  '2': [
    {
      '1': 'phone_number',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.i18n.phonenumbers.PhoneNumber',
      '8': {},
      '10': 'phoneNumber'
    },
    {'1': 'verified', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'verified'},
    {'1': 'primary', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'primary'},
  ],
};

/// Descriptor for `PhoneNumber`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneNumberDescriptor = $convert.base64Decode(
    'CgtQaG9uZU51bWJlchKqAQoMcGhvbmVfbnVtYmVyGAEgASgLMh4uaTE4bi5waG9uZW51bWJlcn'
    'MuUGhvbmVOdW1iZXJCZ+BBArpIYboBXgoSdmFsaWRfcGhvbmVfbnVtYmVyEihwaG9uZV9udW1i'
    'ZXIgbXVzdCBpbmNsdWRlIGEgY291bnRyeSBjb2RlGh50aGlzLnJhd19pbnB1dC5zdGFydHNXaX'
    'RoKCcrJylSC3Bob25lTnVtYmVyEh8KCHZlcmlmaWVkGAIgASgIQgPgQQNSCHZlcmlmaWVkEh0K'
    'B3ByaW1hcnkYAyABKAhCA+BBA1IHcHJpbWFyeQ==');

@$core.Deprecated('Use externalIdentityDescriptor instead')
const ExternalIdentity$json = {
  '1': 'ExternalIdentity',
  '2': [
    {
      '1': 'provider',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.auth.v1alpha1.IdentityProviderType',
      '8': {},
      '10': 'provider'
    },
    {'1': 'provider_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'providerId'},
  ],
};

/// Descriptor for `ExternalIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalIdentityDescriptor = $convert.base64Decode(
    'ChBFeHRlcm5hbElkZW50aXR5ElEKCHByb3ZpZGVyGAEgASgOMjAuY2VsZXN0LmNsb3VkLmF1dG'
    'gudjFhbHBoYTEuSWRlbnRpdHlQcm92aWRlclR5cGVCA+BBA1IIcHJvdmlkZXISJAoLcHJvdmlk'
    'ZXJfaWQYAiABKAlCA+BBA1IKcHJvdmlkZXJJZA==');

@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = {
  '1': 'CreateUserRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'user',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.User',
      '8': {},
      '10': 'user'
    },
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'userId'},
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

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVc2VyUmVxdWVzdBI1CgZwYXJlbnQYASABKAlCHeBBAvpBFxIVY2xvdWQuY2VsZX'
    'N0LmRldi9Vc2VyUgZwYXJlbnQSOQoEdXNlchgCIAEoCzIgLmNlbGVzdC5jbG91ZC5hdXRoLnYx'
    'YWxwaGExLlVzZXJCA+BBAlIEdXNlchIcCgd1c2VyX2lkGAMgASgJQgPgQQFSBnVzZXJJZBIoCg'
    '12YWxpZGF0ZV9vbmx5GAQgASgIQgPgQQFSDHZhbGlkYXRlT25seQ==');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBKLAQoEbmFtZRgBIAEoCUJ34EEC+kEXChVjbG91ZC5jZWxlc3QuZG'
    'V2L1VzZXK6SFe6AVQKGHZhbGlkX3VzZXJfcmVzb3VyY2VfbmFtZRIaaW52YWxpZCB1c2VyIHJl'
    'c291cmNlIG5hbWUaHHRoaXMubWF0Y2hlcygndXNlcnMvW14vXSskJylSBG5hbWU=');

@$core.Deprecated('Use listUsersRequestDescriptor instead')
const ListUsersRequest$json = {
  '1': 'ListUsersRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'orderBy'},
  ],
};

/// Descriptor for `ListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VXNlcnNSZXF1ZXN0ErUBCgZwYXJlbnQYASABKAlCnAHgQQL6QRcSFWNsb3VkLmNlbG'
    'VzdC5kZXYvVXNlcrpIfLoBeQoMdmFsaWRfcGFyZW50Eh1wYXJlbnQgbXVzdCBiZSBhIHZhbGlk'
    'IHBhcmVudBpKdGhpcy5tYXRjaGVzKCdeb3JnYW5pemF0aW9ucy9bXi9dKyR8Xm9yZ2FuaXphdG'
    'lvbnMvW14vXSsvcHJvamVjdHMvW14vXSskJylSBnBhcmVudBInCglwYWdlX3NpemUYAiABKAVC'
    'CuBBAbpIBBoCKABSCHBhZ2VTaXplEiIKCnBhZ2VfdG9rZW4YAyABKAlCA+BBAVIJcGFnZVRva2'
    'VuEhsKBmZpbHRlchgEIAEoCUID4EEBUgZmaWx0ZXISHgoIb3JkZXJfYnkYBSABKAlCA+BBAVIH'
    'b3JkZXJCeQ==');

@$core.Deprecated('Use listUsersResponseDescriptor instead')
const ListUsersResponse$json = {
  '1': 'ListUsersResponse',
  '2': [
    {
      '1': 'users',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.User',
      '10': 'users'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VXNlcnNSZXNwb25zZRI2CgV1c2VycxgBIAMoCzIgLmNlbGVzdC5jbG91ZC5hdXRoLn'
    'YxYWxwaGExLlVzZXJSBXVzZXJzEiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VU'
    'b2tlbg==');

@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = {
  '1': 'UpdateUserRequest',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.User',
      '8': {},
      '10': 'user'
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
      '1': 'validate_only',
      '3': 3,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'validateOnly'
    },
  ],
  '7': {},
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVVc2VyUmVxdWVzdBI5CgR1c2VyGAEgASgLMiAuY2VsZXN0LmNsb3VkLmF1dGgudj'
    'FhbHBoYTEuVXNlckID4EECUgR1c2VyEkAKC3VwZGF0ZV9tYXNrGAIgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLkZpZWxkTWFza0ID4EEBUgp1cGRhdGVNYXNrEigKDXZhbGlkYXRlX29ubHkYAyABKA'
    'hCA+BBAVIMdmFsaWRhdGVPbmx5OpQCukiQAhqNAgoQdmFsaWRfZmllbGRfbWFzaxJwdXBkYXRl'
    'X21hc2sgbWF5IG9ubHkgaW5jbHVkZTogJ2dpdmVuX25hbWUnLCAnZmFtaWx5X25hbWUnLCAnZW'
    '1haWwnLCAncGhvbmVfbnVtYmVyJywgJ3RpbWVfem9uZScsICdsYW5ndWFnZV9jb2RlJxqGAXRo'
    'aXMudXBkYXRlX21hc2sucGF0aHMuYWxsKHBhdGgsIHBhdGggaW4gWyduYW1lJywgJ2dpdmVuX2'
    '5hbWUnLCAnZmFtaWx5X25hbWUnLCAnZW1haWwnLCAncGhvbmVfbnVtYmVyJywgJ3RpbWVfem9u'
    'ZScsICdsYW5ndWFnZV9jb2RlJ10p');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'etag', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'etag'},
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
    {'1': 'force', '3': 5, '4': 1, '5': 8, '8': {}, '10': 'force'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdBKLAQoEbmFtZRgBIAEoCUJ34EEC+kEXChVjbG91ZC5jZWxlc3'
    'QuZGV2L1VzZXK6SFe6AVQKGHZhbGlkX3VzZXJfcmVzb3VyY2VfbmFtZRIaaW52YWxpZCB1c2Vy'
    'IHJlc291cmNlIG5hbWUaHHRoaXMubWF0Y2hlcygndXNlcnMvW14vXSskJylSBG5hbWUSFwoEZX'
    'RhZxgCIAEoCUID4EEBUgRldGFnEigKDWFsbG93X21pc3NpbmcYAyABKAhCA+BBAVIMYWxsb3dN'
    'aXNzaW5nEigKDXZhbGlkYXRlX29ubHkYBCABKAhCA+BBAVIMdmFsaWRhdGVPbmx5EhkKBWZvcm'
    'NlGAUgASgIQgPgQQFSBWZvcmNl');

@$core.Deprecated('Use userMembershipDescriptor instead')
const UserMembership$json = {
  '1': 'UserMembership',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'resource', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'resource'},
    {'1': 'user', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'user'},
    {'1': 'role', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'role'},
  ],
  '7': {},
};

/// Descriptor for `UserMembership`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userMembershipDescriptor = $convert.base64Decode(
    'Cg5Vc2VyTWVtYmVyc2hpcBIXCgRuYW1lGAEgASgJQgPgQQhSBG5hbWUSHwoIcmVzb3VyY2UYAi'
    'ABKAlCA+BBAlIIcmVzb3VyY2USMQoEdXNlchgDIAEoCUId4EEC+kEXChVjbG91ZC5jZWxlc3Qu'
    'ZGV2L1VzZXJSBHVzZXISFwoEcm9sZRgEIAEoCUID4EECUgRyb2xlOnHqQW4KH2Nsb3VkLmNlbG'
    'VzdC5kZXYvVXNlck1lbWJlcnNoaXASKnVzZXJzL3t1c2VyfS9tZW1iZXJzaGlwcy97dXNlcl9t'
    'ZW1iZXJzaGlwfSoPdXNlck1lbWJlcnNoaXBzMg51c2VyTWVtYmVyc2hpcA==');

@$core.Deprecated('Use getUserMembershipRequestDescriptor instead')
const GetUserMembershipRequest$json = {
  '1': 'GetUserMembershipRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetUserMembershipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserMembershipRequestDescriptor = $convert.base64Decode(
    'ChhHZXRVc2VyTWVtYmVyc2hpcFJlcXVlc3QSvgEKBG5hbWUYASABKAlCqQHgQQL6QSEKH2Nsb3'
    'VkLmNlbGVzdC5kZXYvVXNlck1lbWJlcnNoaXC6SH+6AXwKI3ZhbGlkX3VzZXJfbWVtYmVyc2hp'
    'cF9yZXNvdXJjZV9uYW1lEiVpbnZhbGlkIHVzZXIgbWVtYmVyc2hpcCByZXNvdXJjZSBuYW1lGi'
    '50aGlzLm1hdGNoZXMoJ3VzZXJzL1teL10rL21lbWJlcnNoaXBzL1teL10rJCcpUgRuYW1l');

@$core.Deprecated('Use listUserMembershipsRequestDescriptor instead')
const ListUserMembershipsRequest$json = {
  '1': 'ListUserMembershipsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
  ],
};

/// Descriptor for `ListUserMembershipsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUserMembershipsRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0VXNlck1lbWJlcnNoaXBzUmVxdWVzdBKQAQoGcGFyZW50GAEgASgJQnjgQQL6QSESH2'
    'Nsb3VkLmNlbGVzdC5kZXYvVXNlck1lbWJlcnNoaXC6SE66AUsKDHZhbGlkX3BhcmVudBIdcGFy'
    'ZW50IG11c3QgYmUgYSB2YWxpZCBwYXJlbnQaHHRoaXMubWF0Y2hlcygndXNlcnMvW14vXSskJy'
    'lSBnBhcmVudBInCglwYWdlX3NpemUYAiABKAVCCuBBAbpIBBoCKABSCHBhZ2VTaXplEiIKCnBh'
    'Z2VfdG9rZW4YAyABKAlCA+BBAVIJcGFnZVRva2VuEhsKBmZpbHRlchgEIAEoCUID4EEBUgZmaW'
    'x0ZXI=');

@$core.Deprecated('Use listUserMembershipsResponseDescriptor instead')
const ListUserMembershipsResponse$json = {
  '1': 'ListUserMembershipsResponse',
  '2': [
    {
      '1': 'user_memberships',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.UserMembership',
      '10': 'userMemberships'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListUserMembershipsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUserMembershipsResponseDescriptor =
    $convert.base64Decode(
        'ChtMaXN0VXNlck1lbWJlcnNoaXBzUmVzcG9uc2USVQoQdXNlcl9tZW1iZXJzaGlwcxgBIAMoCz'
        'IqLmNlbGVzdC5jbG91ZC5hdXRoLnYxYWxwaGExLlVzZXJNZW1iZXJzaGlwUg91c2VyTWVtYmVy'
        'c2hpcHMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');

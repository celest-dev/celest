//
//  Generated code. Do not modify.
//  source: celest/ast/v1/resolved_ast.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resolvedProjectDescriptor instead')
const ResolvedProject$json = {
  '1': 'ResolvedProject',
  '2': [
    {'1': 'project_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'projectId'},
    {
      '1': 'environment_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'environmentId'
    },
    {
      '1': 'apis',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedProject.ApisEntry',
      '8': {},
      '10': 'apis'
    },
    {
      '1': 'variables',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedVariable',
      '8': {},
      '10': 'variables'
    },
    {
      '1': 'secrets',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'secrets'
    },
    {
      '1': 'auth',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedAuth',
      '8': {},
      '10': 'auth'
    },
    {
      '1': 'databases',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedProject.DatabasesEntry',
      '8': {},
      '10': 'databases'
    },
    {
      '1': 'sdk_config',
      '3': 99,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.SdkConfiguration',
      '8': {},
      '10': 'sdkConfig'
    },
  ],
  '3': [ResolvedProject_ApisEntry$json, ResolvedProject_DatabasesEntry$json],
};

@$core.Deprecated('Use resolvedProjectDescriptor instead')
const ResolvedProject_ApisEntry$json = {
  '1': 'ApisEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedApi',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use resolvedProjectDescriptor instead')
const ResolvedProject_DatabasesEntry$json = {
  '1': 'DatabasesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedDatabase',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `ResolvedProject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedProjectDescriptor = $convert.base64Decode(
    'Cg9SZXNvbHZlZFByb2plY3QSIgoKcHJvamVjdF9pZBgBIAEoCUID4EECUglwcm9qZWN0SWQSKg'
    'oOZW52aXJvbm1lbnRfaWQYAiABKAlCA+BBAlINZW52aXJvbm1lbnRJZBJBCgRhcGlzGAMgAygL'
    'MiguY2VsZXN0LmFzdC52MS5SZXNvbHZlZFByb2plY3QuQXBpc0VudHJ5QgPgQQFSBGFwaXMSQg'
    'oJdmFyaWFibGVzGAQgAygLMh8uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFZhcmlhYmxlQgPgQQFS'
    'CXZhcmlhYmxlcxI8CgdzZWNyZXRzGAUgAygLMh0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3'
    'JldEID4EEBUgdzZWNyZXRzEjQKBGF1dGgYBiABKAsyGy5jZWxlc3QuYXN0LnYxLlJlc29sdmVk'
    'QXV0aEID4EEBUgRhdXRoElAKCWRhdGFiYXNlcxgHIAMoCzItLmNlbGVzdC5hc3QudjEuUmVzb2'
    'x2ZWRQcm9qZWN0LkRhdGFiYXNlc0VudHJ5QgPgQQFSCWRhdGFiYXNlcxJDCgpzZGtfY29uZmln'
    'GGMgASgLMh8uY2VsZXN0LmFzdC52MS5TZGtDb25maWd1cmF0aW9uQgPgQQJSCXNka0NvbmZpZx'
    'pTCglBcGlzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSMAoFdmFsdWUYAiABKAsyGi5jZWxlc3Qu'
    'YXN0LnYxLlJlc29sdmVkQXBpUgV2YWx1ZToCOAEaXQoORGF0YWJhc2VzRW50cnkSEAoDa2V5GA'
    'EgASgJUgNrZXkSNQoFdmFsdWUYAiABKAsyHy5jZWxlc3QuYXN0LnYxLlJlc29sdmVkRGF0YWJh'
    'c2VSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use resolvedApiDescriptor instead')
const ResolvedApi$json = {
  '1': 'ResolvedApi',
  '2': [
    {'1': 'api_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'apiId'},
    {
      '1': 'functions',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedApi.FunctionsEntry',
      '8': {},
      '10': 'functions'
    },
    {
      '1': 'policy_set',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PolicySet',
      '8': {},
      '10': 'policySet'
    },
  ],
  '3': [ResolvedApi_FunctionsEntry$json],
};

@$core.Deprecated('Use resolvedApiDescriptor instead')
const ResolvedApi_FunctionsEntry$json = {
  '1': 'FunctionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedFunction',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `ResolvedApi`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedApiDescriptor = $convert.base64Decode(
    'CgtSZXNvbHZlZEFwaRIaCgZhcGlfaWQYASABKAlCA+BBAlIFYXBpSWQSTAoJZnVuY3Rpb25zGA'
    'IgAygLMikuY2VsZXN0LmFzdC52MS5SZXNvbHZlZEFwaS5GdW5jdGlvbnNFbnRyeUID4EECUglm'
    'dW5jdGlvbnMSNwoKcG9saWN5X3NldBgDIAEoCzITLmNlZGFyLnYzLlBvbGljeVNldEID4EEBUg'
    'lwb2xpY3lTZXQaXQoORnVuY3Rpb25zRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSNQoFdmFsdWUY'
    'AiABKAsyHy5jZWxlc3QuYXN0LnYxLlJlc29sdmVkRnVuY3Rpb25SBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use resolvedFunctionDescriptor instead')
const ResolvedFunction$json = {
  '1': 'ResolvedFunction',
  '2': [
    {'1': 'function_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'functionId'},
    {'1': 'parent_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'parentId'},
    {
      '1': 'http_config',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedHttpConfig',
      '8': {},
      '10': 'httpConfig'
    },
    {
      '1': 'stream_config',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedStreamConfig',
      '8': {},
      '10': 'streamConfig'
    },
    {'1': 'variables', '3': 5, '4': 3, '5': 9, '8': {}, '10': 'variables'},
    {'1': 'secrets', '3': 6, '4': 3, '5': 9, '8': {}, '10': 'secrets'},
    {
      '1': 'policy_set',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PolicySet',
      '8': {},
      '10': 'policySet'
    },
  ],
};

/// Descriptor for `ResolvedFunction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedFunctionDescriptor = $convert.base64Decode(
    'ChBSZXNvbHZlZEZ1bmN0aW9uEiQKC2Z1bmN0aW9uX2lkGAEgASgJQgPgQQJSCmZ1bmN0aW9uSW'
    'QSIAoJcGFyZW50X2lkGAIgASgJQgPgQQJSCHBhcmVudElkEkcKC2h0dHBfY29uZmlnGAMgASgL'
    'MiEuY2VsZXN0LmFzdC52MS5SZXNvbHZlZEh0dHBDb25maWdCA+BBAlIKaHR0cENvbmZpZxJNCg'
    '1zdHJlYW1fY29uZmlnGAQgASgLMiMuY2VsZXN0LmFzdC52MS5SZXNvbHZlZFN0cmVhbUNvbmZp'
    'Z0ID4EECUgxzdHJlYW1Db25maWcSIQoJdmFyaWFibGVzGAUgAygJQgPgQQFSCXZhcmlhYmxlcx'
    'IdCgdzZWNyZXRzGAYgAygJQgPgQQFSB3NlY3JldHMSNwoKcG9saWN5X3NldBgHIAEoCzITLmNl'
    'ZGFyLnYzLlBvbGljeVNldEID4EEBUglwb2xpY3lTZXQ=');

@$core.Deprecated('Use resolvedHttpConfigDescriptor instead')
const ResolvedHttpConfig$json = {
  '1': 'ResolvedHttpConfig',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'status'},
    {
      '1': 'route',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedHttpRoute',
      '8': {},
      '10': 'route'
    },
    {
      '1': 'additional_routes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedHttpRoute',
      '8': {},
      '10': 'additionalRoutes'
    },
    {
      '1': 'status_mappings',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedHttpConfig.StatusMappingsEntry',
      '8': {},
      '10': 'statusMappings'
    },
  ],
  '3': [ResolvedHttpConfig_StatusMappingsEntry$json],
};

@$core.Deprecated('Use resolvedHttpConfigDescriptor instead')
const ResolvedHttpConfig_StatusMappingsEntry$json = {
  '1': 'StatusMappingsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ResolvedHttpConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedHttpConfigDescriptor = $convert.base64Decode(
    'ChJSZXNvbHZlZEh0dHBDb25maWcSGwoGc3RhdHVzGAEgASgFQgPgQQJSBnN0YXR1cxI7CgVyb3'
    'V0ZRgCIAEoCzIgLmNlbGVzdC5hc3QudjEuUmVzb2x2ZWRIdHRwUm91dGVCA+BBAlIFcm91dGUS'
    'UgoRYWRkaXRpb25hbF9yb3V0ZXMYAyADKAsyIC5jZWxlc3QuYXN0LnYxLlJlc29sdmVkSHR0cF'
    'JvdXRlQgPgQQFSEGFkZGl0aW9uYWxSb3V0ZXMSYwoPc3RhdHVzX21hcHBpbmdzGAQgAygLMjUu'
    'Y2VsZXN0LmFzdC52MS5SZXNvbHZlZEh0dHBDb25maWcuU3RhdHVzTWFwcGluZ3NFbnRyeUID4E'
    'ECUg5zdGF0dXNNYXBwaW5ncxpBChNTdGF0dXNNYXBwaW5nc0VudHJ5EhAKA2tleRgBIAEoCVID'
    'a2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use resolvedHttpRouteDescriptor instead')
const ResolvedHttpRoute$json = {
  '1': 'ResolvedHttpRoute',
  '2': [
    {'1': 'method', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'method'},
    {'1': 'path', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'path'},
  ],
};

/// Descriptor for `ResolvedHttpRoute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedHttpRouteDescriptor = $convert.base64Decode(
    'ChFSZXNvbHZlZEh0dHBSb3V0ZRIbCgZtZXRob2QYASABKAlCA+BBAlIGbWV0aG9kEhcKBHBhdG'
    'gYAiABKAlCA+BBAlIEcGF0aA==');

@$core.Deprecated('Use resolvedStreamConfigDescriptor instead')
const ResolvedStreamConfig$json = {
  '1': 'ResolvedStreamConfig',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.ResolvedStreamConfig.Type',
      '8': {},
      '10': 'type'
    },
  ],
  '4': [ResolvedStreamConfig_Type$json],
};

@$core.Deprecated('Use resolvedStreamConfigDescriptor instead')
const ResolvedStreamConfig_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'STREAM_CONFIG_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'UNIDIRECTIONAL_CLIENT', '2': 1},
    {'1': 'UNIDIRECTIONAL_SERVER', '2': 2},
    {'1': 'BIDIRECTIONAL', '2': 3},
  ],
};

/// Descriptor for `ResolvedStreamConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedStreamConfigDescriptor = $convert.base64Decode(
    'ChRSZXNvbHZlZFN0cmVhbUNvbmZpZxJBCgR0eXBlGAEgASgOMiguY2VsZXN0LmFzdC52MS5SZX'
    'NvbHZlZFN0cmVhbUNvbmZpZy5UeXBlQgPgQQJSBHR5cGUicwoEVHlwZRIiCh5TVFJFQU1fQ09O'
    'RklHX1RZUEVfVU5TUEVDSUZJRUQQABIZChVVTklESVJFQ1RJT05BTF9DTElFTlQQARIZChVVTk'
    'lESVJFQ1RJT05BTF9TRVJWRVIQAhIRCg1CSURJUkVDVElPTkFMEAM=');

@$core.Deprecated('Use resolvedVariableDescriptor instead')
const ResolvedVariable$json = {
  '1': 'ResolvedVariable',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'value'},
  ],
};

/// Descriptor for `ResolvedVariable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedVariableDescriptor = $convert.base64Decode(
    'ChBSZXNvbHZlZFZhcmlhYmxlEhcKBG5hbWUYASABKAlCA+BBAlIEbmFtZRIZCgV2YWx1ZRgCIA'
    'EoCUID4EECUgV2YWx1ZQ==');

@$core.Deprecated('Use resolvedSecretDescriptor instead')
const ResolvedSecret$json = {
  '1': 'ResolvedSecret',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'value',
      '17': true
    },
  ],
  '8': [
    {'1': '_value'},
  ],
};

/// Descriptor for `ResolvedSecret`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedSecretDescriptor = $convert.base64Decode(
    'Cg5SZXNvbHZlZFNlY3JldBIXCgRuYW1lGAEgASgJQgPgQQJSBG5hbWUSIQoFdmFsdWUYAiABKA'
    'lCBuBBBOBBAkgAUgV2YWx1ZYgBAUIICgZfdmFsdWU=');

@$core.Deprecated('Use resolvedAuthDescriptor instead')
const ResolvedAuth$json = {
  '1': 'ResolvedAuth',
  '2': [
    {
      '1': 'providers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedAuthProvider',
      '8': {},
      '10': 'providers'
    },
    {
      '1': 'external_providers',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedExternalAuthProvider',
      '8': {},
      '10': 'externalProviders'
    },
  ],
};

/// Descriptor for `ResolvedAuth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedAuthDescriptor = $convert.base64Decode(
    'CgxSZXNvbHZlZEF1dGgSRgoJcHJvdmlkZXJzGAEgAygLMiMuY2VsZXN0LmFzdC52MS5SZXNvbH'
    'ZlZEF1dGhQcm92aWRlckID4EEBUglwcm92aWRlcnMSXwoSZXh0ZXJuYWxfcHJvdmlkZXJzGAIg'
    'AygLMisuY2VsZXN0LmFzdC52MS5SZXNvbHZlZEV4dGVybmFsQXV0aFByb3ZpZGVyQgPgQQFSEW'
    'V4dGVybmFsUHJvdmlkZXJz');

@$core.Deprecated('Use resolvedAuthProviderDescriptor instead')
const ResolvedAuthProvider$json = {
  '1': 'ResolvedAuthProvider',
  '2': [
    {
      '1': 'auth_provider_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'authProviderId'
    },
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.ResolvedAuthProvider.Type',
      '8': {},
      '10': 'type'
    },
    {
      '1': 'email_otp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedEmailOtpProviderConfig',
      '9': 0,
      '10': 'emailOtp'
    },
    {
      '1': 'sms_otp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSmsOtpProviderConfig',
      '9': 0,
      '10': 'smsOtp'
    },
    {
      '1': 'google',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedGoogleOAuthProviderConfig',
      '9': 0,
      '10': 'google'
    },
    {
      '1': 'github',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedGitHubOAuthProviderConfig',
      '9': 0,
      '10': 'github'
    },
    {
      '1': 'apple',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedAppleOAuthProviderConfig',
      '9': 0,
      '10': 'apple'
    },
  ],
  '4': [ResolvedAuthProvider_Type$json],
  '8': [
    {'1': 'config'},
  ],
};

@$core.Deprecated('Use resolvedAuthProviderDescriptor instead')
const ResolvedAuthProvider_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'AUTH_PROVIDER_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'EMAIL_OTP', '2': 1},
    {'1': 'SMS_OTP', '2': 2},
    {'1': 'GOOGLE', '2': 3},
    {'1': 'GITHUB', '2': 4},
    {'1': 'APPLE', '2': 5},
  ],
};

/// Descriptor for `ResolvedAuthProvider`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedAuthProviderDescriptor = $convert.base64Decode(
    'ChRSZXNvbHZlZEF1dGhQcm92aWRlchItChBhdXRoX3Byb3ZpZGVyX2lkGAEgASgJQgPgQQJSDm'
    'F1dGhQcm92aWRlcklkEkEKBHR5cGUYAiABKA4yKC5jZWxlc3QuYXN0LnYxLlJlc29sdmVkQXV0'
    'aFByb3ZpZGVyLlR5cGVCA+BBAlIEdHlwZRJMCgllbWFpbF9vdHAYAyABKAsyLS5jZWxlc3QuYX'
    'N0LnYxLlJlc29sdmVkRW1haWxPdHBQcm92aWRlckNvbmZpZ0gAUghlbWFpbE90cBJGCgdzbXNf'
    'b3RwGAQgASgLMisuY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNtc090cFByb3ZpZGVyQ29uZmlnSA'
    'BSBnNtc090cBJKCgZnb29nbGUYBSABKAsyMC5jZWxlc3QuYXN0LnYxLlJlc29sdmVkR29vZ2xl'
    'T0F1dGhQcm92aWRlckNvbmZpZ0gAUgZnb29nbGUSSgoGZ2l0aHViGAYgASgLMjAuY2VsZXN0Lm'
    'FzdC52MS5SZXNvbHZlZEdpdEh1Yk9BdXRoUHJvdmlkZXJDb25maWdIAFIGZ2l0aHViEkcKBWFw'
    'cGxlGAcgASgLMi8uY2VsZXN0LmFzdC52MS5SZXNvbHZlZEFwcGxlT0F1dGhQcm92aWRlckNvbm'
    'ZpZ0gAUgVhcHBsZSJpCgRUeXBlEiIKHkFVVEhfUFJPVklERVJfVFlQRV9VTlNQRUNJRklFRBAA'
    'Eg0KCUVNQUlMX09UUBABEgsKB1NNU19PVFAQAhIKCgZHT09HTEUQAxIKCgZHSVRIVUIQBBIJCg'
    'VBUFBMRRAFQggKBmNvbmZpZw==');

@$core.Deprecated('Use resolvedEmailOtpProviderConfigDescriptor instead')
const ResolvedEmailOtpProviderConfig$json = {
  '1': 'ResolvedEmailOtpProviderConfig',
};

/// Descriptor for `ResolvedEmailOtpProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedEmailOtpProviderConfigDescriptor =
    $convert.base64Decode('Ch5SZXNvbHZlZEVtYWlsT3RwUHJvdmlkZXJDb25maWc=');

@$core.Deprecated('Use resolvedSmsOtpProviderConfigDescriptor instead')
const ResolvedSmsOtpProviderConfig$json = {
  '1': 'ResolvedSmsOtpProviderConfig',
};

/// Descriptor for `ResolvedSmsOtpProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedSmsOtpProviderConfigDescriptor =
    $convert.base64Decode('ChxSZXNvbHZlZFNtc090cFByb3ZpZGVyQ29uZmln');

@$core.Deprecated('Use resolvedGoogleOAuthProviderConfigDescriptor instead')
const ResolvedGoogleOAuthProviderConfig$json = {
  '1': 'ResolvedGoogleOAuthProviderConfig',
  '2': [
    {
      '1': 'client_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'clientId'
    },
    {
      '1': 'client_secret',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'clientSecret'
    },
  ],
};

/// Descriptor for `ResolvedGoogleOAuthProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedGoogleOAuthProviderConfigDescriptor =
    $convert.base64Decode(
        'CiFSZXNvbHZlZEdvb2dsZU9BdXRoUHJvdmlkZXJDb25maWcSPwoJY2xpZW50X2lkGAEgASgLMh'
        '0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldEID4EECUghjbGllbnRJZBJHCg1jbGllbnRf'
        'c2VjcmV0GAIgASgLMh0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldEID4EECUgxjbGllbn'
        'RTZWNyZXQ=');

@$core.Deprecated('Use resolvedGitHubOAuthProviderConfigDescriptor instead')
const ResolvedGitHubOAuthProviderConfig$json = {
  '1': 'ResolvedGitHubOAuthProviderConfig',
  '2': [
    {
      '1': 'client_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'clientId'
    },
    {
      '1': 'client_secret',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'clientSecret'
    },
  ],
};

/// Descriptor for `ResolvedGitHubOAuthProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedGitHubOAuthProviderConfigDescriptor =
    $convert.base64Decode(
        'CiFSZXNvbHZlZEdpdEh1Yk9BdXRoUHJvdmlkZXJDb25maWcSPwoJY2xpZW50X2lkGAEgASgLMh'
        '0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldEID4EECUghjbGllbnRJZBJHCg1jbGllbnRf'
        'c2VjcmV0GAIgASgLMh0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldEID4EECUgxjbGllbn'
        'RTZWNyZXQ=');

@$core.Deprecated('Use resolvedAppleOAuthProviderConfigDescriptor instead')
const ResolvedAppleOAuthProviderConfig$json = {
  '1': 'ResolvedAppleOAuthProviderConfig',
  '2': [
    {
      '1': 'client_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'clientId'
    },
    {
      '1': 'team_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'teamId'
    },
    {
      '1': 'key_id',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'keyId'
    },
    {
      '1': 'private_key',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'privateKey'
    },
  ],
};

/// Descriptor for `ResolvedAppleOAuthProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedAppleOAuthProviderConfigDescriptor = $convert.base64Decode(
    'CiBSZXNvbHZlZEFwcGxlT0F1dGhQcm92aWRlckNvbmZpZxI/CgljbGllbnRfaWQYASABKAsyHS'
    '5jZWxlc3QuYXN0LnYxLlJlc29sdmVkU2VjcmV0QgPgQQJSCGNsaWVudElkEjsKB3RlYW1faWQY'
    'AiABKAsyHS5jZWxlc3QuYXN0LnYxLlJlc29sdmVkU2VjcmV0QgPgQQJSBnRlYW1JZBI5CgZrZX'
    'lfaWQYAyABKAsyHS5jZWxlc3QuYXN0LnYxLlJlc29sdmVkU2VjcmV0QgPgQQJSBWtleUlkEkMK'
    'C3ByaXZhdGVfa2V5GAQgASgLMh0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldEID4EECUg'
    'pwcml2YXRlS2V5');

@$core.Deprecated('Use resolvedExternalAuthProviderDescriptor instead')
const ResolvedExternalAuthProvider$json = {
  '1': 'ResolvedExternalAuthProvider',
  '2': [
    {
      '1': 'auth_provider_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'authProviderId'
    },
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.ResolvedExternalAuthProvider.Type',
      '8': {},
      '10': 'type'
    },
    {
      '1': 'firebase',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedFirebaseExternalAuthProviderConfig',
      '9': 0,
      '10': 'firebase'
    },
    {
      '1': 'supabase',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSupabaseExternalAuthProviderConfig',
      '9': 0,
      '10': 'supabase'
    },
  ],
  '4': [ResolvedExternalAuthProvider_Type$json],
  '8': [
    {'1': 'config'},
  ],
};

@$core.Deprecated('Use resolvedExternalAuthProviderDescriptor instead')
const ResolvedExternalAuthProvider_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'EXTERNAL_AUTH_PROVIDER_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'FIREBASE', '2': 1},
    {'1': 'SUPABASE', '2': 2},
  ],
};

/// Descriptor for `ResolvedExternalAuthProvider`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedExternalAuthProviderDescriptor = $convert.base64Decode(
    'ChxSZXNvbHZlZEV4dGVybmFsQXV0aFByb3ZpZGVyEi0KEGF1dGhfcHJvdmlkZXJfaWQYASABKA'
    'lCA+BBAlIOYXV0aFByb3ZpZGVySWQSSQoEdHlwZRgCIAEoDjIwLmNlbGVzdC5hc3QudjEuUmVz'
    'b2x2ZWRFeHRlcm5hbEF1dGhQcm92aWRlci5UeXBlQgPgQQJSBHR5cGUSVwoIZmlyZWJhc2UYAy'
    'ABKAsyOS5jZWxlc3QuYXN0LnYxLlJlc29sdmVkRmlyZWJhc2VFeHRlcm5hbEF1dGhQcm92aWRl'
    'ckNvbmZpZ0gAUghmaXJlYmFzZRJXCghzdXBhYmFzZRgEIAEoCzI5LmNlbGVzdC5hc3QudjEuUm'
    'Vzb2x2ZWRTdXBhYmFzZUV4dGVybmFsQXV0aFByb3ZpZGVyQ29uZmlnSABSCHN1cGFiYXNlIk8K'
    'BFR5cGUSKwonRVhURVJOQUxfQVVUSF9QUk9WSURFUl9UWVBFX1VOU1BFQ0lGSUVEEAASDAoIRk'
    'lSRUJBU0UQARIMCghTVVBBQkFTRRACQggKBmNvbmZpZw==');

@$core.Deprecated(
    'Use resolvedFirebaseExternalAuthProviderConfigDescriptor instead')
const ResolvedFirebaseExternalAuthProviderConfig$json = {
  '1': 'ResolvedFirebaseExternalAuthProviderConfig',
  '2': [
    {
      '1': 'project_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedVariable',
      '8': {},
      '10': 'projectId'
    },
  ],
};

/// Descriptor for `ResolvedFirebaseExternalAuthProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    resolvedFirebaseExternalAuthProviderConfigDescriptor =
    $convert.base64Decode(
        'CipSZXNvbHZlZEZpcmViYXNlRXh0ZXJuYWxBdXRoUHJvdmlkZXJDb25maWcSQwoKcHJvamVjdF'
        '9pZBgBIAEoCzIfLmNlbGVzdC5hc3QudjEuUmVzb2x2ZWRWYXJpYWJsZUID4EECUglwcm9qZWN0'
        'SWQ=');

@$core.Deprecated(
    'Use resolvedSupabaseExternalAuthProviderConfigDescriptor instead')
const ResolvedSupabaseExternalAuthProviderConfig$json = {
  '1': 'ResolvedSupabaseExternalAuthProviderConfig',
  '2': [
    {
      '1': 'project_url',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedVariable',
      '8': {},
      '10': 'projectUrl'
    },
    {
      '1': 'jwt_secret',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'jwtSecret'
    },
  ],
};

/// Descriptor for `ResolvedSupabaseExternalAuthProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    resolvedSupabaseExternalAuthProviderConfigDescriptor =
    $convert.base64Decode(
        'CipSZXNvbHZlZFN1cGFiYXNlRXh0ZXJuYWxBdXRoUHJvdmlkZXJDb25maWcSRQoLcHJvamVjdF'
        '91cmwYASABKAsyHy5jZWxlc3QuYXN0LnYxLlJlc29sdmVkVmFyaWFibGVCA+BBAlIKcHJvamVj'
        'dFVybBJBCgpqd3Rfc2VjcmV0GAIgASgLMh0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldE'
        'ID4EEBUglqd3RTZWNyZXQ=');

@$core.Deprecated('Use resolvedDatabaseDescriptor instead')
const ResolvedDatabase$json = {
  '1': 'ResolvedDatabase',
  '2': [
    {'1': 'database_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'databaseId'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.ResolvedDatabase.Type',
      '8': {},
      '10': 'type'
    },
    {
      '1': 'schema',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedDatabaseSchema',
      '8': {},
      '10': 'schema'
    },
    {
      '1': 'celest',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedCelestDatabaseConfig',
      '9': 0,
      '10': 'celest'
    },
  ],
  '4': [ResolvedDatabase_Type$json],
  '8': [
    {'1': 'config'},
  ],
};

@$core.Deprecated('Use resolvedDatabaseDescriptor instead')
const ResolvedDatabase_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'DATABASE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'CELEST', '2': 1},
  ],
};

/// Descriptor for `ResolvedDatabase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedDatabaseDescriptor = $convert.base64Decode(
    'ChBSZXNvbHZlZERhdGFiYXNlEiQKC2RhdGFiYXNlX2lkGAEgASgJQgPgQQJSCmRhdGFiYXNlSW'
    'QSPQoEdHlwZRgCIAEoDjIkLmNlbGVzdC5hc3QudjEuUmVzb2x2ZWREYXRhYmFzZS5UeXBlQgPg'
    'QQJSBHR5cGUSQgoGc2NoZW1hGAMgASgLMiUuY2VsZXN0LmFzdC52MS5SZXNvbHZlZERhdGFiYX'
    'NlU2NoZW1hQgPgQQJSBnNjaGVtYRJFCgZjZWxlc3QYBCABKAsyKy5jZWxlc3QuYXN0LnYxLlJl'
    'c29sdmVkQ2VsZXN0RGF0YWJhc2VDb25maWdIAFIGY2VsZXN0IjEKBFR5cGUSHQoZREFUQUJBU0'
    'VfVFlQRV9VTlNQRUNJRklFRBAAEgoKBkNFTEVTVBABQggKBmNvbmZpZw==');

@$core.Deprecated('Use resolvedCelestDatabaseConfigDescriptor instead')
const ResolvedCelestDatabaseConfig$json = {
  '1': 'ResolvedCelestDatabaseConfig',
  '2': [
    {
      '1': 'hostname',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedVariable',
      '8': {},
      '10': 'hostname'
    },
    {
      '1': 'token',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'token'
    },
  ],
};

/// Descriptor for `ResolvedCelestDatabaseConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedCelestDatabaseConfigDescriptor =
    $convert.base64Decode(
        'ChxSZXNvbHZlZENlbGVzdERhdGFiYXNlQ29uZmlnEkAKCGhvc3RuYW1lGAEgASgLMh8uY2VsZX'
        'N0LmFzdC52MS5SZXNvbHZlZFZhcmlhYmxlQgPgQQJSCGhvc3RuYW1lEjgKBXRva2VuGAIgASgL'
        'Mh0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldEID4EECUgV0b2tlbg==');

@$core.Deprecated('Use resolvedDatabaseSchemaDescriptor instead')
const ResolvedDatabaseSchema$json = {
  '1': 'ResolvedDatabaseSchema',
  '2': [
    {
      '1': 'database_schema_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'databaseSchemaId'
    },
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.ResolvedDatabaseSchema.Type',
      '8': {},
      '10': 'type'
    },
    {
      '1': 'drift',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedDriftDatabaseSchema',
      '9': 0,
      '10': 'drift'
    },
  ],
  '4': [ResolvedDatabaseSchema_Type$json],
  '8': [
    {'1': 'schema'},
  ],
};

@$core.Deprecated('Use resolvedDatabaseSchemaDescriptor instead')
const ResolvedDatabaseSchema_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'DATABASE_SCHEMA_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'DRIFT', '2': 1},
  ],
};

/// Descriptor for `ResolvedDatabaseSchema`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedDatabaseSchemaDescriptor = $convert.base64Decode(
    'ChZSZXNvbHZlZERhdGFiYXNlU2NoZW1hEjEKEmRhdGFiYXNlX3NjaGVtYV9pZBgBIAEoCUID4E'
    'ECUhBkYXRhYmFzZVNjaGVtYUlkEkMKBHR5cGUYAiABKA4yKi5jZWxlc3QuYXN0LnYxLlJlc29s'
    'dmVkRGF0YWJhc2VTY2hlbWEuVHlwZUID4EECUgR0eXBlEkIKBWRyaWZ0GAMgASgLMiouY2VsZX'
    'N0LmFzdC52MS5SZXNvbHZlZERyaWZ0RGF0YWJhc2VTY2hlbWFIAFIFZHJpZnQiNwoEVHlwZRIk'
    'CiBEQVRBQkFTRV9TQ0hFTUFfVFlQRV9VTlNQRUNJRklFRBAAEgkKBURSSUZUEAFCCAoGc2NoZW'
    '1h');

@$core.Deprecated('Use resolvedDriftDatabaseSchemaDescriptor instead')
const ResolvedDriftDatabaseSchema$json = {
  '1': 'ResolvedDriftDatabaseSchema',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'version'},
    {
      '1': 'schema_json',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '8': {},
      '10': 'schemaJson'
    },
  ],
};

/// Descriptor for `ResolvedDriftDatabaseSchema`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedDriftDatabaseSchemaDescriptor =
    $convert.base64Decode(
        'ChtSZXNvbHZlZERyaWZ0RGF0YWJhc2VTY2hlbWESHQoHdmVyc2lvbhgBIAEoBUID4EECUgd2ZX'
        'JzaW9uEj0KC3NjaGVtYV9qc29uGAIgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdEID4EEC'
        'UgpzY2hlbWFKc29u');

@$core.Deprecated('Use sdkConfigurationDescriptor instead')
const SdkConfiguration$json = {
  '1': 'SdkConfiguration',
  '2': [
    {
      '1': 'celest',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Version',
      '8': {},
      '10': 'celest'
    },
    {
      '1': 'dart',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Sdk',
      '8': {},
      '10': 'dart'
    },
    {
      '1': 'flutter',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Sdk',
      '8': {},
      '9': 0,
      '10': 'flutter',
      '17': true
    },
    {
      '1': 'target_sdk',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.SdkType',
      '8': {},
      '10': 'targetSdk'
    },
    {
      '1': 'feature_flags',
      '3': 5,
      '4': 3,
      '5': 14,
      '6': '.celest.ast.v1.FeatureFlag',
      '8': {},
      '10': 'featureFlags'
    },
  ],
  '8': [
    {'1': '_flutter'},
  ],
};

/// Descriptor for `SdkConfiguration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkConfigurationDescriptor = $convert.base64Decode(
    'ChBTZGtDb25maWd1cmF0aW9uEjMKBmNlbGVzdBgBIAEoCzIWLmNlbGVzdC5hc3QudjEuVmVyc2'
    'lvbkID4EECUgZjZWxlc3QSKwoEZGFydBgCIAEoCzISLmNlbGVzdC5hc3QudjEuU2RrQgPgQQJS'
    'BGRhcnQSNgoHZmx1dHRlchgDIAEoCzISLmNlbGVzdC5hc3QudjEuU2RrQgPgQQFIAFIHZmx1dH'
    'RlcogBARI6Cgp0YXJnZXRfc2RrGAQgASgOMhYuY2VsZXN0LmFzdC52MS5TZGtUeXBlQgPgQQJS'
    'CXRhcmdldFNkaxJECg1mZWF0dXJlX2ZsYWdzGAUgAygOMhouY2VsZXN0LmFzdC52MS5GZWF0dX'
    'JlRmxhZ0ID4EEBUgxmZWF0dXJlRmxhZ3NCCgoIX2ZsdXR0ZXI=');

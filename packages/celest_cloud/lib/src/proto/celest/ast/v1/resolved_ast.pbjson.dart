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

@$core.Deprecated('Use sdkTypeDescriptor instead')
const SdkType$json = {
  '1': 'SdkType',
  '2': [
    {'1': 'SDK_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'DART', '2': 1},
    {'1': 'FLUTTER', '2': 2},
  ],
};

/// Descriptor for `SdkType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sdkTypeDescriptor = $convert.base64Decode(
    'CgdTZGtUeXBlEhgKFFNES19UWVBFX1VOU1BFQ0lGSUVEEAASCAoEREFSVBABEgsKB0ZMVVRURV'
    'IQAg==');

@$core.Deprecated('Use resolvedProjectDescriptor instead')
const ResolvedProject$json = {
  '1': 'ResolvedProject',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'apis',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedProject.ApisEntry',
      '8': {},
      '10': 'apis'
    },
    {
      '1': 'environment_variables',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedEnvironmentVariable',
      '8': {},
      '10': 'environmentVariables'
    },
    {
      '1': 'auth',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedAuth',
      '8': {},
      '10': 'auth'
    },
    {
      '1': 'sdk',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.SdkInfo',
      '8': {},
      '10': 'sdk'
    },
    {
      '1': 'feature_flags',
      '3': 6,
      '4': 3,
      '5': 14,
      '6': '.celest.ast.v1.FeatureFlag',
      '8': {},
      '10': 'featureFlags'
    },
    {
      '1': 'secrets',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedSecret',
      '8': {},
      '10': 'secrets'
    },
  ],
  '3': [ResolvedProject_ApisEntry$json],
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

/// Descriptor for `ResolvedProject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedProjectDescriptor = $convert.base64Decode(
    'Cg9SZXNvbHZlZFByb2plY3QSFwoEbmFtZRgBIAEoCUID4EECUgRuYW1lEkEKBGFwaXMYAiADKA'
    'syKC5jZWxlc3QuYXN0LnYxLlJlc29sdmVkUHJvamVjdC5BcGlzRW50cnlCA+BBAVIEYXBpcxJk'
    'ChVlbnZpcm9ubWVudF92YXJpYWJsZXMYAyADKAsyKi5jZWxlc3QuYXN0LnYxLlJlc29sdmVkRW'
    '52aXJvbm1lbnRWYXJpYWJsZUID4EEBUhRlbnZpcm9ubWVudFZhcmlhYmxlcxI0CgRhdXRoGAQg'
    'ASgLMhsuY2VsZXN0LmFzdC52MS5SZXNvbHZlZEF1dGhCA+BBAVIEYXV0aBItCgNzZGsYBSABKA'
    'syFi5jZWxlc3QuYXN0LnYxLlNka0luZm9CA+BBAlIDc2RrEkQKDWZlYXR1cmVfZmxhZ3MYBiAD'
    'KA4yGi5jZWxlc3QuYXN0LnYxLkZlYXR1cmVGbGFnQgPgQQFSDGZlYXR1cmVGbGFncxI8CgdzZW'
    'NyZXRzGAcgAygLMh0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZFNlY3JldEID4EEBUgdzZWNyZXRz'
    'GlMKCUFwaXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIwCgV2YWx1ZRgCIAEoCzIaLmNlbGVzdC'
    '5hc3QudjEuUmVzb2x2ZWRBcGlSBXZhbHVlOgI4AQ==');

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
    {'1': 'api_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'apiId'},
    {
      '1': 'http',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedHttpConfig',
      '8': {},
      '10': 'http'
    },
    {
      '1': 'client_streaming',
      '3': 4,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'clientStreaming'
    },
    {
      '1': 'server_streaming',
      '3': 5,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'serverStreaming'
    },
    {
      '1': 'environment_variables',
      '3': 6,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'environmentVariables'
    },
    {'1': 'secrets', '3': 7, '4': 3, '5': 9, '8': {}, '10': 'secrets'},
    {
      '1': 'policy_set',
      '3': 8,
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
    'QSGgoGYXBpX2lkGAIgASgJQgPgQQJSBWFwaUlkEjoKBGh0dHAYAyABKAsyIS5jZWxlc3QuYXN0'
    'LnYxLlJlc29sdmVkSHR0cENvbmZpZ0ID4EECUgRodHRwEi4KEGNsaWVudF9zdHJlYW1pbmcYBC'
    'ABKAhCA+BBAVIPY2xpZW50U3RyZWFtaW5nEi4KEHNlcnZlcl9zdHJlYW1pbmcYBSABKAhCA+BB'
    'AVIPc2VydmVyU3RyZWFtaW5nEjgKFWVudmlyb25tZW50X3ZhcmlhYmxlcxgGIAMoCUID4EEBUh'
    'RlbnZpcm9ubWVudFZhcmlhYmxlcxIdCgdzZWNyZXRzGAcgAygJQgPgQQFSB3NlY3JldHMSNwoK'
    'cG9saWN5X3NldBgIIAEoCzITLmNlZGFyLnYzLlBvbGljeVNldEID4EEBUglwb2xpY3lTZXQ=');

@$core.Deprecated('Use resolvedHttpConfigDescriptor instead')
const ResolvedHttpConfig$json = {
  '1': 'ResolvedHttpConfig',
  '2': [
    {'1': 'method', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'method'},
    {
      '1': 'path',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.HttpPath',
      '8': {},
      '10': 'path'
    },
    {'1': 'status_code', '3': 3, '4': 1, '5': 5, '8': {}, '10': 'statusCode'},
    {
      '1': 'error_status',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.ResolvedHttpConfig.ErrorStatusEntry',
      '8': {},
      '10': 'errorStatus'
    },
  ],
  '3': [ResolvedHttpConfig_ErrorStatusEntry$json],
};

@$core.Deprecated('Use resolvedHttpConfigDescriptor instead')
const ResolvedHttpConfig_ErrorStatusEntry$json = {
  '1': 'ErrorStatusEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ResolvedHttpConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedHttpConfigDescriptor = $convert.base64Decode(
    'ChJSZXNvbHZlZEh0dHBDb25maWcSGwoGbWV0aG9kGAEgASgJQgPgQQJSBm1ldGhvZBIwCgRwYX'
    'RoGAIgASgLMhcuY2VsZXN0LmFzdC52MS5IdHRwUGF0aEID4EECUgRwYXRoEiQKC3N0YXR1c19j'
    'b2RlGAMgASgFQgPgQQJSCnN0YXR1c0NvZGUSWgoMZXJyb3Jfc3RhdHVzGAQgAygLMjIuY2VsZX'
    'N0LmFzdC52MS5SZXNvbHZlZEh0dHBDb25maWcuRXJyb3JTdGF0dXNFbnRyeUID4EECUgtlcnJv'
    'clN0YXR1cxo+ChBFcnJvclN0YXR1c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGA'
    'IgASgFUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use httpPathDescriptor instead')
const HttpPath$json = {
  '1': 'HttpPath',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'path'},
    {
      '1': 'parameters',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.celest.ast.v1.HttpPath.ParametersEntry',
      '8': {},
      '10': 'parameters'
    },
  ],
  '3': [HttpPath_ParametersEntry$json],
};

@$core.Deprecated('Use httpPathDescriptor instead')
const HttpPath_ParametersEntry$json = {
  '1': 'ParametersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.HttpParameter',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `HttpPath`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpPathDescriptor = $convert.base64Decode(
    'CghIdHRwUGF0aBIXCgRwYXRoGAEgASgJQgPgQQJSBHBhdGgSTAoKcGFyYW1ldGVycxgCIAMoCz'
    'InLmNlbGVzdC5hc3QudjEuSHR0cFBhdGguUGFyYW1ldGVyc0VudHJ5QgPgQQFSCnBhcmFtZXRl'
    'cnMaWwoPUGFyYW1ldGVyc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EjIKBXZhbHVlGAIgASgLMh'
    'wuY2VsZXN0LmFzdC52MS5IdHRwUGFyYW1ldGVyUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use httpParameterDescriptor instead')
const HttpParameter$json = {
  '1': 'HttpParameter',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'type'},
    {'1': 'required', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'required'},
  ],
};

/// Descriptor for `HttpParameter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpParameterDescriptor = $convert.base64Decode(
    'Cg1IdHRwUGFyYW1ldGVyEhcKBG5hbWUYASABKAlCA+BBAlIEbmFtZRIXCgR0eXBlGAIgASgJQg'
    'PgQQJSBHR5cGUSHwoIcmVxdWlyZWQYAyABKAhCA+BBAlIIcmVxdWlyZWQ=');

@$core.Deprecated('Use resolvedEnvironmentVariableDescriptor instead')
const ResolvedEnvironmentVariable$json = {
  '1': 'ResolvedEnvironmentVariable',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'value'},
  ],
};

/// Descriptor for `ResolvedEnvironmentVariable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedEnvironmentVariableDescriptor =
    $convert.base64Decode(
        'ChtSZXNvbHZlZEVudmlyb25tZW50VmFyaWFibGUSFwoEbmFtZRgBIAEoCUID4EECUgRuYW1lEh'
        'kKBXZhbHVlGAIgASgJQgPgQQJSBXZhbHVl');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
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
    'ChRSZXNvbHZlZEF1dGhQcm92aWRlchITCgJpZBgBIAEoCUID4EECUgJpZBJBCgR0eXBlGAIgAS'
    'gOMiguY2VsZXN0LmFzdC52MS5SZXNvbHZlZEF1dGhQcm92aWRlci5UeXBlQgPgQQJSBHR5cGUS'
    'TAoJZW1haWxfb3RwGAMgASgLMi0uY2VsZXN0LmFzdC52MS5SZXNvbHZlZEVtYWlsT3RwUHJvdm'
    'lkZXJDb25maWdIAFIIZW1haWxPdHASRgoHc21zX290cBgEIAEoCzIrLmNlbGVzdC5hc3QudjEu'
    'UmVzb2x2ZWRTbXNPdHBQcm92aWRlckNvbmZpZ0gAUgZzbXNPdHASSgoGZ29vZ2xlGAUgASgLMj'
    'AuY2VsZXN0LmFzdC52MS5SZXNvbHZlZEdvb2dsZU9BdXRoUHJvdmlkZXJDb25maWdIAFIGZ29v'
    'Z2xlEkoKBmdpdGh1YhgGIAEoCzIwLmNlbGVzdC5hc3QudjEuUmVzb2x2ZWRHaXRIdWJPQXV0aF'
    'Byb3ZpZGVyQ29uZmlnSABSBmdpdGh1YhJHCgVhcHBsZRgHIAEoCzIvLmNlbGVzdC5hc3QudjEu'
    'UmVzb2x2ZWRBcHBsZU9BdXRoUHJvdmlkZXJDb25maWdIAFIFYXBwbGUiaQoEVHlwZRIiCh5BVV'
    'RIX1BST1ZJREVSX1RZUEVfVU5TUEVDSUZJRUQQABINCglFTUFJTF9PVFAQARILCgdTTVNfT1RQ'
    'EAISCgoGR09PR0xFEAMSCgoGR0lUSFVCEAQSCQoFQVBQTEUQBUIICgZjb25maWc=');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
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
    'ChxSZXNvbHZlZEV4dGVybmFsQXV0aFByb3ZpZGVyEhMKAmlkGAEgASgJQgPgQQJSAmlkEkkKBH'
    'R5cGUYAiABKA4yMC5jZWxlc3QuYXN0LnYxLlJlc29sdmVkRXh0ZXJuYWxBdXRoUHJvdmlkZXIu'
    'VHlwZUID4EECUgR0eXBlElcKCGZpcmViYXNlGAMgASgLMjkuY2VsZXN0LmFzdC52MS5SZXNvbH'
    'ZlZEZpcmViYXNlRXh0ZXJuYWxBdXRoUHJvdmlkZXJDb25maWdIAFIIZmlyZWJhc2USVwoIc3Vw'
    'YWJhc2UYBCABKAsyOS5jZWxlc3QuYXN0LnYxLlJlc29sdmVkU3VwYWJhc2VFeHRlcm5hbEF1dG'
    'hQcm92aWRlckNvbmZpZ0gAUghzdXBhYmFzZSJPCgRUeXBlEisKJ0VYVEVSTkFMX0FVVEhfUFJP'
    'VklERVJfVFlQRV9VTlNQRUNJRklFRBAAEgwKCEZJUkVCQVNFEAESDAoIU1VQQUJBU0UQAkIICg'
    'Zjb25maWc=');

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
      '6': '.celest.ast.v1.ResolvedEnvironmentVariable',
      '8': {},
      '10': 'projectId'
    },
  ],
};

/// Descriptor for `ResolvedFirebaseExternalAuthProviderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    resolvedFirebaseExternalAuthProviderConfigDescriptor =
    $convert.base64Decode(
        'CipSZXNvbHZlZEZpcmViYXNlRXh0ZXJuYWxBdXRoUHJvdmlkZXJDb25maWcSTgoKcHJvamVjdF'
        '9pZBgBIAEoCzIqLmNlbGVzdC5hc3QudjEuUmVzb2x2ZWRFbnZpcm9ubWVudFZhcmlhYmxlQgPg'
        'QQJSCXByb2plY3RJZA==');

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
      '6': '.celest.ast.v1.ResolvedEnvironmentVariable',
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
        'CipSZXNvbHZlZFN1cGFiYXNlRXh0ZXJuYWxBdXRoUHJvdmlkZXJDb25maWcSUAoLcHJvamVjdF'
        '91cmwYASABKAsyKi5jZWxlc3QuYXN0LnYxLlJlc29sdmVkRW52aXJvbm1lbnRWYXJpYWJsZUID'
        '4EECUgpwcm9qZWN0VXJsEkEKCmp3dF9zZWNyZXQYAiABKAsyHS5jZWxlc3QuYXN0LnYxLlJlc2'
        '9sdmVkU2VjcmV0QgPgQQFSCWp3dFNlY3JldA==');

@$core.Deprecated('Use sdkInfoDescriptor instead')
const SdkInfo$json = {
  '1': 'SdkInfo',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.SdkType',
      '8': {},
      '10': 'type'
    },
    {
      '1': 'version',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Version',
      '8': {},
      '10': 'version'
    },
    {
      '1': 'enabled_experiments',
      '3': 3,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'enabledExperiments'
    },
  ],
};

/// Descriptor for `SdkInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkInfoDescriptor = $convert.base64Decode(
    'CgdTZGtJbmZvEi8KBHR5cGUYASABKA4yFi5jZWxlc3QuYXN0LnYxLlNka1R5cGVCA+BBAlIEdH'
    'lwZRI1Cgd2ZXJzaW9uGAIgASgLMhYuY2VsZXN0LmFzdC52MS5WZXJzaW9uQgPgQQJSB3ZlcnNp'
    'b24SNAoTZW5hYmxlZF9leHBlcmltZW50cxgDIAMoCUID4EEBUhJlbmFibGVkRXhwZXJpbWVudH'
    'M=');

@$core.Deprecated('Use versionDescriptor instead')
const Version$json = {
  '1': 'Version',
  '2': [
    {'1': 'major', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'major'},
    {'1': 'minor', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'minor'},
    {'1': 'patch', '3': 3, '4': 1, '5': 5, '8': {}, '10': 'patch'},
    {
      '1': 'pre_release',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Value',
      '8': {},
      '10': 'preRelease'
    },
    {
      '1': 'build',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Value',
      '8': {},
      '10': 'build'
    },
    {
      '1': 'canonicalized_version',
      '3': 6,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'canonicalizedVersion'
    },
  ],
};

/// Descriptor for `Version`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionDescriptor = $convert.base64Decode(
    'CgdWZXJzaW9uEhkKBW1ham9yGAEgASgFQgPgQQJSBW1ham9yEhkKBW1pbm9yGAIgASgFQgPgQQ'
    'JSBW1pbm9yEhkKBXBhdGNoGAMgASgFQgPgQQJSBXBhdGNoEjwKC3ByZV9yZWxlYXNlGAQgAygL'
    'MhYuZ29vZ2xlLnByb3RvYnVmLlZhbHVlQgPgQQFSCnByZVJlbGVhc2USMQoFYnVpbGQYBSADKA'
    'syFi5nb29nbGUucHJvdG9idWYuVmFsdWVCA+BBAVIFYnVpbGQSOAoVY2Fub25pY2FsaXplZF92'
    'ZXJzaW9uGAYgASgJQgPgQQFSFGNhbm9uaWNhbGl6ZWRWZXJzaW9u');

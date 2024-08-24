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

@$core.Deprecated('Use authProviderTypeDescriptor instead')
const AuthProviderType$json = {
  '1': 'AuthProviderType',
  '2': [
    {'1': 'AUTH_PROVIDER_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'EMAIL_OTP', '2': 1},
    {'1': 'SMS_OTP', '2': 2},
  ],
};

/// Descriptor for `AuthProviderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authProviderTypeDescriptor = $convert.base64Decode(
    'ChBBdXRoUHJvdmlkZXJUeXBlEiIKHkFVVEhfUFJPVklERVJfVFlQRV9VTlNQRUNJRklFRBAAEg'
    '0KCUVNQUlMX09UUBABEgsKB1NNU19PVFAQAg==');

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
      '1': 'sdk_info',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.SdkInfo',
      '8': {},
      '10': 'sdkInfo'
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
    'ASgLMhsuY2VsZXN0LmFzdC52MS5SZXNvbHZlZEF1dGhCA+BBAVIEYXV0aBI2CghzZGtfaW5mbx'
    'gFIAEoCzIWLmNlbGVzdC5hc3QudjEuU2RrSW5mb0ID4EECUgdzZGtJbmZvEkQKDWZlYXR1cmVf'
    'ZmxhZ3MYBiADKA4yGi5jZWxlc3QuYXN0LnYxLkZlYXR1cmVGbGFnQgPgQQFSDGZlYXR1cmVGbG'
    'FncxpTCglBcGlzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSMAoFdmFsdWUYAiABKAsyGi5jZWxl'
    'c3QuYXN0LnYxLlJlc29sdmVkQXBpUgV2YWx1ZToCOAE=');

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
    'QSGgoGYXBpX2lkGAIgASgJQgPgQQJSBWFwaUlkEjoKBGh0dHAYAyABKAsyIS5jZWxlc3QuYXN0'
    'LnYxLlJlc29sdmVkSHR0cENvbmZpZ0ID4EECUgRodHRwEi4KEGNsaWVudF9zdHJlYW1pbmcYBC'
    'ABKAhCA+BBAVIPY2xpZW50U3RyZWFtaW5nEi4KEHNlcnZlcl9zdHJlYW1pbmcYBSABKAhCA+BB'
    'AVIPc2VydmVyU3RyZWFtaW5nEjgKFWVudmlyb25tZW50X3ZhcmlhYmxlcxgGIAMoCUID4EEBUh'
    'RlbnZpcm9ubWVudFZhcmlhYmxlcxI3Cgpwb2xpY3lfc2V0GAcgASgLMhMuY2VkYXIudjMuUG9s'
    'aWN5U2V0QgPgQQFSCXBvbGljeVNldA==');

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
  ],
};

/// Descriptor for `ResolvedAuth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedAuthDescriptor = $convert.base64Decode(
    'CgxSZXNvbHZlZEF1dGgSRgoJcHJvdmlkZXJzGAEgAygLMiMuY2VsZXN0LmFzdC52MS5SZXNvbH'
    'ZlZEF1dGhQcm92aWRlckID4EECUglwcm92aWRlcnM=');

@$core.Deprecated('Use resolvedAuthProviderDescriptor instead')
const ResolvedAuthProvider$json = {
  '1': 'ResolvedAuthProvider',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.AuthProviderType',
      '8': {},
      '10': 'type'
    },
    {'1': 'provider_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'providerId'},
  ],
};

/// Descriptor for `ResolvedAuthProvider`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolvedAuthProviderDescriptor = $convert.base64Decode(
    'ChRSZXNvbHZlZEF1dGhQcm92aWRlchI4CgR0eXBlGAEgASgOMh8uY2VsZXN0LmFzdC52MS5BdX'
    'RoUHJvdmlkZXJUeXBlQgPgQQJSBHR5cGUSJAoLcHJvdmlkZXJfaWQYAiABKAlCA+BBAVIKcHJv'
    'dmlkZXJJZA==');

@$core.Deprecated('Use sdkInfoDescriptor instead')
const SdkInfo$json = {
  '1': 'SdkInfo',
  '2': [
    {
      '1': 'dart_sdk',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Sdk',
      '8': {},
      '10': 'dartSdk'
    },
    {
      '1': 'flutter_sdk',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Sdk',
      '8': {},
      '10': 'flutterSdk'
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
    'CgdTZGtJbmZvEjIKCGRhcnRfc2RrGAEgASgLMhIuY2VsZXN0LmFzdC52MS5TZGtCA+BBAlIHZG'
    'FydFNkaxI4CgtmbHV0dGVyX3NkaxgCIAEoCzISLmNlbGVzdC5hc3QudjEuU2RrQgPgQQFSCmZs'
    'dXR0ZXJTZGsSNAoTZW5hYmxlZF9leHBlcmltZW50cxgDIAMoCUID4EEBUhJlbmFibGVkRXhwZX'
    'JpbWVudHM=');

@$core.Deprecated('Use sdkDescriptor instead')
const Sdk$json = {
  '1': 'Sdk',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'version',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Version',
      '8': {},
      '10': 'version'
    },
  ],
};

/// Descriptor for `Sdk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkDescriptor = $convert.base64Decode(
    'CgNTZGsSFwoEbmFtZRgBIAEoCUID4EECUgRuYW1lEjUKB3ZlcnNpb24YAiABKAsyFi5jZWxlc3'
    'QuYXN0LnYxLlZlcnNpb25CA+BBAlIHdmVyc2lvbg==');

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
    {'1': 'raw_version', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'rawVersion'},
  ],
};

/// Descriptor for `Version`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionDescriptor = $convert.base64Decode(
    'CgdWZXJzaW9uEhkKBW1ham9yGAEgASgFQgPgQQJSBW1ham9yEhkKBW1pbm9yGAIgASgFQgPgQQ'
    'JSBW1pbm9yEhkKBXBhdGNoGAMgASgFQgPgQQJSBXBhdGNoEjwKC3ByZV9yZWxlYXNlGAQgAygL'
    'MhYuZ29vZ2xlLnByb3RvYnVmLlZhbHVlQgPgQQFSCnByZVJlbGVhc2USMQoFYnVpbGQYBSADKA'
    'syFi5nb29nbGUucHJvdG9idWYuVmFsdWVCA+BBAVIFYnVpbGQSJAoLcmF3X3ZlcnNpb24YBiAB'
    'KAlCA+BBAlIKcmF3VmVyc2lvbg==');

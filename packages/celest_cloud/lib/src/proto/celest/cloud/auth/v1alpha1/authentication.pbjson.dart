// This is a generated file - do not edit.
//
// Generated from celest/cloud/auth/v1alpha1/authentication.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clientTypeDescriptor instead')
const ClientType$json = {
  '1': 'ClientType',
  '2': [
    {'1': 'CLIENT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'WEB', '2': 1},
    {'1': 'ANDROID', '2': 2},
    {'1': 'IOS', '2': 3},
    {'1': 'MACOS', '2': 4},
    {'1': 'WINDOWS', '2': 5},
    {'1': 'LINUX', '2': 6},
    {'1': 'HEADLESS', '2': 7},
  ],
};

/// Descriptor for `ClientType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List clientTypeDescriptor = $convert.base64Decode(
    'CgpDbGllbnRUeXBlEhsKF0NMSUVOVF9UWVBFX1VOU1BFQ0lGSUVEEAASBwoDV0VCEAESCwoHQU'
    '5EUk9JRBACEgcKA0lPUxADEgkKBU1BQ09TEAQSCwoHV0lORE9XUxAFEgkKBUxJTlVYEAYSDAoI'
    'SEVBRExFU1MQBw==');

@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = {
  '1': 'Session',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'sessionId'},
    {
      '1': 'session_token',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'sessionToken'
    },
    {
      '1': 'expire_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'expireTime'
    },
    {
      '1': 'success',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationSuccess',
      '9': 0,
      '10': 'success'
    },
    {
      '1': 'next_step',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationStep',
      '9': 0,
      '10': 'nextStep'
    },
    {
      '1': 'client',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.SessionClient',
      '8': {},
      '10': 'client'
    },
  ],
  '8': [
    {'1': 'state'},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode(
    'CgdTZXNzaW9uEhsKBnBhcmVudBgBIAEoCUID4EECUgZwYXJlbnQSJQoKc2Vzc2lvbl9pZBgCIA'
    'EoCUIG4EEC4EEFUglzZXNzaW9uSWQSKwoNc2Vzc2lvbl90b2tlbhgDIAEoCUIG4EEC4EEDUgxz'
    'ZXNzaW9uVG9rZW4SQwoLZXhwaXJlX3RpbWUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZX'
    'N0YW1wQgbgQQLgQQNSCmV4cGlyZVRpbWUSTQoHc3VjY2VzcxgFIAEoCzIxLmNlbGVzdC5jbG91'
    'ZC5hdXRoLnYxYWxwaGExLkF1dGhlbnRpY2F0aW9uU3VjY2Vzc0gAUgdzdWNjZXNzEk0KCW5leH'
    'Rfc3RlcBgGIAEoCzIuLmNlbGVzdC5jbG91ZC5hdXRoLnYxYWxwaGExLkF1dGhlbnRpY2F0aW9u'
    'U3RlcEgAUghuZXh0U3RlcBJJCgZjbGllbnQYByABKAsyKS5jZWxlc3QuY2xvdWQuYXV0aC52MW'
    'FscGhhMS5TZXNzaW9uQ2xpZW50QgbgQQLgQQRSBmNsaWVudEIHCgVzdGF0ZQ==');

@$core.Deprecated('Use sessionClientDescriptor instead')
const SessionClient$json = {
  '1': 'SessionClient',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'clientId'},
    {
      '1': 'client_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.auth.v1alpha1.ClientType',
      '8': {},
      '10': 'clientType'
    },
    {
      '1': 'callbacks',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.SessionCallbacks',
      '8': {},
      '10': 'callbacks'
    },
  ],
};

/// Descriptor for `SessionClient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionClientDescriptor = $convert.base64Decode(
    'Cg1TZXNzaW9uQ2xpZW50EiAKCWNsaWVudF9pZBgBIAEoCUID4EECUghjbGllbnRJZBJMCgtjbG'
    'llbnRfdHlwZRgCIAEoDjImLmNlbGVzdC5jbG91ZC5hdXRoLnYxYWxwaGExLkNsaWVudFR5cGVC'
    'A+BBAlIKY2xpZW50VHlwZRJPCgljYWxsYmFja3MYAyABKAsyLC5jZWxlc3QuY2xvdWQuYXV0aC'
    '52MWFscGhhMS5TZXNzaW9uQ2FsbGJhY2tzQgPgQQJSCWNhbGxiYWNrcw==');

@$core.Deprecated('Use sessionCallbacksDescriptor instead')
const SessionCallbacks$json = {
  '1': 'SessionCallbacks',
  '2': [
    {'1': 'success_uri', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'successUri'},
    {'1': 'error_uri', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'errorUri'},
  ],
};

/// Descriptor for `SessionCallbacks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionCallbacksDescriptor = $convert.base64Decode(
    'ChBTZXNzaW9uQ2FsbGJhY2tzElwKC3N1Y2Nlc3NfdXJpGAEgASgJQjvgQQK6SDW6ATIKCXZhbG'
    'lkX3VyaRIXdXJpIG11c3QgYmUgYSB2YWxpZCBVUkkaDHRoaXMuaXNVcmkoKVIKc3VjY2Vzc1Vy'
    'aRJYCgllcnJvcl91cmkYAiABKAlCO+BBAbpINboBMgoJdmFsaWRfdXJpEhd1cmkgbXVzdCBiZS'
    'BhIHZhbGlkIFVSSRoMdGhpcy5pc1VyaSgpUghlcnJvclVyaQ==');

@$core.Deprecated('Use startSessionRequestDescriptor instead')
const StartSessionRequest$json = {
  '1': 'StartSessionRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'email_otp',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactorEmailOtp',
      '9': 0,
      '10': 'emailOtp'
    },
    {
      '1': 'sms_otp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactorSmsOtp',
      '9': 0,
      '10': 'smsOtp'
    },
    {
      '1': 'idp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactorIdp',
      '9': 0,
      '10': 'idp'
    },
    {
      '1': 'client',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.SessionClient',
      '8': {},
      '10': 'client'
    },
  ],
  '8': [
    {'1': 'factor', '2': {}},
  ],
};

/// Descriptor for `StartSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startSessionRequestDescriptor = $convert.base64Decode(
    'ChNTdGFydFNlc3Npb25SZXF1ZXN0EqsBCgZwYXJlbnQYASABKAlCkgHgQQG6SIsBugGHAQoMdm'
    'FsaWRfcGFyZW50Eh1wYXJlbnQgbXVzdCBiZSBhIHZhbGlkIHBhcmVudBpYdGhpcyA9PSAnJyB8'
    'fCB0aGlzLm1hdGNoZXMoJ15vcmdhbml6YXRpb25zL1teL10rJHxeb3JnYW5pemF0aW9ucy9bXi'
    '9dKy9wcm9qZWN0cy9bXi9dKyQnKVIGcGFyZW50ElcKCWVtYWlsX290cBgCIAEoCzI4LmNlbGVz'
    'dC5jbG91ZC5hdXRoLnYxYWxwaGExLkF1dGhlbnRpY2F0aW9uRmFjdG9yRW1haWxPdHBIAFIIZW'
    '1haWxPdHASUQoHc21zX290cBgDIAEoCzI2LmNlbGVzdC5jbG91ZC5hdXRoLnYxYWxwaGExLkF1'
    'dGhlbnRpY2F0aW9uRmFjdG9yU21zT3RwSABSBnNtc090cBJHCgNpZHAYBCABKAsyMy5jZWxlc3'
    'QuY2xvdWQuYXV0aC52MWFscGhhMS5BdXRoZW50aWNhdGlvbkZhY3RvcklkcEgAUgNpZHASRgoG'
    'Y2xpZW50GAUgASgLMikuY2VsZXN0LmNsb3VkLmF1dGgudjFhbHBoYTEuU2Vzc2lvbkNsaWVudE'
    'ID4EECUgZjbGllbnRCDwoGZmFjdG9yEgW6SAIIAQ==');

@$core.Deprecated('Use authenticationStepDescriptor instead')
const AuthenticationStep$json = {
  '1': 'AuthenticationStep',
  '2': [
    {
      '1': 'needs_proof',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactor',
      '9': 0,
      '10': 'needsProof'
    },
    {
      '1': 'pending_confirmation',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationPendingConfirmation',
      '9': 0,
      '10': 'pendingConfirmation'
    },
  ],
  '8': [
    {'1': 'step', '2': {}},
  ],
};

/// Descriptor for `AuthenticationStep`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationStepDescriptor = $convert.base64Decode(
    'ChJBdXRoZW50aWNhdGlvblN0ZXASUwoLbmVlZHNfcHJvb2YYAyABKAsyMC5jZWxlc3QuY2xvdW'
    'QuYXV0aC52MWFscGhhMS5BdXRoZW50aWNhdGlvbkZhY3RvckgAUgpuZWVkc1Byb29mEnIKFHBl'
    'bmRpbmdfY29uZmlybWF0aW9uGAcgASgLMj0uY2VsZXN0LmNsb3VkLmF1dGgudjFhbHBoYTEuQX'
    'V0aGVudGljYXRpb25QZW5kaW5nQ29uZmlybWF0aW9uSABSE3BlbmRpbmdDb25maXJtYXRpb25C'
    'DQoEc3RlcBIFukgCCAE=');

@$core.Deprecated('Use authenticationFactorEmailOtpDescriptor instead')
const AuthenticationFactorEmailOtp$json = {
  '1': 'AuthenticationFactorEmailOtp',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'email'},
    {
      '1': 'code',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'code',
      '17': true
    },
  ],
  '8': [
    {'1': '_code'},
  ],
};

/// Descriptor for `AuthenticationFactorEmailOtp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationFactorEmailOtpDescriptor = $convert.base64Decode(
    'ChxBdXRoZW50aWNhdGlvbkZhY3RvckVtYWlsT3RwElkKBWVtYWlsGAEgASgJQkPgQQK6SD26AT'
    'oKC3ZhbGlkX2VtYWlsEhtlbWFpbCBtdXN0IGJlIGEgdmFsaWQgZW1haWwaDnRoaXMuaXNFbWFp'
    'bCgpUgVlbWFpbBJpCgRjb2RlGAIgASgJQlDgQQHgQQS6SEe6AUEKCXZhbGlkX290cBIYY29kZS'
    'BtdXN0IGJlIGEgdmFsaWQgT1RQGhp0aGlzLm1hdGNoZXMoJ15bMC05XXs2fSQnKdgBAUgAUgRj'
    'b2RliAEBQgcKBV9jb2Rl');

@$core.Deprecated('Use authenticationFactorSmsOtpDescriptor instead')
const AuthenticationFactorSmsOtp$json = {
  '1': 'AuthenticationFactorSmsOtp',
  '2': [
    {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'phoneNumber'},
    {
      '1': 'code',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'code',
      '17': true
    },
  ],
  '8': [
    {'1': '_code'},
  ],
};

/// Descriptor for `AuthenticationFactorSmsOtp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationFactorSmsOtpDescriptor = $convert.base64Decode(
    'ChpBdXRoZW50aWNhdGlvbkZhY3RvclNtc090cBKAAQoMcGhvbmVfbnVtYmVyGAEgASgJQl3gQQ'
    'K6SFe6AVQKEnZhbGlkX3Bob25lX251bWJlchIocGhvbmVfbnVtYmVyIG11c3QgaW5jbHVkZSBh'
    'IGNvdW50cnkgY29kZRoUdGhpcy5zdGFydHNXaXRoKCcrJylSC3Bob25lTnVtYmVyEmkKBGNvZG'
    'UYAiABKAlCUOBBAeBBBLpIR7oBQQoJdmFsaWRfb3RwEhhjb2RlIG11c3QgYmUgYSB2YWxpZCBP'
    'VFAaGnRoaXMubWF0Y2hlcygnXlswLTldezZ9JCcp2AEBSABSBGNvZGWIAQFCBwoFX2NvZGU=');

@$core.Deprecated('Use authenticationFactorIdpDescriptor instead')
const AuthenticationFactorIdp$json = {
  '1': 'AuthenticationFactorIdp',
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
    {
      '1': 'redirect_uri',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'redirectUri',
      '17': true
    },
  ],
  '8': [
    {'1': '_redirect_uri'},
  ],
};

/// Descriptor for `AuthenticationFactorIdp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationFactorIdpDescriptor = $convert.base64Decode(
    'ChdBdXRoZW50aWNhdGlvbkZhY3RvcklkcBJRCghwcm92aWRlchgBIAEoDjIwLmNlbGVzdC5jbG'
    '91ZC5hdXRoLnYxYWxwaGExLklkZW50aXR5UHJvdmlkZXJUeXBlQgPgQQJSCHByb3ZpZGVyEmYK'
    'DHJlZGlyZWN0X3VyaRgCIAEoCUI+4EEBukg4ugEyCgl2YWxpZF91cmkSF3VyaSBtdXN0IGJlIG'
    'EgdmFsaWQgVVJJGgx0aGlzLmlzVXJpKCnYAQFIAFILcmVkaXJlY3RVcmmIAQFCDwoNX3JlZGly'
    'ZWN0X3VyaQ==');

@$core.Deprecated('Use authenticationFactorDescriptor instead')
const AuthenticationFactor$json = {
  '1': 'AuthenticationFactor',
  '2': [
    {
      '1': 'email_otp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactorEmailOtp',
      '9': 0,
      '10': 'emailOtp'
    },
    {
      '1': 'sms_otp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactorSmsOtp',
      '9': 0,
      '10': 'smsOtp'
    },
    {
      '1': 'idp',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactorIdp',
      '9': 0,
      '10': 'idp'
    },
  ],
  '8': [
    {'1': 'factor', '2': {}},
  ],
};

/// Descriptor for `AuthenticationFactor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationFactorDescriptor = $convert.base64Decode(
    'ChRBdXRoZW50aWNhdGlvbkZhY3RvchJXCgllbWFpbF9vdHAYAyABKAsyOC5jZWxlc3QuY2xvdW'
    'QuYXV0aC52MWFscGhhMS5BdXRoZW50aWNhdGlvbkZhY3RvckVtYWlsT3RwSABSCGVtYWlsT3Rw'
    'ElEKB3Ntc19vdHAYBCABKAsyNi5jZWxlc3QuY2xvdWQuYXV0aC52MWFscGhhMS5BdXRoZW50aW'
    'NhdGlvbkZhY3RvclNtc090cEgAUgZzbXNPdHASRwoDaWRwGAUgASgLMjMuY2VsZXN0LmNsb3Vk'
    'LmF1dGgudjFhbHBoYTEuQXV0aGVudGljYXRpb25GYWN0b3JJZHBIAFIDaWRwQg8KBmZhY3Rvch'
    'IFukgCCAE=');

@$core.Deprecated('Use continueSessionRequestDescriptor instead')
const ContinueSessionRequest$json = {
  '1': 'ContinueSessionRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'sessionId'},
    {
      '1': 'session_token',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'sessionToken'
    },
    {
      '1': 'proof',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactor',
      '9': 0,
      '10': 'proof'
    },
    {
      '1': 'confirmation',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationPendingConfirmation',
      '9': 0,
      '10': 'confirmation'
    },
    {
      '1': 'resend',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.AuthenticationFactor',
      '9': 0,
      '10': 'resend'
    },
  ],
  '8': [
    {'1': 'update', '2': {}},
  ],
};

/// Descriptor for `ContinueSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List continueSessionRequestDescriptor = $convert.base64Decode(
    'ChZDb250aW51ZVNlc3Npb25SZXF1ZXN0EokBCgpzZXNzaW9uX2lkGAEgASgJQmrgQQK6SGS6AW'
    'EKEHZhbGlkX3Nlc3Npb25faWQSJXNlc3Npb25faWQgbXVzdCBiZSBhIHZhbGlkIHNlc3Npb24g'
    'SUQaJnRoaXMubWF0Y2hlcygnXnNlc3NfW0EtWmEtejAtOV17MjZ9JCcpUglzZXNzaW9uSWQSKA'
    'oNc2Vzc2lvbl90b2tlbhgCIAEoCUID4EECUgxzZXNzaW9uVG9rZW4SSAoFcHJvb2YYAyABKAsy'
    'MC5jZWxlc3QuY2xvdWQuYXV0aC52MWFscGhhMS5BdXRoZW50aWNhdGlvbkZhY3RvckgAUgVwcm'
    '9vZhJjCgxjb25maXJtYXRpb24YBCABKAsyPS5jZWxlc3QuY2xvdWQuYXV0aC52MWFscGhhMS5B'
    'dXRoZW50aWNhdGlvblBlbmRpbmdDb25maXJtYXRpb25IAFIMY29uZmlybWF0aW9uEkoKBnJlc2'
    'VuZBgFIAEoCzIwLmNlbGVzdC5jbG91ZC5hdXRoLnYxYWxwaGExLkF1dGhlbnRpY2F0aW9uRmFj'
    'dG9ySABSBnJlc2VuZEIPCgZ1cGRhdGUSBbpIAggB');

@$core.Deprecated('Use authenticationSuccessDescriptor instead')
const AuthenticationSuccess$json = {
  '1': 'AuthenticationSuccess',
  '2': [
    {
      '1': 'identity_token',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'identityToken'
    },
    {
      '1': 'user',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.User',
      '8': {},
      '10': 'user'
    },
    {'1': 'is_new_user', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'isNewUser'},
  ],
};

/// Descriptor for `AuthenticationSuccess`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationSuccessDescriptor = $convert.base64Decode(
    'ChVBdXRoZW50aWNhdGlvblN1Y2Nlc3MSKgoOaWRlbnRpdHlfdG9rZW4YASABKAlCA+BBAlINaW'
    'RlbnRpdHlUb2tlbhI5CgR1c2VyGAIgASgLMiAuY2VsZXN0LmNsb3VkLmF1dGgudjFhbHBoYTEu'
    'VXNlckID4EECUgR1c2VyEiMKC2lzX25ld191c2VyGAMgASgIQgPgQQJSCWlzTmV3VXNlcg==');

@$core.Deprecated('Use authenticationPendingConfirmationDescriptor instead')
const AuthenticationPendingConfirmation$json = {
  '1': 'AuthenticationPendingConfirmation',
  '2': [
    {
      '1': 'link_existing_user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.User',
      '9': 0,
      '10': 'linkExistingUser'
    },
    {
      '1': 'register_user',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.auth.v1alpha1.User',
      '9': 0,
      '10': 'registerUser'
    },
  ],
  '8': [
    {'1': 'pending', '2': {}},
  ],
};

/// Descriptor for `AuthenticationPendingConfirmation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationPendingConfirmationDescriptor =
    $convert.base64Decode(
        'CiFBdXRoZW50aWNhdGlvblBlbmRpbmdDb25maXJtYXRpb24SUAoSbGlua19leGlzdGluZ191c2'
        'VyGAEgASgLMiAuY2VsZXN0LmNsb3VkLmF1dGgudjFhbHBoYTEuVXNlckgAUhBsaW5rRXhpc3Rp'
        'bmdVc2VyEkcKDXJlZ2lzdGVyX3VzZXIYAiABKAsyIC5jZWxlc3QuY2xvdWQuYXV0aC52MWFscG'
        'hhMS5Vc2VySABSDHJlZ2lzdGVyVXNlckIQCgdwZW5kaW5nEgW6SAIIAQ==');

@$core.Deprecated('Use endSessionRequestDescriptor instead')
const EndSessionRequest$json = {
  '1': 'EndSessionRequest',
  '2': [
    {
      '1': 'session_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'sessionId',
      '17': true
    },
    {
      '1': 'session_token',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'sessionToken',
      '17': true
    },
  ],
  '8': [
    {'1': '_session_id'},
    {'1': '_session_token'},
  ],
};

/// Descriptor for `EndSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endSessionRequestDescriptor = $convert.base64Decode(
    'ChFFbmRTZXNzaW9uUmVxdWVzdBKRAQoKc2Vzc2lvbl9pZBgBIAEoCUJt4EEBukhnugFhChB2YW'
    'xpZF9zZXNzaW9uX2lkEiVzZXNzaW9uX2lkIG11c3QgYmUgYSB2YWxpZCBzZXNzaW9uIElEGiZ0'
    'aGlzLm1hdGNoZXMoJ15zZXNzX1tBLVphLXowLTldezI2fSQnKdgBAUgAUglzZXNzaW9uSWSIAQ'
    'ESLQoNc2Vzc2lvbl90b2tlbhgCIAEoCUID4EEBSAFSDHNlc3Npb25Ub2tlbogBAUINCgtfc2Vz'
    'c2lvbl9pZEIQCg5fc2Vzc2lvbl90b2tlbg==');

@$core.Deprecated('Use endSessionResponseDescriptor instead')
const EndSessionResponse$json = {
  '1': 'EndSessionResponse',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'sessionId'},
    {
      '1': 'success',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'success'
    },
    {
      '1': 'redirect_uri',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'redirectUri'
    },
  ],
  '8': [
    {'1': 'result'},
  ],
};

/// Descriptor for `EndSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endSessionResponseDescriptor = $convert.base64Decode(
    'ChJFbmRTZXNzaW9uUmVzcG9uc2USIgoKc2Vzc2lvbl9pZBgBIAEoCUID4EECUglzZXNzaW9uSW'
    'QSMgoHc3VjY2VzcxgCIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgAUgdzdWNjZXNzEmAK'
    'DHJlZGlyZWN0X3VyaRgDIAEoCUI7ukg4ugEyCgl2YWxpZF91cmkSF3VyaSBtdXN0IGJlIGEgdm'
    'FsaWQgVVJJGgx0aGlzLmlzVXJpKCnYAQFIAFILcmVkaXJlY3RVcmlCCAoGcmVzdWx0');

@$core.Deprecated('Use openIdUserinfoDescriptor instead')
const OpenIdUserinfo$json = {
  '1': 'OpenIdUserinfo',
  '2': [
    {'1': 'sub', '3': 1, '4': 1, '5': 9, '10': 'sub'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {
      '1': 'given_name',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'given_name',
      '17': true
    },
    {
      '1': 'family_name',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'family_name',
      '17': true
    },
    {
      '1': 'middle_name',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'middle_name',
      '17': true
    },
    {
      '1': 'nickname',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'nickname',
      '17': true
    },
    {
      '1': 'preferred_username',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'preferred_username',
      '17': true
    },
    {
      '1': 'profile',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 6,
      '10': 'profile',
      '17': true
    },
    {
      '1': 'picture',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 7,
      '10': 'picture',
      '17': true
    },
    {
      '1': 'website',
      '3': 10,
      '4': 1,
      '5': 9,
      '9': 8,
      '10': 'website',
      '17': true
    },
    {'1': 'email', '3': 11, '4': 1, '5': 9, '9': 9, '10': 'email', '17': true},
    {
      '1': 'email_verified',
      '3': 12,
      '4': 1,
      '5': 8,
      '9': 10,
      '10': 'email_verified',
      '17': true
    },
    {
      '1': 'gender',
      '3': 13,
      '4': 1,
      '5': 9,
      '9': 11,
      '10': 'gender',
      '17': true
    },
    {
      '1': 'birthdate',
      '3': 14,
      '4': 1,
      '5': 9,
      '9': 12,
      '10': 'birthdate',
      '17': true
    },
    {
      '1': 'zoneinfo',
      '3': 15,
      '4': 1,
      '5': 9,
      '9': 13,
      '10': 'zoneinfo',
      '17': true
    },
    {
      '1': 'locale',
      '3': 16,
      '4': 1,
      '5': 9,
      '9': 14,
      '10': 'locale',
      '17': true
    },
    {
      '1': 'phone_number',
      '3': 17,
      '4': 1,
      '5': 9,
      '9': 15,
      '10': 'phone_number',
      '17': true
    },
    {
      '1': 'phone_number_verified',
      '3': 18,
      '4': 1,
      '5': 8,
      '9': 16,
      '10': 'phone_number_verified',
      '17': true
    },
    {
      '1': 'address',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Value',
      '9': 17,
      '10': 'address',
      '17': true
    },
    {
      '1': 'updated_at',
      '3': 20,
      '4': 1,
      '5': 5,
      '9': 18,
      '10': 'updated_at',
      '17': true
    },
  ],
  '8': [
    {'1': '_name'},
    {'1': '_given_name'},
    {'1': '_family_name'},
    {'1': '_middle_name'},
    {'1': '_nickname'},
    {'1': '_preferred_username'},
    {'1': '_profile'},
    {'1': '_picture'},
    {'1': '_website'},
    {'1': '_email'},
    {'1': '_email_verified'},
    {'1': '_gender'},
    {'1': '_birthdate'},
    {'1': '_zoneinfo'},
    {'1': '_locale'},
    {'1': '_phone_number'},
    {'1': '_phone_number_verified'},
    {'1': '_address'},
    {'1': '_updated_at'},
  ],
};

/// Descriptor for `OpenIdUserinfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List openIdUserinfoDescriptor = $convert.base64Decode(
    'Cg5PcGVuSWRVc2VyaW5mbxIQCgNzdWIYASABKAlSA3N1YhIXCgRuYW1lGAIgASgJSABSBG5hbW'
    'WIAQESIwoKZ2l2ZW5fbmFtZRgDIAEoCUgBUgpnaXZlbl9uYW1liAEBEiUKC2ZhbWlseV9uYW1l'
    'GAQgASgJSAJSC2ZhbWlseV9uYW1liAEBEiUKC21pZGRsZV9uYW1lGAUgASgJSANSC21pZGRsZV'
    '9uYW1liAEBEh8KCG5pY2tuYW1lGAYgASgJSARSCG5pY2tuYW1liAEBEjMKEnByZWZlcnJlZF91'
    'c2VybmFtZRgHIAEoCUgFUhJwcmVmZXJyZWRfdXNlcm5hbWWIAQESHQoHcHJvZmlsZRgIIAEoCU'
    'gGUgdwcm9maWxliAEBEh0KB3BpY3R1cmUYCSABKAlIB1IHcGljdHVyZYgBARIdCgd3ZWJzaXRl'
    'GAogASgJSAhSB3dlYnNpdGWIAQESGQoFZW1haWwYCyABKAlICVIFZW1haWyIAQESKwoOZW1haW'
    'xfdmVyaWZpZWQYDCABKAhIClIOZW1haWxfdmVyaWZpZWSIAQESGwoGZ2VuZGVyGA0gASgJSAtS'
    'BmdlbmRlcogBARIhCgliaXJ0aGRhdGUYDiABKAlIDFIJYmlydGhkYXRliAEBEh8KCHpvbmVpbm'
    'ZvGA8gASgJSA1SCHpvbmVpbmZviAEBEhsKBmxvY2FsZRgQIAEoCUgOUgZsb2NhbGWIAQESJwoM'
    'cGhvbmVfbnVtYmVyGBEgASgJSA9SDHBob25lX251bWJlcogBARI5ChVwaG9uZV9udW1iZXJfdm'
    'VyaWZpZWQYEiABKAhIEFIVcGhvbmVfbnVtYmVyX3ZlcmlmaWVkiAEBEjUKB2FkZHJlc3MYEyAB'
    'KAsyFi5nb29nbGUucHJvdG9idWYuVmFsdWVIEVIHYWRkcmVzc4gBARIjCgp1cGRhdGVkX2F0GB'
    'QgASgFSBJSCnVwZGF0ZWRfYXSIAQFCBwoFX25hbWVCDQoLX2dpdmVuX25hbWVCDgoMX2ZhbWls'
    'eV9uYW1lQg4KDF9taWRkbGVfbmFtZUILCglfbmlja25hbWVCFQoTX3ByZWZlcnJlZF91c2Vybm'
    'FtZUIKCghfcHJvZmlsZUIKCghfcGljdHVyZUIKCghfd2Vic2l0ZUIICgZfZW1haWxCEQoPX2Vt'
    'YWlsX3ZlcmlmaWVkQgkKB19nZW5kZXJCDAoKX2JpcnRoZGF0ZUILCglfem9uZWluZm9CCQoHX2'
    'xvY2FsZUIPCg1fcGhvbmVfbnVtYmVyQhgKFl9waG9uZV9udW1iZXJfdmVyaWZpZWRCCgoIX2Fk'
    'ZHJlc3NCDQoLX3VwZGF0ZWRfYXQ=');

@$core.Deprecated('Use openIdAddressDescriptor instead')
const OpenIdAddress$json = {
  '1': 'OpenIdAddress',
  '2': [
    {
      '1': 'formatted',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'formatted',
      '17': true
    },
    {
      '1': 'street_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'street_address',
      '17': true
    },
    {
      '1': 'locality',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'locality',
      '17': true
    },
    {'1': 'region', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'region', '17': true},
    {
      '1': 'postal_code',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'postal_code',
      '17': true
    },
    {
      '1': 'country',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'country',
      '17': true
    },
  ],
  '8': [
    {'1': '_formatted'},
    {'1': '_street_address'},
    {'1': '_locality'},
    {'1': '_region'},
    {'1': '_postal_code'},
    {'1': '_country'},
  ],
};

/// Descriptor for `OpenIdAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List openIdAddressDescriptor = $convert.base64Decode(
    'Cg1PcGVuSWRBZGRyZXNzEiEKCWZvcm1hdHRlZBgBIAEoCUgAUglmb3JtYXR0ZWSIAQESKwoOc3'
    'RyZWV0X2FkZHJlc3MYAiABKAlIAVIOc3RyZWV0X2FkZHJlc3OIAQESHwoIbG9jYWxpdHkYAyAB'
    'KAlIAlIIbG9jYWxpdHmIAQESGwoGcmVnaW9uGAQgASgJSANSBnJlZ2lvbogBARIlCgtwb3N0YW'
    'xfY29kZRgFIAEoCUgEUgtwb3N0YWxfY29kZYgBARIdCgdjb3VudHJ5GAYgASgJSAVSB2NvdW50'
    'cnmIAQFCDAoKX2Zvcm1hdHRlZEIRCg9fc3RyZWV0X2FkZHJlc3NCCwoJX2xvY2FsaXR5QgkKB1'
    '9yZWdpb25CDgoMX3Bvc3RhbF9jb2RlQgoKCF9jb3VudHJ5');

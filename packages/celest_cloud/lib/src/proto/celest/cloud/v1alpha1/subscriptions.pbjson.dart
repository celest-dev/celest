//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/subscriptions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use measureDescriptor instead')
const Measure$json = {
  '1': 'Measure',
  '2': [
    {'1': 'MEASURE_UNSPECIFIED', '2': 0},
    {'1': 'MEBIBYTES', '2': 1},
    {'1': 'GIBIBYTES', '2': 2},
    {'1': 'TEBIBYTES', '2': 3},
    {'1': 'MEGABYTES', '2': 4},
    {'1': 'GIGABYTES', '2': 5},
    {'1': 'TERABYTES', '2': 6},
  ],
};

/// Descriptor for `Measure`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List measureDescriptor = $convert.base64Decode(
    'CgdNZWFzdXJlEhcKE01FQVNVUkVfVU5TUEVDSUZJRUQQABINCglNRUJJQllURVMQARINCglHSU'
    'JJQllURVMQAhINCglURUJJQllURVMQAxINCglNRUdBQllURVMQBBINCglHSUdBQllURVMQBRIN'
    'CglURVJBQllURVMQBg==');

@$core.Deprecated('Use instanceTypeDescriptor instead')
const InstanceType$json = {
  '1': 'InstanceType',
  '2': [
    {'1': 'INSTANCE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'MICRO', '2': 1},
    {'1': 'SMALL', '2': 2},
    {'1': 'MEDIUM', '2': 3},
    {'1': 'LARGE', '2': 4},
    {'1': 'QUAD', '2': 5},
    {'1': 'OCTA', '2': 6},
    {'1': 'HEXA', '2': 7},
  ],
};

/// Descriptor for `InstanceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List instanceTypeDescriptor = $convert.base64Decode(
    'CgxJbnN0YW5jZVR5cGUSHQoZSU5TVEFOQ0VfVFlQRV9VTlNQRUNJRklFRBAAEgkKBU1JQ1JPEA'
    'ESCQoFU01BTEwQAhIKCgZNRURJVU0QAxIJCgVMQVJHRRAEEggKBFFVQUQQBRIICgRPQ1RBEAYS'
    'CAoESEVYQRAH');

@$core.Deprecated('Use subscriptionDescriptor instead')
const Subscription$json = {
  '1': 'Subscription',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'parent', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {
      '1': 'community',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.CommunitySubscriptionPlan',
      '9': 0,
      '10': 'community'
    },
    {
      '1': 'builder',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.BuilderSubscriptionPlan',
      '9': 0,
      '10': 'builder'
    },
    {
      '1': 'enterprise',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.EnterpriseSubscriptionPlan',
      '9': 0,
      '10': 'enterprise'
    },
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
      '1': 'payment_required',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.SubscriptionPaymentRequired',
      '9': 1,
      '10': 'paymentRequired'
    },
    {
      '1': 'active',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.SubscriptionActive',
      '9': 1,
      '10': 'active'
    },
    {
      '1': 'paused',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.SubscriptionPaused',
      '9': 1,
      '10': 'paused'
    },
    {
      '1': 'suspended',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.SubscriptionSuspended',
      '9': 1,
      '10': 'suspended'
    },
    {
      '1': 'canceled',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.SubscriptionCanceled',
      '9': 1,
      '10': 'canceled'
    },
  ],
  '7': {},
  '8': [
    {'1': 'plan'},
    {'1': 'state'},
  ],
};

/// Descriptor for `Subscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionDescriptor = $convert.base64Decode(
    'CgxTdWJzY3JpcHRpb24SFwoEbmFtZRgBIAEoCUID4EEIUgRuYW1lEhsKBnBhcmVudBgCIAEoCU'
    'ID4EEDUgZwYXJlbnQSUAoJY29tbXVuaXR5GAMgASgLMjAuY2VsZXN0LmNsb3VkLnYxYWxwaGEx'
    'LkNvbW11bml0eVN1YnNjcmlwdGlvblBsYW5IAFIJY29tbXVuaXR5EkoKB2J1aWxkZXIYBCABKA'
    'syLi5jZWxlc3QuY2xvdWQudjFhbHBoYTEuQnVpbGRlclN1YnNjcmlwdGlvblBsYW5IAFIHYnVp'
    'bGRlchJTCgplbnRlcnByaXNlGAUgASgLMjEuY2VsZXN0LmNsb3VkLnYxYWxwaGExLkVudGVycH'
    'Jpc2VTdWJzY3JpcHRpb25QbGFuSABSCmVudGVycHJpc2USQAoLY3JlYXRlX3RpbWUYBiABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgPgQQNSCmNyZWF0ZVRpbWUSQAoLdXBkYXRlX3'
    'RpbWUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgPgQQNSCnVwZGF0ZVRpbWUS'
    'XwoQcGF5bWVudF9yZXF1aXJlZBgIIAEoCzIyLmNlbGVzdC5jbG91ZC52MWFscGhhMS5TdWJzY3'
    'JpcHRpb25QYXltZW50UmVxdWlyZWRIAVIPcGF5bWVudFJlcXVpcmVkEkMKBmFjdGl2ZRgJIAEo'
    'CzIpLmNlbGVzdC5jbG91ZC52MWFscGhhMS5TdWJzY3JpcHRpb25BY3RpdmVIAVIGYWN0aXZlEk'
    'MKBnBhdXNlZBgKIAEoCzIpLmNlbGVzdC5jbG91ZC52MWFscGhhMS5TdWJzY3JpcHRpb25QYXVz'
    'ZWRIAVIGcGF1c2VkEkwKCXN1c3BlbmRlZBgLIAEoCzIsLmNlbGVzdC5jbG91ZC52MWFscGhhMS'
    '5TdWJzY3JpcHRpb25TdXNwZW5kZWRIAVIJc3VzcGVuZGVkEkkKCGNhbmNlbGVkGAwgASgLMisu'
    'Y2VsZXN0LmNsb3VkLnYxYWxwaGExLlN1YnNjcmlwdGlvbkNhbmNlbGVkSAFSCGNhbmNlbGVkOl'
    'rqQVcKHWNsb3VkLmNlbGVzdC5kZXYvU3Vic2NyaXB0aW9uEhl1c2Vycy97dXNlcn0vc3Vic2Ny'
    'aXB0aW9uKg1zdWJzY3JpcHRpb25zMgxzdWJzY3JpcHRpb25CBgoEcGxhbkIHCgVzdGF0ZQ==');

@$core.Deprecated('Use subscriptionPaymentRequiredDescriptor instead')
const SubscriptionPaymentRequired$json = {
  '1': 'SubscriptionPaymentRequired',
  '2': [
    {'1': 'payment_uri', '3': 1, '4': 1, '5': 9, '10': 'paymentUri'},
    {'1': 'redirect_uri', '3': 2, '4': 1, '5': 9, '10': 'redirectUri'},
  ],
};

/// Descriptor for `SubscriptionPaymentRequired`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionPaymentRequiredDescriptor =
    $convert.base64Decode(
        'ChtTdWJzY3JpcHRpb25QYXltZW50UmVxdWlyZWQSHwoLcGF5bWVudF91cmkYASABKAlSCnBheW'
        '1lbnRVcmkSIQoMcmVkaXJlY3RfdXJpGAIgASgJUgtyZWRpcmVjdFVyaQ==');

@$core.Deprecated('Use subscriptionActiveDescriptor instead')
const SubscriptionActive$json = {
  '1': 'SubscriptionActive',
  '2': [
    {
      '1': 'billing_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.SubscriptionBillingInfo',
      '9': 0,
      '10': 'billingInfo',
      '17': true
    },
  ],
  '8': [
    {'1': '_billing_info'},
  ],
};

/// Descriptor for `SubscriptionActive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionActiveDescriptor = $convert.base64Decode(
    'ChJTdWJzY3JpcHRpb25BY3RpdmUSVgoMYmlsbGluZ19pbmZvGAEgASgLMi4uY2VsZXN0LmNsb3'
    'VkLnYxYWxwaGExLlN1YnNjcmlwdGlvbkJpbGxpbmdJbmZvSABSC2JpbGxpbmdJbmZviAEBQg8K'
    'DV9iaWxsaW5nX2luZm8=');

@$core.Deprecated('Use subscriptionBillingInfoDescriptor instead')
const SubscriptionBillingInfo$json = {
  '1': 'SubscriptionBillingInfo',
  '2': [
    {
      '1': 'next_billing_time',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'nextBillingTime'
    },
  ],
};

/// Descriptor for `SubscriptionBillingInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionBillingInfoDescriptor =
    $convert.base64Decode(
        'ChdTdWJzY3JpcHRpb25CaWxsaW5nSW5mbxJGChFuZXh0X2JpbGxpbmdfdGltZRgBIAEoCzIaLm'
        'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSD25leHRCaWxsaW5nVGltZQ==');

@$core.Deprecated('Use subscriptionPausedDescriptor instead')
const SubscriptionPaused$json = {
  '1': 'SubscriptionPaused',
  '2': [
    {
      '1': 'resume_time',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'resumeTime'
    },
  ],
};

/// Descriptor for `SubscriptionPaused`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionPausedDescriptor = $convert.base64Decode(
    'ChJTdWJzY3JpcHRpb25QYXVzZWQSOwoLcmVzdW1lX3RpbWUYASABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wUgpyZXN1bWVUaW1l');

@$core.Deprecated('Use subscriptionSuspendedDescriptor instead')
const SubscriptionSuspended$json = {
  '1': 'SubscriptionSuspended',
  '2': [
    {'1': 'reason', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'reason', '17': true},
  ],
  '8': [
    {'1': '_reason'},
  ],
};

/// Descriptor for `SubscriptionSuspended`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionSuspendedDescriptor = $convert.base64Decode(
    'ChVTdWJzY3JpcHRpb25TdXNwZW5kZWQSGwoGcmVhc29uGAEgASgJSABSBnJlYXNvbogBAUIJCg'
    'dfcmVhc29u');

@$core.Deprecated('Use subscriptionCanceledDescriptor instead')
const SubscriptionCanceled$json = {
  '1': 'SubscriptionCanceled',
  '2': [
    {
      '1': 'cancel_time',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'cancelTime'
    },
    {
      '1': 'details',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.CancelSubscriptionDetails',
      '10': 'details'
    },
  ],
};

/// Descriptor for `SubscriptionCanceled`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionCanceledDescriptor = $convert.base64Decode(
    'ChRTdWJzY3JpcHRpb25DYW5jZWxlZBI7CgtjYW5jZWxfdGltZRgBIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCmNhbmNlbFRpbWUSSgoHZGV0YWlscxgCIAEoCzIwLmNlbGVzdC5j'
    'bG91ZC52MWFscGhhMS5DYW5jZWxTdWJzY3JpcHRpb25EZXRhaWxzUgdkZXRhaWxz');

@$core.Deprecated('Use communitySubscriptionPlanDescriptor instead')
const CommunitySubscriptionPlan$json = {
  '1': 'CommunitySubscriptionPlan',
};

/// Descriptor for `CommunitySubscriptionPlan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List communitySubscriptionPlanDescriptor =
    $convert.base64Decode('ChlDb21tdW5pdHlTdWJzY3JpcHRpb25QbGFu');

@$core.Deprecated('Use builderSubscriptionPlanDescriptor instead')
const BuilderSubscriptionPlan$json = {
  '1': 'BuilderSubscriptionPlan',
  '2': [
    {
      '1': 'currency_code',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'currencyCode'
    },
    {
      '1': 'instance_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.InstanceType',
      '8': {},
      '10': 'instanceType'
    },
  ],
};

/// Descriptor for `BuilderSubscriptionPlan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List builderSubscriptionPlanDescriptor = $convert.base64Decode(
    'ChdCdWlsZGVyU3Vic2NyaXB0aW9uUGxhbhJ+Cg1jdXJyZW5jeV9jb2RlGAEgASgJQlngQQK6SF'
    'O6AVAKDnZhbGlkX2N1cnJlbmN5Eh1tdXN0IGJlIGEgdmFsaWQgY3VycmVuY3kgY29kZRofdGhp'
    'cy5tYXRjaGVzKCdeW2EtekEtWl17Myw0fSQnKVIMY3VycmVuY3lDb2RlEo4BCg1pbnN0YW5jZV'
    '90eXBlGAIgASgOMiMuY2VsZXN0LmNsb3VkLnYxYWxwaGExLkluc3RhbmNlVHlwZUJE4EECukg+'
    'ugE7ChN2YWxpZF9pbnN0YW5jZV90eXBlEhltdXN0IHNldCBhbiBpbnN0YW5jZSB0eXBlGgl0aG'
    'lzICE9IDBSDGluc3RhbmNlVHlwZQ==');

@$core.Deprecated('Use enterpriseSubscriptionPlanDescriptor instead')
const EnterpriseSubscriptionPlan$json = {
  '1': 'EnterpriseSubscriptionPlan',
};

/// Descriptor for `EnterpriseSubscriptionPlan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enterpriseSubscriptionPlanDescriptor =
    $convert.base64Decode('ChpFbnRlcnByaXNlU3Vic2NyaXB0aW9uUGxhbg==');

@$core.Deprecated('Use getSubscriptionRequestDescriptor instead')
const GetSubscriptionRequest$json = {
  '1': 'GetSubscriptionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetSubscriptionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSubscriptionRequestDescriptor = $convert.base64Decode(
    'ChZHZXRTdWJzY3JpcHRpb25SZXF1ZXN0EqwBCgRuYW1lGAEgASgJQpcB4EEC+kEfCh1jbG91ZC'
    '5jZWxlc3QuZGV2L1N1YnNjcmlwdGlvbrpIb7oBbAoSdmFsaWRfc3Vic2NyaXB0aW9uEiptdXN0'
    'IGJlIGEgdmFsaWQgc3Vic2NyaXB0aW9uIHJlc291cmNlIG5hbWUaKnRoaXMubWF0Y2hlcygnXn'
    'VzZXJzL1teL10rL3N1YnNjcmlwdGlvbiQnKVIEbmFtZQ==');

@$core.Deprecated('Use changePlanRequestDescriptor instead')
const ChangePlanRequest$json = {
  '1': 'ChangePlanRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'community',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.CommunitySubscriptionPlan',
      '9': 0,
      '10': 'community'
    },
    {
      '1': 'builder',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.BuilderSubscriptionPlan',
      '9': 0,
      '10': 'builder'
    },
    {
      '1': 'enterprise',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.EnterpriseSubscriptionPlan',
      '9': 0,
      '10': 'enterprise'
    },
    {'1': 'redirect_uri', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'redirectUri'},
  ],
  '8': [
    {'1': 'plan', '2': {}},
  ],
};

/// Descriptor for `ChangePlanRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePlanRequestDescriptor = $convert.base64Decode(
    'ChFDaGFuZ2VQbGFuUmVxdWVzdBKsAQoEbmFtZRgBIAEoCUKXAeBBAvpBHwodY2xvdWQuY2VsZX'
    'N0LmRldi9TdWJzY3JpcHRpb266SG+6AWwKEnZhbGlkX3N1YnNjcmlwdGlvbhIqbXVzdCBiZSBh'
    'IHZhbGlkIHN1YnNjcmlwdGlvbiByZXNvdXJjZSBuYW1lGip0aGlzLm1hdGNoZXMoJ151c2Vycy'
    '9bXi9dKy9zdWJzY3JpcHRpb24kJylSBG5hbWUSUAoJY29tbXVuaXR5GAIgASgLMjAuY2VsZXN0'
    'LmNsb3VkLnYxYWxwaGExLkNvbW11bml0eVN1YnNjcmlwdGlvblBsYW5IAFIJY29tbXVuaXR5Ek'
    'oKB2J1aWxkZXIYAyABKAsyLi5jZWxlc3QuY2xvdWQudjFhbHBoYTEuQnVpbGRlclN1YnNjcmlw'
    'dGlvblBsYW5IAFIHYnVpbGRlchJTCgplbnRlcnByaXNlGAQgASgLMjEuY2VsZXN0LmNsb3VkLn'
    'YxYWxwaGExLkVudGVycHJpc2VTdWJzY3JpcHRpb25QbGFuSABSCmVudGVycHJpc2USXQoMcmVk'
    'aXJlY3RfdXJpGAYgASgJQjrgQQG6SDS6AS4KCXZhbGlkX3VyaRITbXVzdCBiZSBhIHZhbGlkIF'
    'VSSRoMdGhpcy5pc1VyaSgp0AEBUgtyZWRpcmVjdFVyaUINCgRwbGFuEgW6SAIIAQ==');

@$core.Deprecated('Use changePlanResponseDescriptor instead')
const ChangePlanResponse$json = {
  '1': 'ChangePlanResponse',
  '2': [
    {
      '1': 'subscription',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Subscription',
      '10': 'subscription'
    },
  ],
};

/// Descriptor for `ChangePlanResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePlanResponseDescriptor = $convert.base64Decode(
    'ChJDaGFuZ2VQbGFuUmVzcG9uc2USRwoMc3Vic2NyaXB0aW9uGAEgASgLMiMuY2VsZXN0LmNsb3'
    'VkLnYxYWxwaGExLlN1YnNjcmlwdGlvblIMc3Vic2NyaXB0aW9u');

@$core.Deprecated('Use pauseSubscriptionRequestDescriptor instead')
const PauseSubscriptionRequest$json = {
  '1': 'PauseSubscriptionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'resume_time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'resumeTime'
    },
  ],
};

/// Descriptor for `PauseSubscriptionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pauseSubscriptionRequestDescriptor = $convert.base64Decode(
    'ChhQYXVzZVN1YnNjcmlwdGlvblJlcXVlc3QSrAEKBG5hbWUYASABKAlClwHgQQL6QR8KHWNsb3'
    'VkLmNlbGVzdC5kZXYvU3Vic2NyaXB0aW9uukhvugFsChJ2YWxpZF9zdWJzY3JpcHRpb24SKm11'
    'c3QgYmUgYSB2YWxpZCBzdWJzY3JpcHRpb24gcmVzb3VyY2UgbmFtZRoqdGhpcy5tYXRjaGVzKC'
    'dedXNlcnMvW14vXSsvc3Vic2NyaXB0aW9uJCcpUgRuYW1lEkAKC3Jlc3VtZV90aW1lGAIgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEID4EEBUgpyZXN1bWVUaW1l');

@$core.Deprecated('Use pauseSubscriptionResponseDescriptor instead')
const PauseSubscriptionResponse$json = {
  '1': 'PauseSubscriptionResponse',
  '2': [
    {
      '1': 'subscription',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Subscription',
      '10': 'subscription'
    },
  ],
};

/// Descriptor for `PauseSubscriptionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pauseSubscriptionResponseDescriptor =
    $convert.base64Decode(
        'ChlQYXVzZVN1YnNjcmlwdGlvblJlc3BvbnNlEkcKDHN1YnNjcmlwdGlvbhgBIAEoCzIjLmNlbG'
        'VzdC5jbG91ZC52MWFscGhhMS5TdWJzY3JpcHRpb25SDHN1YnNjcmlwdGlvbg==');

@$core.Deprecated('Use cancelSubscriptionRequestDescriptor instead')
const CancelSubscriptionRequest$json = {
  '1': 'CancelSubscriptionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'details',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.CancelSubscriptionDetails',
      '8': {},
      '10': 'details'
    },
  ],
};

/// Descriptor for `CancelSubscriptionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelSubscriptionRequestDescriptor = $convert.base64Decode(
    'ChlDYW5jZWxTdWJzY3JpcHRpb25SZXF1ZXN0EqwBCgRuYW1lGAEgASgJQpcB4EEC+kEfCh1jbG'
    '91ZC5jZWxlc3QuZGV2L1N1YnNjcmlwdGlvbrpIb7oBbAoSdmFsaWRfc3Vic2NyaXB0aW9uEipt'
    'dXN0IGJlIGEgdmFsaWQgc3Vic2NyaXB0aW9uIHJlc291cmNlIG5hbWUaKnRoaXMubWF0Y2hlcy'
    'gnXnVzZXJzL1teL10rL3N1YnNjcmlwdGlvbiQnKVIEbmFtZRJPCgdkZXRhaWxzGAIgASgLMjAu'
    'Y2VsZXN0LmNsb3VkLnYxYWxwaGExLkNhbmNlbFN1YnNjcmlwdGlvbkRldGFpbHNCA+BBAVIHZG'
    'V0YWlscw==');

@$core.Deprecated('Use cancelSubscriptionDetailsDescriptor instead')
const CancelSubscriptionDetails$json = {
  '1': 'CancelSubscriptionDetails',
  '2': [
    {
      '1': 'reason',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.CancelSubscriptionDetails.Reason',
      '8': {},
      '10': 'reason'
    },
    {
      '1': 'feedback',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.CancelSubscriptionDetails.Feedback',
      '8': {},
      '10': 'feedback'
    },
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'comment'},
  ],
  '4': [
    CancelSubscriptionDetails_Reason$json,
    CancelSubscriptionDetails_Feedback$json
  ],
};

@$core.Deprecated('Use cancelSubscriptionDetailsDescriptor instead')
const CancelSubscriptionDetails_Reason$json = {
  '1': 'Reason',
  '2': [
    {'1': 'REASON_UNSPECIFIED', '2': 0},
    {'1': 'CANCELLATION_REQUESTED', '2': 1},
    {'1': 'PAYMENT_DISPUTED', '2': 2},
    {'1': 'PAYMENT_FAILED', '2': 3},
  ],
};

@$core.Deprecated('Use cancelSubscriptionDetailsDescriptor instead')
const CancelSubscriptionDetails_Feedback$json = {
  '1': 'Feedback',
  '2': [
    {'1': 'FEEDBACK_UNSPECIFIED', '2': 0},
    {'1': 'CUSTOMER_SERVICE', '2': 1},
    {'1': 'LOW_QUALITY', '2': 2},
    {'1': 'MISSING_FEATURES', '2': 3},
    {'1': 'OTHER', '2': 4},
    {'1': 'SWITCHED_SERVICE', '2': 5},
    {'1': 'TOO_COMPLEX', '2': 6},
    {'1': 'TOO_EXPENSIVE', '2': 7},
    {'1': 'UNUSED', '2': 8},
  ],
};

/// Descriptor for `CancelSubscriptionDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelSubscriptionDetailsDescriptor = $convert.base64Decode(
    'ChlDYW5jZWxTdWJzY3JpcHRpb25EZXRhaWxzElQKBnJlYXNvbhgBIAEoDjI3LmNlbGVzdC5jbG'
    '91ZC52MWFscGhhMS5DYW5jZWxTdWJzY3JpcHRpb25EZXRhaWxzLlJlYXNvbkID4EEBUgZyZWFz'
    'b24SWgoIZmVlZGJhY2sYAiABKA4yOS5jZWxlc3QuY2xvdWQudjFhbHBoYTEuQ2FuY2VsU3Vic2'
    'NyaXB0aW9uRGV0YWlscy5GZWVkYmFja0ID4EEBUghmZWVkYmFjaxIdCgdjb21tZW50GAMgASgJ'
    'QgPgQQFSB2NvbW1lbnQiZgoGUmVhc29uEhYKElJFQVNPTl9VTlNQRUNJRklFRBAAEhoKFkNBTk'
    'NFTExBVElPTl9SRVFVRVNURUQQARIUChBQQVlNRU5UX0RJU1BVVEVEEAISEgoOUEFZTUVOVF9G'
    'QUlMRUQQAyKyAQoIRmVlZGJhY2sSGAoURkVFREJBQ0tfVU5TUEVDSUZJRUQQABIUChBDVVNUT0'
    '1FUl9TRVJWSUNFEAESDwoLTE9XX1FVQUxJVFkQAhIUChBNSVNTSU5HX0ZFQVRVUkVTEAMSCQoF'
    'T1RIRVIQBBIUChBTV0lUQ0hFRF9TRVJWSUNFEAUSDwoLVE9PX0NPTVBMRVgQBhIRCg1UT09fRV'
    'hQRU5TSVZFEAcSCgoGVU5VU0VEEAg=');

@$core.Deprecated('Use cancelSubscriptionResponseDescriptor instead')
const CancelSubscriptionResponse$json = {
  '1': 'CancelSubscriptionResponse',
  '2': [
    {
      '1': 'subscription',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Subscription',
      '10': 'subscription'
    },
  ],
};

/// Descriptor for `CancelSubscriptionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelSubscriptionResponseDescriptor =
    $convert.base64Decode(
        'ChpDYW5jZWxTdWJzY3JpcHRpb25SZXNwb25zZRJHCgxzdWJzY3JpcHRpb24YASABKAsyIy5jZW'
        'xlc3QuY2xvdWQudjFhbHBoYTEuU3Vic2NyaXB0aW9uUgxzdWJzY3JpcHRpb24=');

@$core.Deprecated('Use quantityDescriptor instead')
const Quantity$json = {
  '1': 'Quantity',
  '2': [
    {
      '1': 'measure',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.cloud.v1alpha1.Measure',
      '8': {},
      '10': 'measure'
    },
    {'1': 'units', '3': 2, '4': 1, '5': 3, '8': {}, '10': 'units'},
    {'1': 'nanos', '3': 3, '4': 1, '5': 5, '8': {}, '10': 'nanos'},
  ],
};

/// Descriptor for `Quantity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List quantityDescriptor = $convert.base64Decode(
    'CghRdWFudGl0eRI9CgdtZWFzdXJlGAEgASgOMh4uY2VsZXN0LmNsb3VkLnYxYWxwaGExLk1lYX'
    'N1cmVCA+BBAVIHbWVhc3VyZRIgCgV1bml0cxgCIAEoA0IK4EECukgEIgIoAFIFdW5pdHMSIAoF'
    'bmFub3MYAyABKAVCCuBBArpIBBoCKABSBW5hbm9z');

//
//  Generated code. Do not modify.
//  source: cedar/v3/policy.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use policyEffectDescriptor instead')
const PolicyEffect$json = {
  '1': 'PolicyEffect',
  '2': [
    {'1': 'POLICY_EFFECT_UNSPECIFIED', '2': 0},
    {'1': 'POLICY_EFFECT_PERMIT', '2': 1},
    {'1': 'POLICY_EFFECT_FORBID', '2': 2},
  ],
};

/// Descriptor for `PolicyEffect`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List policyEffectDescriptor = $convert.base64Decode(
    'CgxQb2xpY3lFZmZlY3QSHQoZUE9MSUNZX0VGRkVDVF9VTlNQRUNJRklFRBAAEhgKFFBPTElDWV'
    '9FRkZFQ1RfUEVSTUlUEAESGAoUUE9MSUNZX0VGRkVDVF9GT1JCSUQQAg==');

@$core.Deprecated('Use policyOpDescriptor instead')
const PolicyOp$json = {
  '1': 'PolicyOp',
  '2': [
    {'1': 'POLICY_OP_UNSPECIFIED', '2': 0},
    {'1': 'POLICY_OP_ALL', '2': 1},
    {'1': 'POLICY_OP_EQUALS', '2': 2},
    {'1': 'POLICY_OP_IN', '2': 3},
    {'1': 'POLICY_OP_IS', '2': 4},
  ],
};

/// Descriptor for `PolicyOp`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List policyOpDescriptor = $convert.base64Decode(
    'CghQb2xpY3lPcBIZChVQT0xJQ1lfT1BfVU5TUEVDSUZJRUQQABIRCg1QT0xJQ1lfT1BfQUxMEA'
    'ESFAoQUE9MSUNZX09QX0VRVUFMUxACEhAKDFBPTElDWV9PUF9JThADEhAKDFBPTElDWV9PUF9J'
    'UxAE');

@$core.Deprecated('Use policyConditionKindDescriptor instead')
const PolicyConditionKind$json = {
  '1': 'PolicyConditionKind',
  '2': [
    {'1': 'POLICY_CONDITION_KIND_UNSPECIFIED', '2': 0},
    {'1': 'POLICY_CONDITION_KIND_WHEN', '2': 1},
    {'1': 'POLICY_CONDITION_KIND_UNLESS', '2': 2},
  ],
};

/// Descriptor for `PolicyConditionKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List policyConditionKindDescriptor = $convert.base64Decode(
    'ChNQb2xpY3lDb25kaXRpb25LaW5kEiUKIVBPTElDWV9DT05ESVRJT05fS0lORF9VTlNQRUNJRk'
    'lFRBAAEh4KGlBPTElDWV9DT05ESVRJT05fS0lORF9XSEVOEAESIAocUE9MSUNZX0NPTkRJVElP'
    'Tl9LSU5EX1VOTEVTUxAC');

@$core.Deprecated('Use policySetDescriptor instead')
const PolicySet$json = {
  '1': 'PolicySet',
  '2': [
    {
      '1': 'policies',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Policy',
      '10': 'policies'
    },
  ],
};

/// Descriptor for `PolicySet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policySetDescriptor = $convert.base64Decode(
    'CglQb2xpY3lTZXQSLAoIcG9saWNpZXMYASADKAsyEC5jZWRhci52My5Qb2xpY3lSCHBvbGljaW'
    'Vz');

@$core.Deprecated('Use policyDescriptor instead')
const Policy$json = {
  '1': 'Policy',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
    {
      '1': 'effect',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.PolicyEffect',
      '10': 'effect'
    },
    {
      '1': 'principal',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PolicyPrincipal',
      '10': 'principal'
    },
    {
      '1': 'action',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PolicyAction',
      '10': 'action'
    },
    {
      '1': 'resource',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PolicyResource',
      '10': 'resource'
    },
    {
      '1': 'conditions',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.PolicyCondition',
      '10': 'conditions'
    },
    {
      '1': 'annotations',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Policy.AnnotationsEntry',
      '10': 'annotations'
    },
  ],
  '3': [Policy_AnnotationsEntry$json],
  '8': [
    {'1': '_id'},
  ],
};

@$core.Deprecated('Use policyDescriptor instead')
const Policy_AnnotationsEntry$json = {
  '1': 'AnnotationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Policy`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policyDescriptor = $convert.base64Decode(
    'CgZQb2xpY3kSEwoCaWQYASABKAlIAFICaWSIAQESLgoGZWZmZWN0GAIgASgOMhYuY2VkYXIudj'
    'MuUG9saWN5RWZmZWN0UgZlZmZlY3QSNwoJcHJpbmNpcGFsGAMgASgLMhkuY2VkYXIudjMuUG9s'
    'aWN5UHJpbmNpcGFsUglwcmluY2lwYWwSLgoGYWN0aW9uGAQgASgLMhYuY2VkYXIudjMuUG9saW'
    'N5QWN0aW9uUgZhY3Rpb24SNAoIcmVzb3VyY2UYBSABKAsyGC5jZWRhci52My5Qb2xpY3lSZXNv'
    'dXJjZVIIcmVzb3VyY2USOQoKY29uZGl0aW9ucxgGIAMoCzIZLmNlZGFyLnYzLlBvbGljeUNvbm'
    'RpdGlvblIKY29uZGl0aW9ucxJDCgthbm5vdGF0aW9ucxgHIAMoCzIhLmNlZGFyLnYzLlBvbGlj'
    'eS5Bbm5vdGF0aW9uc0VudHJ5Ugthbm5vdGF0aW9ucxo+ChBBbm5vdGF0aW9uc0VudHJ5EhAKA2'
    'tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFCBQoDX2lk');

@$core.Deprecated('Use policyPrincipalDescriptor instead')
const PolicyPrincipal$json = {
  '1': 'PolicyPrincipal',
  '2': [
    {'1': 'op', '3': 1, '4': 1, '5': 14, '6': '.cedar.v3.PolicyOp', '10': 'op'},
    {
      '1': 'entity',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityId',
      '9': 0,
      '10': 'entity',
      '17': true
    },
    {
      '1': 'entity_type',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'entityType',
      '17': true
    },
  ],
  '8': [
    {'1': '_entity'},
    {'1': '_entity_type'},
  ],
};

/// Descriptor for `PolicyPrincipal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policyPrincipalDescriptor = $convert.base64Decode(
    'Cg9Qb2xpY3lQcmluY2lwYWwSIgoCb3AYASABKA4yEi5jZWRhci52My5Qb2xpY3lPcFICb3ASLw'
    'oGZW50aXR5GAIgASgLMhIuY2VkYXIudjMuRW50aXR5SWRIAFIGZW50aXR5iAEBEiQKC2VudGl0'
    'eV90eXBlGAMgASgJSAFSCmVudGl0eVR5cGWIAQFCCQoHX2VudGl0eUIOCgxfZW50aXR5X3R5cG'
    'U=');

@$core.Deprecated('Use policyActionDescriptor instead')
const PolicyAction$json = {
  '1': 'PolicyAction',
  '2': [
    {'1': 'op', '3': 1, '4': 1, '5': 14, '6': '.cedar.v3.PolicyOp', '10': 'op'},
    {
      '1': 'entity',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityId',
      '9': 0,
      '10': 'entity',
      '17': true
    },
    {
      '1': 'entities',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.EntityId',
      '10': 'entities'
    },
  ],
  '8': [
    {'1': '_entity'},
  ],
};

/// Descriptor for `PolicyAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policyActionDescriptor = $convert.base64Decode(
    'CgxQb2xpY3lBY3Rpb24SIgoCb3AYASABKA4yEi5jZWRhci52My5Qb2xpY3lPcFICb3ASLwoGZW'
    '50aXR5GAIgASgLMhIuY2VkYXIudjMuRW50aXR5SWRIAFIGZW50aXR5iAEBEi4KCGVudGl0aWVz'
    'GAMgAygLMhIuY2VkYXIudjMuRW50aXR5SWRSCGVudGl0aWVzQgkKB19lbnRpdHk=');

@$core.Deprecated('Use policyResourceDescriptor instead')
const PolicyResource$json = {
  '1': 'PolicyResource',
  '2': [
    {'1': 'op', '3': 1, '4': 1, '5': 14, '6': '.cedar.v3.PolicyOp', '10': 'op'},
    {
      '1': 'entity',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityId',
      '9': 0,
      '10': 'entity',
      '17': true
    },
    {
      '1': 'entity_type',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'entityType',
      '17': true
    },
  ],
  '8': [
    {'1': '_entity'},
    {'1': '_entity_type'},
  ],
};

/// Descriptor for `PolicyResource`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policyResourceDescriptor = $convert.base64Decode(
    'Cg5Qb2xpY3lSZXNvdXJjZRIiCgJvcBgBIAEoDjISLmNlZGFyLnYzLlBvbGljeU9wUgJvcBIvCg'
    'ZlbnRpdHkYAiABKAsyEi5jZWRhci52My5FbnRpdHlJZEgAUgZlbnRpdHmIAQESJAoLZW50aXR5'
    'X3R5cGUYAyABKAlIAVIKZW50aXR5VHlwZYgBAUIJCgdfZW50aXR5Qg4KDF9lbnRpdHlfdHlwZQ'
    '==');

@$core.Deprecated('Use policyConditionDescriptor instead')
const PolicyCondition$json = {
  '1': 'PolicyCondition',
  '2': [
    {
      '1': 'kind',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.PolicyConditionKind',
      '10': 'kind'
    },
    {'1': 'body', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'body'},
  ],
};

/// Descriptor for `PolicyCondition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policyConditionDescriptor = $convert.base64Decode(
    'Cg9Qb2xpY3lDb25kaXRpb24SMQoEa2luZBgBIAEoDjIdLmNlZGFyLnYzLlBvbGljeUNvbmRpdG'
    'lvbktpbmRSBGtpbmQSIgoEYm9keRgCIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGJvZHk=');

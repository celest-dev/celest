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

@$core.Deprecated('Use effectDescriptor instead')
const Effect$json = {
  '1': 'Effect',
  '2': [
    {'1': 'EFFECT_UNSPECIFIED', '2': 0},
    {'1': 'EFFECT_PERMIT', '2': 1},
    {'1': 'EFFECT_FORBID', '2': 2},
  ],
};

/// Descriptor for `Effect`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List effectDescriptor = $convert.base64Decode(
    'CgZFZmZlY3QSFgoSRUZGRUNUX1VOU1BFQ0lGSUVEEAASEQoNRUZGRUNUX1BFUk1JVBABEhEKDU'
    'VGRkVDVF9GT1JCSUQQAg==');

@$core.Deprecated('Use conditionKindDescriptor instead')
const ConditionKind$json = {
  '1': 'ConditionKind',
  '2': [
    {'1': 'CONDITION_KIND_UNSPECIFIED', '2': 0},
    {'1': 'CONDITION_KIND_WHEN', '2': 1},
    {'1': 'CONDITION_KIND_UNLESS', '2': 2},
  ],
};

/// Descriptor for `ConditionKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List conditionKindDescriptor = $convert.base64Decode(
    'Cg1Db25kaXRpb25LaW5kEh4KGkNPTkRJVElPTl9LSU5EX1VOU1BFQ0lGSUVEEAASFwoTQ09ORE'
    'lUSU9OX0tJTkRfV0hFThABEhkKFUNPTkRJVElPTl9LSU5EX1VOTEVTUxAC');

@$core.Deprecated('Use policySetDescriptor instead')
const PolicySet$json = {
  '1': 'PolicySet',
  '2': [
    {
      '1': 'policies',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.PolicySet.PoliciesEntry',
      '10': 'policies'
    },
    {
      '1': 'templates',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.PolicySet.TemplatesEntry',
      '10': 'templates'
    },
    {
      '1': 'template_links',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.TemplateLink',
      '10': 'templateLinks'
    },
  ],
  '3': [PolicySet_PoliciesEntry$json, PolicySet_TemplatesEntry$json],
};

@$core.Deprecated('Use policySetDescriptor instead')
const PolicySet_PoliciesEntry$json = {
  '1': 'PoliciesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Policy',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use policySetDescriptor instead')
const PolicySet_TemplatesEntry$json = {
  '1': 'TemplatesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Policy',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `PolicySet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policySetDescriptor = $convert.base64Decode(
    'CglQb2xpY3lTZXQSPQoIcG9saWNpZXMYASADKAsyIS5jZWRhci52My5Qb2xpY3lTZXQuUG9saW'
    'NpZXNFbnRyeVIIcG9saWNpZXMSQAoJdGVtcGxhdGVzGAIgAygLMiIuY2VkYXIudjMuUG9saWN5'
    'U2V0LlRlbXBsYXRlc0VudHJ5Ugl0ZW1wbGF0ZXMSPQoOdGVtcGxhdGVfbGlua3MYAyADKAsyFi'
    '5jZWRhci52My5UZW1wbGF0ZUxpbmtSDXRlbXBsYXRlTGlua3MaTQoNUG9saWNpZXNFbnRyeRIQ'
    'CgNrZXkYASABKAlSA2tleRImCgV2YWx1ZRgCIAEoCzIQLmNlZGFyLnYzLlBvbGljeVIFdmFsdW'
    'U6AjgBGk4KDlRlbXBsYXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiYKBXZhbHVlGAIgASgL'
    'MhAuY2VkYXIudjMuUG9saWN5UgV2YWx1ZToCOAE=');

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
      '6': '.cedar.v3.Effect',
      '10': 'effect'
    },
    {
      '1': 'principal',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PrincipalConstraint',
      '10': 'principal'
    },
    {
      '1': 'action',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ActionConstraint',
      '10': 'action'
    },
    {
      '1': 'resource',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ResourceConstraint',
      '10': 'resource'
    },
    {
      '1': 'conditions',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Condition',
      '10': 'conditions'
    },
    {
      '1': 'annotations',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Annotations',
      '10': 'annotations'
    },
    {
      '1': 'position',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Position',
      '10': 'position'
    },
  ],
  '8': [
    {'1': '_id'},
  ],
};

/// Descriptor for `Policy`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List policyDescriptor = $convert.base64Decode(
    'CgZQb2xpY3kSEwoCaWQYASABKAlIAFICaWSIAQESKAoGZWZmZWN0GAIgASgOMhAuY2VkYXIudj'
    'MuRWZmZWN0UgZlZmZlY3QSOwoJcHJpbmNpcGFsGAMgASgLMh0uY2VkYXIudjMuUHJpbmNpcGFs'
    'Q29uc3RyYWludFIJcHJpbmNpcGFsEjIKBmFjdGlvbhgEIAEoCzIaLmNlZGFyLnYzLkFjdGlvbk'
    'NvbnN0cmFpbnRSBmFjdGlvbhI4CghyZXNvdXJjZRgFIAEoCzIcLmNlZGFyLnYzLlJlc291cmNl'
    'Q29uc3RyYWludFIIcmVzb3VyY2USMwoKY29uZGl0aW9ucxgGIAMoCzITLmNlZGFyLnYzLkNvbm'
    'RpdGlvblIKY29uZGl0aW9ucxI3Cgthbm5vdGF0aW9ucxgHIAEoCzIVLmNlZGFyLnYzLkFubm90'
    'YXRpb25zUgthbm5vdGF0aW9ucxIuCghwb3NpdGlvbhgIIAEoCzISLmNlZGFyLnYzLlBvc2l0aW'
    '9uUghwb3NpdGlvbkIFCgNfaWQ=');

@$core.Deprecated('Use annotationsDescriptor instead')
const Annotations$json = {
  '1': 'Annotations',
  '2': [
    {
      '1': 'annotations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Annotations.AnnotationsEntry',
      '10': 'annotations'
    },
  ],
  '3': [Annotations_AnnotationsEntry$json],
};

@$core.Deprecated('Use annotationsDescriptor instead')
const Annotations_AnnotationsEntry$json = {
  '1': 'AnnotationsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Annotations`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List annotationsDescriptor = $convert.base64Decode(
    'CgtBbm5vdGF0aW9ucxJICgthbm5vdGF0aW9ucxgBIAMoCzImLmNlZGFyLnYzLkFubm90YXRpb2'
    '5zLkFubm90YXRpb25zRW50cnlSC2Fubm90YXRpb25zGj4KEEFubm90YXRpb25zRW50cnkSEAoD'
    'a2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use positionDescriptor instead')
const Position$json = {
  '1': 'Position',
  '2': [
    {
      '1': 'filename',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'filename',
      '17': true
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 13, '10': 'offset'},
    {'1': 'line', '3': 3, '4': 1, '5': 13, '10': 'line'},
    {'1': 'column', '3': 4, '4': 1, '5': 13, '10': 'column'},
  ],
  '8': [
    {'1': '_filename'},
  ],
};

/// Descriptor for `Position`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionDescriptor = $convert.base64Decode(
    'CghQb3NpdGlvbhIfCghmaWxlbmFtZRgBIAEoCUgAUghmaWxlbmFtZYgBARIWCgZvZmZzZXQYAi'
    'ABKA1SBm9mZnNldBISCgRsaW5lGAMgASgNUgRsaW5lEhYKBmNvbHVtbhgEIAEoDVIGY29sdW1u'
    'QgsKCV9maWxlbmFtZQ==');

@$core.Deprecated('Use principalConstraintDescriptor instead')
const PrincipalConstraint$json = {
  '1': 'PrincipalConstraint',
  '2': [
    {
      '1': 'all',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PrincipalAll',
      '9': 0,
      '10': 'all'
    },
    {
      '1': 'equals',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PrincipalEquals',
      '9': 0,
      '10': 'equals'
    },
    {
      '1': 'in',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PrincipalIn',
      '8': {'28700919': 'in_'},
      '9': 0,
      '10': 'in',
    },
    {
      '1': 'is_in',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PrincipalIsIn',
      '9': 0,
      '10': 'isIn'
    },
    {
      '1': 'is',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.PrincipalIs',
      '9': 0,
      '10': 'is'
    },
  ],
  '8': [
    {'1': 'constraint'},
  ],
};

/// Descriptor for `PrincipalConstraint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List principalConstraintDescriptor = $convert.base64Decode(
    'ChNQcmluY2lwYWxDb25zdHJhaW50EioKA2FsbBgBIAEoCzIWLmNlZGFyLnYzLlByaW5jaXBhbE'
    'FsbEgAUgNhbGwSMwoGZXF1YWxzGAIgASgLMhkuY2VkYXIudjMuUHJpbmNpcGFsRXF1YWxzSABS'
    'BmVxdWFscxIxCgJpbhgDIAEoCzIVLmNlZGFyLnYzLlByaW5jaXBhbEluQgi6j75tA2luX0gAUg'
    'JpbhIuCgVpc19pbhgEIAEoCzIXLmNlZGFyLnYzLlByaW5jaXBhbElzSW5IAFIEaXNJbhInCgJp'
    'cxgFIAEoCzIVLmNlZGFyLnYzLlByaW5jaXBhbElzSABSAmlzQgwKCmNvbnN0cmFpbnQ=');

@$core.Deprecated('Use principalAllDescriptor instead')
const PrincipalAll$json = {
  '1': 'PrincipalAll',
};

/// Descriptor for `PrincipalAll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List principalAllDescriptor =
    $convert.base64Decode('CgxQcmluY2lwYWxBbGw=');

@$core.Deprecated('Use principalEqualsDescriptor instead')
const PrincipalEquals$json = {
  '1': 'PrincipalEquals',
  '2': [
    {
      '1': 'slot',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.SlotId',
      '9': 0,
      '10': 'slot'
    },
    {
      '1': 'entity',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '9': 0,
      '10': 'entity'
    },
  ],
  '8': [
    {'1': 'component'},
  ],
};

/// Descriptor for `PrincipalEquals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List principalEqualsDescriptor = $convert.base64Decode(
    'Cg9QcmluY2lwYWxFcXVhbHMSJgoEc2xvdBgBIAEoDjIQLmNlZGFyLnYzLlNsb3RJZEgAUgRzbG'
    '90Ei0KBmVudGl0eRgCIAEoCzITLmNlZGFyLnYzLkVudGl0eVVpZEgAUgZlbnRpdHlCCwoJY29t'
    'cG9uZW50');

@$core.Deprecated('Use principalInDescriptor instead')
const PrincipalIn$json = {
  '1': 'PrincipalIn',
  '2': [
    {
      '1': 'slot',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.SlotId',
      '9': 0,
      '10': 'slot'
    },
    {
      '1': 'entity',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '9': 0,
      '10': 'entity'
    },
  ],
  '8': [
    {'1': 'component'},
  ],
};

/// Descriptor for `PrincipalIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List principalInDescriptor = $convert.base64Decode(
    'CgtQcmluY2lwYWxJbhImCgRzbG90GAEgASgOMhAuY2VkYXIudjMuU2xvdElkSABSBHNsb3QSLQ'
    'oGZW50aXR5GAIgASgLMhMuY2VkYXIudjMuRW50aXR5VWlkSABSBmVudGl0eUILCgljb21wb25l'
    'bnQ=');

@$core.Deprecated('Use principalIsInDescriptor instead')
const PrincipalIsIn$json = {
  '1': 'PrincipalIsIn',
  '2': [
    {'1': 'entity_type', '3': 1, '4': 1, '5': 9, '10': 'entityType'},
    {
      '1': 'slot',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.SlotId',
      '9': 0,
      '10': 'slot'
    },
    {
      '1': 'entity',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '9': 0,
      '10': 'entity'
    },
  ],
  '8': [
    {'1': 'in'},
  ],
};

/// Descriptor for `PrincipalIsIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List principalIsInDescriptor = $convert.base64Decode(
    'Cg1QcmluY2lwYWxJc0luEh8KC2VudGl0eV90eXBlGAEgASgJUgplbnRpdHlUeXBlEiYKBHNsb3'
    'QYAiABKA4yEC5jZWRhci52My5TbG90SWRIAFIEc2xvdBItCgZlbnRpdHkYAyABKAsyEy5jZWRh'
    'ci52My5FbnRpdHlVaWRIAFIGZW50aXR5QgQKAmlu');

@$core.Deprecated('Use principalIsDescriptor instead')
const PrincipalIs$json = {
  '1': 'PrincipalIs',
  '2': [
    {'1': 'entity_type', '3': 1, '4': 1, '5': 9, '10': 'entityType'},
  ],
};

/// Descriptor for `PrincipalIs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List principalIsDescriptor = $convert.base64Decode(
    'CgtQcmluY2lwYWxJcxIfCgtlbnRpdHlfdHlwZRgBIAEoCVIKZW50aXR5VHlwZQ==');

@$core.Deprecated('Use actionConstraintDescriptor instead')
const ActionConstraint$json = {
  '1': 'ActionConstraint',
  '2': [
    {
      '1': 'all',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ActionAll',
      '9': 0,
      '10': 'all'
    },
    {
      '1': 'equals',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ActionEquals',
      '9': 0,
      '10': 'equals'
    },
    {
      '1': 'in',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ActionIn',
      '8': {'28700919': 'in_'},
      '9': 0,
      '10': 'in',
    },
    {
      '1': 'in_set',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ActionInSet',
      '9': 0,
      '10': 'inSet'
    },
  ],
  '8': [
    {'1': 'constraint'},
  ],
};

/// Descriptor for `ActionConstraint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionConstraintDescriptor = $convert.base64Decode(
    'ChBBY3Rpb25Db25zdHJhaW50EicKA2FsbBgBIAEoCzITLmNlZGFyLnYzLkFjdGlvbkFsbEgAUg'
    'NhbGwSMAoGZXF1YWxzGAIgASgLMhYuY2VkYXIudjMuQWN0aW9uRXF1YWxzSABSBmVxdWFscxIu'
    'CgJpbhgDIAEoCzISLmNlZGFyLnYzLkFjdGlvbkluQgi6j75tA2luX0gAUgJpbhIuCgZpbl9zZX'
    'QYBCABKAsyFS5jZWRhci52My5BY3Rpb25JblNldEgAUgVpblNldEIMCgpjb25zdHJhaW50');

@$core.Deprecated('Use actionAllDescriptor instead')
const ActionAll$json = {
  '1': 'ActionAll',
};

/// Descriptor for `ActionAll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionAllDescriptor =
    $convert.base64Decode('CglBY3Rpb25BbGw=');

@$core.Deprecated('Use actionEqualsDescriptor instead')
const ActionEquals$json = {
  '1': 'ActionEquals',
  '2': [
    {
      '1': 'entity',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '10': 'entity'
    },
  ],
};

/// Descriptor for `ActionEquals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionEqualsDescriptor = $convert.base64Decode(
    'CgxBY3Rpb25FcXVhbHMSKwoGZW50aXR5GAEgASgLMhMuY2VkYXIudjMuRW50aXR5VWlkUgZlbn'
    'RpdHk=');

@$core.Deprecated('Use actionInDescriptor instead')
const ActionIn$json = {
  '1': 'ActionIn',
  '2': [
    {
      '1': 'entity',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '10': 'entity'
    },
  ],
};

/// Descriptor for `ActionIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionInDescriptor = $convert.base64Decode(
    'CghBY3Rpb25JbhIrCgZlbnRpdHkYASABKAsyEy5jZWRhci52My5FbnRpdHlVaWRSBmVudGl0eQ'
    '==');

@$core.Deprecated('Use actionInSetDescriptor instead')
const ActionInSet$json = {
  '1': 'ActionInSet',
  '2': [
    {
      '1': 'entities',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '10': 'entities'
    },
  ],
};

/// Descriptor for `ActionInSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionInSetDescriptor = $convert.base64Decode(
    'CgtBY3Rpb25JblNldBIvCghlbnRpdGllcxgBIAMoCzITLmNlZGFyLnYzLkVudGl0eVVpZFIIZW'
    '50aXRpZXM=');

@$core.Deprecated('Use resourceConstraintDescriptor instead')
const ResourceConstraint$json = {
  '1': 'ResourceConstraint',
  '2': [
    {
      '1': 'all',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ResourceAll',
      '9': 0,
      '10': 'all'
    },
    {
      '1': 'equals',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ResourceEquals',
      '9': 0,
      '10': 'equals'
    },
    {
      '1': 'in',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ResourceIn',
      '8': {'28700919': 'in_'},
      '9': 0,
      '10': 'in',
    },
    {
      '1': 'is_in',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ResourceIsIn',
      '9': 0,
      '10': 'isIn'
    },
    {
      '1': 'is',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ResourceIs',
      '9': 0,
      '10': 'is'
    },
  ],
  '8': [
    {'1': 'constraint'},
  ],
};

/// Descriptor for `ResourceConstraint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceConstraintDescriptor = $convert.base64Decode(
    'ChJSZXNvdXJjZUNvbnN0cmFpbnQSKQoDYWxsGAEgASgLMhUuY2VkYXIudjMuUmVzb3VyY2VBbG'
    'xIAFIDYWxsEjIKBmVxdWFscxgCIAEoCzIYLmNlZGFyLnYzLlJlc291cmNlRXF1YWxzSABSBmVx'
    'dWFscxIwCgJpbhgDIAEoCzIULmNlZGFyLnYzLlJlc291cmNlSW5CCLqPvm0DaW5fSABSAmluEi'
    '0KBWlzX2luGAQgASgLMhYuY2VkYXIudjMuUmVzb3VyY2VJc0luSABSBGlzSW4SJgoCaXMYBSAB'
    'KAsyFC5jZWRhci52My5SZXNvdXJjZUlzSABSAmlzQgwKCmNvbnN0cmFpbnQ=');

@$core.Deprecated('Use resourceAllDescriptor instead')
const ResourceAll$json = {
  '1': 'ResourceAll',
};

/// Descriptor for `ResourceAll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceAllDescriptor =
    $convert.base64Decode('CgtSZXNvdXJjZUFsbA==');

@$core.Deprecated('Use resourceEqualsDescriptor instead')
const ResourceEquals$json = {
  '1': 'ResourceEquals',
  '2': [
    {
      '1': 'slot',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.SlotId',
      '9': 0,
      '10': 'slot'
    },
    {
      '1': 'entity',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '9': 0,
      '10': 'entity'
    },
  ],
  '8': [
    {'1': 'component'},
  ],
};

/// Descriptor for `ResourceEquals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceEqualsDescriptor = $convert.base64Decode(
    'Cg5SZXNvdXJjZUVxdWFscxImCgRzbG90GAEgASgOMhAuY2VkYXIudjMuU2xvdElkSABSBHNsb3'
    'QSLQoGZW50aXR5GAIgASgLMhMuY2VkYXIudjMuRW50aXR5VWlkSABSBmVudGl0eUILCgljb21w'
    'b25lbnQ=');

@$core.Deprecated('Use resourceInDescriptor instead')
const ResourceIn$json = {
  '1': 'ResourceIn',
  '2': [
    {
      '1': 'slot',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.SlotId',
      '9': 0,
      '10': 'slot'
    },
    {
      '1': 'entity',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '9': 0,
      '10': 'entity'
    },
  ],
  '8': [
    {'1': 'component'},
  ],
};

/// Descriptor for `ResourceIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceInDescriptor = $convert.base64Decode(
    'CgpSZXNvdXJjZUluEiYKBHNsb3QYASABKA4yEC5jZWRhci52My5TbG90SWRIAFIEc2xvdBItCg'
    'ZlbnRpdHkYAiABKAsyEy5jZWRhci52My5FbnRpdHlVaWRIAFIGZW50aXR5QgsKCWNvbXBvbmVu'
    'dA==');

@$core.Deprecated('Use resourceIsInDescriptor instead')
const ResourceIsIn$json = {
  '1': 'ResourceIsIn',
  '2': [
    {'1': 'entity_type', '3': 1, '4': 1, '5': 9, '10': 'entityType'},
    {
      '1': 'slot',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.SlotId',
      '9': 0,
      '10': 'slot'
    },
    {
      '1': 'entity',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '9': 0,
      '10': 'entity'
    },
  ],
  '8': [
    {'1': 'in'},
  ],
};

/// Descriptor for `ResourceIsIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceIsInDescriptor = $convert.base64Decode(
    'CgxSZXNvdXJjZUlzSW4SHwoLZW50aXR5X3R5cGUYASABKAlSCmVudGl0eVR5cGUSJgoEc2xvdB'
    'gCIAEoDjIQLmNlZGFyLnYzLlNsb3RJZEgAUgRzbG90Ei0KBmVudGl0eRgDIAEoCzITLmNlZGFy'
    'LnYzLkVudGl0eVVpZEgAUgZlbnRpdHlCBAoCaW4=');

@$core.Deprecated('Use resourceIsDescriptor instead')
const ResourceIs$json = {
  '1': 'ResourceIs',
  '2': [
    {'1': 'entity_type', '3': 1, '4': 1, '5': 9, '10': 'entityType'},
  ],
};

/// Descriptor for `ResourceIs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceIsDescriptor = $convert.base64Decode(
    'CgpSZXNvdXJjZUlzEh8KC2VudGl0eV90eXBlGAEgASgJUgplbnRpdHlUeXBl');

@$core.Deprecated('Use conditionDescriptor instead')
const Condition$json = {
  '1': 'Condition',
  '2': [
    {
      '1': 'kind',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.cedar.v3.ConditionKind',
      '10': 'kind'
    },
    {'1': 'body', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'body'},
  ],
};

/// Descriptor for `Condition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conditionDescriptor = $convert.base64Decode(
    'CglDb25kaXRpb24SKwoEa2luZBgBIAEoDjIXLmNlZGFyLnYzLkNvbmRpdGlvbktpbmRSBGtpbm'
    'QSIgoEYm9keRgCIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGJvZHk=');

@$core.Deprecated('Use templateLinkDescriptor instead')
const TemplateLink$json = {
  '1': 'TemplateLink',
  '2': [
    {'1': 'template_id', '3': 1, '4': 1, '5': 9, '10': 'templateId'},
    {'1': 'new_id', '3': 2, '4': 1, '5': 9, '10': 'newId'},
    {
      '1': 'values',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.TemplateLink.ValuesEntry',
      '10': 'values'
    },
  ],
  '3': [TemplateLink_ValuesEntry$json],
};

@$core.Deprecated('Use templateLinkDescriptor instead')
const TemplateLink_ValuesEntry$json = {
  '1': 'ValuesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `TemplateLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateLinkDescriptor = $convert.base64Decode(
    'CgxUZW1wbGF0ZUxpbmsSHwoLdGVtcGxhdGVfaWQYASABKAlSCnRlbXBsYXRlSWQSFQoGbmV3X2'
    'lkGAIgASgJUgVuZXdJZBI6CgZ2YWx1ZXMYAyADKAsyIi5jZWRhci52My5UZW1wbGF0ZUxpbmsu'
    'VmFsdWVzRW50cnlSBnZhbHVlcxpOCgtWYWx1ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIpCg'
    'V2YWx1ZRgCIAEoCzITLmNlZGFyLnYzLkVudGl0eVVpZFIFdmFsdWU6AjgB');

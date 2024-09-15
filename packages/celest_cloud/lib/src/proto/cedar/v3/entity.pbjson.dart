//
//  Generated code. Do not modify.
//  source: cedar/v3/entity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use entityDescriptor instead')
const Entity$json = {
  '1': 'Entity',
  '2': [
    {
      '1': 'uid',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '10': 'uid'
    },
    {
      '1': 'parents',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '10': 'parents'
    },
    {
      '1': 'attributes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Entity.AttributesEntry',
      '10': 'attributes'
    },
  ],
  '3': [Entity_AttributesEntry$json],
};

@$core.Deprecated('Use entityDescriptor instead')
const Entity_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Value',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `Entity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityDescriptor = $convert.base64Decode(
    'CgZFbnRpdHkSJQoDdWlkGAEgASgLMhMuY2VkYXIudjMuRW50aXR5VWlkUgN1aWQSLQoHcGFyZW'
    '50cxgCIAMoCzITLmNlZGFyLnYzLkVudGl0eVVpZFIHcGFyZW50cxJACgphdHRyaWJ1dGVzGAMg'
    'AygLMiAuY2VkYXIudjMuRW50aXR5LkF0dHJpYnV0ZXNFbnRyeVIKYXR0cmlidXRlcxpOCg9BdH'
    'RyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSJQoFdmFsdWUYAiABKAsyDy5jZWRhci52'
    'My5WYWx1ZVIFdmFsdWU6AjgB');

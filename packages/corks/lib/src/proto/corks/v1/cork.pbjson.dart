//
//  Generated code. Do not modify.
//  source: corks/v1/cork.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use corkDescriptor instead')
const Cork$json = {
  '1': 'Cork',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'key_id', '3': 2, '4': 1, '5': 12, '10': 'keyId'},
    {'1': 'bearer', '3': 3, '4': 1, '5': 11, '6': '.corks.v1.Bearer', '9': 0, '10': 'bearer', '17': true},
    {'1': 'caveats', '3': 4, '4': 3, '5': 11, '6': '.corks.v1.Caveat', '10': 'caveats'},
    {'1': 'signature', '3': 5, '4': 1, '5': 12, '10': 'signature'},
  ],
  '8': [
    {'1': '_bearer'},
  ],
};

/// Descriptor for `Cork`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List corkDescriptor = $convert.base64Decode(
    'CgRDb3JrEg4KAmlkGAEgASgMUgJpZBIVCgZrZXlfaWQYAiABKAxSBWtleUlkEi0KBmJlYXJlch'
    'gDIAEoCzIQLmNvcmtzLnYxLkJlYXJlckgAUgZiZWFyZXKIAQESKgoHY2F2ZWF0cxgEIAMoCzIQ'
    'LmNvcmtzLnYxLkNhdmVhdFIHY2F2ZWF0cxIcCglzaWduYXR1cmUYBSABKAxSCXNpZ25hdHVyZU'
    'IJCgdfYmVhcmVy');

@$core.Deprecated('Use bearerDescriptor instead')
const Bearer$json = {
  '1': 'Bearer',
  '2': [
    {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
    {'1': 'entity', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Entity', '9': 0, '10': 'entity'},
  ],
  '8': [
    {'1': 'bearer'},
  ],
};

/// Descriptor for `Bearer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bearerDescriptor = $convert.base64Decode(
    'CgZCZWFyZXISHAoJc2lnbmF0dXJlGAEgASgMUglzaWduYXR1cmUSKgoGZW50aXR5GAIgASgLMh'
    'AuY2VkYXIudjMuRW50aXR5SABSBmVudGl0eUIICgZiZWFyZXI=');

@$core.Deprecated('Use caveatDescriptor instead')
const Caveat$json = {
  '1': 'Caveat',
  '2': [
    {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
    {'1': 'policy', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Policy', '9': 0, '10': 'policy'},
  ],
  '8': [
    {'1': 'block'},
  ],
};

/// Descriptor for `Caveat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caveatDescriptor = $convert.base64Decode(
    'CgZDYXZlYXQSHAoJc2lnbmF0dXJlGAEgASgMUglzaWduYXR1cmUSKgoGcG9saWN5GAIgASgLMh'
    'AuY2VkYXIudjMuUG9saWN5SABSBnBvbGljeUIHCgVibG9jaw==');


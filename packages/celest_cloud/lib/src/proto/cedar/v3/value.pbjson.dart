//
//  Generated code. Do not modify.
//  source: cedar/v3/value.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use valueDescriptor instead')
const Value$json = {
  '1': 'Value',
  '2': [
    {'1': 'string', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'string'},
    {'1': 'long', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'long'},
    {'1': 'bool', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'bool'},
    {
      '1': 'set',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.SetValue',
      '9': 0,
      '10': 'set'
    },
    {
      '1': 'record',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.RecordValue',
      '9': 0,
      '10': 'record'
    },
    {
      '1': 'extension',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ExtensionValue',
      '9': 0,
      '10': 'extension'
    },
    {
      '1': 'entity',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityValue',
      '9': 0,
      '10': 'entity'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueDescriptor = $convert.base64Decode(
    'CgVWYWx1ZRIYCgZzdHJpbmcYASABKAlIAFIGc3RyaW5nEhQKBGxvbmcYAiABKANIAFIEbG9uZx'
    'IUCgRib29sGAMgASgISABSBGJvb2wSJgoDc2V0GAQgASgLMhIuY2VkYXIudjMuU2V0VmFsdWVI'
    'AFIDc2V0Ei8KBnJlY29yZBgFIAEoCzIVLmNlZGFyLnYzLlJlY29yZFZhbHVlSABSBnJlY29yZB'
    'I4CglleHRlbnNpb24YBiABKAsyGC5jZWRhci52My5FeHRlbnNpb25WYWx1ZUgAUglleHRlbnNp'
    'b24SLwoGZW50aXR5GAcgASgLMhUuY2VkYXIudjMuRW50aXR5VmFsdWVIAFIGZW50aXR5QgcKBX'
    'ZhbHVl');

@$core.Deprecated('Use setValueDescriptor instead')
const SetValue$json = {
  '1': 'SetValue',
  '2': [
    {
      '1': 'values',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Value',
      '10': 'values'
    },
  ],
};

/// Descriptor for `SetValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setValueDescriptor = $convert.base64Decode(
    'CghTZXRWYWx1ZRInCgZ2YWx1ZXMYASADKAsyDy5jZWRhci52My5WYWx1ZVIGdmFsdWVz');

@$core.Deprecated('Use recordValueDescriptor instead')
const RecordValue$json = {
  '1': 'RecordValue',
  '2': [
    {
      '1': 'values',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.RecordValue.ValuesEntry',
      '10': 'values'
    },
  ],
  '3': [RecordValue_ValuesEntry$json],
};

@$core.Deprecated('Use recordValueDescriptor instead')
const RecordValue_ValuesEntry$json = {
  '1': 'ValuesEntry',
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

/// Descriptor for `RecordValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordValueDescriptor = $convert.base64Decode(
    'CgtSZWNvcmRWYWx1ZRI5CgZ2YWx1ZXMYASADKAsyIS5jZWRhci52My5SZWNvcmRWYWx1ZS5WYW'
    'x1ZXNFbnRyeVIGdmFsdWVzGkoKC1ZhbHVlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiUKBXZh'
    'bHVlGAIgASgLMg8uY2VkYXIudjMuVmFsdWVSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use extensionValueDescriptor instead')
const ExtensionValue$json = {
  '1': 'ExtensionValue',
  '2': [
    {'1': 'fn', '3': 1, '4': 1, '5': 9, '10': 'fn'},
    {'1': 'arg', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Value', '10': 'arg'},
  ],
};

/// Descriptor for `ExtensionValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionValueDescriptor = $convert.base64Decode(
    'Cg5FeHRlbnNpb25WYWx1ZRIOCgJmbhgBIAEoCVICZm4SIQoDYXJnGAIgASgLMg8uY2VkYXIudj'
    'MuVmFsdWVSA2FyZw==');

@$core.Deprecated('Use entityValueDescriptor instead')
const EntityValue$json = {
  '1': 'EntityValue',
  '2': [
    {
      '1': 'uid',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityId',
      '10': 'uid'
    },
  ],
};

/// Descriptor for `EntityValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityValueDescriptor = $convert.base64Decode(
    'CgtFbnRpdHlWYWx1ZRIkCgN1aWQYASABKAsyEi5jZWRhci52My5FbnRpdHlJZFIDdWlk');

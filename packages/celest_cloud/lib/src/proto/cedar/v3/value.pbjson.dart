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
    {
      '1': 'string',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.StringValue',
      '9': 0,
      '10': 'string'
    },
    {
      '1': 'long',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Int64Value',
      '9': 0,
      '10': 'long'
    },
    {
      '1': 'bool',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.BoolValue',
      '9': 0,
      '10': 'bool'
    },
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
      '1': 'extension_call',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ExtensionCall',
      '9': 0,
      '10': 'extensionCall'
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
    {
      '1': 'decimal',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.DecimalValue',
      '9': 0,
      '10': 'decimal'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueDescriptor = $convert.base64Decode(
    'CgVWYWx1ZRI2CgZzdHJpbmcYASABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVIAF'
    'IGc3RyaW5nEjEKBGxvbmcYAiABKAsyGy5nb29nbGUucHJvdG9idWYuSW50NjRWYWx1ZUgAUgRs'
    'b25nEjAKBGJvb2wYAyABKAsyGi5nb29nbGUucHJvdG9idWYuQm9vbFZhbHVlSABSBGJvb2wSJg'
    'oDc2V0GAQgASgLMhIuY2VkYXIudjMuU2V0VmFsdWVIAFIDc2V0Ei8KBnJlY29yZBgFIAEoCzIV'
    'LmNlZGFyLnYzLlJlY29yZFZhbHVlSABSBnJlY29yZBJACg5leHRlbnNpb25fY2FsbBgGIAEoCz'
    'IXLmNlZGFyLnYzLkV4dGVuc2lvbkNhbGxIAFINZXh0ZW5zaW9uQ2FsbBIvCgZlbnRpdHkYByAB'
    'KAsyFS5jZWRhci52My5FbnRpdHlWYWx1ZUgAUgZlbnRpdHkSMgoHZGVjaW1hbBgIIAEoCzIWLm'
    'NlZGFyLnYzLkRlY2ltYWxWYWx1ZUgAUgdkZWNpbWFsQgcKBXZhbHVl');

@$core.Deprecated('Use setValueDescriptor instead')
const SetValue$json = {
  '1': 'SetValue',
  '2': [
    {
      '1': 'elements',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Value',
      '10': 'elements'
    },
  ],
};

/// Descriptor for `SetValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setValueDescriptor = $convert.base64Decode(
    'CghTZXRWYWx1ZRIrCghlbGVtZW50cxgBIAMoCzIPLmNlZGFyLnYzLlZhbHVlUghlbGVtZW50cw'
    '==');

@$core.Deprecated('Use recordValueDescriptor instead')
const RecordValue$json = {
  '1': 'RecordValue',
  '2': [
    {
      '1': 'attributes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.RecordValue.AttributesEntry',
      '10': 'attributes'
    },
  ],
  '3': [RecordValue_AttributesEntry$json],
};

@$core.Deprecated('Use recordValueDescriptor instead')
const RecordValue_AttributesEntry$json = {
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

/// Descriptor for `RecordValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordValueDescriptor = $convert.base64Decode(
    'CgtSZWNvcmRWYWx1ZRJFCgphdHRyaWJ1dGVzGAEgAygLMiUuY2VkYXIudjMuUmVjb3JkVmFsdW'
    'UuQXR0cmlidXRlc0VudHJ5UgphdHRyaWJ1dGVzGk4KD0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkY'
    'ASABKAlSA2tleRIlCgV2YWx1ZRgCIAEoCzIPLmNlZGFyLnYzLlZhbHVlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use extensionCallDescriptor instead')
const ExtensionCall$json = {
  '1': 'ExtensionCall',
  '2': [
    {'1': 'fn', '3': 1, '4': 1, '5': 9, '10': 'fn'},
    {'1': 'arg', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Value', '10': 'arg'},
  ],
};

/// Descriptor for `ExtensionCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionCallDescriptor = $convert.base64Decode(
    'Cg1FeHRlbnNpb25DYWxsEg4KAmZuGAEgASgJUgJmbhIhCgNhcmcYAiABKAsyDy5jZWRhci52My'
    '5WYWx1ZVIDYXJn');

@$core.Deprecated('Use entityValueDescriptor instead')
const EntityValue$json = {
  '1': 'EntityValue',
  '2': [
    {
      '1': 'uid',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.EntityUid',
      '10': 'uid'
    },
  ],
};

/// Descriptor for `EntityValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityValueDescriptor = $convert.base64Decode(
    'CgtFbnRpdHlWYWx1ZRIlCgN1aWQYASABKAsyEy5jZWRhci52My5FbnRpdHlVaWRSA3VpZA==');

@$core.Deprecated('Use decimalValueDescriptor instead')
const DecimalValue$json = {
  '1': 'DecimalValue',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `DecimalValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decimalValueDescriptor =
    $convert.base64Decode('CgxEZWNpbWFsVmFsdWUSFAoFdmFsdWUYASABKAlSBXZhbHVl');

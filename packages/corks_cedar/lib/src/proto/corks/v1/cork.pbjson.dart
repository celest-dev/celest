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
    {'1': 'bearer', '3': 3, '4': 1, '5': 11, '6': '.corks.v1.SignedBlock', '9': 0, '10': 'bearer', '17': true},
    {'1': 'caveats', '3': 4, '4': 3, '5': 11, '6': '.corks.v1.SignedBlock', '10': 'caveats'},
    {'1': 'signature', '3': 5, '4': 1, '5': 12, '10': 'signature'},
  ],
  '8': [
    {'1': '_bearer'},
  ],
};

/// Descriptor for `Cork`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List corkDescriptor = $convert.base64Decode(
    'CgRDb3JrEg4KAmlkGAEgASgMUgJpZBIVCgZrZXlfaWQYAiABKAxSBWtleUlkEjIKBmJlYXJlch'
    'gDIAEoCzIVLmNvcmtzLnYxLlNpZ25lZEJsb2NrSABSBmJlYXJlcogBARIvCgdjYXZlYXRzGAQg'
    'AygLMhUuY29ya3MudjEuU2lnbmVkQmxvY2tSB2NhdmVhdHMSHAoJc2lnbmF0dXJlGAUgASgMUg'
    'lzaWduYXR1cmVCCQoHX2JlYXJlcg==');

@$core.Deprecated('Use signedBlockDescriptor instead')
const SignedBlock$json = {
  '1': 'SignedBlock',
  '2': [
    {'1': 'block', '3': 1, '4': 1, '5': 12, '10': 'block'},
    {'1': 'type_url', '3': 2, '4': 1, '5': 12, '10': 'typeUrl'},
    {'1': 'signature', '3': 3, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `SignedBlock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedBlockDescriptor = $convert.base64Decode(
    'CgtTaWduZWRCbG9jaxIUCgVibG9jaxgBIAEoDFIFYmxvY2sSGQoIdHlwZV91cmwYAiABKAxSB3'
    'R5cGVVcmwSHAoJc2lnbmF0dXJlGAMgASgMUglzaWduYXR1cmU=');


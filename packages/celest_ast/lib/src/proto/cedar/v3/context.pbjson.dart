//
//  Generated code. Do not modify.
//  source: cedar/v3/context.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use contextDescriptor instead')
const Context$json = {
  '1': 'Context',
  '2': [
    {
      '1': 'values',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cedar.v3.Context.ValuesEntry',
      '10': 'values'
    },
  ],
  '3': [Context_ValuesEntry$json],
};

@$core.Deprecated('Use contextDescriptor instead')
const Context_ValuesEntry$json = {
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

/// Descriptor for `Context`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contextDescriptor = $convert.base64Decode(
    'CgdDb250ZXh0EjUKBnZhbHVlcxgBIAMoCzIdLmNlZGFyLnYzLkNvbnRleHQuVmFsdWVzRW50cn'
    'lSBnZhbHVlcxpKCgtWYWx1ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIlCgV2YWx1ZRgCIAEo'
    'CzIPLmNlZGFyLnYzLlZhbHVlUgV2YWx1ZToCOAE=');

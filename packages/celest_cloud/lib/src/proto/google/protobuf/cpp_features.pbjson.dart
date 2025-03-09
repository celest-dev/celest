//
//  Generated code. Do not modify.
//  source: google/protobuf/cpp_features.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cppFeaturesDescriptor instead')
const CppFeatures$json = {
  '1': 'CppFeatures',
  '2': [
    {
      '1': 'legacy_closed_enum',
      '3': 1,
      '4': 1,
      '5': 8,
      '8': {},
      '10': 'legacyClosedEnum'
    },
    {
      '1': 'string_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pb.CppFeatures.StringType',
      '8': {},
      '10': 'stringType'
    },
  ],
  '4': [CppFeatures_StringType$json],
};

@$core.Deprecated('Use cppFeaturesDescriptor instead')
const CppFeatures_StringType$json = {
  '1': 'StringType',
  '2': [
    {'1': 'STRING_TYPE_UNKNOWN', '2': 0},
    {'1': 'VIEW', '2': 1},
    {'1': 'CORD', '2': 2},
    {'1': 'STRING', '2': 3},
  ],
};

/// Descriptor for `CppFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cppFeaturesDescriptor = $convert.base64Decode(
    'CgtDcHBGZWF0dXJlcxKNAgoSbGVnYWN5X2Nsb3NlZF9lbnVtGAEgASgIQt4BiAEBmAEEmAEBog'
    'EJEgR0cnVlGIQHogEKEgVmYWxzZRjnB7IBuAEI6AcQ6AcarwFUaGUgbGVnYWN5IGNsb3NlZCBl'
    'bnVtIHRyZWF0bWVudCBpbiBDKysgaXMgZGVwcmVjYXRlZCBhbmQgaXMgc2NoZWR1bGVkIHRvIG'
    'JlIHJlbW92ZWQgaW4gZWRpdGlvbiAyMDI1LiAgTWFyayBlbnVtIHR5cGUgb24gdGhlIGVudW0g'
    'ZGVmaW5pdGlvbnMgdGhlbXNlbHZlcyByYXRoZXIgdGhhbiBvbiBmaWVsZHMuUhBsZWdhY3lDbG'
    '9zZWRFbnVtEmYKC3N0cmluZ190eXBlGAIgASgOMhoucGIuQ3BwRmVhdHVyZXMuU3RyaW5nVHlw'
    'ZUIpiAEBmAEEmAEBogELEgZTVFJJTkcYhAeiAQkSBFZJRVcY6QeyAQMI6AdSCnN0cmluZ1R5cG'
    'UiRQoKU3RyaW5nVHlwZRIXChNTVFJJTkdfVFlQRV9VTktOT1dOEAASCAoEVklFVxABEggKBENP'
    'UkQQAhIKCgZTVFJJTkcQAw==');

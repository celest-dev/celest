//
//  Generated code. Do not modify.
//  source: celest/ast/v1/features.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use featureFlagDescriptor instead')
const FeatureFlag$json = {
  '1': 'FeatureFlag',
  '2': [
    {'1': 'FEATURE_FLAG_UNSPECIFIED', '2': 0},
    {'1': 'STREAMING', '2': 1},
  ],
};

/// Descriptor for `FeatureFlag`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List featureFlagDescriptor = $convert.base64Decode(
    'CgtGZWF0dXJlRmxhZxIcChhGRUFUVVJFX0ZMQUdfVU5TUEVDSUZJRUQQABINCglTVFJFQU1JTk'
    'cQAQ==');

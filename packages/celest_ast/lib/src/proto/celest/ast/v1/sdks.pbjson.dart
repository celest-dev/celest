//
//  Generated code. Do not modify.
//  source: celest/ast/v1/sdks.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sdkTypeDescriptor instead')
const SdkType$json = {
  '1': 'SdkType',
  '2': [
    {'1': 'SDK_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'DART', '2': 1},
    {'1': 'FLUTTER', '2': 2},
  ],
};

/// Descriptor for `SdkType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sdkTypeDescriptor = $convert.base64Decode(
    'CgdTZGtUeXBlEhgKFFNES19UWVBFX1VOU1BFQ0lGSUVEEAASCAoEREFSVBABEgsKB0ZMVVRURV'
    'IQAg==');

@$core.Deprecated('Use sdkDescriptor instead')
const Sdk$json = {
  '1': 'Sdk',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.celest.ast.v1.SdkType',
      '8': {},
      '10': 'type'
    },
    {
      '1': 'version',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.celest.ast.v1.Version',
      '8': {},
      '10': 'version'
    },
    {
      '1': 'enabled_experiments',
      '3': 3,
      '4': 3,
      '5': 9,
      '8': {},
      '10': 'enabledExperiments'
    },
  ],
};

/// Descriptor for `Sdk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkDescriptor = $convert.base64Decode(
    'CgNTZGsSLwoEdHlwZRgBIAEoDjIWLmNlbGVzdC5hc3QudjEuU2RrVHlwZUID4EECUgR0eXBlEj'
    'UKB3ZlcnNpb24YAiABKAsyFi5jZWxlc3QuYXN0LnYxLlZlcnNpb25CA+BBAlIHdmVyc2lvbhI0'
    'ChNlbmFibGVkX2V4cGVyaW1lbnRzGAMgAygJQgPgQQFSEmVuYWJsZWRFeHBlcmltZW50cw==');

@$core.Deprecated('Use versionDescriptor instead')
const Version$json = {
  '1': 'Version',
  '2': [
    {'1': 'major', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'major'},
    {'1': 'minor', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'minor'},
    {'1': 'patch', '3': 3, '4': 1, '5': 5, '8': {}, '10': 'patch'},
    {
      '1': 'pre_release',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Value',
      '8': {},
      '10': 'preRelease'
    },
    {
      '1': 'build',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Value',
      '8': {},
      '10': 'build'
    },
    {
      '1': 'canonicalized_version',
      '3': 6,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'canonicalizedVersion'
    },
  ],
};

/// Descriptor for `Version`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionDescriptor = $convert.base64Decode(
    'CgdWZXJzaW9uEhkKBW1ham9yGAEgASgFQgPgQQJSBW1ham9yEhkKBW1pbm9yGAIgASgFQgPgQQ'
    'JSBW1pbm9yEhkKBXBhdGNoGAMgASgFQgPgQQJSBXBhdGNoEjwKC3ByZV9yZWxlYXNlGAQgAygL'
    'MhYuZ29vZ2xlLnByb3RvYnVmLlZhbHVlQgPgQQFSCnByZVJlbGVhc2USMQoFYnVpbGQYBSADKA'
    'syFi5nb29nbGUucHJvdG9idWYuVmFsdWVCA+BBAVIFYnVpbGQSOAoVY2Fub25pY2FsaXplZF92'
    'ZXJzaW9uGAYgASgJQgPgQQFSFGNhbm9uaWNhbGl6ZWRWZXJzaW9u');

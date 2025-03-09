//
//  Generated code. Do not modify.
//  source: google/protobuf/compiler/plugin.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use versionDescriptor instead')
const Version$json = {
  '1': 'Version',
  '2': [
    {'1': 'major', '3': 1, '4': 1, '5': 5, '10': 'major'},
    {'1': 'minor', '3': 2, '4': 1, '5': 5, '10': 'minor'},
    {'1': 'patch', '3': 3, '4': 1, '5': 5, '10': 'patch'},
    {'1': 'suffix', '3': 4, '4': 1, '5': 9, '10': 'suffix'},
  ],
};

/// Descriptor for `Version`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionDescriptor = $convert.base64Decode(
    'CgdWZXJzaW9uEhQKBW1ham9yGAEgASgFUgVtYWpvchIUCgVtaW5vchgCIAEoBVIFbWlub3ISFA'
    'oFcGF0Y2gYAyABKAVSBXBhdGNoEhYKBnN1ZmZpeBgEIAEoCVIGc3VmZml4');

@$core.Deprecated('Use codeGeneratorRequestDescriptor instead')
const CodeGeneratorRequest$json = {
  '1': 'CodeGeneratorRequest',
  '2': [
    {'1': 'file_to_generate', '3': 1, '4': 3, '5': 9, '10': 'fileToGenerate'},
    {'1': 'parameter', '3': 2, '4': 1, '5': 9, '10': 'parameter'},
    {
      '1': 'proto_file',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.FileDescriptorProto',
      '10': 'protoFile'
    },
    {
      '1': 'source_file_descriptors',
      '3': 17,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.FileDescriptorProto',
      '10': 'sourceFileDescriptors'
    },
    {
      '1': 'compiler_version',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.compiler.Version',
      '10': 'compilerVersion'
    },
  ],
};

/// Descriptor for `CodeGeneratorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List codeGeneratorRequestDescriptor = $convert.base64Decode(
    'ChRDb2RlR2VuZXJhdG9yUmVxdWVzdBIoChBmaWxlX3RvX2dlbmVyYXRlGAEgAygJUg5maWxlVG'
    '9HZW5lcmF0ZRIcCglwYXJhbWV0ZXIYAiABKAlSCXBhcmFtZXRlchJDCgpwcm90b19maWxlGA8g'
    'AygLMiQuZ29vZ2xlLnByb3RvYnVmLkZpbGVEZXNjcmlwdG9yUHJvdG9SCXByb3RvRmlsZRJcCh'
    'dzb3VyY2VfZmlsZV9kZXNjcmlwdG9ycxgRIAMoCzIkLmdvb2dsZS5wcm90b2J1Zi5GaWxlRGVz'
    'Y3JpcHRvclByb3RvUhVzb3VyY2VGaWxlRGVzY3JpcHRvcnMSTAoQY29tcGlsZXJfdmVyc2lvbh'
    'gDIAEoCzIhLmdvb2dsZS5wcm90b2J1Zi5jb21waWxlci5WZXJzaW9uUg9jb21waWxlclZlcnNp'
    'b24=');

@$core.Deprecated('Use codeGeneratorResponseDescriptor instead')
const CodeGeneratorResponse$json = {
  '1': 'CodeGeneratorResponse',
  '2': [
    {'1': 'error', '3': 1, '4': 1, '5': 9, '10': 'error'},
    {
      '1': 'supported_features',
      '3': 2,
      '4': 1,
      '5': 4,
      '10': 'supportedFeatures'
    },
    {'1': 'minimum_edition', '3': 3, '4': 1, '5': 5, '10': 'minimumEdition'},
    {'1': 'maximum_edition', '3': 4, '4': 1, '5': 5, '10': 'maximumEdition'},
    {
      '1': 'file',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.compiler.CodeGeneratorResponse.File',
      '10': 'file'
    },
  ],
  '3': [CodeGeneratorResponse_File$json],
  '4': [CodeGeneratorResponse_Feature$json],
};

@$core.Deprecated('Use codeGeneratorResponseDescriptor instead')
const CodeGeneratorResponse_File$json = {
  '1': 'File',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'insertion_point', '3': 2, '4': 1, '5': 9, '10': 'insertionPoint'},
    {'1': 'content', '3': 15, '4': 1, '5': 9, '10': 'content'},
    {
      '1': 'generated_code_info',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.GeneratedCodeInfo',
      '10': 'generatedCodeInfo'
    },
  ],
};

@$core.Deprecated('Use codeGeneratorResponseDescriptor instead')
const CodeGeneratorResponse_Feature$json = {
  '1': 'Feature',
  '2': [
    {'1': 'FEATURE_NONE', '2': 0},
    {'1': 'FEATURE_PROTO3_OPTIONAL', '2': 1},
    {'1': 'FEATURE_SUPPORTS_EDITIONS', '2': 2},
  ],
};

/// Descriptor for `CodeGeneratorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List codeGeneratorResponseDescriptor = $convert.base64Decode(
    'ChVDb2RlR2VuZXJhdG9yUmVzcG9uc2USFAoFZXJyb3IYASABKAlSBWVycm9yEi0KEnN1cHBvcn'
    'RlZF9mZWF0dXJlcxgCIAEoBFIRc3VwcG9ydGVkRmVhdHVyZXMSJwoPbWluaW11bV9lZGl0aW9u'
    'GAMgASgFUg5taW5pbXVtRWRpdGlvbhInCg9tYXhpbXVtX2VkaXRpb24YBCABKAVSDm1heGltdW'
    '1FZGl0aW9uEkgKBGZpbGUYDyADKAsyNC5nb29nbGUucHJvdG9idWYuY29tcGlsZXIuQ29kZUdl'
    'bmVyYXRvclJlc3BvbnNlLkZpbGVSBGZpbGUasQEKBEZpbGUSEgoEbmFtZRgBIAEoCVIEbmFtZR'
    'InCg9pbnNlcnRpb25fcG9pbnQYAiABKAlSDmluc2VydGlvblBvaW50EhgKB2NvbnRlbnQYDyAB'
    'KAlSB2NvbnRlbnQSUgoTZ2VuZXJhdGVkX2NvZGVfaW5mbxgQIAEoCzIiLmdvb2dsZS5wcm90b2'
    'J1Zi5HZW5lcmF0ZWRDb2RlSW5mb1IRZ2VuZXJhdGVkQ29kZUluZm8iVwoHRmVhdHVyZRIQCgxG'
    'RUFUVVJFX05PTkUQABIbChdGRUFUVVJFX1BST1RPM19PUFRJT05BTBABEh0KGUZFQVRVUkVfU1'
    'VQUE9SVFNfRURJVElPTlMQAg==');

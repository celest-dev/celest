//
//  Generated code. Do not modify.
//  source: google/protobuf/descriptor.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use editionDescriptor instead')
const Edition$json = {
  '1': 'Edition',
  '2': [
    {'1': 'EDITION_UNKNOWN', '2': 0},
    {'1': 'EDITION_PROTO2', '2': 998},
    {'1': 'EDITION_PROTO3', '2': 999},
    {'1': 'EDITION_2023', '2': 1000},
    {'1': 'EDITION_1_TEST_ONLY', '2': 1},
    {'1': 'EDITION_2_TEST_ONLY', '2': 2},
    {'1': 'EDITION_99997_TEST_ONLY', '2': 99997},
    {'1': 'EDITION_99998_TEST_ONLY', '2': 99998},
    {'1': 'EDITION_99999_TEST_ONLY', '2': 99999},
  ],
};

/// Descriptor for `Edition`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List editionDescriptor = $convert.base64Decode(
    'CgdFZGl0aW9uEhMKD0VESVRJT05fVU5LTk9XThAAEhMKDkVESVRJT05fUFJPVE8yEOYHEhMKDk'
    'VESVRJT05fUFJPVE8zEOcHEhEKDEVESVRJT05fMjAyMxDoBxIXChNFRElUSU9OXzFfVEVTVF9P'
    'TkxZEAESFwoTRURJVElPTl8yX1RFU1RfT05MWRACEh0KF0VESVRJT05fOTk5OTdfVEVTVF9PTk'
    'xZEJ2NBhIdChdFRElUSU9OXzk5OTk4X1RFU1RfT05MWRCejQYSHQoXRURJVElPTl85OTk5OV9U'
    'RVNUX09OTFkQn40G');

@$core.Deprecated('Use fileDescriptorSetDescriptor instead')
const FileDescriptorSet$json = {
  '1': 'FileDescriptorSet',
  '2': [
    {'1': 'file', '3': 1, '4': 3, '5': 11, '6': '.google.protobuf.FileDescriptorProto', '10': 'file'},
  ],
};

/// Descriptor for `FileDescriptorSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptorSetDescriptor = $convert.base64Decode(
    'ChFGaWxlRGVzY3JpcHRvclNldBI4CgRmaWxlGAEgAygLMiQuZ29vZ2xlLnByb3RvYnVmLkZpbG'
    'VEZXNjcmlwdG9yUHJvdG9SBGZpbGU=');

@$core.Deprecated('Use fileDescriptorProtoDescriptor instead')
const FileDescriptorProto$json = {
  '1': 'FileDescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'package', '3': 2, '4': 1, '5': 9, '10': 'package'},
    {'1': 'dependency', '3': 3, '4': 3, '5': 9, '10': 'dependency'},
    {'1': 'public_dependency', '3': 10, '4': 3, '5': 5, '10': 'publicDependency'},
    {'1': 'weak_dependency', '3': 11, '4': 3, '5': 5, '10': 'weakDependency'},
    {'1': 'message_type', '3': 4, '4': 3, '5': 11, '6': '.google.protobuf.DescriptorProto', '10': 'messageType'},
    {'1': 'enum_type', '3': 5, '4': 3, '5': 11, '6': '.google.protobuf.EnumDescriptorProto', '10': 'enumType'},
    {'1': 'service', '3': 6, '4': 3, '5': 11, '6': '.google.protobuf.ServiceDescriptorProto', '10': 'service'},
    {'1': 'extension', '3': 7, '4': 3, '5': 11, '6': '.google.protobuf.FieldDescriptorProto', '10': 'extension'},
    {'1': 'options', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.FileOptions', '10': 'options'},
    {'1': 'source_code_info', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.SourceCodeInfo', '10': 'sourceCodeInfo'},
    {'1': 'syntax', '3': 12, '4': 1, '5': 9, '10': 'syntax'},
    {'1': 'edition', '3': 14, '4': 1, '5': 14, '6': '.google.protobuf.Edition', '10': 'edition'},
  ],
};

/// Descriptor for `FileDescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptorProtoDescriptor = $convert.base64Decode(
    'ChNGaWxlRGVzY3JpcHRvclByb3RvEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHcGFja2FnZRgCIA'
    'EoCVIHcGFja2FnZRIeCgpkZXBlbmRlbmN5GAMgAygJUgpkZXBlbmRlbmN5EisKEXB1YmxpY19k'
    'ZXBlbmRlbmN5GAogAygFUhBwdWJsaWNEZXBlbmRlbmN5EicKD3dlYWtfZGVwZW5kZW5jeRgLIA'
    'MoBVIOd2Vha0RlcGVuZGVuY3kSQwoMbWVzc2FnZV90eXBlGAQgAygLMiAuZ29vZ2xlLnByb3Rv'
    'YnVmLkRlc2NyaXB0b3JQcm90b1ILbWVzc2FnZVR5cGUSQQoJZW51bV90eXBlGAUgAygLMiQuZ2'
    '9vZ2xlLnByb3RvYnVmLkVudW1EZXNjcmlwdG9yUHJvdG9SCGVudW1UeXBlEkEKB3NlcnZpY2UY'
    'BiADKAsyJy5nb29nbGUucHJvdG9idWYuU2VydmljZURlc2NyaXB0b3JQcm90b1IHc2VydmljZR'
    'JDCglleHRlbnNpb24YByADKAsyJS5nb29nbGUucHJvdG9idWYuRmllbGREZXNjcmlwdG9yUHJv'
    'dG9SCWV4dGVuc2lvbhI2CgdvcHRpb25zGAggASgLMhwuZ29vZ2xlLnByb3RvYnVmLkZpbGVPcH'
    'Rpb25zUgdvcHRpb25zEkkKEHNvdXJjZV9jb2RlX2luZm8YCSABKAsyHy5nb29nbGUucHJvdG9i'
    'dWYuU291cmNlQ29kZUluZm9SDnNvdXJjZUNvZGVJbmZvEhYKBnN5bnRheBgMIAEoCVIGc3ludG'
    'F4EjIKB2VkaXRpb24YDiABKA4yGC5nb29nbGUucHJvdG9idWYuRWRpdGlvblIHZWRpdGlvbg==');

@$core.Deprecated('Use descriptorProtoDescriptor instead')
const DescriptorProto$json = {
  '1': 'DescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'field', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.FieldDescriptorProto', '10': 'field'},
    {'1': 'extension', '3': 6, '4': 3, '5': 11, '6': '.google.protobuf.FieldDescriptorProto', '10': 'extension'},
    {'1': 'nested_type', '3': 3, '4': 3, '5': 11, '6': '.google.protobuf.DescriptorProto', '10': 'nestedType'},
    {'1': 'enum_type', '3': 4, '4': 3, '5': 11, '6': '.google.protobuf.EnumDescriptorProto', '10': 'enumType'},
    {'1': 'extension_range', '3': 5, '4': 3, '5': 11, '6': '.google.protobuf.DescriptorProto.ExtensionRange', '10': 'extensionRange'},
    {'1': 'oneof_decl', '3': 8, '4': 3, '5': 11, '6': '.google.protobuf.OneofDescriptorProto', '10': 'oneofDecl'},
    {'1': 'options', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.MessageOptions', '10': 'options'},
    {'1': 'reserved_range', '3': 9, '4': 3, '5': 11, '6': '.google.protobuf.DescriptorProto.ReservedRange', '10': 'reservedRange'},
    {'1': 'reserved_name', '3': 10, '4': 3, '5': 9, '10': 'reservedName'},
  ],
  '3': [DescriptorProto_ExtensionRange$json, DescriptorProto_ReservedRange$json],
};

@$core.Deprecated('Use descriptorProtoDescriptor instead')
const DescriptorProto_ExtensionRange$json = {
  '1': 'ExtensionRange',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 5, '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 5, '10': 'end'},
    {'1': 'options', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.ExtensionRangeOptions', '10': 'options'},
  ],
};

@$core.Deprecated('Use descriptorProtoDescriptor instead')
const DescriptorProto_ReservedRange$json = {
  '1': 'ReservedRange',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 5, '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 5, '10': 'end'},
  ],
};

/// Descriptor for `DescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List descriptorProtoDescriptor = $convert.base64Decode(
    'Cg9EZXNjcmlwdG9yUHJvdG8SEgoEbmFtZRgBIAEoCVIEbmFtZRI7CgVmaWVsZBgCIAMoCzIlLm'
    'dvb2dsZS5wcm90b2J1Zi5GaWVsZERlc2NyaXB0b3JQcm90b1IFZmllbGQSQwoJZXh0ZW5zaW9u'
    'GAYgAygLMiUuZ29vZ2xlLnByb3RvYnVmLkZpZWxkRGVzY3JpcHRvclByb3RvUglleHRlbnNpb2'
    '4SQQoLbmVzdGVkX3R5cGUYAyADKAsyIC5nb29nbGUucHJvdG9idWYuRGVzY3JpcHRvclByb3Rv'
    'UgpuZXN0ZWRUeXBlEkEKCWVudW1fdHlwZRgEIAMoCzIkLmdvb2dsZS5wcm90b2J1Zi5FbnVtRG'
    'VzY3JpcHRvclByb3RvUghlbnVtVHlwZRJYCg9leHRlbnNpb25fcmFuZ2UYBSADKAsyLy5nb29n'
    'bGUucHJvdG9idWYuRGVzY3JpcHRvclByb3RvLkV4dGVuc2lvblJhbmdlUg5leHRlbnNpb25SYW'
    '5nZRJECgpvbmVvZl9kZWNsGAggAygLMiUuZ29vZ2xlLnByb3RvYnVmLk9uZW9mRGVzY3JpcHRv'
    'clByb3RvUglvbmVvZkRlY2wSOQoHb3B0aW9ucxgHIAEoCzIfLmdvb2dsZS5wcm90b2J1Zi5NZX'
    'NzYWdlT3B0aW9uc1IHb3B0aW9ucxJVCg5yZXNlcnZlZF9yYW5nZRgJIAMoCzIuLmdvb2dsZS5w'
    'cm90b2J1Zi5EZXNjcmlwdG9yUHJvdG8uUmVzZXJ2ZWRSYW5nZVINcmVzZXJ2ZWRSYW5nZRIjCg'
    '1yZXNlcnZlZF9uYW1lGAogAygJUgxyZXNlcnZlZE5hbWUaegoORXh0ZW5zaW9uUmFuZ2USFAoF'
    'c3RhcnQYASABKAVSBXN0YXJ0EhAKA2VuZBgCIAEoBVIDZW5kEkAKB29wdGlvbnMYAyABKAsyJi'
    '5nb29nbGUucHJvdG9idWYuRXh0ZW5zaW9uUmFuZ2VPcHRpb25zUgdvcHRpb25zGjcKDVJlc2Vy'
    'dmVkUmFuZ2USFAoFc3RhcnQYASABKAVSBXN0YXJ0EhAKA2VuZBgCIAEoBVIDZW5k');

@$core.Deprecated('Use extensionRangeOptionsDescriptor instead')
const ExtensionRangeOptions$json = {
  '1': 'ExtensionRangeOptions',
  '2': [
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
    {'1': 'declaration', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.ExtensionRangeOptions.Declaration', '8': {}, '10': 'declaration'},
    {'1': 'features', '3': 50, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'verification', '3': 3, '4': 1, '5': 14, '6': '.google.protobuf.ExtensionRangeOptions.VerificationState', '7': 'UNVERIFIED', '10': 'verification'},
  ],
  '3': [ExtensionRangeOptions_Declaration$json],
  '4': [ExtensionRangeOptions_VerificationState$json],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

@$core.Deprecated('Use extensionRangeOptionsDescriptor instead')
const ExtensionRangeOptions_Declaration$json = {
  '1': 'Declaration',
  '2': [
    {'1': 'number', '3': 1, '4': 1, '5': 5, '10': 'number'},
    {'1': 'full_name', '3': 2, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'reserved', '3': 5, '4': 1, '5': 8, '10': 'reserved'},
    {'1': 'repeated', '3': 6, '4': 1, '5': 8, '10': 'repeated'},
  ],
  '9': [
    {'1': 4, '2': 5},
  ],
};

@$core.Deprecated('Use extensionRangeOptionsDescriptor instead')
const ExtensionRangeOptions_VerificationState$json = {
  '1': 'VerificationState',
  '2': [
    {'1': 'DECLARATION', '2': 0},
    {'1': 'UNVERIFIED', '2': 1},
  ],
};

/// Descriptor for `ExtensionRangeOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionRangeOptionsDescriptor = $convert.base64Decode(
    'ChVFeHRlbnNpb25SYW5nZU9wdGlvbnMSWAoUdW5pbnRlcnByZXRlZF9vcHRpb24Y5wcgAygLMi'
    'QuZ29vZ2xlLnByb3RvYnVmLlVuaW50ZXJwcmV0ZWRPcHRpb25SE3VuaW50ZXJwcmV0ZWRPcHRp'
    'b24SWQoLZGVjbGFyYXRpb24YAiADKAsyMi5nb29nbGUucHJvdG9idWYuRXh0ZW5zaW9uUmFuZ2'
    'VPcHRpb25zLkRlY2xhcmF0aW9uQgOIAQJSC2RlY2xhcmF0aW9uEjcKCGZlYXR1cmVzGDIgASgL'
    'MhsuZ29vZ2xlLnByb3RvYnVmLkZlYXR1cmVTZXRSCGZlYXR1cmVzEmgKDHZlcmlmaWNhdGlvbh'
    'gDIAEoDjI4Lmdvb2dsZS5wcm90b2J1Zi5FeHRlbnNpb25SYW5nZU9wdGlvbnMuVmVyaWZpY2F0'
    'aW9uU3RhdGU6ClVOVkVSSUZJRURSDHZlcmlmaWNhdGlvbhqUAQoLRGVjbGFyYXRpb24SFgoGbn'
    'VtYmVyGAEgASgFUgZudW1iZXISGwoJZnVsbF9uYW1lGAIgASgJUghmdWxsTmFtZRISCgR0eXBl'
    'GAMgASgJUgR0eXBlEhoKCHJlc2VydmVkGAUgASgIUghyZXNlcnZlZBIaCghyZXBlYXRlZBgGIA'
    'EoCFIIcmVwZWF0ZWRKBAgEEAUiNAoRVmVyaWZpY2F0aW9uU3RhdGUSDwoLREVDTEFSQVRJT04Q'
    'ABIOCgpVTlZFUklGSUVEEAEqCQjoBxCAgICAAg==');

@$core.Deprecated('Use fieldDescriptorProtoDescriptor instead')
const FieldDescriptorProto$json = {
  '1': 'FieldDescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'number', '3': 3, '4': 1, '5': 5, '10': 'number'},
    {'1': 'label', '3': 4, '4': 1, '5': 14, '6': '.google.protobuf.FieldDescriptorProto.Label', '10': 'label'},
    {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.google.protobuf.FieldDescriptorProto.Type', '10': 'type'},
    {'1': 'type_name', '3': 6, '4': 1, '5': 9, '10': 'typeName'},
    {'1': 'extendee', '3': 2, '4': 1, '5': 9, '10': 'extendee'},
    {'1': 'default_value', '3': 7, '4': 1, '5': 9, '10': 'defaultValue'},
    {'1': 'oneof_index', '3': 9, '4': 1, '5': 5, '10': 'oneofIndex'},
    {'1': 'json_name', '3': 10, '4': 1, '5': 9, '10': 'jsonName'},
    {'1': 'options', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.FieldOptions', '10': 'options'},
    {'1': 'proto3_optional', '3': 17, '4': 1, '5': 8, '10': 'proto3Optional'},
  ],
  '4': [FieldDescriptorProto_Type$json, FieldDescriptorProto_Label$json],
};

@$core.Deprecated('Use fieldDescriptorProtoDescriptor instead')
const FieldDescriptorProto_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'TYPE_DOUBLE', '2': 1},
    {'1': 'TYPE_FLOAT', '2': 2},
    {'1': 'TYPE_INT64', '2': 3},
    {'1': 'TYPE_UINT64', '2': 4},
    {'1': 'TYPE_INT32', '2': 5},
    {'1': 'TYPE_FIXED64', '2': 6},
    {'1': 'TYPE_FIXED32', '2': 7},
    {'1': 'TYPE_BOOL', '2': 8},
    {'1': 'TYPE_STRING', '2': 9},
    {'1': 'TYPE_GROUP', '2': 10},
    {'1': 'TYPE_MESSAGE', '2': 11},
    {'1': 'TYPE_BYTES', '2': 12},
    {'1': 'TYPE_UINT32', '2': 13},
    {'1': 'TYPE_ENUM', '2': 14},
    {'1': 'TYPE_SFIXED32', '2': 15},
    {'1': 'TYPE_SFIXED64', '2': 16},
    {'1': 'TYPE_SINT32', '2': 17},
    {'1': 'TYPE_SINT64', '2': 18},
  ],
};

@$core.Deprecated('Use fieldDescriptorProtoDescriptor instead')
const FieldDescriptorProto_Label$json = {
  '1': 'Label',
  '2': [
    {'1': 'LABEL_OPTIONAL', '2': 1},
    {'1': 'LABEL_REPEATED', '2': 3},
    {'1': 'LABEL_REQUIRED', '2': 2},
  ],
};

/// Descriptor for `FieldDescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldDescriptorProtoDescriptor = $convert.base64Decode(
    'ChRGaWVsZERlc2NyaXB0b3JQcm90bxISCgRuYW1lGAEgASgJUgRuYW1lEhYKBm51bWJlchgDIA'
    'EoBVIGbnVtYmVyEkEKBWxhYmVsGAQgASgOMisuZ29vZ2xlLnByb3RvYnVmLkZpZWxkRGVzY3Jp'
    'cHRvclByb3RvLkxhYmVsUgVsYWJlbBI+CgR0eXBlGAUgASgOMiouZ29vZ2xlLnByb3RvYnVmLk'
    'ZpZWxkRGVzY3JpcHRvclByb3RvLlR5cGVSBHR5cGUSGwoJdHlwZV9uYW1lGAYgASgJUgh0eXBl'
    'TmFtZRIaCghleHRlbmRlZRgCIAEoCVIIZXh0ZW5kZWUSIwoNZGVmYXVsdF92YWx1ZRgHIAEoCV'
    'IMZGVmYXVsdFZhbHVlEh8KC29uZW9mX2luZGV4GAkgASgFUgpvbmVvZkluZGV4EhsKCWpzb25f'
    'bmFtZRgKIAEoCVIIanNvbk5hbWUSNwoHb3B0aW9ucxgIIAEoCzIdLmdvb2dsZS5wcm90b2J1Zi'
    '5GaWVsZE9wdGlvbnNSB29wdGlvbnMSJwoPcHJvdG8zX29wdGlvbmFsGBEgASgIUg5wcm90bzNP'
    'cHRpb25hbCK2AgoEVHlwZRIPCgtUWVBFX0RPVUJMRRABEg4KClRZUEVfRkxPQVQQAhIOCgpUWV'
    'BFX0lOVDY0EAMSDwoLVFlQRV9VSU5UNjQQBBIOCgpUWVBFX0lOVDMyEAUSEAoMVFlQRV9GSVhF'
    'RDY0EAYSEAoMVFlQRV9GSVhFRDMyEAcSDQoJVFlQRV9CT09MEAgSDwoLVFlQRV9TVFJJTkcQCR'
    'IOCgpUWVBFX0dST1VQEAoSEAoMVFlQRV9NRVNTQUdFEAsSDgoKVFlQRV9CWVRFUxAMEg8KC1RZ'
    'UEVfVUlOVDMyEA0SDQoJVFlQRV9FTlVNEA4SEQoNVFlQRV9TRklYRUQzMhAPEhEKDVRZUEVfU0'
    'ZJWEVENjQQEBIPCgtUWVBFX1NJTlQzMhAREg8KC1RZUEVfU0lOVDY0EBIiQwoFTGFiZWwSEgoO'
    'TEFCRUxfT1BUSU9OQUwQARISCg5MQUJFTF9SRVBFQVRFRBADEhIKDkxBQkVMX1JFUVVJUkVEEA'
    'I=');

@$core.Deprecated('Use oneofDescriptorProtoDescriptor instead')
const OneofDescriptorProto$json = {
  '1': 'OneofDescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.OneofOptions', '10': 'options'},
  ],
};

/// Descriptor for `OneofDescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oneofDescriptorProtoDescriptor = $convert.base64Decode(
    'ChRPbmVvZkRlc2NyaXB0b3JQcm90bxISCgRuYW1lGAEgASgJUgRuYW1lEjcKB29wdGlvbnMYAi'
    'ABKAsyHS5nb29nbGUucHJvdG9idWYuT25lb2ZPcHRpb25zUgdvcHRpb25z');

@$core.Deprecated('Use enumDescriptorProtoDescriptor instead')
const EnumDescriptorProto$json = {
  '1': 'EnumDescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.EnumValueDescriptorProto', '10': 'value'},
    {'1': 'options', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.EnumOptions', '10': 'options'},
    {'1': 'reserved_range', '3': 4, '4': 3, '5': 11, '6': '.google.protobuf.EnumDescriptorProto.EnumReservedRange', '10': 'reservedRange'},
    {'1': 'reserved_name', '3': 5, '4': 3, '5': 9, '10': 'reservedName'},
  ],
  '3': [EnumDescriptorProto_EnumReservedRange$json],
};

@$core.Deprecated('Use enumDescriptorProtoDescriptor instead')
const EnumDescriptorProto_EnumReservedRange$json = {
  '1': 'EnumReservedRange',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 5, '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 5, '10': 'end'},
  ],
};

/// Descriptor for `EnumDescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumDescriptorProtoDescriptor = $convert.base64Decode(
    'ChNFbnVtRGVzY3JpcHRvclByb3RvEhIKBG5hbWUYASABKAlSBG5hbWUSPwoFdmFsdWUYAiADKA'
    'syKS5nb29nbGUucHJvdG9idWYuRW51bVZhbHVlRGVzY3JpcHRvclByb3RvUgV2YWx1ZRI2Cgdv'
    'cHRpb25zGAMgASgLMhwuZ29vZ2xlLnByb3RvYnVmLkVudW1PcHRpb25zUgdvcHRpb25zEl0KDn'
    'Jlc2VydmVkX3JhbmdlGAQgAygLMjYuZ29vZ2xlLnByb3RvYnVmLkVudW1EZXNjcmlwdG9yUHJv'
    'dG8uRW51bVJlc2VydmVkUmFuZ2VSDXJlc2VydmVkUmFuZ2USIwoNcmVzZXJ2ZWRfbmFtZRgFIA'
    'MoCVIMcmVzZXJ2ZWROYW1lGjsKEUVudW1SZXNlcnZlZFJhbmdlEhQKBXN0YXJ0GAEgASgFUgVz'
    'dGFydBIQCgNlbmQYAiABKAVSA2VuZA==');

@$core.Deprecated('Use enumValueDescriptorProtoDescriptor instead')
const EnumValueDescriptorProto$json = {
  '1': 'EnumValueDescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'number', '3': 2, '4': 1, '5': 5, '10': 'number'},
    {'1': 'options', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.EnumValueOptions', '10': 'options'},
  ],
};

/// Descriptor for `EnumValueDescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumValueDescriptorProtoDescriptor = $convert.base64Decode(
    'ChhFbnVtVmFsdWVEZXNjcmlwdG9yUHJvdG8SEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZudW1iZX'
    'IYAiABKAVSBm51bWJlchI7CgdvcHRpb25zGAMgASgLMiEuZ29vZ2xlLnByb3RvYnVmLkVudW1W'
    'YWx1ZU9wdGlvbnNSB29wdGlvbnM=');

@$core.Deprecated('Use serviceDescriptorProtoDescriptor instead')
const ServiceDescriptorProto$json = {
  '1': 'ServiceDescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'method', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.MethodDescriptorProto', '10': 'method'},
    {'1': 'options', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.ServiceOptions', '10': 'options'},
  ],
};

/// Descriptor for `ServiceDescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceDescriptorProtoDescriptor = $convert.base64Decode(
    'ChZTZXJ2aWNlRGVzY3JpcHRvclByb3RvEhIKBG5hbWUYASABKAlSBG5hbWUSPgoGbWV0aG9kGA'
    'IgAygLMiYuZ29vZ2xlLnByb3RvYnVmLk1ldGhvZERlc2NyaXB0b3JQcm90b1IGbWV0aG9kEjkK'
    'B29wdGlvbnMYAyABKAsyHy5nb29nbGUucHJvdG9idWYuU2VydmljZU9wdGlvbnNSB29wdGlvbn'
    'M=');

@$core.Deprecated('Use methodDescriptorProtoDescriptor instead')
const MethodDescriptorProto$json = {
  '1': 'MethodDescriptorProto',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'input_type', '3': 2, '4': 1, '5': 9, '10': 'inputType'},
    {'1': 'output_type', '3': 3, '4': 1, '5': 9, '10': 'outputType'},
    {'1': 'options', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.MethodOptions', '10': 'options'},
    {'1': 'client_streaming', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'clientStreaming'},
    {'1': 'server_streaming', '3': 6, '4': 1, '5': 8, '7': 'false', '10': 'serverStreaming'},
  ],
};

/// Descriptor for `MethodDescriptorProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List methodDescriptorProtoDescriptor = $convert.base64Decode(
    'ChVNZXRob2REZXNjcmlwdG9yUHJvdG8SEgoEbmFtZRgBIAEoCVIEbmFtZRIdCgppbnB1dF90eX'
    'BlGAIgASgJUglpbnB1dFR5cGUSHwoLb3V0cHV0X3R5cGUYAyABKAlSCm91dHB1dFR5cGUSOAoH'
    'b3B0aW9ucxgEIAEoCzIeLmdvb2dsZS5wcm90b2J1Zi5NZXRob2RPcHRpb25zUgdvcHRpb25zEj'
    'AKEGNsaWVudF9zdHJlYW1pbmcYBSABKAg6BWZhbHNlUg9jbGllbnRTdHJlYW1pbmcSMAoQc2Vy'
    'dmVyX3N0cmVhbWluZxgGIAEoCDoFZmFsc2VSD3NlcnZlclN0cmVhbWluZw==');

@$core.Deprecated('Use fileOptionsDescriptor instead')
const FileOptions$json = {
  '1': 'FileOptions',
  '2': [
    {'1': 'java_package', '3': 1, '4': 1, '5': 9, '10': 'javaPackage'},
    {'1': 'java_outer_classname', '3': 8, '4': 1, '5': 9, '10': 'javaOuterClassname'},
    {'1': 'java_multiple_files', '3': 10, '4': 1, '5': 8, '7': 'false', '10': 'javaMultipleFiles'},
    {
      '1': 'java_generate_equals_and_hash',
      '3': 20,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'javaGenerateEqualsAndHash',
    },
    {'1': 'java_string_check_utf8', '3': 27, '4': 1, '5': 8, '7': 'false', '10': 'javaStringCheckUtf8'},
    {'1': 'optimize_for', '3': 9, '4': 1, '5': 14, '6': '.google.protobuf.FileOptions.OptimizeMode', '7': 'SPEED', '10': 'optimizeFor'},
    {'1': 'go_package', '3': 11, '4': 1, '5': 9, '10': 'goPackage'},
    {'1': 'cc_generic_services', '3': 16, '4': 1, '5': 8, '7': 'false', '10': 'ccGenericServices'},
    {'1': 'java_generic_services', '3': 17, '4': 1, '5': 8, '7': 'false', '10': 'javaGenericServices'},
    {'1': 'py_generic_services', '3': 18, '4': 1, '5': 8, '7': 'false', '10': 'pyGenericServices'},
    {'1': 'php_generic_services', '3': 42, '4': 1, '5': 8, '7': 'false', '10': 'phpGenericServices'},
    {'1': 'deprecated', '3': 23, '4': 1, '5': 8, '7': 'false', '10': 'deprecated'},
    {'1': 'cc_enable_arenas', '3': 31, '4': 1, '5': 8, '7': 'true', '10': 'ccEnableArenas'},
    {'1': 'objc_class_prefix', '3': 36, '4': 1, '5': 9, '10': 'objcClassPrefix'},
    {'1': 'csharp_namespace', '3': 37, '4': 1, '5': 9, '10': 'csharpNamespace'},
    {'1': 'swift_prefix', '3': 39, '4': 1, '5': 9, '10': 'swiftPrefix'},
    {'1': 'php_class_prefix', '3': 40, '4': 1, '5': 9, '10': 'phpClassPrefix'},
    {'1': 'php_namespace', '3': 41, '4': 1, '5': 9, '10': 'phpNamespace'},
    {'1': 'php_metadata_namespace', '3': 44, '4': 1, '5': 9, '10': 'phpMetadataNamespace'},
    {'1': 'ruby_package', '3': 45, '4': 1, '5': 9, '10': 'rubyPackage'},
    {'1': 'features', '3': 50, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '4': [FileOptions_OptimizeMode$json],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '9': [
    {'1': 38, '2': 39},
  ],
};

@$core.Deprecated('Use fileOptionsDescriptor instead')
const FileOptions_OptimizeMode$json = {
  '1': 'OptimizeMode',
  '2': [
    {'1': 'SPEED', '2': 1},
    {'1': 'CODE_SIZE', '2': 2},
    {'1': 'LITE_RUNTIME', '2': 3},
  ],
};

/// Descriptor for `FileOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileOptionsDescriptor = $convert.base64Decode(
    'CgtGaWxlT3B0aW9ucxIhCgxqYXZhX3BhY2thZ2UYASABKAlSC2phdmFQYWNrYWdlEjAKFGphdm'
    'Ffb3V0ZXJfY2xhc3NuYW1lGAggASgJUhJqYXZhT3V0ZXJDbGFzc25hbWUSNQoTamF2YV9tdWx0'
    'aXBsZV9maWxlcxgKIAEoCDoFZmFsc2VSEWphdmFNdWx0aXBsZUZpbGVzEkQKHWphdmFfZ2VuZX'
    'JhdGVfZXF1YWxzX2FuZF9oYXNoGBQgASgIQgIYAVIZamF2YUdlbmVyYXRlRXF1YWxzQW5kSGFz'
    'aBI6ChZqYXZhX3N0cmluZ19jaGVja191dGY4GBsgASgIOgVmYWxzZVITamF2YVN0cmluZ0NoZW'
    'NrVXRmOBJTCgxvcHRpbWl6ZV9mb3IYCSABKA4yKS5nb29nbGUucHJvdG9idWYuRmlsZU9wdGlv'
    'bnMuT3B0aW1pemVNb2RlOgVTUEVFRFILb3B0aW1pemVGb3ISHQoKZ29fcGFja2FnZRgLIAEoCV'
    'IJZ29QYWNrYWdlEjUKE2NjX2dlbmVyaWNfc2VydmljZXMYECABKAg6BWZhbHNlUhFjY0dlbmVy'
    'aWNTZXJ2aWNlcxI5ChVqYXZhX2dlbmVyaWNfc2VydmljZXMYESABKAg6BWZhbHNlUhNqYXZhR2'
    'VuZXJpY1NlcnZpY2VzEjUKE3B5X2dlbmVyaWNfc2VydmljZXMYEiABKAg6BWZhbHNlUhFweUdl'
    'bmVyaWNTZXJ2aWNlcxI3ChRwaHBfZ2VuZXJpY19zZXJ2aWNlcxgqIAEoCDoFZmFsc2VSEnBocE'
    'dlbmVyaWNTZXJ2aWNlcxIlCgpkZXByZWNhdGVkGBcgASgIOgVmYWxzZVIKZGVwcmVjYXRlZBIu'
    'ChBjY19lbmFibGVfYXJlbmFzGB8gASgIOgR0cnVlUg5jY0VuYWJsZUFyZW5hcxIqChFvYmpjX2'
    'NsYXNzX3ByZWZpeBgkIAEoCVIPb2JqY0NsYXNzUHJlZml4EikKEGNzaGFycF9uYW1lc3BhY2UY'
    'JSABKAlSD2NzaGFycE5hbWVzcGFjZRIhCgxzd2lmdF9wcmVmaXgYJyABKAlSC3N3aWZ0UHJlZm'
    'l4EigKEHBocF9jbGFzc19wcmVmaXgYKCABKAlSDnBocENsYXNzUHJlZml4EiMKDXBocF9uYW1l'
    'c3BhY2UYKSABKAlSDHBocE5hbWVzcGFjZRI0ChZwaHBfbWV0YWRhdGFfbmFtZXNwYWNlGCwgAS'
    'gJUhRwaHBNZXRhZGF0YU5hbWVzcGFjZRIhCgxydWJ5X3BhY2thZ2UYLSABKAlSC3J1YnlQYWNr'
    'YWdlEjcKCGZlYXR1cmVzGDIgASgLMhsuZ29vZ2xlLnByb3RvYnVmLkZlYXR1cmVTZXRSCGZlYX'
    'R1cmVzElgKFHVuaW50ZXJwcmV0ZWRfb3B0aW9uGOcHIAMoCzIkLmdvb2dsZS5wcm90b2J1Zi5V'
    'bmludGVycHJldGVkT3B0aW9uUhN1bmludGVycHJldGVkT3B0aW9uIjoKDE9wdGltaXplTW9kZR'
    'IJCgVTUEVFRBABEg0KCUNPREVfU0laRRACEhAKDExJVEVfUlVOVElNRRADKgkI6AcQgICAgAJK'
    'BAgmECc=');

@$core.Deprecated('Use messageOptionsDescriptor instead')
const MessageOptions$json = {
  '1': 'MessageOptions',
  '2': [
    {'1': 'message_set_wire_format', '3': 1, '4': 1, '5': 8, '7': 'false', '10': 'messageSetWireFormat'},
    {'1': 'no_standard_descriptor_accessor', '3': 2, '4': 1, '5': 8, '7': 'false', '10': 'noStandardDescriptorAccessor'},
    {'1': 'deprecated', '3': 3, '4': 1, '5': 8, '7': 'false', '10': 'deprecated'},
    {'1': 'map_entry', '3': 7, '4': 1, '5': 8, '10': 'mapEntry'},
    {
      '1': 'deprecated_legacy_json_field_conflicts',
      '3': 11,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'deprecatedLegacyJsonFieldConflicts',
    },
    {'1': 'features', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '9': [
    {'1': 4, '2': 5},
    {'1': 5, '2': 6},
    {'1': 6, '2': 7},
    {'1': 8, '2': 9},
    {'1': 9, '2': 10},
  ],
};

/// Descriptor for `MessageOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageOptionsDescriptor = $convert.base64Decode(
    'Cg5NZXNzYWdlT3B0aW9ucxI8ChdtZXNzYWdlX3NldF93aXJlX2Zvcm1hdBgBIAEoCDoFZmFsc2'
    'VSFG1lc3NhZ2VTZXRXaXJlRm9ybWF0EkwKH25vX3N0YW5kYXJkX2Rlc2NyaXB0b3JfYWNjZXNz'
    'b3IYAiABKAg6BWZhbHNlUhxub1N0YW5kYXJkRGVzY3JpcHRvckFjY2Vzc29yEiUKCmRlcHJlY2'
    'F0ZWQYAyABKAg6BWZhbHNlUgpkZXByZWNhdGVkEhsKCW1hcF9lbnRyeRgHIAEoCFIIbWFwRW50'
    'cnkSVgomZGVwcmVjYXRlZF9sZWdhY3lfanNvbl9maWVsZF9jb25mbGljdHMYCyABKAhCAhgBUi'
    'JkZXByZWNhdGVkTGVnYWN5SnNvbkZpZWxkQ29uZmxpY3RzEjcKCGZlYXR1cmVzGAwgASgLMhsu'
    'Z29vZ2xlLnByb3RvYnVmLkZlYXR1cmVTZXRSCGZlYXR1cmVzElgKFHVuaW50ZXJwcmV0ZWRfb3'
    'B0aW9uGOcHIAMoCzIkLmdvb2dsZS5wcm90b2J1Zi5VbmludGVycHJldGVkT3B0aW9uUhN1bmlu'
    'dGVycHJldGVkT3B0aW9uKgkI6AcQgICAgAJKBAgEEAVKBAgFEAZKBAgGEAdKBAgIEAlKBAgJEA'
    'o=');

@$core.Deprecated('Use fieldOptionsDescriptor instead')
const FieldOptions$json = {
  '1': 'FieldOptions',
  '2': [
    {'1': 'ctype', '3': 1, '4': 1, '5': 14, '6': '.google.protobuf.FieldOptions.CType', '7': 'STRING', '10': 'ctype'},
    {'1': 'packed', '3': 2, '4': 1, '5': 8, '10': 'packed'},
    {'1': 'jstype', '3': 6, '4': 1, '5': 14, '6': '.google.protobuf.FieldOptions.JSType', '7': 'JS_NORMAL', '10': 'jstype'},
    {'1': 'lazy', '3': 5, '4': 1, '5': 8, '7': 'false', '10': 'lazy'},
    {'1': 'unverified_lazy', '3': 15, '4': 1, '5': 8, '7': 'false', '10': 'unverifiedLazy'},
    {'1': 'deprecated', '3': 3, '4': 1, '5': 8, '7': 'false', '10': 'deprecated'},
    {'1': 'weak', '3': 10, '4': 1, '5': 8, '7': 'false', '10': 'weak'},
    {'1': 'debug_redact', '3': 16, '4': 1, '5': 8, '7': 'false', '10': 'debugRedact'},
    {'1': 'retention', '3': 17, '4': 1, '5': 14, '6': '.google.protobuf.FieldOptions.OptionRetention', '10': 'retention'},
    {'1': 'targets', '3': 19, '4': 3, '5': 14, '6': '.google.protobuf.FieldOptions.OptionTargetType', '10': 'targets'},
    {'1': 'edition_defaults', '3': 20, '4': 3, '5': 11, '6': '.google.protobuf.FieldOptions.EditionDefault', '10': 'editionDefaults'},
    {'1': 'features', '3': 21, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '3': [FieldOptions_EditionDefault$json],
  '4': [FieldOptions_CType$json, FieldOptions_JSType$json, FieldOptions_OptionRetention$json, FieldOptions_OptionTargetType$json],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '9': [
    {'1': 4, '2': 5},
    {'1': 18, '2': 19},
  ],
};

@$core.Deprecated('Use fieldOptionsDescriptor instead')
const FieldOptions_EditionDefault$json = {
  '1': 'EditionDefault',
  '2': [
    {'1': 'edition', '3': 3, '4': 1, '5': 14, '6': '.google.protobuf.Edition', '10': 'edition'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

@$core.Deprecated('Use fieldOptionsDescriptor instead')
const FieldOptions_CType$json = {
  '1': 'CType',
  '2': [
    {'1': 'STRING', '2': 0},
    {'1': 'CORD', '2': 1},
    {'1': 'STRING_PIECE', '2': 2},
  ],
};

@$core.Deprecated('Use fieldOptionsDescriptor instead')
const FieldOptions_JSType$json = {
  '1': 'JSType',
  '2': [
    {'1': 'JS_NORMAL', '2': 0},
    {'1': 'JS_STRING', '2': 1},
    {'1': 'JS_NUMBER', '2': 2},
  ],
};

@$core.Deprecated('Use fieldOptionsDescriptor instead')
const FieldOptions_OptionRetention$json = {
  '1': 'OptionRetention',
  '2': [
    {'1': 'RETENTION_UNKNOWN', '2': 0},
    {'1': 'RETENTION_RUNTIME', '2': 1},
    {'1': 'RETENTION_SOURCE', '2': 2},
  ],
};

@$core.Deprecated('Use fieldOptionsDescriptor instead')
const FieldOptions_OptionTargetType$json = {
  '1': 'OptionTargetType',
  '2': [
    {'1': 'TARGET_TYPE_UNKNOWN', '2': 0},
    {'1': 'TARGET_TYPE_FILE', '2': 1},
    {'1': 'TARGET_TYPE_EXTENSION_RANGE', '2': 2},
    {'1': 'TARGET_TYPE_MESSAGE', '2': 3},
    {'1': 'TARGET_TYPE_FIELD', '2': 4},
    {'1': 'TARGET_TYPE_ONEOF', '2': 5},
    {'1': 'TARGET_TYPE_ENUM', '2': 6},
    {'1': 'TARGET_TYPE_ENUM_ENTRY', '2': 7},
    {'1': 'TARGET_TYPE_SERVICE', '2': 8},
    {'1': 'TARGET_TYPE_METHOD', '2': 9},
  ],
};

/// Descriptor for `FieldOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldOptionsDescriptor = $convert.base64Decode(
    'CgxGaWVsZE9wdGlvbnMSQQoFY3R5cGUYASABKA4yIy5nb29nbGUucHJvdG9idWYuRmllbGRPcH'
    'Rpb25zLkNUeXBlOgZTVFJJTkdSBWN0eXBlEhYKBnBhY2tlZBgCIAEoCFIGcGFja2VkEkcKBmpz'
    'dHlwZRgGIAEoDjIkLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE9wdGlvbnMuSlNUeXBlOglKU19OT1'
    'JNQUxSBmpzdHlwZRIZCgRsYXp5GAUgASgIOgVmYWxzZVIEbGF6eRIuCg91bnZlcmlmaWVkX2xh'
    'enkYDyABKAg6BWZhbHNlUg51bnZlcmlmaWVkTGF6eRIlCgpkZXByZWNhdGVkGAMgASgIOgVmYW'
    'xzZVIKZGVwcmVjYXRlZBIZCgR3ZWFrGAogASgIOgVmYWxzZVIEd2VhaxIoCgxkZWJ1Z19yZWRh'
    'Y3QYECABKAg6BWZhbHNlUgtkZWJ1Z1JlZGFjdBJLCglyZXRlbnRpb24YESABKA4yLS5nb29nbG'
    'UucHJvdG9idWYuRmllbGRPcHRpb25zLk9wdGlvblJldGVudGlvblIJcmV0ZW50aW9uEkgKB3Rh'
    'cmdldHMYEyADKA4yLi5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zLk9wdGlvblRhcmdldF'
    'R5cGVSB3RhcmdldHMSVwoQZWRpdGlvbl9kZWZhdWx0cxgUIAMoCzIsLmdvb2dsZS5wcm90b2J1'
    'Zi5GaWVsZE9wdGlvbnMuRWRpdGlvbkRlZmF1bHRSD2VkaXRpb25EZWZhdWx0cxI3CghmZWF0dX'
    'JlcxgVIAEoCzIbLmdvb2dsZS5wcm90b2J1Zi5GZWF0dXJlU2V0UghmZWF0dXJlcxJYChR1bmlu'
    'dGVycHJldGVkX29wdGlvbhjnByADKAsyJC5nb29nbGUucHJvdG9idWYuVW5pbnRlcnByZXRlZE'
    '9wdGlvblITdW5pbnRlcnByZXRlZE9wdGlvbhpaCg5FZGl0aW9uRGVmYXVsdBIyCgdlZGl0aW9u'
    'GAMgASgOMhguZ29vZ2xlLnByb3RvYnVmLkVkaXRpb25SB2VkaXRpb24SFAoFdmFsdWUYAiABKA'
    'lSBXZhbHVlIi8KBUNUeXBlEgoKBlNUUklORxAAEggKBENPUkQQARIQCgxTVFJJTkdfUElFQ0UQ'
    'AiI1CgZKU1R5cGUSDQoJSlNfTk9STUFMEAASDQoJSlNfU1RSSU5HEAESDQoJSlNfTlVNQkVSEA'
    'IiVQoPT3B0aW9uUmV0ZW50aW9uEhUKEVJFVEVOVElPTl9VTktOT1dOEAASFQoRUkVURU5USU9O'
    'X1JVTlRJTUUQARIUChBSRVRFTlRJT05fU09VUkNFEAIijAIKEE9wdGlvblRhcmdldFR5cGUSFw'
    'oTVEFSR0VUX1RZUEVfVU5LTk9XThAAEhQKEFRBUkdFVF9UWVBFX0ZJTEUQARIfChtUQVJHRVRf'
    'VFlQRV9FWFRFTlNJT05fUkFOR0UQAhIXChNUQVJHRVRfVFlQRV9NRVNTQUdFEAMSFQoRVEFSR0'
    'VUX1RZUEVfRklFTEQQBBIVChFUQVJHRVRfVFlQRV9PTkVPRhAFEhQKEFRBUkdFVF9UWVBFX0VO'
    'VU0QBhIaChZUQVJHRVRfVFlQRV9FTlVNX0VOVFJZEAcSFwoTVEFSR0VUX1RZUEVfU0VSVklDRR'
    'AIEhYKElRBUkdFVF9UWVBFX01FVEhPRBAJKgkI6AcQgICAgAJKBAgEEAVKBAgSEBM=');

@$core.Deprecated('Use oneofOptionsDescriptor instead')
const OneofOptions$json = {
  '1': 'OneofOptions',
  '2': [
    {'1': 'features', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

/// Descriptor for `OneofOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oneofOptionsDescriptor = $convert.base64Decode(
    'CgxPbmVvZk9wdGlvbnMSNwoIZmVhdHVyZXMYASABKAsyGy5nb29nbGUucHJvdG9idWYuRmVhdH'
    'VyZVNldFIIZmVhdHVyZXMSWAoUdW5pbnRlcnByZXRlZF9vcHRpb24Y5wcgAygLMiQuZ29vZ2xl'
    'LnByb3RvYnVmLlVuaW50ZXJwcmV0ZWRPcHRpb25SE3VuaW50ZXJwcmV0ZWRPcHRpb24qCQjoBx'
    'CAgICAAg==');

@$core.Deprecated('Use enumOptionsDescriptor instead')
const EnumOptions$json = {
  '1': 'EnumOptions',
  '2': [
    {'1': 'allow_alias', '3': 2, '4': 1, '5': 8, '10': 'allowAlias'},
    {'1': 'deprecated', '3': 3, '4': 1, '5': 8, '7': 'false', '10': 'deprecated'},
    {
      '1': 'deprecated_legacy_json_field_conflicts',
      '3': 6,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'deprecatedLegacyJsonFieldConflicts',
    },
    {'1': 'features', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '9': [
    {'1': 5, '2': 6},
  ],
};

/// Descriptor for `EnumOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumOptionsDescriptor = $convert.base64Decode(
    'CgtFbnVtT3B0aW9ucxIfCgthbGxvd19hbGlhcxgCIAEoCFIKYWxsb3dBbGlhcxIlCgpkZXByZW'
    'NhdGVkGAMgASgIOgVmYWxzZVIKZGVwcmVjYXRlZBJWCiZkZXByZWNhdGVkX2xlZ2FjeV9qc29u'
    'X2ZpZWxkX2NvbmZsaWN0cxgGIAEoCEICGAFSImRlcHJlY2F0ZWRMZWdhY3lKc29uRmllbGRDb2'
    '5mbGljdHMSNwoIZmVhdHVyZXMYByABKAsyGy5nb29nbGUucHJvdG9idWYuRmVhdHVyZVNldFII'
    'ZmVhdHVyZXMSWAoUdW5pbnRlcnByZXRlZF9vcHRpb24Y5wcgAygLMiQuZ29vZ2xlLnByb3RvYn'
    'VmLlVuaW50ZXJwcmV0ZWRPcHRpb25SE3VuaW50ZXJwcmV0ZWRPcHRpb24qCQjoBxCAgICAAkoE'
    'CAUQBg==');

@$core.Deprecated('Use enumValueOptionsDescriptor instead')
const EnumValueOptions$json = {
  '1': 'EnumValueOptions',
  '2': [
    {'1': 'deprecated', '3': 1, '4': 1, '5': 8, '7': 'false', '10': 'deprecated'},
    {'1': 'features', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'debug_redact', '3': 3, '4': 1, '5': 8, '7': 'false', '10': 'debugRedact'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

/// Descriptor for `EnumValueOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumValueOptionsDescriptor = $convert.base64Decode(
    'ChBFbnVtVmFsdWVPcHRpb25zEiUKCmRlcHJlY2F0ZWQYASABKAg6BWZhbHNlUgpkZXByZWNhdG'
    'VkEjcKCGZlYXR1cmVzGAIgASgLMhsuZ29vZ2xlLnByb3RvYnVmLkZlYXR1cmVTZXRSCGZlYXR1'
    'cmVzEigKDGRlYnVnX3JlZGFjdBgDIAEoCDoFZmFsc2VSC2RlYnVnUmVkYWN0ElgKFHVuaW50ZX'
    'JwcmV0ZWRfb3B0aW9uGOcHIAMoCzIkLmdvb2dsZS5wcm90b2J1Zi5VbmludGVycHJldGVkT3B0'
    'aW9uUhN1bmludGVycHJldGVkT3B0aW9uKgkI6AcQgICAgAI=');

@$core.Deprecated('Use serviceOptionsDescriptor instead')
const ServiceOptions$json = {
  '1': 'ServiceOptions',
  '2': [
    {'1': 'features', '3': 34, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'deprecated', '3': 33, '4': 1, '5': 8, '7': 'false', '10': 'deprecated'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

/// Descriptor for `ServiceOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceOptionsDescriptor = $convert.base64Decode(
    'Cg5TZXJ2aWNlT3B0aW9ucxI3CghmZWF0dXJlcxgiIAEoCzIbLmdvb2dsZS5wcm90b2J1Zi5GZW'
    'F0dXJlU2V0UghmZWF0dXJlcxIlCgpkZXByZWNhdGVkGCEgASgIOgVmYWxzZVIKZGVwcmVjYXRl'
    'ZBJYChR1bmludGVycHJldGVkX29wdGlvbhjnByADKAsyJC5nb29nbGUucHJvdG9idWYuVW5pbn'
    'RlcnByZXRlZE9wdGlvblITdW5pbnRlcnByZXRlZE9wdGlvbioJCOgHEICAgIAC');

@$core.Deprecated('Use methodOptionsDescriptor instead')
const MethodOptions$json = {
  '1': 'MethodOptions',
  '2': [
    {'1': 'deprecated', '3': 33, '4': 1, '5': 8, '7': 'false', '10': 'deprecated'},
    {'1': 'idempotency_level', '3': 34, '4': 1, '5': 14, '6': '.google.protobuf.MethodOptions.IdempotencyLevel', '7': 'IDEMPOTENCY_UNKNOWN', '10': 'idempotencyLevel'},
    {'1': 'features', '3': 35, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
    {'1': 'uninterpreted_option', '3': 999, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption', '10': 'uninterpretedOption'},
  ],
  '4': [MethodOptions_IdempotencyLevel$json],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

@$core.Deprecated('Use methodOptionsDescriptor instead')
const MethodOptions_IdempotencyLevel$json = {
  '1': 'IdempotencyLevel',
  '2': [
    {'1': 'IDEMPOTENCY_UNKNOWN', '2': 0},
    {'1': 'NO_SIDE_EFFECTS', '2': 1},
    {'1': 'IDEMPOTENT', '2': 2},
  ],
};

/// Descriptor for `MethodOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List methodOptionsDescriptor = $convert.base64Decode(
    'Cg1NZXRob2RPcHRpb25zEiUKCmRlcHJlY2F0ZWQYISABKAg6BWZhbHNlUgpkZXByZWNhdGVkEn'
    'EKEWlkZW1wb3RlbmN5X2xldmVsGCIgASgOMi8uZ29vZ2xlLnByb3RvYnVmLk1ldGhvZE9wdGlv'
    'bnMuSWRlbXBvdGVuY3lMZXZlbDoTSURFTVBPVEVOQ1lfVU5LTk9XTlIQaWRlbXBvdGVuY3lMZX'
    'ZlbBI3CghmZWF0dXJlcxgjIAEoCzIbLmdvb2dsZS5wcm90b2J1Zi5GZWF0dXJlU2V0UghmZWF0'
    'dXJlcxJYChR1bmludGVycHJldGVkX29wdGlvbhjnByADKAsyJC5nb29nbGUucHJvdG9idWYuVW'
    '5pbnRlcnByZXRlZE9wdGlvblITdW5pbnRlcnByZXRlZE9wdGlvbiJQChBJZGVtcG90ZW5jeUxl'
    'dmVsEhcKE0lERU1QT1RFTkNZX1VOS05PV04QABITCg9OT19TSURFX0VGRkVDVFMQARIOCgpJRE'
    'VNUE9URU5UEAIqCQjoBxCAgICAAg==');

@$core.Deprecated('Use uninterpretedOptionDescriptor instead')
const UninterpretedOption$json = {
  '1': 'UninterpretedOption',
  '2': [
    {'1': 'name', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.UninterpretedOption.NamePart', '10': 'name'},
    {'1': 'identifier_value', '3': 3, '4': 1, '5': 9, '10': 'identifierValue'},
    {'1': 'positive_int_value', '3': 4, '4': 1, '5': 4, '10': 'positiveIntValue'},
    {'1': 'negative_int_value', '3': 5, '4': 1, '5': 3, '10': 'negativeIntValue'},
    {'1': 'double_value', '3': 6, '4': 1, '5': 1, '10': 'doubleValue'},
    {'1': 'string_value', '3': 7, '4': 1, '5': 12, '10': 'stringValue'},
    {'1': 'aggregate_value', '3': 8, '4': 1, '5': 9, '10': 'aggregateValue'},
  ],
  '3': [UninterpretedOption_NamePart$json],
};

@$core.Deprecated('Use uninterpretedOptionDescriptor instead')
const UninterpretedOption_NamePart$json = {
  '1': 'NamePart',
  '2': [
    {'1': 'name_part', '3': 1, '4': 2, '5': 9, '10': 'namePart'},
    {'1': 'is_extension', '3': 2, '4': 2, '5': 8, '10': 'isExtension'},
  ],
};

/// Descriptor for `UninterpretedOption`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uninterpretedOptionDescriptor = $convert.base64Decode(
    'ChNVbmludGVycHJldGVkT3B0aW9uEkEKBG5hbWUYAiADKAsyLS5nb29nbGUucHJvdG9idWYuVW'
    '5pbnRlcnByZXRlZE9wdGlvbi5OYW1lUGFydFIEbmFtZRIpChBpZGVudGlmaWVyX3ZhbHVlGAMg'
    'ASgJUg9pZGVudGlmaWVyVmFsdWUSLAoScG9zaXRpdmVfaW50X3ZhbHVlGAQgASgEUhBwb3NpdG'
    'l2ZUludFZhbHVlEiwKEm5lZ2F0aXZlX2ludF92YWx1ZRgFIAEoA1IQbmVnYXRpdmVJbnRWYWx1'
    'ZRIhCgxkb3VibGVfdmFsdWUYBiABKAFSC2RvdWJsZVZhbHVlEiEKDHN0cmluZ192YWx1ZRgHIA'
    'EoDFILc3RyaW5nVmFsdWUSJwoPYWdncmVnYXRlX3ZhbHVlGAggASgJUg5hZ2dyZWdhdGVWYWx1'
    'ZRpKCghOYW1lUGFydBIbCgluYW1lX3BhcnQYASACKAlSCG5hbWVQYXJ0EiEKDGlzX2V4dGVuc2'
    'lvbhgCIAIoCFILaXNFeHRlbnNpb24=');

@$core.Deprecated('Use featureSetDescriptor instead')
const FeatureSet$json = {
  '1': 'FeatureSet',
  '2': [
    {'1': 'field_presence', '3': 1, '4': 1, '5': 14, '6': '.google.protobuf.FeatureSet.FieldPresence', '8': {}, '10': 'fieldPresence'},
    {'1': 'enum_type', '3': 2, '4': 1, '5': 14, '6': '.google.protobuf.FeatureSet.EnumType', '8': {}, '10': 'enumType'},
    {'1': 'repeated_field_encoding', '3': 3, '4': 1, '5': 14, '6': '.google.protobuf.FeatureSet.RepeatedFieldEncoding', '8': {}, '10': 'repeatedFieldEncoding'},
    {'1': 'utf8_validation', '3': 4, '4': 1, '5': 14, '6': '.google.protobuf.FeatureSet.Utf8Validation', '8': {}, '10': 'utf8Validation'},
    {'1': 'message_encoding', '3': 5, '4': 1, '5': 14, '6': '.google.protobuf.FeatureSet.MessageEncoding', '8': {}, '10': 'messageEncoding'},
    {'1': 'json_format', '3': 6, '4': 1, '5': 14, '6': '.google.protobuf.FeatureSet.JsonFormat', '8': {}, '10': 'jsonFormat'},
  ],
  '4': [FeatureSet_FieldPresence$json, FeatureSet_EnumType$json, FeatureSet_RepeatedFieldEncoding$json, FeatureSet_Utf8Validation$json, FeatureSet_MessageEncoding$json, FeatureSet_JsonFormat$json],
  '5': [
    {'1': 1000, '2': 1001},
    {'1': 1001, '2': 1002},
    {'1': 9995, '2': 10000},
  ],
  '9': [
    {'1': 999, '2': 1000},
  ],
};

@$core.Deprecated('Use featureSetDescriptor instead')
const FeatureSet_FieldPresence$json = {
  '1': 'FieldPresence',
  '2': [
    {'1': 'FIELD_PRESENCE_UNKNOWN', '2': 0},
    {'1': 'EXPLICIT', '2': 1},
    {'1': 'IMPLICIT', '2': 2},
    {'1': 'LEGACY_REQUIRED', '2': 3},
  ],
};

@$core.Deprecated('Use featureSetDescriptor instead')
const FeatureSet_EnumType$json = {
  '1': 'EnumType',
  '2': [
    {'1': 'ENUM_TYPE_UNKNOWN', '2': 0},
    {'1': 'OPEN', '2': 1},
    {'1': 'CLOSED', '2': 2},
  ],
};

@$core.Deprecated('Use featureSetDescriptor instead')
const FeatureSet_RepeatedFieldEncoding$json = {
  '1': 'RepeatedFieldEncoding',
  '2': [
    {'1': 'REPEATED_FIELD_ENCODING_UNKNOWN', '2': 0},
    {'1': 'PACKED', '2': 1},
    {'1': 'EXPANDED', '2': 2},
  ],
};

@$core.Deprecated('Use featureSetDescriptor instead')
const FeatureSet_Utf8Validation$json = {
  '1': 'Utf8Validation',
  '2': [
    {'1': 'UTF8_VALIDATION_UNKNOWN', '2': 0},
    {'1': 'NONE', '2': 1},
    {'1': 'VERIFY', '2': 2},
  ],
};

@$core.Deprecated('Use featureSetDescriptor instead')
const FeatureSet_MessageEncoding$json = {
  '1': 'MessageEncoding',
  '2': [
    {'1': 'MESSAGE_ENCODING_UNKNOWN', '2': 0},
    {'1': 'LENGTH_PREFIXED', '2': 1},
    {'1': 'DELIMITED', '2': 2},
  ],
};

@$core.Deprecated('Use featureSetDescriptor instead')
const FeatureSet_JsonFormat$json = {
  '1': 'JsonFormat',
  '2': [
    {'1': 'JSON_FORMAT_UNKNOWN', '2': 0},
    {'1': 'ALLOW', '2': 1},
    {'1': 'LEGACY_BEST_EFFORT', '2': 2},
  ],
};

/// Descriptor for `FeatureSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List featureSetDescriptor = $convert.base64Decode(
    'CgpGZWF0dXJlU2V0EosBCg5maWVsZF9wcmVzZW5jZRgBIAEoDjIpLmdvb2dsZS5wcm90b2J1Zi'
    '5GZWF0dXJlU2V0LkZpZWxkUHJlc2VuY2VCOYgBAZgBBJgBAaIBDRIIRVhQTElDSVQY5geiAQ0S'
    'CElNUExJQ0lUGOcHogENEghFWFBMSUNJVBjoB1INZmllbGRQcmVzZW5jZRJmCgllbnVtX3R5cG'
    'UYAiABKA4yJC5nb29nbGUucHJvdG9idWYuRmVhdHVyZVNldC5FbnVtVHlwZUIjiAEBmAEGmAEB'
    'ogELEgZDTE9TRUQY5geiAQkSBE9QRU4Y5wdSCGVudW1UeXBlEpIBChdyZXBlYXRlZF9maWVsZF'
    '9lbmNvZGluZxgDIAEoDjIxLmdvb2dsZS5wcm90b2J1Zi5GZWF0dXJlU2V0LlJlcGVhdGVkRmll'
    'bGRFbmNvZGluZ0IniAEBmAEEmAEBogENEghFWFBBTkRFRBjmB6IBCxIGUEFDS0VEGOcHUhVyZX'
    'BlYXRlZEZpZWxkRW5jb2RpbmcSeAoPdXRmOF92YWxpZGF0aW9uGAQgASgOMiouZ29vZ2xlLnBy'
    'b3RvYnVmLkZlYXR1cmVTZXQuVXRmOFZhbGlkYXRpb25CI4gBAZgBBJgBAaIBCRIETk9ORRjmB6'
    'IBCxIGVkVSSUZZGOcHUg51dGY4VmFsaWRhdGlvbhJ4ChBtZXNzYWdlX2VuY29kaW5nGAUgASgO'
    'MisuZ29vZ2xlLnByb3RvYnVmLkZlYXR1cmVTZXQuTWVzc2FnZUVuY29kaW5nQiCIAQGYAQSYAQ'
    'GiARQSD0xFTkdUSF9QUkVGSVhFRBjmB1IPbWVzc2FnZUVuY29kaW5nEnwKC2pzb25fZm9ybWF0'
    'GAYgASgOMiYuZ29vZ2xlLnByb3RvYnVmLkZlYXR1cmVTZXQuSnNvbkZvcm1hdEIziAEBmAEDmA'
    'EGmAEBogEXEhJMRUdBQ1lfQkVTVF9FRkZPUlQY5geiAQoSBUFMTE9XGOcHUgpqc29uRm9ybWF0'
    'IlwKDUZpZWxkUHJlc2VuY2USGgoWRklFTERfUFJFU0VOQ0VfVU5LTk9XThAAEgwKCEVYUExJQ0'
    'lUEAESDAoISU1QTElDSVQQAhITCg9MRUdBQ1lfUkVRVUlSRUQQAyI3CghFbnVtVHlwZRIVChFF'
    'TlVNX1RZUEVfVU5LTk9XThAAEggKBE9QRU4QARIKCgZDTE9TRUQQAiJWChVSZXBlYXRlZEZpZW'
    'xkRW5jb2RpbmcSIwofUkVQRUFURURfRklFTERfRU5DT0RJTkdfVU5LTk9XThAAEgoKBlBBQ0tF'
    'RBABEgwKCEVYUEFOREVEEAIiQwoOVXRmOFZhbGlkYXRpb24SGwoXVVRGOF9WQUxJREFUSU9OX1'
    'VOS05PV04QABIICgROT05FEAESCgoGVkVSSUZZEAIiUwoPTWVzc2FnZUVuY29kaW5nEhwKGE1F'
    'U1NBR0VfRU5DT0RJTkdfVU5LTk9XThAAEhMKD0xFTkdUSF9QUkVGSVhFRBABEg0KCURFTElNSV'
    'RFRBACIkgKCkpzb25Gb3JtYXQSFwoTSlNPTl9GT1JNQVRfVU5LTk9XThAAEgkKBUFMTE9XEAES'
    'FgoSTEVHQUNZX0JFU1RfRUZGT1JUEAIqBgjoBxDpByoGCOkHEOoHKgYIi04QkE5KBgjnBxDoBw'
    '==');

@$core.Deprecated('Use featureSetDefaultsDescriptor instead')
const FeatureSetDefaults$json = {
  '1': 'FeatureSetDefaults',
  '2': [
    {'1': 'defaults', '3': 1, '4': 3, '5': 11, '6': '.google.protobuf.FeatureSetDefaults.FeatureSetEditionDefault', '10': 'defaults'},
    {'1': 'minimum_edition', '3': 4, '4': 1, '5': 14, '6': '.google.protobuf.Edition', '10': 'minimumEdition'},
    {'1': 'maximum_edition', '3': 5, '4': 1, '5': 14, '6': '.google.protobuf.Edition', '10': 'maximumEdition'},
  ],
  '3': [FeatureSetDefaults_FeatureSetEditionDefault$json],
};

@$core.Deprecated('Use featureSetDefaultsDescriptor instead')
const FeatureSetDefaults_FeatureSetEditionDefault$json = {
  '1': 'FeatureSetEditionDefault',
  '2': [
    {'1': 'edition', '3': 3, '4': 1, '5': 14, '6': '.google.protobuf.Edition', '10': 'edition'},
    {'1': 'features', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FeatureSet', '10': 'features'},
  ],
};

/// Descriptor for `FeatureSetDefaults`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List featureSetDefaultsDescriptor = $convert.base64Decode(
    'ChJGZWF0dXJlU2V0RGVmYXVsdHMSWAoIZGVmYXVsdHMYASADKAsyPC5nb29nbGUucHJvdG9idW'
    'YuRmVhdHVyZVNldERlZmF1bHRzLkZlYXR1cmVTZXRFZGl0aW9uRGVmYXVsdFIIZGVmYXVsdHMS'
    'QQoPbWluaW11bV9lZGl0aW9uGAQgASgOMhguZ29vZ2xlLnByb3RvYnVmLkVkaXRpb25SDm1pbm'
    'ltdW1FZGl0aW9uEkEKD21heGltdW1fZWRpdGlvbhgFIAEoDjIYLmdvb2dsZS5wcm90b2J1Zi5F'
    'ZGl0aW9uUg5tYXhpbXVtRWRpdGlvbhqHAQoYRmVhdHVyZVNldEVkaXRpb25EZWZhdWx0EjIKB2'
    'VkaXRpb24YAyABKA4yGC5nb29nbGUucHJvdG9idWYuRWRpdGlvblIHZWRpdGlvbhI3CghmZWF0'
    'dXJlcxgCIAEoCzIbLmdvb2dsZS5wcm90b2J1Zi5GZWF0dXJlU2V0UghmZWF0dXJlcw==');

@$core.Deprecated('Use sourceCodeInfoDescriptor instead')
const SourceCodeInfo$json = {
  '1': 'SourceCodeInfo',
  '2': [
    {'1': 'location', '3': 1, '4': 3, '5': 11, '6': '.google.protobuf.SourceCodeInfo.Location', '10': 'location'},
  ],
  '3': [SourceCodeInfo_Location$json],
};

@$core.Deprecated('Use sourceCodeInfoDescriptor instead')
const SourceCodeInfo_Location$json = {
  '1': 'Location',
  '2': [
    {
      '1': 'path',
      '3': 1,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'path',
    },
    {
      '1': 'span',
      '3': 2,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'span',
    },
    {'1': 'leading_comments', '3': 3, '4': 1, '5': 9, '10': 'leadingComments'},
    {'1': 'trailing_comments', '3': 4, '4': 1, '5': 9, '10': 'trailingComments'},
    {'1': 'leading_detached_comments', '3': 6, '4': 3, '5': 9, '10': 'leadingDetachedComments'},
  ],
};

/// Descriptor for `SourceCodeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sourceCodeInfoDescriptor = $convert.base64Decode(
    'Cg5Tb3VyY2VDb2RlSW5mbxJECghsb2NhdGlvbhgBIAMoCzIoLmdvb2dsZS5wcm90b2J1Zi5Tb3'
    'VyY2VDb2RlSW5mby5Mb2NhdGlvblIIbG9jYXRpb24azgEKCExvY2F0aW9uEhYKBHBhdGgYASAD'
    'KAVCAhABUgRwYXRoEhYKBHNwYW4YAiADKAVCAhABUgRzcGFuEikKEGxlYWRpbmdfY29tbWVudH'
    'MYAyABKAlSD2xlYWRpbmdDb21tZW50cxIrChF0cmFpbGluZ19jb21tZW50cxgEIAEoCVIQdHJh'
    'aWxpbmdDb21tZW50cxI6ChlsZWFkaW5nX2RldGFjaGVkX2NvbW1lbnRzGAYgAygJUhdsZWFkaW'
    '5nRGV0YWNoZWRDb21tZW50cw==');

@$core.Deprecated('Use generatedCodeInfoDescriptor instead')
const GeneratedCodeInfo$json = {
  '1': 'GeneratedCodeInfo',
  '2': [
    {'1': 'annotation', '3': 1, '4': 3, '5': 11, '6': '.google.protobuf.GeneratedCodeInfo.Annotation', '10': 'annotation'},
  ],
  '3': [GeneratedCodeInfo_Annotation$json],
};

@$core.Deprecated('Use generatedCodeInfoDescriptor instead')
const GeneratedCodeInfo_Annotation$json = {
  '1': 'Annotation',
  '2': [
    {
      '1': 'path',
      '3': 1,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'path',
    },
    {'1': 'source_file', '3': 2, '4': 1, '5': 9, '10': 'sourceFile'},
    {'1': 'begin', '3': 3, '4': 1, '5': 5, '10': 'begin'},
    {'1': 'end', '3': 4, '4': 1, '5': 5, '10': 'end'},
    {'1': 'semantic', '3': 5, '4': 1, '5': 14, '6': '.google.protobuf.GeneratedCodeInfo.Annotation.Semantic', '10': 'semantic'},
  ],
  '4': [GeneratedCodeInfo_Annotation_Semantic$json],
};

@$core.Deprecated('Use generatedCodeInfoDescriptor instead')
const GeneratedCodeInfo_Annotation_Semantic$json = {
  '1': 'Semantic',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'SET', '2': 1},
    {'1': 'ALIAS', '2': 2},
  ],
};

/// Descriptor for `GeneratedCodeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generatedCodeInfoDescriptor = $convert.base64Decode(
    'ChFHZW5lcmF0ZWRDb2RlSW5mbxJNCgphbm5vdGF0aW9uGAEgAygLMi0uZ29vZ2xlLnByb3RvYn'
    'VmLkdlbmVyYXRlZENvZGVJbmZvLkFubm90YXRpb25SCmFubm90YXRpb24a6wEKCkFubm90YXRp'
    'b24SFgoEcGF0aBgBIAMoBUICEAFSBHBhdGgSHwoLc291cmNlX2ZpbGUYAiABKAlSCnNvdXJjZU'
    'ZpbGUSFAoFYmVnaW4YAyABKAVSBWJlZ2luEhAKA2VuZBgEIAEoBVIDZW5kElIKCHNlbWFudGlj'
    'GAUgASgOMjYuZ29vZ2xlLnByb3RvYnVmLkdlbmVyYXRlZENvZGVJbmZvLkFubm90YXRpb24uU2'
    'VtYW50aWNSCHNlbWFudGljIigKCFNlbWFudGljEggKBE5PTkUQABIHCgNTRVQQARIJCgVBTElB'
    'UxAC');


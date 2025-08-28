// This is a generated file - do not edit.
//
// Generated from buf/validate/validate.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ignoreDescriptor instead')
const Ignore$json = {
  '1': 'Ignore',
  '2': [
    {'1': 'IGNORE_UNSPECIFIED', '2': 0},
    {'1': 'IGNORE_IF_ZERO_VALUE', '2': 1},
    {'1': 'IGNORE_ALWAYS', '2': 3},
  ],
  '4': [
    {'1': 2, '2': 2},
  ],
  '5': [
    'IGNORE_EMPTY',
    'IGNORE_DEFAULT',
    'IGNORE_IF_DEFAULT_VALUE',
    'IGNORE_IF_UNPOPULATED'
  ],
};

/// Descriptor for `Ignore`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ignoreDescriptor = $convert.base64Decode(
    'CgZJZ25vcmUSFgoSSUdOT1JFX1VOU1BFQ0lGSUVEEAASGAoUSUdOT1JFX0lGX1pFUk9fVkFMVU'
    'UQARIRCg1JR05PUkVfQUxXQVlTEAMiBAgCEAIqDElHTk9SRV9FTVBUWSoOSUdOT1JFX0RFRkFV'
    'TFQqF0lHTk9SRV9JRl9ERUZBVUxUX1ZBTFVFKhVJR05PUkVfSUZfVU5QT1BVTEFURUQ=');

@$core.Deprecated('Use knownRegexDescriptor instead')
const KnownRegex$json = {
  '1': 'KnownRegex',
  '2': [
    {'1': 'KNOWN_REGEX_UNSPECIFIED', '2': 0},
    {'1': 'KNOWN_REGEX_HTTP_HEADER_NAME', '2': 1},
    {'1': 'KNOWN_REGEX_HTTP_HEADER_VALUE', '2': 2},
  ],
};

/// Descriptor for `KnownRegex`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List knownRegexDescriptor = $convert.base64Decode(
    'CgpLbm93blJlZ2V4EhsKF0tOT1dOX1JFR0VYX1VOU1BFQ0lGSUVEEAASIAocS05PV05fUkVHRV'
    'hfSFRUUF9IRUFERVJfTkFNRRABEiEKHUtOT1dOX1JFR0VYX0hUVFBfSEVBREVSX1ZBTFVFEAI=');

@$core.Deprecated('Use ruleDescriptor instead')
const Rule$json = {
  '1': 'Rule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'expression', '3': 3, '4': 1, '5': 9, '10': 'expression'},
  ],
};

/// Descriptor for `Rule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ruleDescriptor = $convert.base64Decode(
    'CgRSdWxlEg4KAmlkGAEgASgJUgJpZBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEh4KCmV4cH'
    'Jlc3Npb24YAyABKAlSCmV4cHJlc3Npb24=');

@$core.Deprecated('Use messageRulesDescriptor instead')
const MessageRules$json = {
  '1': 'MessageRules',
  '2': [
    {
      '1': 'cel',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.Rule',
      '10': 'cel'
    },
    {
      '1': 'oneof',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.MessageOneofRule',
      '10': 'oneof'
    },
  ],
  '9': [
    {'1': 1, '2': 2},
  ],
  '10': ['disabled'],
};

/// Descriptor for `MessageRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageRulesDescriptor = $convert.base64Decode(
    'CgxNZXNzYWdlUnVsZXMSJAoDY2VsGAMgAygLMhIuYnVmLnZhbGlkYXRlLlJ1bGVSA2NlbBI0Cg'
    'VvbmVvZhgEIAMoCzIeLmJ1Zi52YWxpZGF0ZS5NZXNzYWdlT25lb2ZSdWxlUgVvbmVvZkoECAEQ'
    'AlIIZGlzYWJsZWQ=');

@$core.Deprecated('Use messageOneofRuleDescriptor instead')
const MessageOneofRule$json = {
  '1': 'MessageOneofRule',
  '2': [
    {'1': 'fields', '3': 1, '4': 3, '5': 9, '10': 'fields'},
    {'1': 'required', '3': 2, '4': 1, '5': 8, '10': 'required'},
  ],
};

/// Descriptor for `MessageOneofRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageOneofRuleDescriptor = $convert.base64Decode(
    'ChBNZXNzYWdlT25lb2ZSdWxlEhYKBmZpZWxkcxgBIAMoCVIGZmllbGRzEhoKCHJlcXVpcmVkGA'
    'IgASgIUghyZXF1aXJlZA==');

@$core.Deprecated('Use oneofRulesDescriptor instead')
const OneofRules$json = {
  '1': 'OneofRules',
  '2': [
    {'1': 'required', '3': 1, '4': 1, '5': 8, '10': 'required'},
  ],
};

/// Descriptor for `OneofRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oneofRulesDescriptor = $convert
    .base64Decode('CgpPbmVvZlJ1bGVzEhoKCHJlcXVpcmVkGAEgASgIUghyZXF1aXJlZA==');

@$core.Deprecated('Use fieldRulesDescriptor instead')
const FieldRules$json = {
  '1': 'FieldRules',
  '2': [
    {
      '1': 'cel',
      '3': 23,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.Rule',
      '10': 'cel'
    },
    {'1': 'required', '3': 25, '4': 1, '5': 8, '10': 'required'},
    {
      '1': 'ignore',
      '3': 27,
      '4': 1,
      '5': 14,
      '6': '.buf.validate.Ignore',
      '10': 'ignore'
    },
    {
      '1': 'float',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.FloatRules',
      '9': 0,
      '10': 'float'
    },
    {
      '1': 'double',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.DoubleRules',
      '9': 0,
      '10': 'double'
    },
    {
      '1': 'int32',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.Int32Rules',
      '9': 0,
      '10': 'int32'
    },
    {
      '1': 'int64',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.Int64Rules',
      '9': 0,
      '10': 'int64'
    },
    {
      '1': 'uint32',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.UInt32Rules',
      '9': 0,
      '10': 'uint32'
    },
    {
      '1': 'uint64',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.UInt64Rules',
      '9': 0,
      '10': 'uint64'
    },
    {
      '1': 'sint32',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.SInt32Rules',
      '9': 0,
      '10': 'sint32'
    },
    {
      '1': 'sint64',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.SInt64Rules',
      '9': 0,
      '10': 'sint64'
    },
    {
      '1': 'fixed32',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.Fixed32Rules',
      '9': 0,
      '10': 'fixed32'
    },
    {
      '1': 'fixed64',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.Fixed64Rules',
      '9': 0,
      '10': 'fixed64'
    },
    {
      '1': 'sfixed32',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.SFixed32Rules',
      '9': 0,
      '10': 'sfixed32'
    },
    {
      '1': 'sfixed64',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.SFixed64Rules',
      '9': 0,
      '10': 'sfixed64'
    },
    {
      '1': 'bool',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.BoolRules',
      '9': 0,
      '10': 'bool'
    },
    {
      '1': 'string',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.StringRules',
      '9': 0,
      '10': 'string'
    },
    {
      '1': 'bytes',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.BytesRules',
      '9': 0,
      '10': 'bytes'
    },
    {
      '1': 'enum',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.EnumRules',
      '9': 0,
      '10': 'enum'
    },
    {
      '1': 'repeated',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.RepeatedRules',
      '9': 0,
      '10': 'repeated'
    },
    {
      '1': 'map',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.MapRules',
      '9': 0,
      '10': 'map'
    },
    {
      '1': 'any',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.AnyRules',
      '9': 0,
      '10': 'any'
    },
    {
      '1': 'duration',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.DurationRules',
      '9': 0,
      '10': 'duration'
    },
    {
      '1': 'timestamp',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.TimestampRules',
      '9': 0,
      '10': 'timestamp'
    },
  ],
  '8': [
    {'1': 'type'},
  ],
  '9': [
    {'1': 24, '2': 25},
    {'1': 26, '2': 27},
  ],
  '10': ['skipped', 'ignore_empty'],
};

/// Descriptor for `FieldRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldRulesDescriptor = $convert.base64Decode(
    'CgpGaWVsZFJ1bGVzEiQKA2NlbBgXIAMoCzISLmJ1Zi52YWxpZGF0ZS5SdWxlUgNjZWwSGgoIcm'
    'VxdWlyZWQYGSABKAhSCHJlcXVpcmVkEiwKBmlnbm9yZRgbIAEoDjIULmJ1Zi52YWxpZGF0ZS5J'
    'Z25vcmVSBmlnbm9yZRIwCgVmbG9hdBgBIAEoCzIYLmJ1Zi52YWxpZGF0ZS5GbG9hdFJ1bGVzSA'
    'BSBWZsb2F0EjMKBmRvdWJsZRgCIAEoCzIZLmJ1Zi52YWxpZGF0ZS5Eb3VibGVSdWxlc0gAUgZk'
    'b3VibGUSMAoFaW50MzIYAyABKAsyGC5idWYudmFsaWRhdGUuSW50MzJSdWxlc0gAUgVpbnQzMh'
    'IwCgVpbnQ2NBgEIAEoCzIYLmJ1Zi52YWxpZGF0ZS5JbnQ2NFJ1bGVzSABSBWludDY0EjMKBnVp'
    'bnQzMhgFIAEoCzIZLmJ1Zi52YWxpZGF0ZS5VSW50MzJSdWxlc0gAUgZ1aW50MzISMwoGdWludD'
    'Y0GAYgASgLMhkuYnVmLnZhbGlkYXRlLlVJbnQ2NFJ1bGVzSABSBnVpbnQ2NBIzCgZzaW50MzIY'
    'ByABKAsyGS5idWYudmFsaWRhdGUuU0ludDMyUnVsZXNIAFIGc2ludDMyEjMKBnNpbnQ2NBgIIA'
    'EoCzIZLmJ1Zi52YWxpZGF0ZS5TSW50NjRSdWxlc0gAUgZzaW50NjQSNgoHZml4ZWQzMhgJIAEo'
    'CzIaLmJ1Zi52YWxpZGF0ZS5GaXhlZDMyUnVsZXNIAFIHZml4ZWQzMhI2CgdmaXhlZDY0GAogAS'
    'gLMhouYnVmLnZhbGlkYXRlLkZpeGVkNjRSdWxlc0gAUgdmaXhlZDY0EjkKCHNmaXhlZDMyGAsg'
    'ASgLMhsuYnVmLnZhbGlkYXRlLlNGaXhlZDMyUnVsZXNIAFIIc2ZpeGVkMzISOQoIc2ZpeGVkNj'
    'QYDCABKAsyGy5idWYudmFsaWRhdGUuU0ZpeGVkNjRSdWxlc0gAUghzZml4ZWQ2NBItCgRib29s'
    'GA0gASgLMhcuYnVmLnZhbGlkYXRlLkJvb2xSdWxlc0gAUgRib29sEjMKBnN0cmluZxgOIAEoCz'
    'IZLmJ1Zi52YWxpZGF0ZS5TdHJpbmdSdWxlc0gAUgZzdHJpbmcSMAoFYnl0ZXMYDyABKAsyGC5i'
    'dWYudmFsaWRhdGUuQnl0ZXNSdWxlc0gAUgVieXRlcxItCgRlbnVtGBAgASgLMhcuYnVmLnZhbG'
    'lkYXRlLkVudW1SdWxlc0gAUgRlbnVtEjkKCHJlcGVhdGVkGBIgASgLMhsuYnVmLnZhbGlkYXRl'
    'LlJlcGVhdGVkUnVsZXNIAFIIcmVwZWF0ZWQSKgoDbWFwGBMgASgLMhYuYnVmLnZhbGlkYXRlLk'
    '1hcFJ1bGVzSABSA21hcBIqCgNhbnkYFCABKAsyFi5idWYudmFsaWRhdGUuQW55UnVsZXNIAFID'
    'YW55EjkKCGR1cmF0aW9uGBUgASgLMhsuYnVmLnZhbGlkYXRlLkR1cmF0aW9uUnVsZXNIAFIIZH'
    'VyYXRpb24SPAoJdGltZXN0YW1wGBYgASgLMhwuYnVmLnZhbGlkYXRlLlRpbWVzdGFtcFJ1bGVz'
    'SABSCXRpbWVzdGFtcEIGCgR0eXBlSgQIGBAZSgQIGhAbUgdza2lwcGVkUgxpZ25vcmVfZW1wdH'
    'k=');

@$core.Deprecated('Use predefinedRulesDescriptor instead')
const PredefinedRules$json = {
  '1': 'PredefinedRules',
  '2': [
    {
      '1': 'cel',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.Rule',
      '10': 'cel'
    },
  ],
  '9': [
    {'1': 24, '2': 25},
    {'1': 26, '2': 27},
  ],
  '10': ['skipped', 'ignore_empty'],
};

/// Descriptor for `PredefinedRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predefinedRulesDescriptor = $convert.base64Decode(
    'Cg9QcmVkZWZpbmVkUnVsZXMSJAoDY2VsGAEgAygLMhIuYnVmLnZhbGlkYXRlLlJ1bGVSA2NlbE'
    'oECBgQGUoECBoQG1IHc2tpcHBlZFIMaWdub3JlX2VtcHR5');

@$core.Deprecated('Use floatRulesDescriptor instead')
const FloatRules$json = {
  '1': 'FloatRules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 2, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 2, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 2, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 2, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 2, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 2, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 2, '8': {}, '10': 'notIn'},
    {'1': 'finite', '3': 8, '4': 1, '5': 8, '8': {}, '10': 'finite'},
    {'1': 'example', '3': 9, '4': 3, '5': 2, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `FloatRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List floatRulesDescriptor = $convert.base64Decode(
    'CgpGbG9hdFJ1bGVzEooBCgVjb25zdBgBIAEoAkJ0wkhxCm8KC2Zsb2F0LmNvbnN0GmB0aGlzIC'
    'E9IGdldEZpZWxkKHJ1bGVzLCAnY29uc3QnKSA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3Jt'
    'YXQoW2dldEZpZWxkKHJ1bGVzLCAnY29uc3QnKV0pIDogJydSBWNvbnN0EqMBCgJsdBgCIAEoAk'
    'KQAcJIjAEKiQEKCGZsb2F0Lmx0Gn0haGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkg'
    'JiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID49IHJ1bGVzLmx0KT8gJ3ZhbHVlIG11c3QgYmUgbG'
    'VzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBK0AQoDbHRlGAMgASgC'
    'Qp8BwkibAQqYAQoJZmxvYXQubHRlGooBIWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3'
    'QpICYmICh0aGlzLmlzTmFuKCkgfHwgdGhpcyA+IHJ1bGVzLmx0ZSk/ICd2YWx1ZSBtdXN0IGJl'
    'IGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5sdGVdKSA6ICcnSABSA2'
    'x0ZRLzBwoCZ3QYBCABKAJC4AfCSNwHCo0BCghmbG9hdC5ndBqAASFoYXMocnVsZXMubHQpICYm'
    'ICFoYXMocnVsZXMubHRlKSAmJiAodGhpcy5pc05hbigpIHx8IHRoaXMgPD0gcnVsZXMuZ3QpPy'
    'AndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcn'
    'CsMBCgtmbG9hdC5ndF9sdBqzAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3'
    'QgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPD0gcnVsZXMu'
    'Z3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm'
    '9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcnCs0BChVmbG9hdC5ndF9sdF9leGNsdXNp'
    'dmUaswFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3QgJiYgKHRoaXMuaXNOYW'
    '4oKSB8fCAocnVsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KSk/ICd2YWx1ZSBt'
    'dXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3'
    'QsIHJ1bGVzLmx0XSkgOiAnJwrTAQoMZmxvYXQuZ3RfbHRlGsIBaGFzKHJ1bGVzLmx0ZSkgJiYg'
    'cnVsZXMubHRlID49IHJ1bGVzLmd0ICYmICh0aGlzLmlzTmFuKCkgfHwgdGhpcyA+IHJ1bGVzLm'
    'x0ZSB8fCB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVz'
    'IGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLm'
    'x0ZV0pIDogJycK3QEKFmZsb2F0Lmd0X2x0ZV9leGNsdXNpdmUawgFoYXMocnVsZXMubHRlKSAm'
    'JiBydWxlcy5sdGUgPCBydWxlcy5ndCAmJiAodGhpcy5pc05hbigpIHx8IChydWxlcy5sdGUgPC'
    'B0aGlzICYmIHRoaXMgPD0gcnVsZXMuZ3QpKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFu'
    'ICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZX'
    'MubHRlXSkgOiAnJ0gBUgJndBK/CAoDZ3RlGAUgASgCQqoIwkimCAqbAQoJZmxvYXQuZ3RlGo0B'
    'IWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmICh0aGlzLmlzTmFuKCkgfHwgdG'
    'hpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0'
    'byAlcycuZm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCtIBCgxmbG9hdC5ndGVfbHQawQFoYXMocn'
    'VsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJiAodGhpcy5pc05hbigpIHx8IHRo'
    'aXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZW'
    'F0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVz'
    'Lmd0ZSwgcnVsZXMubHRdKSA6ICcnCtwBChZmbG9hdC5ndGVfbHRfZXhjbHVzaXZlGsEBaGFzKH'
    'J1bGVzLmx0KSAmJiBydWxlcy5sdCA8IHJ1bGVzLmd0ZSAmJiAodGhpcy5pc05hbigpIHx8IChy'
    'dWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpKT8gJ3ZhbHVlIG11c3QgYmUgZ3'
    'JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxl'
    'cy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwriAQoNZmxvYXQuZ3RlX2x0ZRrQAWhhcyhydWxlcy5sdG'
    'UpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID4g'
    'cnVsZXMubHRlIHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIH'
    'RoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0'
    'KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJycK7AEKF2Zsb2F0Lmd0ZV9sdGVfZXhjbHVzaX'
    'ZlGtABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3RlICYmICh0aGlzLmlz'
    'TmFuKCkgfHwgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8IHJ1bGVzLmd0ZSkpPyAndmFsdW'
    'UgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuIG9yIGVx'
    'dWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJ0gBUgNndGUSgw'
    'EKAmluGAYgAygCQnPCSHAKbgoIZmxvYXQuaW4aYiEodGhpcyBpbiBnZXRGaWVsZChydWxlcywg'
    'J2luJykpID8gJ3ZhbHVlIG11c3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtnZXRGaWVsZChydW'
    'xlcywgJ2luJyldKSA6ICcnUgJpbhJ9CgZub3RfaW4YByADKAJCZsJIYwphCgxmbG9hdC5ub3Rf'
    'aW4aUXRoaXMgaW4gcnVsZXMubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJX'
    'MnLmZvcm1hdChbcnVsZXMubm90X2luXSkgOiAnJ1IFbm90SW4SfQoGZmluaXRlGAggASgIQmXC'
    'SGIKYAoMZmxvYXQuZmluaXRlGlBydWxlcy5maW5pdGUgPyAodGhpcy5pc05hbigpIHx8IHRoaX'
    'MuaXNJbmYoKSA/ICd2YWx1ZSBtdXN0IGJlIGZpbml0ZScgOiAnJykgOiAnJ1IGZmluaXRlEjQK'
    'B2V4YW1wbGUYCSADKAJCGsJIFwoVCg1mbG9hdC5leGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6A'
    'cQgICAgAJCCwoJbGVzc190aGFuQg4KDGdyZWF0ZXJfdGhhbg==');

@$core.Deprecated('Use doubleRulesDescriptor instead')
const DoubleRules$json = {
  '1': 'DoubleRules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 1, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 1, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 1, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 1, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 1, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 1, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 1, '8': {}, '10': 'notIn'},
    {'1': 'finite', '3': 8, '4': 1, '5': 8, '8': {}, '10': 'finite'},
    {'1': 'example', '3': 9, '4': 3, '5': 1, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `DoubleRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doubleRulesDescriptor = $convert.base64Decode(
    'CgtEb3VibGVSdWxlcxKLAQoFY29uc3QYASABKAFCdcJIcgpwCgxkb3VibGUuY29uc3QaYHRoaX'
    'MgIT0gZ2V0RmllbGQocnVsZXMsICdjb25zdCcpID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZv'
    'cm1hdChbZ2V0RmllbGQocnVsZXMsICdjb25zdCcpXSkgOiAnJ1IFY29uc3QSpAEKAmx0GAIgAS'
    'gBQpEBwkiNAQqKAQoJZG91YmxlLmx0Gn0haGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5n'
    'dCkgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID49IHJ1bGVzLmx0KT8gJ3ZhbHVlIG11c3QgYm'
    'UgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBK1AQoDbHRlGAMg'
    'ASgBQqABwkicAQqZAQoKZG91YmxlLmx0ZRqKASFoYXMocnVsZXMuZ3RlKSAmJiAhaGFzKHJ1bG'
    'VzLmd0KSAmJiAodGhpcy5pc05hbigpIHx8IHRoaXMgPiBydWxlcy5sdGUpPyAndmFsdWUgbXVz'
    'dCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMubHRlXSkgOiAnJ0'
    'gAUgNsdGUS+AcKAmd0GAQgASgBQuUHwkjhBwqOAQoJZG91YmxlLmd0GoABIWhhcyhydWxlcy5s'
    'dCkgJiYgIWhhcyhydWxlcy5sdGUpICYmICh0aGlzLmlzTmFuKCkgfHwgdGhpcyA8PSBydWxlcy'
    '5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndF0p'
    'IDogJycKxAEKDGRvdWJsZS5ndF9sdBqzAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcn'
    'VsZXMuZ3QgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPD0g'
    'cnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3MgdGhhbi'
    'AlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcnCs4BChZkb3VibGUuZ3RfbHRf'
    'ZXhjbHVzaXZlGrMBaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IHJ1bGVzLmd0ICYmICh0aG'
    'lzLmlzTmFuKCkgfHwgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCkpPyAn'
    'dmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3'
    'J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycK1AEKDWRvdWJsZS5ndF9sdGUawgFoYXMocnVsZXMu'
    'bHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3QgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID'
    '4gcnVsZXMubHRlIHx8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVy'
    'IHRoYW4gJXMgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndC'
    'wgcnVsZXMubHRlXSkgOiAnJwreAQoXZG91YmxlLmd0X2x0ZV9leGNsdXNpdmUawgFoYXMocnVs'
    'ZXMubHRlKSAmJiBydWxlcy5sdGUgPCBydWxlcy5ndCAmJiAodGhpcy5pc05hbigpIHx8IChydW'
    'xlcy5sdGUgPCB0aGlzICYmIHRoaXMgPD0gcnVsZXMuZ3QpKT8gJ3ZhbHVlIG11c3QgYmUgZ3Jl'
    'YXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy'
    '5ndCwgcnVsZXMubHRlXSkgOiAnJ0gBUgJndBLECAoDZ3RlGAUgASgBQq8IwkirCAqcAQoKZG91'
    'YmxlLmd0ZRqNASFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiAodGhpcy5pc0'
    '5hbigpIHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4g'
    'b3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkgOiAnJwrTAQoNZG91YmxlLmd0ZV'
    '9sdBrBAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3RlICYmICh0aGlzLmlz'
    'TmFuKCkgfHwgdGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG'
    '11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZv'
    'cm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycK3QEKF2RvdWJsZS5ndGVfbHRfZXhjbH'
    'VzaXZlGsEBaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IHJ1bGVzLmd0ZSAmJiAodGhpcy5p'
    'c05hbigpIHx8IChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpKT8gJ3ZhbH'
    'VlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiAlcycu'
    'Zm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwrjAQoOZG91YmxlLmd0ZV9sdGUa0A'
    'FoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3RlICYmICh0aGlzLmlzTmFu'
    'KCkgfHwgdGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3'
    'QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwg'
    'dG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnCu0BChhkb3VibGUuZ3'
    'RlX2x0ZV9leGNsdXNpdmUa0AFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPCBydWxlcy5n'
    'dGUgJiYgKHRoaXMuaXNOYW4oKSB8fCAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwgcnVsZX'
    'MuZ3RlKSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBvciBs'
    'ZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKS'
    'A6ICcnSAFSA2d0ZRKEAQoCaW4YBiADKAFCdMJIcQpvCglkb3VibGUuaW4aYiEodGhpcyBpbiBn'
    'ZXRGaWVsZChydWxlcywgJ2luJykpID8gJ3ZhbHVlIG11c3QgYmUgaW4gbGlzdCAlcycuZm9ybW'
    'F0KFtnZXRGaWVsZChydWxlcywgJ2luJyldKSA6ICcnUgJpbhJ+CgZub3RfaW4YByADKAFCZ8JI'
    'ZApiCg1kb3VibGUubm90X2luGlF0aGlzIGluIHJ1bGVzLm5vdF9pbiA/ICd2YWx1ZSBtdXN0IG'
    '5vdCBiZSBpbiBsaXN0ICVzJy5mb3JtYXQoW3J1bGVzLm5vdF9pbl0pIDogJydSBW5vdEluEn4K'
    'BmZpbml0ZRgIIAEoCEJmwkhjCmEKDWRvdWJsZS5maW5pdGUaUHJ1bGVzLmZpbml0ZSA/ICh0aG'
    'lzLmlzTmFuKCkgfHwgdGhpcy5pc0luZigpID8gJ3ZhbHVlIG11c3QgYmUgZmluaXRlJyA6ICcn'
    'KSA6ICcnUgZmaW5pdGUSNQoHZXhhbXBsZRgJIAMoAUIbwkgYChYKDmRvdWJsZS5leGFtcGxlGg'
    'R0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJCCwoJbGVzc190aGFuQg4KDGdyZWF0ZXJfdGhhbg==');

@$core.Deprecated('Use int32RulesDescriptor instead')
const Int32Rules$json = {
  '1': 'Int32Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 5, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 5, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 5, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 5, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 5, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 5, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 5, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `Int32Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List int32RulesDescriptor = $convert.base64Decode(
    'CgpJbnQzMlJ1bGVzEooBCgVjb25zdBgBIAEoBUJ0wkhxCm8KC2ludDMyLmNvbnN0GmB0aGlzIC'
    'E9IGdldEZpZWxkKHJ1bGVzLCAnY29uc3QnKSA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3Jt'
    'YXQoW2dldEZpZWxkKHJ1bGVzLCAnY29uc3QnKV0pIDogJydSBWNvbnN0Eo4BCgJsdBgCIAEoBU'
    'J8wkh5CncKCGludDMyLmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYg'
    'dGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3'
    'J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKhAQoDbHRlGAMgASgFQowBwkiIAQqFAQoJaW50MzIubHRl'
    'GnghaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+IHJ1bGVzLmx0ZT'
    '8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVz'
    'Lmx0ZV0pIDogJydIAFIDbHRlEpsHCgJndBgEIAEoBUKIB8JIhAcKegoIaW50MzIuZ3QabiFoYX'
    'MocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDw9IHJ1bGVzLmd0PyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcnCrMBCg'
    'tpbnQzMi5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYg'
    'KHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIG'
    'dyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxl'
    'cy5sdF0pIDogJycKuwEKFWludDMyLmd0X2x0X2V4Y2x1c2l2ZRqhAWhhcyhydWxlcy5sdCkgJi'
    'YgcnVsZXMubHQgPCBydWxlcy5ndCAmJiAocnVsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1'
    'bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiAlcy'
    'cuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcnCsMBCgxpbnQzMi5ndF9sdGUasgFo'
    'YXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy'
    '5sdGUgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAl'
    'cyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy'
    '5sdGVdKSA6ICcnCssBChZpbnQzMi5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkg'
    'JiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PS'
    'BydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4g'
    'b3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3'
    'QS6AcKA2d0ZRgFIAEoBULTB8JIzwcKiAEKCWludDMyLmd0ZRp7IWhhcyhydWxlcy5sdCkgJiYg'
    'IWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPCBydWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIGdyZW'
    'F0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsIBCgxp'
    'bnQzMi5ndGVfbHQasQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJi'
    'AodGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUg'
    'Z3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcn'
    'VsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKygEKFmludDMyLmd0ZV9sdF9leGNsdXNpdmUarwFo'
    'YXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aG'
    'lzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubH'
    'RdKSA6ICcnCtIBCg1pbnQzMi5ndGVfbHRlGsABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRl'
    'ID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDwgcnVsZXMuZ3RlKT'
    '8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRo'
    'YW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnCt'
    'oBChdpbnQzMi5ndGVfbHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0'
    'ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKT'
    '8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhh'
    'biBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJydIAV'
    'IDZ3RlEoMBCgJpbhgGIAMoBUJzwkhwCm4KCGludDMyLmluGmIhKHRoaXMgaW4gZ2V0RmllbGQo'
    'cnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0Rm'
    'llbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4SfQoGbm90X2luGAcgAygFQmbCSGMKYQoMaW50'
    'MzIubm90X2luGlF0aGlzIGluIHJ1bGVzLm5vdF9pbiA/ICd2YWx1ZSBtdXN0IG5vdCBiZSBpbi'
    'BsaXN0ICVzJy5mb3JtYXQoW3J1bGVzLm5vdF9pbl0pIDogJydSBW5vdEluEjQKB2V4YW1wbGUY'
    'CCADKAVCGsJIFwoVCg1pbnQzMi5leGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJCCw'
    'oJbGVzc190aGFuQg4KDGdyZWF0ZXJfdGhhbg==');

@$core.Deprecated('Use int64RulesDescriptor instead')
const Int64Rules$json = {
  '1': 'Int64Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 3, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 3, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 3, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 3, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 3, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 3, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 3, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 9, '4': 3, '5': 3, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `Int64Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List int64RulesDescriptor = $convert.base64Decode(
    'CgpJbnQ2NFJ1bGVzEooBCgVjb25zdBgBIAEoA0J0wkhxCm8KC2ludDY0LmNvbnN0GmB0aGlzIC'
    'E9IGdldEZpZWxkKHJ1bGVzLCAnY29uc3QnKSA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3Jt'
    'YXQoW2dldEZpZWxkKHJ1bGVzLCAnY29uc3QnKV0pIDogJydSBWNvbnN0Eo4BCgJsdBgCIAEoA0'
    'J8wkh5CncKCGludDY0Lmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYg'
    'dGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3'
    'J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKhAQoDbHRlGAMgASgDQowBwkiIAQqFAQoJaW50NjQubHRl'
    'GnghaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+IHJ1bGVzLmx0ZT'
    '8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVz'
    'Lmx0ZV0pIDogJydIAFIDbHRlEpsHCgJndBgEIAEoA0KIB8JIhAcKegoIaW50NjQuZ3QabiFoYX'
    'MocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDw9IHJ1bGVzLmd0PyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcnCrMBCg'
    'tpbnQ2NC5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYg'
    'KHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIG'
    'dyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxl'
    'cy5sdF0pIDogJycKuwEKFWludDY0Lmd0X2x0X2V4Y2x1c2l2ZRqhAWhhcyhydWxlcy5sdCkgJi'
    'YgcnVsZXMubHQgPCBydWxlcy5ndCAmJiAocnVsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1'
    'bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiAlcy'
    'cuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcnCsMBCgxpbnQ2NC5ndF9sdGUasgFo'
    'YXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy'
    '5sdGUgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAl'
    'cyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy'
    '5sdGVdKSA6ICcnCssBChZpbnQ2NC5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkg'
    'JiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PS'
    'BydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4g'
    'b3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3'
    'QS6AcKA2d0ZRgFIAEoA0LTB8JIzwcKiAEKCWludDY0Lmd0ZRp7IWhhcyhydWxlcy5sdCkgJiYg'
    'IWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPCBydWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIGdyZW'
    'F0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsIBCgxp'
    'bnQ2NC5ndGVfbHQasQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJi'
    'AodGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUg'
    'Z3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcn'
    'VsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKygEKFmludDY0Lmd0ZV9sdF9leGNsdXNpdmUarwFo'
    'YXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aG'
    'lzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubH'
    'RdKSA6ICcnCtIBCg1pbnQ2NC5ndGVfbHRlGsABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRl'
    'ID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDwgcnVsZXMuZ3RlKT'
    '8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRo'
    'YW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnCt'
    'oBChdpbnQ2NC5ndGVfbHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0'
    'ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKT'
    '8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhh'
    'biBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJydIAV'
    'IDZ3RlEoMBCgJpbhgGIAMoA0JzwkhwCm4KCGludDY0LmluGmIhKHRoaXMgaW4gZ2V0RmllbGQo'
    'cnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0Rm'
    'llbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4SfQoGbm90X2luGAcgAygDQmbCSGMKYQoMaW50'
    'NjQubm90X2luGlF0aGlzIGluIHJ1bGVzLm5vdF9pbiA/ICd2YWx1ZSBtdXN0IG5vdCBiZSBpbi'
    'BsaXN0ICVzJy5mb3JtYXQoW3J1bGVzLm5vdF9pbl0pIDogJydSBW5vdEluEjQKB2V4YW1wbGUY'
    'CSADKANCGsJIFwoVCg1pbnQ2NC5leGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJCCw'
    'oJbGVzc190aGFuQg4KDGdyZWF0ZXJfdGhhbg==');

@$core.Deprecated('Use uInt32RulesDescriptor instead')
const UInt32Rules$json = {
  '1': 'UInt32Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 13, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 13, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 13, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 13, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 13, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 13, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 13, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 13, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `UInt32Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uInt32RulesDescriptor = $convert.base64Decode(
    'CgtVSW50MzJSdWxlcxKLAQoFY29uc3QYASABKA1CdcJIcgpwCgx1aW50MzIuY29uc3QaYHRoaX'
    'MgIT0gZ2V0RmllbGQocnVsZXMsICdjb25zdCcpID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZv'
    'cm1hdChbZ2V0RmllbGQocnVsZXMsICdjb25zdCcpXSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgAS'
    'gNQn3CSHoKeAoJdWludDMyLmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkg'
    'JiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYX'
    'QoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQoDbHRlGAMgASgNQo0BwkiJAQqGAQoKdWludDMy'
    'Lmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy'
    '5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFty'
    'dWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoCZ3QYBCABKA1CjQfCSIkHCnsKCXVpbnQzMi5ndB'
    'puIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/'
    'ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJy'
    'cKtAEKDHVpbnQzMi5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMu'
    'Z3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdX'
    'N0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0'
    'LCBydWxlcy5sdF0pIDogJycKvAEKFnVpbnQzMi5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZX'
    'MubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhp'
    'cyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIH'
    'RoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwrEAQoNdWludDMyLmd0'
    'X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcy'
    'A+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRl'
    'ciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3'
    'QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3VpbnQzMi5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1'
    'bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJi'
    'YgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBs'
    'ZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pID'
    'ogJydIAVICZ3QS7QcKA2d0ZRgFIAEoDULYB8JI1AcKiQEKCnVpbnQzMi5ndGUaeyFoYXMocnVs'
    'ZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbX'
    'VzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkg'
    'OiAnJwrDAQoNdWludDMyLmd0ZV9sdBqxAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcn'
    'VsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcy'
    'cuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwrLAQoXdWludDMyLmd0ZV9sdF9l'
    'eGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydW'
    'xlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVh'
    'dGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLm'
    'd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg51aW50MzIuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUp'
    'ICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcy'
    'A8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAl'
    'cyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJwrbAQoYdWludDMyLmd0ZV9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0'
    'ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaX'
    'MgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8g'
    'JXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJ0gBUgNndGUShAEKAmluGAYgAygNQnTCSHEKbwoJdWludDMyLmluGmIhKHRo'
    'aXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJX'
    'MnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4SfgoGbm90X2luGAcg'
    'AygNQmfCSGQKYgoNdWludDMyLm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdW'
    'UgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVu'
    'b3RJbhI1CgdleGFtcGxlGAggAygNQhvCSBgKFgoOdWludDMyLmV4YW1wbGUaBHRydWVSB2V4YW'
    '1wbGUqCQjoBxCAgICAAkILCglsZXNzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

@$core.Deprecated('Use uInt64RulesDescriptor instead')
const UInt64Rules$json = {
  '1': 'UInt64Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 4, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 4, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 4, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 4, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 4, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 4, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 4, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 4, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `UInt64Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uInt64RulesDescriptor = $convert.base64Decode(
    'CgtVSW50NjRSdWxlcxKLAQoFY29uc3QYASABKARCdcJIcgpwCgx1aW50NjQuY29uc3QaYHRoaX'
    'MgIT0gZ2V0RmllbGQocnVsZXMsICdjb25zdCcpID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZv'
    'cm1hdChbZ2V0RmllbGQocnVsZXMsICdjb25zdCcpXSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgAS'
    'gEQn3CSHoKeAoJdWludDY0Lmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkg'
    'JiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYX'
    'QoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQoDbHRlGAMgASgEQo0BwkiJAQqGAQoKdWludDY0'
    'Lmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy'
    '5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFty'
    'dWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoCZ3QYBCABKARCjQfCSIkHCnsKCXVpbnQ2NC5ndB'
    'puIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/'
    'ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJy'
    'cKtAEKDHVpbnQ2NC5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMu'
    'Z3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdX'
    'N0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0'
    'LCBydWxlcy5sdF0pIDogJycKvAEKFnVpbnQ2NC5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZX'
    'MubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhp'
    'cyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIH'
    'RoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwrEAQoNdWludDY0Lmd0'
    'X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcy'
    'A+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRl'
    'ciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3'
    'QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3VpbnQ2NC5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1'
    'bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJi'
    'YgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBs'
    'ZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pID'
    'ogJydIAVICZ3QS7QcKA2d0ZRgFIAEoBELYB8JI1AcKiQEKCnVpbnQ2NC5ndGUaeyFoYXMocnVs'
    'ZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbX'
    'VzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkg'
    'OiAnJwrDAQoNdWludDY0Lmd0ZV9sdBqxAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcn'
    'VsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcy'
    'cuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwrLAQoXdWludDY0Lmd0ZV9sdF9l'
    'eGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydW'
    'xlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVh'
    'dGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLm'
    'd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg51aW50NjQuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUp'
    'ICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcy'
    'A8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAl'
    'cyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJwrbAQoYdWludDY0Lmd0ZV9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0'
    'ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaX'
    'MgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8g'
    'JXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJ0gBUgNndGUShAEKAmluGAYgAygEQnTCSHEKbwoJdWludDY0LmluGmIhKHRo'
    'aXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJX'
    'MnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4SfgoGbm90X2luGAcg'
    'AygEQmfCSGQKYgoNdWludDY0Lm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdW'
    'UgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVu'
    'b3RJbhI1CgdleGFtcGxlGAggAygEQhvCSBgKFgoOdWludDY0LmV4YW1wbGUaBHRydWVSB2V4YW'
    '1wbGUqCQjoBxCAgICAAkILCglsZXNzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

@$core.Deprecated('Use sInt32RulesDescriptor instead')
const SInt32Rules$json = {
  '1': 'SInt32Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 17, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 17, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 17, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 17, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 17, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 17, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 17, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 17, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `SInt32Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sInt32RulesDescriptor = $convert.base64Decode(
    'CgtTSW50MzJSdWxlcxKLAQoFY29uc3QYASABKBFCdcJIcgpwCgxzaW50MzIuY29uc3QaYHRoaX'
    'MgIT0gZ2V0RmllbGQocnVsZXMsICdjb25zdCcpID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZv'
    'cm1hdChbZ2V0RmllbGQocnVsZXMsICdjb25zdCcpXSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgAS'
    'gRQn3CSHoKeAoJc2ludDMyLmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkg'
    'JiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYX'
    'QoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQoDbHRlGAMgASgRQo0BwkiJAQqGAQoKc2ludDMy'
    'Lmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy'
    '5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFty'
    'dWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoCZ3QYBCABKBFCjQfCSIkHCnsKCXNpbnQzMi5ndB'
    'puIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/'
    'ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJy'
    'cKtAEKDHNpbnQzMi5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMu'
    'Z3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdX'
    'N0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0'
    'LCBydWxlcy5sdF0pIDogJycKvAEKFnNpbnQzMi5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZX'
    'MubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhp'
    'cyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIH'
    'RoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwrEAQoNc2ludDMyLmd0'
    'X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcy'
    'A+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRl'
    'ciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3'
    'QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3NpbnQzMi5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1'
    'bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJi'
    'YgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBs'
    'ZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pID'
    'ogJydIAVICZ3QS7QcKA2d0ZRgFIAEoEULYB8JI1AcKiQEKCnNpbnQzMi5ndGUaeyFoYXMocnVs'
    'ZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbX'
    'VzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkg'
    'OiAnJwrDAQoNc2ludDMyLmd0ZV9sdBqxAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcn'
    'VsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcy'
    'cuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwrLAQoXc2ludDMyLmd0ZV9sdF9l'
    'eGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydW'
    'xlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVh'
    'dGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLm'
    'd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg5zaW50MzIuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUp'
    'ICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcy'
    'A8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAl'
    'cyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJwrbAQoYc2ludDMyLmd0ZV9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0'
    'ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaX'
    'MgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8g'
    'JXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJ0gBUgNndGUShAEKAmluGAYgAygRQnTCSHEKbwoJc2ludDMyLmluGmIhKHRo'
    'aXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJX'
    'MnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4SfgoGbm90X2luGAcg'
    'AygRQmfCSGQKYgoNc2ludDMyLm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdW'
    'UgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVu'
    'b3RJbhI1CgdleGFtcGxlGAggAygRQhvCSBgKFgoOc2ludDMyLmV4YW1wbGUaBHRydWVSB2V4YW'
    '1wbGUqCQjoBxCAgICAAkILCglsZXNzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

@$core.Deprecated('Use sInt64RulesDescriptor instead')
const SInt64Rules$json = {
  '1': 'SInt64Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 18, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 18, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 18, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 18, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 18, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 18, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 18, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 18, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `SInt64Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sInt64RulesDescriptor = $convert.base64Decode(
    'CgtTSW50NjRSdWxlcxKLAQoFY29uc3QYASABKBJCdcJIcgpwCgxzaW50NjQuY29uc3QaYHRoaX'
    'MgIT0gZ2V0RmllbGQocnVsZXMsICdjb25zdCcpID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZv'
    'cm1hdChbZ2V0RmllbGQocnVsZXMsICdjb25zdCcpXSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgAS'
    'gSQn3CSHoKeAoJc2ludDY0Lmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkg'
    'JiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYX'
    'QoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQoDbHRlGAMgASgSQo0BwkiJAQqGAQoKc2ludDY0'
    'Lmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy'
    '5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFty'
    'dWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoCZ3QYBCABKBJCjQfCSIkHCnsKCXNpbnQ2NC5ndB'
    'puIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/'
    'ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJy'
    'cKtAEKDHNpbnQ2NC5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMu'
    'Z3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdX'
    'N0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0'
    'LCBydWxlcy5sdF0pIDogJycKvAEKFnNpbnQ2NC5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZX'
    'MubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhp'
    'cyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIH'
    'RoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwrEAQoNc2ludDY0Lmd0'
    'X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcy'
    'A+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRl'
    'ciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3'
    'QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3NpbnQ2NC5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1'
    'bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJi'
    'YgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBs'
    'ZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pID'
    'ogJydIAVICZ3QS7QcKA2d0ZRgFIAEoEkLYB8JI1AcKiQEKCnNpbnQ2NC5ndGUaeyFoYXMocnVs'
    'ZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbX'
    'VzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkg'
    'OiAnJwrDAQoNc2ludDY0Lmd0ZV9sdBqxAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcn'
    'VsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcy'
    'cuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwrLAQoXc2ludDY0Lmd0ZV9sdF9l'
    'eGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydW'
    'xlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVh'
    'dGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLm'
    'd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg5zaW50NjQuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUp'
    'ICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcy'
    'A8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAl'
    'cyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJwrbAQoYc2ludDY0Lmd0ZV9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0'
    'ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaX'
    'MgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8g'
    'JXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZX'
    'MubHRlXSkgOiAnJ0gBUgNndGUShAEKAmluGAYgAygSQnTCSHEKbwoJc2ludDY0LmluGmIhKHRo'
    'aXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJX'
    'MnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4SfgoGbm90X2luGAcg'
    'AygSQmfCSGQKYgoNc2ludDY0Lm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdW'
    'UgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVu'
    'b3RJbhI1CgdleGFtcGxlGAggAygSQhvCSBgKFgoOc2ludDY0LmV4YW1wbGUaBHRydWVSB2V4YW'
    '1wbGUqCQjoBxCAgICAAkILCglsZXNzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

@$core.Deprecated('Use fixed32RulesDescriptor instead')
const Fixed32Rules$json = {
  '1': 'Fixed32Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 7, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 7, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 7, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 7, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 7, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 7, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 7, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 7, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `Fixed32Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fixed32RulesDescriptor = $convert.base64Decode(
    'CgxGaXhlZDMyUnVsZXMSjAEKBWNvbnN0GAEgASgHQnbCSHMKcQoNZml4ZWQzMi5jb25zdBpgdG'
    'hpcyAhPSBnZXRGaWVsZChydWxlcywgJ2NvbnN0JykgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycu'
    'Zm9ybWF0KFtnZXRGaWVsZChydWxlcywgJ2NvbnN0JyldKSA6ICcnUgVjb25zdBKQAQoCbHQYAi'
    'ABKAdCfsJIewp5CgpmaXhlZDMyLmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5n'
    'dCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3'
    'JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKjAQoDbHRlGAMgASgHQo4BwkiKAQqHAQoLZml4'
    'ZWQzMi5sdGUaeCFoYXMocnVsZXMuZ3RlKSAmJiAhaGFzKHJ1bGVzLmd0KSAmJiB0aGlzID4gcn'
    'VsZXMubHRlPyAndmFsdWUgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1h'
    'dChbcnVsZXMubHRlXSkgOiAnJ0gAUgNsdGUSpQcKAmd0GAQgASgHQpIHwkiOBwp8CgpmaXhlZD'
    'MyLmd0Gm4haGFzKHJ1bGVzLmx0KSAmJiAhaGFzKHJ1bGVzLmx0ZSkgJiYgdGhpcyA8PSBydWxl'
    'cy5ndD8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0XS'
    'kgOiAnJwq1AQoNZml4ZWQzMi5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0g'
    'cnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YW'
    'x1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1'
    'bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvQEKF2ZpeGVkMzIuZ3RfbHRfZXhjbHVzaXZlGqEBaG'
    'FzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IHJ1bGVzLmd0ICYmIChydWxlcy5sdCA8PSB0aGlz'
    'ICYmIHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgb3'
    'IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKxQEKDmZp'
    'eGVkMzIuZ3RfbHRlGrIBaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0IC'
    'YmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBi'
    'ZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KF'
    'tydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJwrNAQoYZml4ZWQzMi5ndF9sdGVfZXhjbHVzaXZl'
    'GrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZS'
    'A8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bG'
    'VzLmx0ZV0pIDogJydIAVICZ3QS8gcKA2d0ZRgFIAEoB0LdB8JI2QcKigEKC2ZpeGVkMzIuZ3Rl'
    'GnshaGFzKHJ1bGVzLmx0KSAmJiAhaGFzKHJ1bGVzLmx0ZSkgJiYgdGhpcyA8IHJ1bGVzLmd0ZT'
    '8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1'
    'bGVzLmd0ZV0pIDogJycKxAEKDmZpeGVkMzIuZ3RlX2x0GrEBaGFzKHJ1bGVzLmx0KSAmJiBydW'
    'xlcy5sdCA+PSBydWxlcy5ndGUgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8IHJ1bGVz'
    'Lmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbG'
    'VzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCswBChhmaXhl'
    'ZDMyLmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZX'
    'MuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUg'
    'bXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3'
    'JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtQBCg9maXhlZDMyLmd0ZV9sdGUawAFo'
    'YXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3RlICYmICh0aGlzID4gcnVsZX'
    'MubHRlIHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4g'
    'b3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydW'
    'xlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJycK3AEKGWZpeGVkMzIuZ3RlX2x0ZV9leGNsdXNpdmUa'
    'vgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPCBydWxlcy5ndGUgJiYgKHJ1bGVzLmx0ZS'
    'A8IHRoaXMgJiYgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biBvciBlcXVhbCB0byAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcn'
    'VsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnSAFSA2d0ZRKFAQoCaW4YBiADKAdCdcJIcgpwCgpm'
    'aXhlZDMyLmluGmIhKHRoaXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdX'
    'N0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1IC'
    'aW4SfwoGbm90X2luGAcgAygHQmjCSGUKYwoOZml4ZWQzMi5ub3RfaW4aUXRoaXMgaW4gcnVsZX'
    'Mubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZXMu'
    'bm90X2luXSkgOiAnJ1IFbm90SW4SNgoHZXhhbXBsZRgIIAMoB0IcwkgZChcKD2ZpeGVkMzIuZX'
    'hhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIACQgsKCWxlc3NfdGhhbkIOCgxncmVhdGVy'
    'X3RoYW4=');

@$core.Deprecated('Use fixed64RulesDescriptor instead')
const Fixed64Rules$json = {
  '1': 'Fixed64Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 6, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 6, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 6, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 6, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 6, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 6, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 6, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 6, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `Fixed64Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fixed64RulesDescriptor = $convert.base64Decode(
    'CgxGaXhlZDY0UnVsZXMSjAEKBWNvbnN0GAEgASgGQnbCSHMKcQoNZml4ZWQ2NC5jb25zdBpgdG'
    'hpcyAhPSBnZXRGaWVsZChydWxlcywgJ2NvbnN0JykgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycu'
    'Zm9ybWF0KFtnZXRGaWVsZChydWxlcywgJ2NvbnN0JyldKSA6ICcnUgVjb25zdBKQAQoCbHQYAi'
    'ABKAZCfsJIewp5CgpmaXhlZDY0Lmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5n'
    'dCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3'
    'JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKjAQoDbHRlGAMgASgGQo4BwkiKAQqHAQoLZml4'
    'ZWQ2NC5sdGUaeCFoYXMocnVsZXMuZ3RlKSAmJiAhaGFzKHJ1bGVzLmd0KSAmJiB0aGlzID4gcn'
    'VsZXMubHRlPyAndmFsdWUgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1h'
    'dChbcnVsZXMubHRlXSkgOiAnJ0gAUgNsdGUSpQcKAmd0GAQgASgGQpIHwkiOBwp8CgpmaXhlZD'
    'Y0Lmd0Gm4haGFzKHJ1bGVzLmx0KSAmJiAhaGFzKHJ1bGVzLmx0ZSkgJiYgdGhpcyA8PSBydWxl'
    'cy5ndD8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0XS'
    'kgOiAnJwq1AQoNZml4ZWQ2NC5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0g'
    'cnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YW'
    'x1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1'
    'bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvQEKF2ZpeGVkNjQuZ3RfbHRfZXhjbHVzaXZlGqEBaG'
    'FzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IHJ1bGVzLmd0ICYmIChydWxlcy5sdCA8PSB0aGlz'
    'ICYmIHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgb3'
    'IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKxQEKDmZp'
    'eGVkNjQuZ3RfbHRlGrIBaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0IC'
    'YmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBi'
    'ZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KF'
    'tydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJwrNAQoYZml4ZWQ2NC5ndF9sdGVfZXhjbHVzaXZl'
    'GrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZS'
    'A8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bG'
    'VzLmx0ZV0pIDogJydIAVICZ3QS8gcKA2d0ZRgFIAEoBkLdB8JI2QcKigEKC2ZpeGVkNjQuZ3Rl'
    'GnshaGFzKHJ1bGVzLmx0KSAmJiAhaGFzKHJ1bGVzLmx0ZSkgJiYgdGhpcyA8IHJ1bGVzLmd0ZT'
    '8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1'
    'bGVzLmd0ZV0pIDogJycKxAEKDmZpeGVkNjQuZ3RlX2x0GrEBaGFzKHJ1bGVzLmx0KSAmJiBydW'
    'xlcy5sdCA+PSBydWxlcy5ndGUgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8IHJ1bGVz'
    'Lmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbG'
    'VzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCswBChhmaXhl'
    'ZDY0Lmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZX'
    'MuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUg'
    'bXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3'
    'JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtQBCg9maXhlZDY0Lmd0ZV9sdGUawAFo'
    'YXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3RlICYmICh0aGlzID4gcnVsZX'
    'MubHRlIHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4g'
    'b3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydW'
    'xlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJycK3AEKGWZpeGVkNjQuZ3RlX2x0ZV9leGNsdXNpdmUa'
    'vgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPCBydWxlcy5ndGUgJiYgKHJ1bGVzLmx0ZS'
    'A8IHRoaXMgJiYgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biBvciBlcXVhbCB0byAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcn'
    'VsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnSAFSA2d0ZRKFAQoCaW4YBiADKAZCdcJIcgpwCgpm'
    'aXhlZDY0LmluGmIhKHRoaXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdX'
    'N0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1IC'
    'aW4SfwoGbm90X2luGAcgAygGQmjCSGUKYwoOZml4ZWQ2NC5ub3RfaW4aUXRoaXMgaW4gcnVsZX'
    'Mubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZXMu'
    'bm90X2luXSkgOiAnJ1IFbm90SW4SNgoHZXhhbXBsZRgIIAMoBkIcwkgZChcKD2ZpeGVkNjQuZX'
    'hhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIACQgsKCWxlc3NfdGhhbkIOCgxncmVhdGVy'
    'X3RoYW4=');

@$core.Deprecated('Use sFixed32RulesDescriptor instead')
const SFixed32Rules$json = {
  '1': 'SFixed32Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 15, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 15, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 15, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 15, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 15, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 15, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 15, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 15, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `SFixed32Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sFixed32RulesDescriptor = $convert.base64Decode(
    'Cg1TRml4ZWQzMlJ1bGVzEo0BCgVjb25zdBgBIAEoD0J3wkh0CnIKDnNmaXhlZDMyLmNvbnN0Gm'
    'B0aGlzICE9IGdldEZpZWxkKHJ1bGVzLCAnY29uc3QnKSA/ICd2YWx1ZSBtdXN0IGVxdWFsICVz'
    'Jy5mb3JtYXQoW2dldEZpZWxkKHJ1bGVzLCAnY29uc3QnKV0pIDogJydSBWNvbnN0EpEBCgJsdB'
    'gCIAEoD0J/wkh8CnoKC3NmaXhlZDMyLmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxl'
    'cy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy'
    '5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKkAQoDbHRlGAMgASgPQo8BwkiLAQqIAQoM'
    'c2ZpeGVkMzIubHRlGnghaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcy'
    'A+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5m'
    'b3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFIDbHRlEqoHCgJndBgEIAEoD0KXB8JIkwcKfQoLc2'
    'ZpeGVkMzIuZ3QabiFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDw9'
    'IHJ1bGVzLmd0PyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZX'
    'MuZ3RdKSA6ICcnCrYBCg5zZml4ZWQzMi5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMu'
    'bHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndC'
    'k/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3Jt'
    'YXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvgEKGHNmaXhlZDMyLmd0X2x0X2V4Y2x1c2'
    'l2ZRqhAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPCBydWxlcy5ndCAmJiAocnVsZXMubHQg'
    'PD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcn'
    'CsYBCg9zZml4ZWQzMi5ndF9sdGUasgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcn'
    'VsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1'
    'ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy'
    '5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdGVdKSA6ICcnCs4BChlzZml4ZWQzMi5ndF9sdGVf'
    'ZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKH'
    'J1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdy'
    'ZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZX'
    'MuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS9wcKA2d0ZRgFIAEoD0LiB8JI3gcKiwEKDHNm'
    'aXhlZDMyLmd0ZRp7IWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPC'
    'BydWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycu'
    'Zm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsUBCg9zZml4ZWQzMi5ndGVfbHQasQFoYXMocnVsZX'
    'MubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+PSBydWxlcy5sdCB8fCB0'
    'aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIH'
    'RvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0pIDog'
    'JycKzQEKGXNmaXhlZDMyLmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bG'
    'VzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5n'
    'dGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcy'
    'B0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtUBChBzZml4ZWQz'
    'Mi5ndGVfbHRlGsABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ZSAmJi'
    'AodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUg'
    'Z3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJX'
    'MnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnCt0BChpzZml4ZWQzMi5ndGVf'
    'bHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZS'
    'AmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3Qg'
    'YmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0by'
    'AlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJydIAVIDZ3RlEoYBCgJpbhgG'
    'IAMoD0J2wkhzCnEKC3NmaXhlZDMyLmluGmIhKHRoaXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbi'
    'cpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMs'
    'ICdpbicpXSkgOiAnJ1ICaW4SgAEKBm5vdF9pbhgHIAMoD0JpwkhmCmQKD3NmaXhlZDMyLm5vdF'
    '9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdWUgbXVzdCBub3QgYmUgaW4gbGlzdCAl'
    'cycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVub3RJbhI3CgdleGFtcGxlGAggAygPQh'
    '3CSBoKGAoQc2ZpeGVkMzIuZXhhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIACQgsKCWxl'
    'c3NfdGhhbkIOCgxncmVhdGVyX3RoYW4=');

@$core.Deprecated('Use sFixed64RulesDescriptor instead')
const SFixed64Rules$json = {
  '1': 'SFixed64Rules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 16, '8': {}, '10': 'const'},
    {'1': 'lt', '3': 2, '4': 1, '5': 16, '8': {}, '9': 0, '10': 'lt'},
    {'1': 'lte', '3': 3, '4': 1, '5': 16, '8': {}, '9': 0, '10': 'lte'},
    {'1': 'gt', '3': 4, '4': 1, '5': 16, '8': {}, '9': 1, '10': 'gt'},
    {'1': 'gte', '3': 5, '4': 1, '5': 16, '8': {}, '9': 1, '10': 'gte'},
    {'1': 'in', '3': 6, '4': 3, '5': 16, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 7, '4': 3, '5': 16, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 8, '4': 3, '5': 16, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `SFixed64Rules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sFixed64RulesDescriptor = $convert.base64Decode(
    'Cg1TRml4ZWQ2NFJ1bGVzEo0BCgVjb25zdBgBIAEoEEJ3wkh0CnIKDnNmaXhlZDY0LmNvbnN0Gm'
    'B0aGlzICE9IGdldEZpZWxkKHJ1bGVzLCAnY29uc3QnKSA/ICd2YWx1ZSBtdXN0IGVxdWFsICVz'
    'Jy5mb3JtYXQoW2dldEZpZWxkKHJ1bGVzLCAnY29uc3QnKV0pIDogJydSBWNvbnN0EpEBCgJsdB'
    'gCIAEoEEJ/wkh8CnoKC3NmaXhlZDY0Lmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxl'
    'cy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy'
    '5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKkAQoDbHRlGAMgASgQQo8BwkiLAQqIAQoM'
    'c2ZpeGVkNjQubHRlGnghaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcy'
    'A+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5m'
    'b3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFIDbHRlEqoHCgJndBgEIAEoEEKXB8JIkwcKfQoLc2'
    'ZpeGVkNjQuZ3QabiFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDw9'
    'IHJ1bGVzLmd0PyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZX'
    'MuZ3RdKSA6ICcnCrYBCg5zZml4ZWQ2NC5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMu'
    'bHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndC'
    'k/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3Jt'
    'YXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvgEKGHNmaXhlZDY0Lmd0X2x0X2V4Y2x1c2'
    'l2ZRqhAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPCBydWxlcy5ndCAmJiAocnVsZXMubHQg'
    'PD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcn'
    'CsYBCg9zZml4ZWQ2NC5ndF9sdGUasgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcn'
    'VsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1'
    'ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy'
    '5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdGVdKSA6ICcnCs4BChlzZml4ZWQ2NC5ndF9sdGVf'
    'ZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKH'
    'J1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdy'
    'ZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZX'
    'MuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS9wcKA2d0ZRgFIAEoEELiB8JI3gcKiwEKDHNm'
    'aXhlZDY0Lmd0ZRp7IWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPC'
    'BydWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycu'
    'Zm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsUBCg9zZml4ZWQ2NC5ndGVfbHQasQFoYXMocnVsZX'
    'MubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+PSBydWxlcy5sdCB8fCB0'
    'aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIH'
    'RvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0pIDog'
    'JycKzQEKGXNmaXhlZDY0Lmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bG'
    'VzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5n'
    'dGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcy'
    'B0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtUBChBzZml4ZWQ2'
    'NC5ndGVfbHRlGsABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ZSAmJi'
    'AodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUg'
    'Z3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJX'
    'MnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnCt0BChpzZml4ZWQ2NC5ndGVf'
    'bHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZS'
    'AmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3Qg'
    'YmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0by'
    'AlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJydIAVIDZ3RlEoYBCgJpbhgG'
    'IAMoEEJ2wkhzCnEKC3NmaXhlZDY0LmluGmIhKHRoaXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbi'
    'cpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMs'
    'ICdpbicpXSkgOiAnJ1ICaW4SgAEKBm5vdF9pbhgHIAMoEEJpwkhmCmQKD3NmaXhlZDY0Lm5vdF'
    '9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdWUgbXVzdCBub3QgYmUgaW4gbGlzdCAl'
    'cycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVub3RJbhI3CgdleGFtcGxlGAggAygQQh'
    '3CSBoKGAoQc2ZpeGVkNjQuZXhhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIACQgsKCWxl'
    'c3NfdGhhbkIOCgxncmVhdGVyX3RoYW4=');

@$core.Deprecated('Use boolRulesDescriptor instead')
const BoolRules$json = {
  '1': 'BoolRules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 8, '8': {}, '10': 'const'},
    {'1': 'example', '3': 2, '4': 3, '5': 8, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

/// Descriptor for `BoolRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boolRulesDescriptor = $convert.base64Decode(
    'CglCb29sUnVsZXMSiQEKBWNvbnN0GAEgASgIQnPCSHAKbgoKYm9vbC5jb25zdBpgdGhpcyAhPS'
    'BnZXRGaWVsZChydWxlcywgJ2NvbnN0JykgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycuZm9ybWF0'
    'KFtnZXRGaWVsZChydWxlcywgJ2NvbnN0JyldKSA6ICcnUgVjb25zdBIzCgdleGFtcGxlGAIgAy'
    'gIQhnCSBYKFAoMYm9vbC5leGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAI=');

@$core.Deprecated('Use stringRulesDescriptor instead')
const StringRules$json = {
  '1': 'StringRules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'const'},
    {'1': 'len', '3': 19, '4': 1, '5': 4, '8': {}, '10': 'len'},
    {'1': 'min_len', '3': 2, '4': 1, '5': 4, '8': {}, '10': 'minLen'},
    {'1': 'max_len', '3': 3, '4': 1, '5': 4, '8': {}, '10': 'maxLen'},
    {'1': 'len_bytes', '3': 20, '4': 1, '5': 4, '8': {}, '10': 'lenBytes'},
    {'1': 'min_bytes', '3': 4, '4': 1, '5': 4, '8': {}, '10': 'minBytes'},
    {'1': 'max_bytes', '3': 5, '4': 1, '5': 4, '8': {}, '10': 'maxBytes'},
    {'1': 'pattern', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'pattern'},
    {'1': 'prefix', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'prefix'},
    {'1': 'suffix', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'suffix'},
    {'1': 'contains', '3': 9, '4': 1, '5': 9, '8': {}, '10': 'contains'},
    {
      '1': 'not_contains',
      '3': 23,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'notContains'
    },
    {'1': 'in', '3': 10, '4': 3, '5': 9, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 11, '4': 3, '5': 9, '8': {}, '10': 'notIn'},
    {'1': 'email', '3': 12, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'email'},
    {
      '1': 'hostname',
      '3': 13,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'hostname'
    },
    {'1': 'ip', '3': 14, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'ip'},
    {'1': 'ipv4', '3': 15, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'ipv4'},
    {'1': 'ipv6', '3': 16, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'ipv6'},
    {'1': 'uri', '3': 17, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'uri'},
    {'1': 'uri_ref', '3': 18, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'uriRef'},
    {'1': 'address', '3': 21, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'address'},
    {'1': 'uuid', '3': 22, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'uuid'},
    {'1': 'tuuid', '3': 33, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'tuuid'},
    {
      '1': 'ip_with_prefixlen',
      '3': 26,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'ipWithPrefixlen'
    },
    {
      '1': 'ipv4_with_prefixlen',
      '3': 27,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'ipv4WithPrefixlen'
    },
    {
      '1': 'ipv6_with_prefixlen',
      '3': 28,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'ipv6WithPrefixlen'
    },
    {
      '1': 'ip_prefix',
      '3': 29,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'ipPrefix'
    },
    {
      '1': 'ipv4_prefix',
      '3': 30,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'ipv4Prefix'
    },
    {
      '1': 'ipv6_prefix',
      '3': 31,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'ipv6Prefix'
    },
    {
      '1': 'host_and_port',
      '3': 32,
      '4': 1,
      '5': 8,
      '8': {},
      '9': 0,
      '10': 'hostAndPort'
    },
    {
      '1': 'well_known_regex',
      '3': 24,
      '4': 1,
      '5': 14,
      '6': '.buf.validate.KnownRegex',
      '8': {},
      '9': 0,
      '10': 'wellKnownRegex'
    },
    {'1': 'strict', '3': 25, '4': 1, '5': 8, '10': 'strict'},
    {'1': 'example', '3': 34, '4': 3, '5': 9, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'well_known'},
  ],
};

/// Descriptor for `StringRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringRulesDescriptor = $convert.base64Decode(
    'CgtTdHJpbmdSdWxlcxKNAQoFY29uc3QYASABKAlCd8JIdApyCgxzdHJpbmcuY29uc3QaYnRoaX'
    'MgIT0gZ2V0RmllbGQocnVsZXMsICdjb25zdCcpID8gJ3ZhbHVlIG11c3QgZXF1YWwgYCVzYCcu'
    'Zm9ybWF0KFtnZXRGaWVsZChydWxlcywgJ2NvbnN0JyldKSA6ICcnUgVjb25zdBKDAQoDbGVuGB'
    'MgASgEQnHCSG4KbAoKc3RyaW5nLmxlbhpedWludCh0aGlzLnNpemUoKSkgIT0gcnVsZXMubGVu'
    'ID8gJ3ZhbHVlIGxlbmd0aCBtdXN0IGJlICVzIGNoYXJhY3RlcnMnLmZvcm1hdChbcnVsZXMubG'
    'VuXSkgOiAnJ1IDbGVuEqEBCgdtaW5fbGVuGAIgASgEQocBwkiDAQqAAQoOc3RyaW5nLm1pbl9s'
    'ZW4abnVpbnQodGhpcy5zaXplKCkpIDwgcnVsZXMubWluX2xlbiA/ICd2YWx1ZSBsZW5ndGggbX'
    'VzdCBiZSBhdCBsZWFzdCAlcyBjaGFyYWN0ZXJzJy5mb3JtYXQoW3J1bGVzLm1pbl9sZW5dKSA6'
    'ICcnUgZtaW5MZW4SnwEKB21heF9sZW4YAyABKARChQHCSIEBCn8KDnN0cmluZy5tYXhfbGVuGm'
    '11aW50KHRoaXMuc2l6ZSgpKSA+IHJ1bGVzLm1heF9sZW4gPyAndmFsdWUgbGVuZ3RoIG11c3Qg'
    'YmUgYXQgbW9zdCAlcyBjaGFyYWN0ZXJzJy5mb3JtYXQoW3J1bGVzLm1heF9sZW5dKSA6ICcnUg'
    'ZtYXhMZW4SpQEKCWxlbl9ieXRlcxgUIAEoBEKHAcJIgwEKgAEKEHN0cmluZy5sZW5fYnl0ZXMa'
    'bHVpbnQoYnl0ZXModGhpcykuc2l6ZSgpKSAhPSBydWxlcy5sZW5fYnl0ZXMgPyAndmFsdWUgbG'
    'VuZ3RoIG11c3QgYmUgJXMgYnl0ZXMnLmZvcm1hdChbcnVsZXMubGVuX2J5dGVzXSkgOiAnJ1II'
    'bGVuQnl0ZXMSrQEKCW1pbl9ieXRlcxgEIAEoBEKPAcJIiwEKiAEKEHN0cmluZy5taW5fYnl0ZX'
    'MadHVpbnQoYnl0ZXModGhpcykuc2l6ZSgpKSA8IHJ1bGVzLm1pbl9ieXRlcyA/ICd2YWx1ZSBs'
    'ZW5ndGggbXVzdCBiZSBhdCBsZWFzdCAlcyBieXRlcycuZm9ybWF0KFtydWxlcy5taW5fYnl0ZX'
    'NdKSA6ICcnUghtaW5CeXRlcxKsAQoJbWF4X2J5dGVzGAUgASgEQo4BwkiKAQqHAQoQc3RyaW5n'
    'Lm1heF9ieXRlcxpzdWludChieXRlcyh0aGlzKS5zaXplKCkpID4gcnVsZXMubWF4X2J5dGVzID'
    '8gJ3ZhbHVlIGxlbmd0aCBtdXN0IGJlIGF0IG1vc3QgJXMgYnl0ZXMnLmZvcm1hdChbcnVsZXMu'
    'bWF4X2J5dGVzXSkgOiAnJ1IIbWF4Qnl0ZXMSlgEKB3BhdHRlcm4YBiABKAlCfMJIeQp3Cg5zdH'
    'JpbmcucGF0dGVybhplIXRoaXMubWF0Y2hlcyhydWxlcy5wYXR0ZXJuKSA/ICd2YWx1ZSBkb2Vz'
    'IG5vdCBtYXRjaCByZWdleCBwYXR0ZXJuIGAlc2AnLmZvcm1hdChbcnVsZXMucGF0dGVybl0pID'
    'ogJydSB3BhdHRlcm4SjAEKBnByZWZpeBgHIAEoCUJ0wkhxCm8KDXN0cmluZy5wcmVmaXgaXiF0'
    'aGlzLnN0YXJ0c1dpdGgocnVsZXMucHJlZml4KSA/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIHByZW'
    'ZpeCBgJXNgJy5mb3JtYXQoW3J1bGVzLnByZWZpeF0pIDogJydSBnByZWZpeBKKAQoGc3VmZml4'
    'GAggASgJQnLCSG8KbQoNc3RyaW5nLnN1ZmZpeBpcIXRoaXMuZW5kc1dpdGgocnVsZXMuc3VmZm'
    'l4KSA/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIHN1ZmZpeCBgJXNgJy5mb3JtYXQoW3J1bGVzLnN1'
    'ZmZpeF0pIDogJydSBnN1ZmZpeBKaAQoIY29udGFpbnMYCSABKAlCfsJIewp5Cg9zdHJpbmcuY2'
    '9udGFpbnMaZiF0aGlzLmNvbnRhaW5zKHJ1bGVzLmNvbnRhaW5zKSA/ICd2YWx1ZSBkb2VzIG5v'
    'dCBjb250YWluIHN1YnN0cmluZyBgJXNgJy5mb3JtYXQoW3J1bGVzLmNvbnRhaW5zXSkgOiAnJ1'
    'IIY29udGFpbnMSpQEKDG5vdF9jb250YWlucxgXIAEoCUKBAcJIfgp8ChNzdHJpbmcubm90X2Nv'
    'bnRhaW5zGmV0aGlzLmNvbnRhaW5zKHJ1bGVzLm5vdF9jb250YWlucykgPyAndmFsdWUgY29udG'
    'FpbnMgc3Vic3RyaW5nIGAlc2AnLmZvcm1hdChbcnVsZXMubm90X2NvbnRhaW5zXSkgOiAnJ1IL'
    'bm90Q29udGFpbnMShAEKAmluGAogAygJQnTCSHEKbwoJc3RyaW5nLmluGmIhKHRoaXMgaW4gZ2'
    'V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1h'
    'dChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4SfgoGbm90X2luGAsgAygJQmfCSG'
    'QKYgoNc3RyaW5nLm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdWUgbXVzdCBu'
    'b3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVub3RJbhLmAQ'
    'oFZW1haWwYDCABKAhCzQHCSMkBCmEKDHN0cmluZy5lbWFpbBIjdmFsdWUgbXVzdCBiZSBhIHZh'
    'bGlkIGVtYWlsIGFkZHJlc3MaLCFydWxlcy5lbWFpbCB8fCB0aGlzID09ICcnIHx8IHRoaXMuaX'
    'NFbWFpbCgpCmQKEnN0cmluZy5lbWFpbF9lbXB0eRIydmFsdWUgaXMgZW1wdHksIHdoaWNoIGlz'
    'IG5vdCBhIHZhbGlkIGVtYWlsIGFkZHJlc3MaGiFydWxlcy5lbWFpbCB8fCB0aGlzICE9ICcnSA'
    'BSBWVtYWlsEvEBCghob3N0bmFtZRgNIAEoCELSAcJIzgEKZQoPc3RyaW5nLmhvc3RuYW1lEh52'
    'YWx1ZSBtdXN0IGJlIGEgdmFsaWQgaG9zdG5hbWUaMiFydWxlcy5ob3N0bmFtZSB8fCB0aGlzID'
    '09ICcnIHx8IHRoaXMuaXNIb3N0bmFtZSgpCmUKFXN0cmluZy5ob3N0bmFtZV9lbXB0eRItdmFs'
    'dWUgaXMgZW1wdHksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIGhvc3RuYW1lGh0hcnVsZXMuaG9zdG'
    '5hbWUgfHwgdGhpcyAhPSAnJ0gAUghob3N0bmFtZRLLAQoCaXAYDiABKAhCuAHCSLQBClUKCXN0'
    'cmluZy5pcBIgdmFsdWUgbXVzdCBiZSBhIHZhbGlkIElQIGFkZHJlc3MaJiFydWxlcy5pcCB8fC'
    'B0aGlzID09ICcnIHx8IHRoaXMuaXNJcCgpClsKD3N0cmluZy5pcF9lbXB0eRIvdmFsdWUgaXMg'
    'ZW1wdHksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIElQIGFkZHJlc3MaFyFydWxlcy5pcCB8fCB0aG'
    'lzICE9ICcnSABSAmlwEtwBCgRpcHY0GA8gASgIQsUBwkjBAQpcCgtzdHJpbmcuaXB2NBIidmFs'
    'dWUgbXVzdCBiZSBhIHZhbGlkIElQdjQgYWRkcmVzcxopIXJ1bGVzLmlwdjQgfHwgdGhpcyA9PS'
    'AnJyB8fCB0aGlzLmlzSXAoNCkKYQoRc3RyaW5nLmlwdjRfZW1wdHkSMXZhbHVlIGlzIGVtcHR5'
    'LCB3aGljaCBpcyBub3QgYSB2YWxpZCBJUHY0IGFkZHJlc3MaGSFydWxlcy5pcHY0IHx8IHRoaX'
    'MgIT0gJydIAFIEaXB2NBLcAQoEaXB2NhgQIAEoCELFAcJIwQEKXAoLc3RyaW5nLmlwdjYSInZh'
    'bHVlIG11c3QgYmUgYSB2YWxpZCBJUHY2IGFkZHJlc3MaKSFydWxlcy5pcHY2IHx8IHRoaXMgPT'
    '0gJycgfHwgdGhpcy5pc0lwKDYpCmEKEXN0cmluZy5pcHY2X2VtcHR5EjF2YWx1ZSBpcyBlbXB0'
    'eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSVB2NiBhZGRyZXNzGhkhcnVsZXMuaXB2NiB8fCB0aG'
    'lzICE9ICcnSABSBGlwdjYSxAEKA3VyaRgRIAEoCEKvAcJIqwEKUQoKc3RyaW5nLnVyaRIZdmFs'
    'dWUgbXVzdCBiZSBhIHZhbGlkIFVSSRooIXJ1bGVzLnVyaSB8fCB0aGlzID09ICcnIHx8IHRoaX'
    'MuaXNVcmkoKQpWChBzdHJpbmcudXJpX2VtcHR5Eih2YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMg'
    'bm90IGEgdmFsaWQgVVJJGhghcnVsZXMudXJpIHx8IHRoaXMgIT0gJydIAFIDdXJpEngKB3VyaV'
    '9yZWYYEiABKAhCXcJIWgpYCg5zdHJpbmcudXJpX3JlZhIjdmFsdWUgbXVzdCBiZSBhIHZhbGlk'
    'IFVSSSBSZWZlcmVuY2UaISFydWxlcy51cmlfcmVmIHx8IHRoaXMuaXNVcmlSZWYoKUgAUgZ1cm'
    'lSZWYSmQIKB2FkZHJlc3MYFSABKAhC/AHCSPgBCoEBCg5zdHJpbmcuYWRkcmVzcxItdmFsdWUg'
    'bXVzdCBiZSBhIHZhbGlkIGhvc3RuYW1lLCBvciBpcCBhZGRyZXNzGkAhcnVsZXMuYWRkcmVzcy'
    'B8fCB0aGlzID09ICcnIHx8IHRoaXMuaXNIb3N0bmFtZSgpIHx8IHRoaXMuaXNJcCgpCnIKFHN0'
    'cmluZy5hZGRyZXNzX2VtcHR5Ejx2YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaW'
    'QgaG9zdG5hbWUsIG9yIGlwIGFkZHJlc3MaHCFydWxlcy5hZGRyZXNzIHx8IHRoaXMgIT0gJydI'
    'AFIHYWRkcmVzcxKeAgoEdXVpZBgWIAEoCEKHAsJIgwIKpQEKC3N0cmluZy51dWlkEhp2YWx1ZS'
    'BtdXN0IGJlIGEgdmFsaWQgVVVJRBp6IXJ1bGVzLnV1aWQgfHwgdGhpcyA9PSAnJyB8fCB0aGlz'
    'Lm1hdGNoZXMoJ15bMC05YS1mQS1GXXs4fS1bMC05YS1mQS1GXXs0fS1bMC05YS1mQS1GXXs0fS'
    '1bMC05YS1mQS1GXXs0fS1bMC05YS1mQS1GXXsxMn0kJykKWQoRc3RyaW5nLnV1aWRfZW1wdHkS'
    'KXZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBVVUlEGhkhcnVsZXMudXVpZC'
    'B8fCB0aGlzICE9ICcnSABSBHV1aWQS9wEKBXR1dWlkGCEgASgIQt4BwkjaAQpzCgxzdHJpbmcu'
    'dHV1aWQSInZhbHVlIG11c3QgYmUgYSB2YWxpZCB0cmltbWVkIFVVSUQaPyFydWxlcy50dXVpZC'
    'B8fCB0aGlzID09ICcnIHx8IHRoaXMubWF0Y2hlcygnXlswLTlhLWZBLUZdezMyfSQnKQpjChJz'
    'dHJpbmcudHV1aWRfZW1wdHkSMXZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZC'
    'B0cmltbWVkIFVVSUQaGiFydWxlcy50dXVpZCB8fCB0aGlzICE9ICcnSABSBXR1dWlkEqcCChFp'
    'cF93aXRoX3ByZWZpeGxlbhgaIAEoCEL4AcJI9AEKeAoYc3RyaW5nLmlwX3dpdGhfcHJlZml4bG'
    'VuEh92YWx1ZSBtdXN0IGJlIGEgdmFsaWQgSVAgcHJlZml4GjshcnVsZXMuaXBfd2l0aF9wcmVm'
    'aXhsZW4gfHwgdGhpcyA9PSAnJyB8fCB0aGlzLmlzSXBQcmVmaXgoKQp4Ch5zdHJpbmcuaXBfd2'
    'l0aF9wcmVmaXhsZW5fZW1wdHkSLnZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxp'
    'ZCBJUCBwcmVmaXgaJiFydWxlcy5pcF93aXRoX3ByZWZpeGxlbiB8fCB0aGlzICE9ICcnSABSD2'
    'lwV2l0aFByZWZpeGxlbhLiAgoTaXB2NF93aXRoX3ByZWZpeGxlbhgbIAEoCEKvAsJIqwIKkwEK'
    'GnN0cmluZy5pcHY0X3dpdGhfcHJlZml4bGVuEjV2YWx1ZSBtdXN0IGJlIGEgdmFsaWQgSVB2NC'
    'BhZGRyZXNzIHdpdGggcHJlZml4IGxlbmd0aBo+IXJ1bGVzLmlwdjRfd2l0aF9wcmVmaXhsZW4g'
    'fHwgdGhpcyA9PSAnJyB8fCB0aGlzLmlzSXBQcmVmaXgoNCkKkgEKIHN0cmluZy5pcHY0X3dpdG'
    'hfcHJlZml4bGVuX2VtcHR5EkR2YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQg'
    'SVB2NCBhZGRyZXNzIHdpdGggcHJlZml4IGxlbmd0aBooIXJ1bGVzLmlwdjRfd2l0aF9wcmVmaX'
    'hsZW4gfHwgdGhpcyAhPSAnJ0gAUhFpcHY0V2l0aFByZWZpeGxlbhLiAgoTaXB2Nl93aXRoX3By'
    'ZWZpeGxlbhgcIAEoCEKvAsJIqwIKkwEKGnN0cmluZy5pcHY2X3dpdGhfcHJlZml4bGVuEjV2YW'
    'x1ZSBtdXN0IGJlIGEgdmFsaWQgSVB2NiBhZGRyZXNzIHdpdGggcHJlZml4IGxlbmd0aBo+IXJ1'
    'bGVzLmlwdjZfd2l0aF9wcmVmaXhsZW4gfHwgdGhpcyA9PSAnJyB8fCB0aGlzLmlzSXBQcmVmaX'
    'goNikKkgEKIHN0cmluZy5pcHY2X3dpdGhfcHJlZml4bGVuX2VtcHR5EkR2YWx1ZSBpcyBlbXB0'
    'eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSVB2NiBhZGRyZXNzIHdpdGggcHJlZml4IGxlbmd0aB'
    'ooIXJ1bGVzLmlwdjZfd2l0aF9wcmVmaXhsZW4gfHwgdGhpcyAhPSAnJ0gAUhFpcHY2V2l0aFBy'
    'ZWZpeGxlbhL8AQoJaXBfcHJlZml4GB0gASgIQtwBwkjYAQpsChBzdHJpbmcuaXBfcHJlZml4Eh'
    '92YWx1ZSBtdXN0IGJlIGEgdmFsaWQgSVAgcHJlZml4GjchcnVsZXMuaXBfcHJlZml4IHx8IHRo'
    'aXMgPT0gJycgfHwgdGhpcy5pc0lwUHJlZml4KHRydWUpCmgKFnN0cmluZy5pcF9wcmVmaXhfZW'
    '1wdHkSLnZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBJUCBwcmVmaXgaHiFy'
    'dWxlcy5pcF9wcmVmaXggfHwgdGhpcyAhPSAnJ0gAUghpcFByZWZpeBKPAgoLaXB2NF9wcmVmaX'
    'gYHiABKAhC6wHCSOcBCnUKEnN0cmluZy5pcHY0X3ByZWZpeBIhdmFsdWUgbXVzdCBiZSBhIHZh'
    'bGlkIElQdjQgcHJlZml4GjwhcnVsZXMuaXB2NF9wcmVmaXggfHwgdGhpcyA9PSAnJyB8fCB0aG'
    'lzLmlzSXBQcmVmaXgoNCwgdHJ1ZSkKbgoYc3RyaW5nLmlwdjRfcHJlZml4X2VtcHR5EjB2YWx1'
    'ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSVB2NCBwcmVmaXgaICFydWxlcy5pcH'
    'Y0X3ByZWZpeCB8fCB0aGlzICE9ICcnSABSCmlwdjRQcmVmaXgSjwIKC2lwdjZfcHJlZml4GB8g'
    'ASgIQusBwkjnAQp1ChJzdHJpbmcuaXB2Nl9wcmVmaXgSIXZhbHVlIG11c3QgYmUgYSB2YWxpZC'
    'BJUHY2IHByZWZpeBo8IXJ1bGVzLmlwdjZfcHJlZml4IHx8IHRoaXMgPT0gJycgfHwgdGhpcy5p'
    'c0lwUHJlZml4KDYsIHRydWUpCm4KGHN0cmluZy5pcHY2X3ByZWZpeF9lbXB0eRIwdmFsdWUgaX'
    'MgZW1wdHksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIElQdjYgcHJlZml4GiAhcnVsZXMuaXB2Nl9w'
    'cmVmaXggfHwgdGhpcyAhPSAnJ0gAUgppcHY2UHJlZml4EsICCg1ob3N0X2FuZF9wb3J0GCAgAS'
    'gIQpsCwkiXAgqZAQoUc3RyaW5nLmhvc3RfYW5kX3BvcnQSQXZhbHVlIG11c3QgYmUgYSB2YWxp'
    'ZCBob3N0IChob3N0bmFtZSBvciBJUCBhZGRyZXNzKSBhbmQgcG9ydCBwYWlyGj4hcnVsZXMuaG'
    '9zdF9hbmRfcG9ydCB8fCB0aGlzID09ICcnIHx8IHRoaXMuaXNIb3N0QW5kUG9ydCh0cnVlKQp5'
    'ChpzdHJpbmcuaG9zdF9hbmRfcG9ydF9lbXB0eRI3dmFsdWUgaXMgZW1wdHksIHdoaWNoIGlzIG'
    '5vdCBhIHZhbGlkIGhvc3QgYW5kIHBvcnQgcGFpchoiIXJ1bGVzLmhvc3RfYW5kX3BvcnQgfHwg'
    'dGhpcyAhPSAnJ0gAUgtob3N0QW5kUG9ydBK4BQoQd2VsbF9rbm93bl9yZWdleBgYIAEoDjIYLm'
    'J1Zi52YWxpZGF0ZS5Lbm93blJlZ2V4QvEEwkjtBArwAQojc3RyaW5nLndlbGxfa25vd25fcmVn'
    'ZXguaGVhZGVyX25hbWUSJnZhbHVlIG11c3QgYmUgYSB2YWxpZCBIVFRQIGhlYWRlciBuYW1lGq'
    'ABcnVsZXMud2VsbF9rbm93bl9yZWdleCAhPSAxIHx8IHRoaXMgPT0gJycgfHwgdGhpcy5tYXRj'
    'aGVzKCFoYXMocnVsZXMuc3RyaWN0KSB8fCBydWxlcy5zdHJpY3QgPydeOj9bMC05YS16QS1aIS'
    'MkJSZcJyorLS5eX3x+XHg2MF0rJCcgOideW15cdTAwMDBcdTAwMEFcdTAwMERdKyQnKQqNAQop'
    'c3RyaW5nLndlbGxfa25vd25fcmVnZXguaGVhZGVyX25hbWVfZW1wdHkSNXZhbHVlIGlzIGVtcH'
    'R5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBIVFRQIGhlYWRlciBuYW1lGilydWxlcy53ZWxsX2tu'
    'b3duX3JlZ2V4ICE9IDEgfHwgdGhpcyAhPSAnJwrnAQokc3RyaW5nLndlbGxfa25vd25fcmVnZX'
    'guaGVhZGVyX3ZhbHVlEid2YWx1ZSBtdXN0IGJlIGEgdmFsaWQgSFRUUCBoZWFkZXIgdmFsdWUa'
    'lQFydWxlcy53ZWxsX2tub3duX3JlZ2V4ICE9IDIgfHwgdGhpcy5tYXRjaGVzKCFoYXMocnVsZX'
    'Muc3RyaWN0KSB8fCBydWxlcy5zdHJpY3QgPydeW15cdTAwMDAtXHUwMDA4XHUwMDBBLVx1MDAx'
    'Rlx1MDA3Rl0qJCcgOideW15cdTAwMDBcdTAwMEFcdTAwMERdKiQnKUgAUg53ZWxsS25vd25SZW'
    'dleBIWCgZzdHJpY3QYGSABKAhSBnN0cmljdBI1CgdleGFtcGxlGCIgAygJQhvCSBgKFgoOc3Ry'
    'aW5nLmV4YW1wbGUaBHRydWVSB2V4YW1wbGUqCQjoBxCAgICAAkIMCgp3ZWxsX2tub3du');

@$core.Deprecated('Use bytesRulesDescriptor instead')
const BytesRules$json = {
  '1': 'BytesRules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 12, '8': {}, '10': 'const'},
    {'1': 'len', '3': 13, '4': 1, '5': 4, '8': {}, '10': 'len'},
    {'1': 'min_len', '3': 2, '4': 1, '5': 4, '8': {}, '10': 'minLen'},
    {'1': 'max_len', '3': 3, '4': 1, '5': 4, '8': {}, '10': 'maxLen'},
    {'1': 'pattern', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'pattern'},
    {'1': 'prefix', '3': 5, '4': 1, '5': 12, '8': {}, '10': 'prefix'},
    {'1': 'suffix', '3': 6, '4': 1, '5': 12, '8': {}, '10': 'suffix'},
    {'1': 'contains', '3': 7, '4': 1, '5': 12, '8': {}, '10': 'contains'},
    {'1': 'in', '3': 8, '4': 3, '5': 12, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 9, '4': 3, '5': 12, '8': {}, '10': 'notIn'},
    {'1': 'ip', '3': 10, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'ip'},
    {'1': 'ipv4', '3': 11, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'ipv4'},
    {'1': 'ipv6', '3': 12, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'ipv6'},
    {'1': 'example', '3': 14, '4': 3, '5': 12, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'well_known'},
  ],
};

/// Descriptor for `BytesRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bytesRulesDescriptor = $convert.base64Decode(
    'CgpCeXRlc1J1bGVzEocBCgVjb25zdBgBIAEoDEJxwkhuCmwKC2J5dGVzLmNvbnN0Gl10aGlzIC'
    'E9IGdldEZpZWxkKHJ1bGVzLCAnY29uc3QnKSA/ICd2YWx1ZSBtdXN0IGJlICV4Jy5mb3JtYXQo'
    'W2dldEZpZWxkKHJ1bGVzLCAnY29uc3QnKV0pIDogJydSBWNvbnN0En0KA2xlbhgNIAEoBEJrwk'
    'hoCmYKCWJ5dGVzLmxlbhpZdWludCh0aGlzLnNpemUoKSkgIT0gcnVsZXMubGVuID8gJ3ZhbHVl'
    'IGxlbmd0aCBtdXN0IGJlICVzIGJ5dGVzJy5mb3JtYXQoW3J1bGVzLmxlbl0pIDogJydSA2xlbh'
    'KYAQoHbWluX2xlbhgCIAEoBEJ/wkh8CnoKDWJ5dGVzLm1pbl9sZW4aaXVpbnQodGhpcy5zaXpl'
    'KCkpIDwgcnVsZXMubWluX2xlbiA/ICd2YWx1ZSBsZW5ndGggbXVzdCBiZSBhdCBsZWFzdCAlcy'
    'BieXRlcycuZm9ybWF0KFtydWxlcy5taW5fbGVuXSkgOiAnJ1IGbWluTGVuEpABCgdtYXhfbGVu'
    'GAMgASgEQnfCSHQKcgoNYnl0ZXMubWF4X2xlbhphdWludCh0aGlzLnNpemUoKSkgPiBydWxlcy'
    '5tYXhfbGVuID8gJ3ZhbHVlIG11c3QgYmUgYXQgbW9zdCAlcyBieXRlcycuZm9ybWF0KFtydWxl'
    'cy5tYXhfbGVuXSkgOiAnJ1IGbWF4TGVuEpkBCgdwYXR0ZXJuGAQgASgJQn/CSHwKegoNYnl0ZX'
    'MucGF0dGVybhppIXN0cmluZyh0aGlzKS5tYXRjaGVzKHJ1bGVzLnBhdHRlcm4pID8gJ3ZhbHVl'
    'IG11c3QgbWF0Y2ggcmVnZXggcGF0dGVybiBgJXNgJy5mb3JtYXQoW3J1bGVzLnBhdHRlcm5dKS'
    'A6ICcnUgdwYXR0ZXJuEokBCgZwcmVmaXgYBSABKAxCccJIbgpsCgxieXRlcy5wcmVmaXgaXCF0'
    'aGlzLnN0YXJ0c1dpdGgocnVsZXMucHJlZml4KSA/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIHByZW'
    'ZpeCAleCcuZm9ybWF0KFtydWxlcy5wcmVmaXhdKSA6ICcnUgZwcmVmaXgShwEKBnN1ZmZpeBgG'
    'IAEoDEJvwkhsCmoKDGJ5dGVzLnN1ZmZpeBpaIXRoaXMuZW5kc1dpdGgocnVsZXMuc3VmZml4KS'
    'A/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIHN1ZmZpeCAleCcuZm9ybWF0KFtydWxlcy5zdWZmaXhd'
    'KSA6ICcnUgZzdWZmaXgSjQEKCGNvbnRhaW5zGAcgASgMQnHCSG4KbAoOYnl0ZXMuY29udGFpbn'
    'MaWiF0aGlzLmNvbnRhaW5zKHJ1bGVzLmNvbnRhaW5zKSA/ICd2YWx1ZSBkb2VzIG5vdCBjb250'
    'YWluICV4Jy5mb3JtYXQoW3J1bGVzLmNvbnRhaW5zXSkgOiAnJ1IIY29udGFpbnMSqwEKAmluGA'
    'ggAygMQpoBwkiWAQqTAQoIYnl0ZXMuaW4ahgFnZXRGaWVsZChydWxlcywgJ2luJykuc2l6ZSgp'
    'ID4gMCAmJiAhKHRoaXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/ICd2YWx1ZSBtdXN0IG'
    'JlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbicpXSkgOiAnJ1ICaW4S'
    'fQoGbm90X2luGAkgAygMQmbCSGMKYQoMYnl0ZXMubm90X2luGlF0aGlzIGluIHJ1bGVzLm5vdF'
    '9pbiA/ICd2YWx1ZSBtdXN0IG5vdCBiZSBpbiBsaXN0ICVzJy5mb3JtYXQoW3J1bGVzLm5vdF9p'
    'bl0pIDogJydSBW5vdEluEu8BCgJpcBgKIAEoCELcAcJI2AEKdAoIYnl0ZXMuaXASIHZhbHVlIG'
    '11c3QgYmUgYSB2YWxpZCBJUCBhZGRyZXNzGkYhcnVsZXMuaXAgfHwgdGhpcy5zaXplKCkgPT0g'
    'MCB8fCB0aGlzLnNpemUoKSA9PSA0IHx8IHRoaXMuc2l6ZSgpID09IDE2CmAKDmJ5dGVzLmlwX2'
    'VtcHR5Ei92YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSVAgYWRkcmVzcxod'
    'IXJ1bGVzLmlwIHx8IHRoaXMuc2l6ZSgpICE9IDBIAFICaXAS6gEKBGlwdjQYCyABKAhC0wHCSM'
    '8BCmUKCmJ5dGVzLmlwdjQSInZhbHVlIG11c3QgYmUgYSB2YWxpZCBJUHY0IGFkZHJlc3MaMyFy'
    'dWxlcy5pcHY0IHx8IHRoaXMuc2l6ZSgpID09IDAgfHwgdGhpcy5zaXplKCkgPT0gNApmChBieX'
    'Rlcy5pcHY0X2VtcHR5EjF2YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSVB2'
    'NCBhZGRyZXNzGh8hcnVsZXMuaXB2NCB8fCB0aGlzLnNpemUoKSAhPSAwSABSBGlwdjQS6wEKBG'
    'lwdjYYDCABKAhC1AHCSNABCmYKCmJ5dGVzLmlwdjYSInZhbHVlIG11c3QgYmUgYSB2YWxpZCBJ'
    'UHY2IGFkZHJlc3MaNCFydWxlcy5pcHY2IHx8IHRoaXMuc2l6ZSgpID09IDAgfHwgdGhpcy5zaX'
    'plKCkgPT0gMTYKZgoQYnl0ZXMuaXB2Nl9lbXB0eRIxdmFsdWUgaXMgZW1wdHksIHdoaWNoIGlz'
    'IG5vdCBhIHZhbGlkIElQdjYgYWRkcmVzcxofIXJ1bGVzLmlwdjYgfHwgdGhpcy5zaXplKCkgIT'
    '0gMEgAUgRpcHY2EjQKB2V4YW1wbGUYDiADKAxCGsJIFwoVCg1ieXRlcy5leGFtcGxlGgR0cnVl'
    'UgdleGFtcGxlKgkI6AcQgICAgAJCDAoKd2VsbF9rbm93bg==');

@$core.Deprecated('Use enumRulesDescriptor instead')
const EnumRules$json = {
  '1': 'EnumRules',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'const'},
    {'1': 'defined_only', '3': 2, '4': 1, '5': 8, '10': 'definedOnly'},
    {'1': 'in', '3': 3, '4': 3, '5': 5, '8': {}, '10': 'in'},
    {'1': 'not_in', '3': 4, '4': 3, '5': 5, '8': {}, '10': 'notIn'},
    {'1': 'example', '3': 5, '4': 3, '5': 5, '8': {}, '10': 'example'},
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

/// Descriptor for `EnumRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumRulesDescriptor = $convert.base64Decode(
    'CglFbnVtUnVsZXMSiQEKBWNvbnN0GAEgASgFQnPCSHAKbgoKZW51bS5jb25zdBpgdGhpcyAhPS'
    'BnZXRGaWVsZChydWxlcywgJ2NvbnN0JykgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycuZm9ybWF0'
    'KFtnZXRGaWVsZChydWxlcywgJ2NvbnN0JyldKSA6ICcnUgVjb25zdBIhCgxkZWZpbmVkX29ubH'
    'kYAiABKAhSC2RlZmluZWRPbmx5EoIBCgJpbhgDIAMoBUJywkhvCm0KB2VudW0uaW4aYiEodGhp'
    'cyBpbiBnZXRGaWVsZChydWxlcywgJ2luJykpID8gJ3ZhbHVlIG11c3QgYmUgaW4gbGlzdCAlcy'
    'cuZm9ybWF0KFtnZXRGaWVsZChydWxlcywgJ2luJyldKSA6ICcnUgJpbhJ8CgZub3RfaW4YBCAD'
    'KAVCZcJIYgpgCgtlbnVtLm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdWUgbX'
    'VzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVub3RJ'
    'bhIzCgdleGFtcGxlGAUgAygFQhnCSBYKFAoMZW51bS5leGFtcGxlGgR0cnVlUgdleGFtcGxlKg'
    'kI6AcQgICAgAI=');

@$core.Deprecated('Use repeatedRulesDescriptor instead')
const RepeatedRules$json = {
  '1': 'RepeatedRules',
  '2': [
    {'1': 'min_items', '3': 1, '4': 1, '5': 4, '8': {}, '10': 'minItems'},
    {'1': 'max_items', '3': 2, '4': 1, '5': 4, '8': {}, '10': 'maxItems'},
    {'1': 'unique', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'unique'},
    {
      '1': 'items',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.FieldRules',
      '10': 'items'
    },
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

/// Descriptor for `RepeatedRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repeatedRulesDescriptor = $convert.base64Decode(
    'Cg1SZXBlYXRlZFJ1bGVzEqgBCgltaW5faXRlbXMYASABKARCigHCSIYBCoMBChJyZXBlYXRlZC'
    '5taW5faXRlbXMabXVpbnQodGhpcy5zaXplKCkpIDwgcnVsZXMubWluX2l0ZW1zID8gJ3ZhbHVl'
    'IG11c3QgY29udGFpbiBhdCBsZWFzdCAlZCBpdGVtKHMpJy5mb3JtYXQoW3J1bGVzLm1pbl9pdG'
    'Vtc10pIDogJydSCG1pbkl0ZW1zEqwBCgltYXhfaXRlbXMYAiABKARCjgHCSIoBCocBChJyZXBl'
    'YXRlZC5tYXhfaXRlbXMacXVpbnQodGhpcy5zaXplKCkpID4gcnVsZXMubWF4X2l0ZW1zID8gJ3'
    'ZhbHVlIG11c3QgY29udGFpbiBubyBtb3JlIHRoYW4gJXMgaXRlbShzKScuZm9ybWF0KFtydWxl'
    'cy5tYXhfaXRlbXNdKSA6ICcnUghtYXhJdGVtcxJ4CgZ1bmlxdWUYAyABKAhCYMJIXQpbCg9yZX'
    'BlYXRlZC51bmlxdWUSKHJlcGVhdGVkIHZhbHVlIG11c3QgY29udGFpbiB1bmlxdWUgaXRlbXMa'
    'HiFydWxlcy51bmlxdWUgfHwgdGhpcy51bmlxdWUoKVIGdW5pcXVlEi4KBWl0ZW1zGAQgASgLMh'
    'guYnVmLnZhbGlkYXRlLkZpZWxkUnVsZXNSBWl0ZW1zKgkI6AcQgICAgAI=');

@$core.Deprecated('Use mapRulesDescriptor instead')
const MapRules$json = {
  '1': 'MapRules',
  '2': [
    {'1': 'min_pairs', '3': 1, '4': 1, '5': 4, '8': {}, '10': 'minPairs'},
    {'1': 'max_pairs', '3': 2, '4': 1, '5': 4, '8': {}, '10': 'maxPairs'},
    {
      '1': 'keys',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.FieldRules',
      '10': 'keys'
    },
    {
      '1': 'values',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.FieldRules',
      '10': 'values'
    },
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
};

/// Descriptor for `MapRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mapRulesDescriptor = $convert.base64Decode(
    'CghNYXBSdWxlcxKZAQoJbWluX3BhaXJzGAEgASgEQnzCSHkKdwoNbWFwLm1pbl9wYWlycxpmdW'
    'ludCh0aGlzLnNpemUoKSkgPCBydWxlcy5taW5fcGFpcnMgPyAnbWFwIG11c3QgYmUgYXQgbGVh'
    'c3QgJWQgZW50cmllcycuZm9ybWF0KFtydWxlcy5taW5fcGFpcnNdKSA6ICcnUghtaW5QYWlycx'
    'KYAQoJbWF4X3BhaXJzGAIgASgEQnvCSHgKdgoNbWFwLm1heF9wYWlycxpldWludCh0aGlzLnNp'
    'emUoKSkgPiBydWxlcy5tYXhfcGFpcnMgPyAnbWFwIG11c3QgYmUgYXQgbW9zdCAlZCBlbnRyaW'
    'VzJy5mb3JtYXQoW3J1bGVzLm1heF9wYWlyc10pIDogJydSCG1heFBhaXJzEiwKBGtleXMYBCAB'
    'KAsyGC5idWYudmFsaWRhdGUuRmllbGRSdWxlc1IEa2V5cxIwCgZ2YWx1ZXMYBSABKAsyGC5idW'
    'YudmFsaWRhdGUuRmllbGRSdWxlc1IGdmFsdWVzKgkI6AcQgICAgAI=');

@$core.Deprecated('Use anyRulesDescriptor instead')
const AnyRules$json = {
  '1': 'AnyRules',
  '2': [
    {'1': 'in', '3': 2, '4': 3, '5': 9, '10': 'in'},
    {'1': 'not_in', '3': 3, '4': 3, '5': 9, '10': 'notIn'},
  ],
};

/// Descriptor for `AnyRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List anyRulesDescriptor = $convert.base64Decode(
    'CghBbnlSdWxlcxIOCgJpbhgCIAMoCVICaW4SFQoGbm90X2luGAMgAygJUgVub3RJbg==');

@$core.Deprecated('Use durationRulesDescriptor instead')
const DurationRules$json = {
  '1': 'DurationRules',
  '2': [
    {
      '1': 'const',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '10': 'const'
    },
    {
      '1': 'lt',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '9': 0,
      '10': 'lt'
    },
    {
      '1': 'lte',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '9': 0,
      '10': 'lte'
    },
    {
      '1': 'gt',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '9': 1,
      '10': 'gt'
    },
    {
      '1': 'gte',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '9': 1,
      '10': 'gte'
    },
    {
      '1': 'in',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '10': 'in'
    },
    {
      '1': 'not_in',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '10': 'notIn'
    },
    {
      '1': 'example',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '10': 'example'
    },
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `DurationRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List durationRulesDescriptor = $convert.base64Decode(
    'Cg1EdXJhdGlvblJ1bGVzEqgBCgVjb25zdBgCIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdG'
    'lvbkJ3wkh0CnIKDmR1cmF0aW9uLmNvbnN0GmB0aGlzICE9IGdldEZpZWxkKHJ1bGVzLCAnY29u'
    'c3QnKSA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3JtYXQoW2dldEZpZWxkKHJ1bGVzLCAnY2'
    '9uc3QnKV0pIDogJydSBWNvbnN0EqwBCgJsdBgDIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJh'
    'dGlvbkJ/wkh8CnoKC2R1cmF0aW9uLmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy'
    '5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5m'
    'b3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBK/AQoDbHRlGAQgASgLMhkuZ29vZ2xlLnByb3'
    'RvYnVmLkR1cmF0aW9uQo8BwkiLAQqIAQoMZHVyYXRpb24ubHRlGnghaGFzKHJ1bGVzLmd0ZSkg'
    'JiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYmUgbG'
    'VzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFIDbHRl'
    'EsUHCgJndBgFIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvbkKXB8JIkwcKfQoLZHVyYX'
    'Rpb24uZ3QabiFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDw9IHJ1'
    'bGVzLmd0PyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3'
    'RdKSA6ICcnCrYBCg5kdXJhdGlvbi5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQg'
    'Pj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/IC'
    'd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQo'
    'W3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvgEKGGR1cmF0aW9uLmd0X2x0X2V4Y2x1c2l2ZR'
    'qhAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPCBydWxlcy5ndCAmJiAocnVsZXMubHQgPD0g'
    'dGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIC'
    'VzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcnCsYB'
    'Cg9kdXJhdGlvbi5ndF9sdGUasgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZX'
    'MuZ3QgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBt'
    'dXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3'
    'JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdGVdKSA6ICcnCs4BChlkdXJhdGlvbi5ndF9sdGVfZXhj'
    'bHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bG'
    'VzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0'
    'ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3'
    'QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QSkggKA2d0ZRgGIAEoCzIZLmdvb2dsZS5wcm90b2J1'
    'Zi5EdXJhdGlvbkLiB8JI3gcKiwEKDGR1cmF0aW9uLmd0ZRp7IWhhcyhydWxlcy5sdCkgJiYgIW'
    'hhcyhydWxlcy5sdGUpICYmIHRoaXMgPCBydWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0'
    'ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsUBCg9kdX'
    'JhdGlvbi5ndGVfbHQasQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAm'
    'JiAodGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYm'
    'UgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChb'
    'cnVsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKzQEKGWR1cmF0aW9uLmd0ZV9sdF9leGNsdXNpdm'
    'UarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8'
    'PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW'
    '4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVs'
    'ZXMubHRdKSA6ICcnCtUBChBkdXJhdGlvbi5ndGVfbHRlGsABaGFzKHJ1bGVzLmx0ZSkgJiYgcn'
    'VsZXMubHRlID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDwgcnVs'
    'ZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZC'
    'BsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVd'
    'KSA6ICcnCt0BChpkdXJhdGlvbi5ndGVfbHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5sdGUpIC'
    'YmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwg'
    'cnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG'
    '9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0'
    'ZV0pIDogJydIAVIDZ3RlEqEBCgJpbhgHIAMoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvbk'
    'J2wkhzCnEKC2R1cmF0aW9uLmluGmIhKHRoaXMgaW4gZ2V0RmllbGQocnVsZXMsICdpbicpKSA/'
    'ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZ2V0RmllbGQocnVsZXMsICdpbi'
    'cpXSkgOiAnJ1ICaW4SmwEKBm5vdF9pbhgIIAMoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlv'
    'bkJpwkhmCmQKD2R1cmF0aW9uLm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFsdW'
    'UgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUgVu'
    'b3RJbhJSCgdleGFtcGxlGAkgAygLMhkuZ29vZ2xlLnByb3RvYnVmLkR1cmF0aW9uQh3CSBoKGA'
    'oQZHVyYXRpb24uZXhhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIACQgsKCWxlc3NfdGhh'
    'bkIOCgxncmVhdGVyX3RoYW4=');

@$core.Deprecated('Use timestampRulesDescriptor instead')
const TimestampRules$json = {
  '1': 'TimestampRules',
  '2': [
    {
      '1': 'const',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'const'
    },
    {
      '1': 'lt',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '9': 0,
      '10': 'lt'
    },
    {
      '1': 'lte',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '9': 0,
      '10': 'lte'
    },
    {'1': 'lt_now', '3': 7, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'ltNow'},
    {
      '1': 'gt',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '9': 1,
      '10': 'gt'
    },
    {
      '1': 'gte',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '9': 1,
      '10': 'gte'
    },
    {'1': 'gt_now', '3': 8, '4': 1, '5': 8, '8': {}, '9': 1, '10': 'gtNow'},
    {
      '1': 'within',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '8': {},
      '10': 'within'
    },
    {
      '1': 'example',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'example'
    },
  ],
  '5': [
    {'1': 1000, '2': 536870912},
  ],
  '8': [
    {'1': 'less_than'},
    {'1': 'greater_than'},
  ],
};

/// Descriptor for `TimestampRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timestampRulesDescriptor = $convert.base64Decode(
    'Cg5UaW1lc3RhbXBSdWxlcxKqAQoFY29uc3QYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZX'
    'N0YW1wQnjCSHUKcwoPdGltZXN0YW1wLmNvbnN0GmB0aGlzICE9IGdldEZpZWxkKHJ1bGVzLCAn'
    'Y29uc3QnKSA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3JtYXQoW2dldEZpZWxkKHJ1bGVzLC'
    'AnY29uc3QnKV0pIDogJydSBWNvbnN0Eq8BCgJsdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBCgAHCSH0KewoMdGltZXN0YW1wLmx0GmshaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcy'
    'hydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFu'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBLBAQoDbHRlGAQgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcEKQAcJIjAEKiQEKDXRpbWVzdGFtcC5sdGUaeCFoYXMocnVs'
    'ZXMuZ3RlKSAmJiAhaGFzKHJ1bGVzLmd0KSAmJiB0aGlzID4gcnVsZXMubHRlPyAndmFsdWUgbX'
    'VzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMubHRlXSkgOiAn'
    'J0gAUgNsdGUScwoGbHRfbm93GAcgASgIQlrCSFcKVQoQdGltZXN0YW1wLmx0X25vdxpBKHJ1bG'
    'VzLmx0X25vdyAmJiB0aGlzID4gbm93KSA/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiBub3cn'
    'IDogJydIAFIFbHROb3cSywcKAmd0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcE'
    'KcB8JImAcKfgoMdGltZXN0YW1wLmd0Gm4haGFzKHJ1bGVzLmx0KSAmJiAhaGFzKHJ1bGVzLmx0'
    'ZSkgJiYgdGhpcyA8PSBydWxlcy5ndD8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzJy'
    '5mb3JtYXQoW3J1bGVzLmd0XSkgOiAnJwq3AQoPdGltZXN0YW1wLmd0X2x0GqMBaGFzKHJ1bGVz'
    'Lmx0KSAmJiBydWxlcy5sdCA+PSBydWxlcy5ndCAmJiAodGhpcyA+PSBydWxlcy5sdCB8fCB0aG'
    'lzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIGFuZCBsZXNz'
    'IHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwq/AQoZdGltZXN0YW'
    '1wLmd0X2x0X2V4Y2x1c2l2ZRqhAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPCBydWxlcy5n'
    'dCAmJiAocnVsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3'
    'QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwg'
    'cnVsZXMubHRdKSA6ICcnCscBChB0aW1lc3RhbXAuZ3RfbHRlGrIBaGFzKHJ1bGVzLmx0ZSkgJi'
    'YgcnVsZXMubHRlID49IHJ1bGVzLmd0ICYmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPD0g'
    'cnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3MgdGhhbi'
    'BvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJwrPAQoa'
    'dGltZXN0YW1wLmd0X2x0ZV9leGNsdXNpdmUasAFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdG'
    'UgPCBydWxlcy5ndCAmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KT8g'
    'J3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0by'
    'AlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJ0gBUgJndBKYCAoDZ3RlGAYg'
    'ASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcELnB8JI4wcKjAEKDXRpbWVzdGFtcC5ndG'
    'UaeyFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDwgcnVsZXMuZ3Rl'
    'PyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcn'
    'VsZXMuZ3RlXSkgOiAnJwrGAQoQdGltZXN0YW1wLmd0ZV9sdBqxAWhhcyhydWxlcy5sdCkgJiYg'
    'cnVsZXMubHQgPj0gcnVsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPCBydW'
    'xlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5k'
    'IGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwrOAQoadG'
    'ltZXN0YW1wLmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwg'
    'cnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndm'
    'FsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVz'
    'Jy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtYBChF0aW1lc3RhbXAuZ3RlX2'
    'x0ZRrAAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUgJiYgKHRoaXMg'
    'PiBydWxlcy5sdGUgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZX'
    'IgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3Jt'
    'YXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJwreAQobdGltZXN0YW1wLmd0ZV9sdGVfZX'
    'hjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3RlICYmIChy'
    'dWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncm'
    'VhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5m'
    'b3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJ0gBUgNndGUSdgoGZ3Rfbm93GAggAS'
    'gIQl3CSFoKWAoQdGltZXN0YW1wLmd0X25vdxpEKHJ1bGVzLmd0X25vdyAmJiB0aGlzIDwgbm93'
    'KSA/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBub3cnIDogJydIAVIFZ3ROb3cSwAEKBn'
    'dpdGhpbhgJIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvbkKMAcJIiAEKhQEKEHRpbWVz'
    'dGFtcC53aXRoaW4acXRoaXMgPCBub3ctcnVsZXMud2l0aGluIHx8IHRoaXMgPiBub3crcnVsZX'
    'Mud2l0aGluID8gJ3ZhbHVlIG11c3QgYmUgd2l0aGluICVzIG9mIG5vdycuZm9ybWF0KFtydWxl'
    'cy53aXRoaW5dKSA6ICcnUgZ3aXRoaW4SVAoHZXhhbXBsZRgKIAMoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBCHsJIGwoZChF0aW1lc3RhbXAuZXhhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJ'
    'COgHEICAgIACQgsKCWxlc3NfdGhhbkIOCgxncmVhdGVyX3RoYW4=');

@$core.Deprecated('Use violationsDescriptor instead')
const Violations$json = {
  '1': 'Violations',
  '2': [
    {
      '1': 'violations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.Violation',
      '10': 'violations'
    },
  ],
};

/// Descriptor for `Violations`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List violationsDescriptor = $convert.base64Decode(
    'CgpWaW9sYXRpb25zEjcKCnZpb2xhdGlvbnMYASADKAsyFy5idWYudmFsaWRhdGUuVmlvbGF0aW'
    '9uUgp2aW9sYXRpb25z');

@$core.Deprecated('Use violationDescriptor instead')
const Violation$json = {
  '1': 'Violation',
  '2': [
    {
      '1': 'field',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.FieldPath',
      '10': 'field'
    },
    {
      '1': 'rule',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.FieldPath',
      '10': 'rule'
    },
    {'1': 'rule_id', '3': 2, '4': 1, '5': 9, '10': 'ruleId'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'for_key', '3': 4, '4': 1, '5': 8, '10': 'forKey'},
  ],
  '9': [
    {'1': 1, '2': 2},
  ],
  '10': ['field_path'],
};

/// Descriptor for `Violation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List violationDescriptor = $convert.base64Decode(
    'CglWaW9sYXRpb24SLQoFZmllbGQYBSABKAsyFy5idWYudmFsaWRhdGUuRmllbGRQYXRoUgVmaW'
    'VsZBIrCgRydWxlGAYgASgLMhcuYnVmLnZhbGlkYXRlLkZpZWxkUGF0aFIEcnVsZRIXCgdydWxl'
    'X2lkGAIgASgJUgZydWxlSWQSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIXCgdmb3Jfa2V5GA'
    'QgASgIUgZmb3JLZXlKBAgBEAJSCmZpZWxkX3BhdGg=');

@$core.Deprecated('Use fieldPathDescriptor instead')
const FieldPath$json = {
  '1': 'FieldPath',
  '2': [
    {
      '1': 'elements',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.FieldPathElement',
      '10': 'elements'
    },
  ],
};

/// Descriptor for `FieldPath`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldPathDescriptor = $convert.base64Decode(
    'CglGaWVsZFBhdGgSOgoIZWxlbWVudHMYASADKAsyHi5idWYudmFsaWRhdGUuRmllbGRQYXRoRW'
    'xlbWVudFIIZWxlbWVudHM=');

@$core.Deprecated('Use fieldPathElementDescriptor instead')
const FieldPathElement$json = {
  '1': 'FieldPathElement',
  '2': [
    {'1': 'field_number', '3': 1, '4': 1, '5': 5, '10': 'fieldNumber'},
    {'1': 'field_name', '3': 2, '4': 1, '5': 9, '10': 'fieldName'},
    {
      '1': 'field_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.google.protobuf.FieldDescriptorProto.Type',
      '10': 'fieldType'
    },
    {
      '1': 'key_type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.google.protobuf.FieldDescriptorProto.Type',
      '10': 'keyType'
    },
    {
      '1': 'value_type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.google.protobuf.FieldDescriptorProto.Type',
      '10': 'valueType'
    },
    {'1': 'index', '3': 6, '4': 1, '5': 4, '9': 0, '10': 'index'},
    {'1': 'bool_key', '3': 7, '4': 1, '5': 8, '9': 0, '10': 'boolKey'},
    {'1': 'int_key', '3': 8, '4': 1, '5': 3, '9': 0, '10': 'intKey'},
    {'1': 'uint_key', '3': 9, '4': 1, '5': 4, '9': 0, '10': 'uintKey'},
    {'1': 'string_key', '3': 10, '4': 1, '5': 9, '9': 0, '10': 'stringKey'},
  ],
  '8': [
    {'1': 'subscript'},
  ],
};

/// Descriptor for `FieldPathElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldPathElementDescriptor = $convert.base64Decode(
    'ChBGaWVsZFBhdGhFbGVtZW50EiEKDGZpZWxkX251bWJlchgBIAEoBVILZmllbGROdW1iZXISHQ'
    'oKZmllbGRfbmFtZRgCIAEoCVIJZmllbGROYW1lEkkKCmZpZWxkX3R5cGUYAyABKA4yKi5nb29n'
    'bGUucHJvdG9idWYuRmllbGREZXNjcmlwdG9yUHJvdG8uVHlwZVIJZmllbGRUeXBlEkUKCGtleV'
    '90eXBlGAQgASgOMiouZ29vZ2xlLnByb3RvYnVmLkZpZWxkRGVzY3JpcHRvclByb3RvLlR5cGVS'
    'B2tleVR5cGUSSQoKdmFsdWVfdHlwZRgFIAEoDjIqLmdvb2dsZS5wcm90b2J1Zi5GaWVsZERlc2'
    'NyaXB0b3JQcm90by5UeXBlUgl2YWx1ZVR5cGUSFgoFaW5kZXgYBiABKARIAFIFaW5kZXgSGwoI'
    'Ym9vbF9rZXkYByABKAhIAFIHYm9vbEtleRIZCgdpbnRfa2V5GAggASgDSABSBmludEtleRIbCg'
    'h1aW50X2tleRgJIAEoBEgAUgd1aW50S2V5Eh8KCnN0cmluZ19rZXkYCiABKAlIAFIJc3RyaW5n'
    'S2V5QgsKCXN1YnNjcmlwdA==');

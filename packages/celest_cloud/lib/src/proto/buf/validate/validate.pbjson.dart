//
//  Generated code. Do not modify.
//  source: buf/validate/validate.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ignoreDescriptor instead')
const Ignore$json = {
  '1': 'Ignore',
  '2': [
    {'1': 'IGNORE_UNSPECIFIED', '2': 0},
    {'1': 'IGNORE_IF_UNPOPULATED', '2': 1},
    {'1': 'IGNORE_IF_DEFAULT_VALUE', '2': 2},
    {'1': 'IGNORE_ALWAYS', '2': 3},
  ],
  '5': ['IGNORE_EMPTYIGNORE_DEFAULT'],
};

/// Descriptor for `Ignore`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ignoreDescriptor = $convert.base64Decode(
    'CgZJZ25vcmUSFgoSSUdOT1JFX1VOU1BFQ0lGSUVEEAASGQoVSUdOT1JFX0lGX1VOUE9QVUxBVE'
    'VEEAESGwoXSUdOT1JFX0lGX0RFRkFVTFRfVkFMVUUQAhIRCg1JR05PUkVfQUxXQVlTEAMqGklH'
    'Tk9SRV9FTVBUWUlHTk9SRV9ERUZBVUxU');

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

@$core.Deprecated('Use constraintDescriptor instead')
const Constraint$json = {
  '1': 'Constraint',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'expression', '3': 3, '4': 1, '5': 9, '10': 'expression'},
  ],
};

/// Descriptor for `Constraint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List constraintDescriptor = $convert.base64Decode(
    'CgpDb25zdHJhaW50Eg4KAmlkGAEgASgJUgJpZBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEh'
    '4KCmV4cHJlc3Npb24YAyABKAlSCmV4cHJlc3Npb24=');

@$core.Deprecated('Use messageConstraintsDescriptor instead')
const MessageConstraints$json = {
  '1': 'MessageConstraints',
  '2': [
    {'1': 'disabled', '3': 1, '4': 1, '5': 8, '10': 'disabled'},
    {
      '1': 'cel',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.Constraint',
      '10': 'cel'
    },
  ],
};

/// Descriptor for `MessageConstraints`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageConstraintsDescriptor = $convert.base64Decode(
    'ChJNZXNzYWdlQ29uc3RyYWludHMSGgoIZGlzYWJsZWQYASABKAhSCGRpc2FibGVkEioKA2NlbB'
    'gDIAMoCzIYLmJ1Zi52YWxpZGF0ZS5Db25zdHJhaW50UgNjZWw=');

@$core.Deprecated('Use oneofConstraintsDescriptor instead')
const OneofConstraints$json = {
  '1': 'OneofConstraints',
  '2': [
    {'1': 'required', '3': 1, '4': 1, '5': 8, '10': 'required'},
  ],
};

/// Descriptor for `OneofConstraints`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oneofConstraintsDescriptor = $convert.base64Decode(
    'ChBPbmVvZkNvbnN0cmFpbnRzEhoKCHJlcXVpcmVkGAEgASgIUghyZXF1aXJlZA==');

@$core.Deprecated('Use fieldConstraintsDescriptor instead')
const FieldConstraints$json = {
  '1': 'FieldConstraints',
  '2': [
    {
      '1': 'cel',
      '3': 23,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.Constraint',
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

/// Descriptor for `FieldConstraints`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldConstraintsDescriptor = $convert.base64Decode(
    'ChBGaWVsZENvbnN0cmFpbnRzEioKA2NlbBgXIAMoCzIYLmJ1Zi52YWxpZGF0ZS5Db25zdHJhaW'
    '50UgNjZWwSGgoIcmVxdWlyZWQYGSABKAhSCHJlcXVpcmVkEiwKBmlnbm9yZRgbIAEoDjIULmJ1'
    'Zi52YWxpZGF0ZS5JZ25vcmVSBmlnbm9yZRIwCgVmbG9hdBgBIAEoCzIYLmJ1Zi52YWxpZGF0ZS'
    '5GbG9hdFJ1bGVzSABSBWZsb2F0EjMKBmRvdWJsZRgCIAEoCzIZLmJ1Zi52YWxpZGF0ZS5Eb3Vi'
    'bGVSdWxlc0gAUgZkb3VibGUSMAoFaW50MzIYAyABKAsyGC5idWYudmFsaWRhdGUuSW50MzJSdW'
    'xlc0gAUgVpbnQzMhIwCgVpbnQ2NBgEIAEoCzIYLmJ1Zi52YWxpZGF0ZS5JbnQ2NFJ1bGVzSABS'
    'BWludDY0EjMKBnVpbnQzMhgFIAEoCzIZLmJ1Zi52YWxpZGF0ZS5VSW50MzJSdWxlc0gAUgZ1aW'
    '50MzISMwoGdWludDY0GAYgASgLMhkuYnVmLnZhbGlkYXRlLlVJbnQ2NFJ1bGVzSABSBnVpbnQ2'
    'NBIzCgZzaW50MzIYByABKAsyGS5idWYudmFsaWRhdGUuU0ludDMyUnVsZXNIAFIGc2ludDMyEj'
    'MKBnNpbnQ2NBgIIAEoCzIZLmJ1Zi52YWxpZGF0ZS5TSW50NjRSdWxlc0gAUgZzaW50NjQSNgoH'
    'Zml4ZWQzMhgJIAEoCzIaLmJ1Zi52YWxpZGF0ZS5GaXhlZDMyUnVsZXNIAFIHZml4ZWQzMhI2Cg'
    'dmaXhlZDY0GAogASgLMhouYnVmLnZhbGlkYXRlLkZpeGVkNjRSdWxlc0gAUgdmaXhlZDY0EjkK'
    'CHNmaXhlZDMyGAsgASgLMhsuYnVmLnZhbGlkYXRlLlNGaXhlZDMyUnVsZXNIAFIIc2ZpeGVkMz'
    'ISOQoIc2ZpeGVkNjQYDCABKAsyGy5idWYudmFsaWRhdGUuU0ZpeGVkNjRSdWxlc0gAUghzZml4'
    'ZWQ2NBItCgRib29sGA0gASgLMhcuYnVmLnZhbGlkYXRlLkJvb2xSdWxlc0gAUgRib29sEjMKBn'
    'N0cmluZxgOIAEoCzIZLmJ1Zi52YWxpZGF0ZS5TdHJpbmdSdWxlc0gAUgZzdHJpbmcSMAoFYnl0'
    'ZXMYDyABKAsyGC5idWYudmFsaWRhdGUuQnl0ZXNSdWxlc0gAUgVieXRlcxItCgRlbnVtGBAgAS'
    'gLMhcuYnVmLnZhbGlkYXRlLkVudW1SdWxlc0gAUgRlbnVtEjkKCHJlcGVhdGVkGBIgASgLMhsu'
    'YnVmLnZhbGlkYXRlLlJlcGVhdGVkUnVsZXNIAFIIcmVwZWF0ZWQSKgoDbWFwGBMgASgLMhYuYn'
    'VmLnZhbGlkYXRlLk1hcFJ1bGVzSABSA21hcBIqCgNhbnkYFCABKAsyFi5idWYudmFsaWRhdGUu'
    'QW55UnVsZXNIAFIDYW55EjkKCGR1cmF0aW9uGBUgASgLMhsuYnVmLnZhbGlkYXRlLkR1cmF0aW'
    '9uUnVsZXNIAFIIZHVyYXRpb24SPAoJdGltZXN0YW1wGBYgASgLMhwuYnVmLnZhbGlkYXRlLlRp'
    'bWVzdGFtcFJ1bGVzSABSCXRpbWVzdGFtcEIGCgR0eXBlSgQIGBAZSgQIGhAbUgdza2lwcGVkUg'
    'xpZ25vcmVfZW1wdHk=');

@$core.Deprecated('Use predefinedConstraintsDescriptor instead')
const PredefinedConstraints$json = {
  '1': 'PredefinedConstraints',
  '2': [
    {
      '1': 'cel',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.buf.validate.Constraint',
      '10': 'cel'
    },
  ],
  '9': [
    {'1': 24, '2': 25},
    {'1': 26, '2': 27},
  ],
  '10': ['skippedignore_empty'],
};

/// Descriptor for `PredefinedConstraints`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predefinedConstraintsDescriptor = $convert.base64Decode(
    'ChVQcmVkZWZpbmVkQ29uc3RyYWludHMSKgoDY2VsGAEgAygLMhguYnVmLnZhbGlkYXRlLkNvbn'
    'N0cmFpbnRSA2NlbEoECBgQGUoECBoQG1ITc2tpcHBlZGlnbm9yZV9lbXB0eQ==');

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
    'CgpGbG9hdFJ1bGVzEnAKBWNvbnN0GAEgASgCQlrCSFcKVQoLZmxvYXQuY29uc3QaRnRoaXMgIT'
    '0gcnVsZXMuY29uc3QgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycuZm9ybWF0KFtydWxlcy5jb25z'
    'dF0pIDogJydSBWNvbnN0EqMBCgJsdBgCIAEoAkKQAcJIjAEKiQEKCGZsb2F0Lmx0Gn0haGFzKH'
    'J1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID49'
    'IHJ1bGVzLmx0KT8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLm'
    'x0XSkgOiAnJ0gAUgJsdBK0AQoDbHRlGAMgASgCQp8BwkibAQqYAQoJZmxvYXQubHRlGooBIWhh'
    'cyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmICh0aGlzLmlzTmFuKCkgfHwgdGhpcy'
    'A+IHJ1bGVzLmx0ZSk/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycu'
    'Zm9ybWF0KFtydWxlcy5sdGVdKSA6ICcnSABSA2x0ZRLzBwoCZ3QYBCABKAJC4AfCSNwHCo0BCg'
    'hmbG9hdC5ndBqAASFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiAodGhpcy5p'
    'c05hbigpIHx8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW'
    '4gJXMnLmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcnCsMBCgtmbG9hdC5ndF9sdBqzAWhhcyhydWxl'
    'cy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID'
    '49IHJ1bGVzLmx0IHx8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVy'
    'IHRoYW4gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKS'
    'A6ICcnCs0BChVmbG9hdC5ndF9sdF9leGNsdXNpdmUaswFoYXMocnVsZXMubHQpICYmIHJ1bGVz'
    'Lmx0IDwgcnVsZXMuZ3QgJiYgKHRoaXMuaXNOYW4oKSB8fCAocnVsZXMubHQgPD0gdGhpcyAmJi'
    'B0aGlzIDw9IHJ1bGVzLmd0KSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBs'
    'ZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwrTAQoMZmxvYX'
    'QuZ3RfbHRlGsIBaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ICYmICh0'
    'aGlzLmlzTmFuKCkgfHwgdGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3'
    'ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8g'
    'JXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJycK3QEKFmZsb2F0Lmd0X2x0ZV'
    '9leGNsdXNpdmUawgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPCBydWxlcy5ndCAmJiAo'
    'dGhpcy5pc05hbigpIHx8IChydWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPD0gcnVsZXMuZ3QpKT'
    '8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0'
    'byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJ0gBUgJndBK/CAoDZ3RlGA'
    'UgASgCQqoIwkimCAqbAQoJZmxvYXQuZ3RlGo0BIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxl'
    'cy5sdGUpICYmICh0aGlzLmlzTmFuKCkgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdX'
    'N0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGVdKSA6'
    'ICcnCtIBCgxmbG9hdC5ndGVfbHQawQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bG'
    'VzLmd0ZSAmJiAodGhpcy5pc05hbigpIHx8IHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8IHJ1'
    'bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbm'
    'QgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtwBChZm'
    'bG9hdC5ndGVfbHRfZXhjbHVzaXZlGsEBaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IHJ1bG'
    'VzLmd0ZSAmJiAodGhpcy5pc05hbigpIHx8IChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBy'
    'dWxlcy5ndGUpKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG'
    '9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwriAQoN'
    'ZmxvYXQuZ3RlX2x0ZRrQAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndG'
    'UgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPCBydWxlcy5n'
    'dGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3'
    'MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDog'
    'JycK7AEKF2Zsb2F0Lmd0ZV9sdGVfZXhjbHVzaXZlGtABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZX'
    'MubHRlIDwgcnVsZXMuZ3RlICYmICh0aGlzLmlzTmFuKCkgfHwgKHJ1bGVzLmx0ZSA8IHRoaXMg'
    'JiYgdGhpcyA8IHJ1bGVzLmd0ZSkpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZX'
    'F1YWwgdG8gJXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0'
    'ZSwgcnVsZXMubHRlXSkgOiAnJ0gBUgNndGUSeQoCaW4YBiADKAJCacJIZgpkCghmbG9hdC5pbh'
    'pYISh0aGlzIGluIGR5bihydWxlcylbJ2luJ10pID8gJ3ZhbHVlIG11c3QgYmUgaW4gbGlzdCAl'
    'cycuZm9ybWF0KFtkeW4ocnVsZXMpWydpbiddXSkgOiAnJ1ICaW4SfQoGbm90X2luGAcgAygCQm'
    'bCSGMKYQoMZmxvYXQubm90X2luGlF0aGlzIGluIHJ1bGVzLm5vdF9pbiA/ICd2YWx1ZSBtdXN0'
    'IG5vdCBiZSBpbiBsaXN0ICVzJy5mb3JtYXQoW3J1bGVzLm5vdF9pbl0pIDogJydSBW5vdEluEn'
    '0KBmZpbml0ZRgIIAEoCEJlwkhiCmAKDGZsb2F0LmZpbml0ZRpQcnVsZXMuZmluaXRlID8gKHRo'
    'aXMuaXNOYW4oKSB8fCB0aGlzLmlzSW5mKCkgPyAndmFsdWUgbXVzdCBiZSBmaW5pdGUnIDogJy'
    'cpIDogJydSBmZpbml0ZRI0CgdleGFtcGxlGAkgAygCQhrCSBcKFQoNZmxvYXQuZXhhbXBsZRoE'
    'dHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIACQgsKCWxlc3NfdGhhbkIOCgxncmVhdGVyX3RoYW4=');

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
    'CgtEb3VibGVSdWxlcxJxCgVjb25zdBgBIAEoAUJbwkhYClYKDGRvdWJsZS5jb25zdBpGdGhpcy'
    'AhPSBydWxlcy5jb25zdCA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3JtYXQoW3J1bGVzLmNv'
    'bnN0XSkgOiAnJ1IFY29uc3QSpAEKAmx0GAIgASgBQpEBwkiNAQqKAQoJZG91YmxlLmx0Gn0haG'
    'FzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlz'
    'ID49IHJ1bGVzLmx0KT8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bG'
    'VzLmx0XSkgOiAnJ0gAUgJsdBK1AQoDbHRlGAMgASgBQqABwkicAQqZAQoKZG91YmxlLmx0ZRqK'
    'ASFoYXMocnVsZXMuZ3RlKSAmJiAhaGFzKHJ1bGVzLmd0KSAmJiAodGhpcy5pc05hbigpIHx8IH'
    'RoaXMgPiBydWxlcy5sdGUpPyAndmFsdWUgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8g'
    'JXMnLmZvcm1hdChbcnVsZXMubHRlXSkgOiAnJ0gAUgNsdGUS+AcKAmd0GAQgASgBQuUHwkjhBw'
    'qOAQoJZG91YmxlLmd0GoABIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmICh0'
    'aGlzLmlzTmFuKCkgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZX'
    'IgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJycKxAEKDGRvdWJsZS5ndF9sdBqzAWhh'
    'cyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMuaXNOYW4oKSB8fC'
    'B0aGlzID49IHJ1bGVzLmx0IHx8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBn'
    'cmVhdGVyIHRoYW4gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZX'
    'MubHRdKSA6ICcnCs4BChZkb3VibGUuZ3RfbHRfZXhjbHVzaXZlGrMBaGFzKHJ1bGVzLmx0KSAm'
    'JiBydWxlcy5sdCA8IHJ1bGVzLmd0ICYmICh0aGlzLmlzTmFuKCkgfHwgKHJ1bGVzLmx0IDw9IH'
    'RoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCkpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4g'
    'JXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycK1A'
    'EKDWRvdWJsZS5ndF9sdGUawgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMu'
    'Z3QgJiYgKHRoaXMuaXNOYW4oKSB8fCB0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPD0gcnVsZX'
    'MuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3MgdGhhbiBvciBl'
    'cXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJwreAQoXZG91Ym'
    'xlLmd0X2x0ZV9leGNsdXNpdmUawgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPCBydWxl'
    'cy5ndCAmJiAodGhpcy5pc05hbigpIHx8IChydWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPD0gcn'
    'VsZXMuZ3QpKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiBv'
    'ciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJ0gBUgJndB'
    'LECAoDZ3RlGAUgASgBQq8IwkirCAqcAQoKZG91YmxlLmd0ZRqNASFoYXMocnVsZXMubHQpICYm'
    'ICFoYXMocnVsZXMubHRlKSAmJiAodGhpcy5pc05hbigpIHx8IHRoaXMgPCBydWxlcy5ndGUpPy'
    'AndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVs'
    'ZXMuZ3RlXSkgOiAnJwrTAQoNZG91YmxlLmd0ZV9sdBrBAWhhcyhydWxlcy5sdCkgJiYgcnVsZX'
    'MubHQgPj0gcnVsZXMuZ3RlICYmICh0aGlzLmlzTmFuKCkgfHwgdGhpcyA+PSBydWxlcy5sdCB8'
    'fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdW'
    'FsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0p'
    'IDogJycK3QEKF2RvdWJsZS5ndGVfbHRfZXhjbHVzaXZlGsEBaGFzKHJ1bGVzLmx0KSAmJiBydW'
    'xlcy5sdCA8IHJ1bGVzLmd0ZSAmJiAodGhpcy5pc05hbigpIHx8IChydWxlcy5sdCA8PSB0aGlz'
    'ICYmIHRoaXMgPCBydWxlcy5ndGUpKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIG'
    'VxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0'
    'XSkgOiAnJwrjAQoOZG91YmxlLmd0ZV9sdGUa0AFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdG'
    'UgPj0gcnVsZXMuZ3RlICYmICh0aGlzLmlzTmFuKCkgfHwgdGhpcyA+IHJ1bGVzLmx0ZSB8fCB0'
    'aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIH'
    'RvICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBy'
    'dWxlcy5sdGVdKSA6ICcnCu0BChhkb3VibGUuZ3RlX2x0ZV9leGNsdXNpdmUa0AFoYXMocnVsZX'
    'MubHRlKSAmJiBydWxlcy5sdGUgPCBydWxlcy5ndGUgJiYgKHRoaXMuaXNOYW4oKSB8fCAocnVs'
    'ZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKSk/ICd2YWx1ZSBtdXN0IGJlIGdyZW'
    'F0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZv'
    'cm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnSAFSA2d0ZRJ6CgJpbhgGIAMoAUJqwk'
    'hnCmUKCWRvdWJsZS5pbhpYISh0aGlzIGluIGR5bihydWxlcylbJ2luJ10pID8gJ3ZhbHVlIG11'
    'c3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtkeW4ocnVsZXMpWydpbiddXSkgOiAnJ1ICaW4Sfg'
    'oGbm90X2luGAcgAygBQmfCSGQKYgoNZG91YmxlLm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3Rf'
    'aW4gPyAndmFsdWUgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW'
    '5dKSA6ICcnUgVub3RJbhJ+CgZmaW5pdGUYCCABKAhCZsJIYwphCg1kb3VibGUuZmluaXRlGlBy'
    'dWxlcy5maW5pdGUgPyAodGhpcy5pc05hbigpIHx8IHRoaXMuaXNJbmYoKSA/ICd2YWx1ZSBtdX'
    'N0IGJlIGZpbml0ZScgOiAnJykgOiAnJ1IGZmluaXRlEjUKB2V4YW1wbGUYCSADKAFCG8JIGAoW'
    'Cg5kb3VibGUuZXhhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIACQgsKCWxlc3NfdGhhbk'
    'IOCgxncmVhdGVyX3RoYW4=');

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
    'CgpJbnQzMlJ1bGVzEnAKBWNvbnN0GAEgASgFQlrCSFcKVQoLaW50MzIuY29uc3QaRnRoaXMgIT'
    '0gcnVsZXMuY29uc3QgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycuZm9ybWF0KFtydWxlcy5jb25z'
    'dF0pIDogJydSBWNvbnN0Eo4BCgJsdBgCIAEoBUJ8wkh5CncKCGludDMyLmx0GmshaGFzKHJ1bG'
    'VzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11'
    'c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKhAQoDbH'
    'RlGAMgASgFQowBwkiIAQqFAQoJaW50MzIubHRlGnghaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhy'
    'dWxlcy5ndCkgJiYgdGhpcyA+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuIG'
    '9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFIDbHRlEpsHCgJndBgE'
    'IAEoBUKIB8JIhAcKegoIaW50MzIuZ3QabiFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubH'
    'RlKSAmJiB0aGlzIDw9IHJ1bGVzLmd0PyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMn'
    'LmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcnCrMBCgtpbnQzMi5ndF9sdBqjAWhhcyhydWxlcy5sdC'
    'kgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8'
    'PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aG'
    'FuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKuwEKFWludDMyLmd0X2x0'
    'X2V4Y2x1c2l2ZRqhAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPCBydWxlcy5ndCAmJiAocn'
    'VsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3Jl'
    'YXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubH'
    'RdKSA6ICcnCsMBCgxpbnQzMi5ndF9sdGUasgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUg'
    'Pj0gcnVsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8PSBydWxlcy5ndCk/IC'
    'd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdGVdKSA6ICcnCssBChZpbnQzMi5ndF9sdG'
    'VfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYg'
    'KHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIG'
    'dyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVs'
    'ZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS6AcKA2d0ZRgFIAEoBULTB8JIzwcKiAEKCW'
    'ludDMyLmd0ZRp7IWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPCBy'
    'dWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm'
    '9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsIBCgxpbnQzMi5ndGVfbHQasQFoYXMocnVsZXMubHQp'
    'ICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzID'
    'wgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVz'
    'IGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKyg'
    'EKFmludDMyLmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwg'
    'cnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndm'
    'FsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVz'
    'Jy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtIBCg1pbnQzMi5ndGVfbHRlGs'
    'ABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+IHJ1'
    'bGVzLmx0ZSB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChb'
    'cnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnCtoBChdpbnQzMi5ndGVfbHRlX2V4Y2x1c2l2ZR'
    'q+AWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRl'
    'IDwgdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFty'
    'dWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJydIAVIDZ3RlEnkKAmluGAYgAygFQmnCSGYKZAoIaW'
    '50MzIuaW4aWCEodGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2YWx1ZSBtdXN0IGJlIGlu'
    'IGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJydSAmluEn0KBm5vdF9pbh'
    'gHIAMoBUJmwkhjCmEKDGludDMyLm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFs'
    'dWUgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUg'
    'Vub3RJbhI0CgdleGFtcGxlGAggAygFQhrCSBcKFQoNaW50MzIuZXhhbXBsZRoEdHJ1ZVIHZXhh'
    'bXBsZSoJCOgHEICAgIACQgsKCWxlc3NfdGhhbkIOCgxncmVhdGVyX3RoYW4=');

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
    'CgpJbnQ2NFJ1bGVzEnAKBWNvbnN0GAEgASgDQlrCSFcKVQoLaW50NjQuY29uc3QaRnRoaXMgIT'
    '0gcnVsZXMuY29uc3QgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycuZm9ybWF0KFtydWxlcy5jb25z'
    'dF0pIDogJydSBWNvbnN0Eo4BCgJsdBgCIAEoA0J8wkh5CncKCGludDY0Lmx0GmshaGFzKHJ1bG'
    'VzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVlIG11'
    'c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKhAQoDbH'
    'RlGAMgASgDQowBwkiIAQqFAQoJaW50NjQubHRlGnghaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhy'
    'dWxlcy5ndCkgJiYgdGhpcyA+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuIG'
    '9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFIDbHRlEpsHCgJndBgE'
    'IAEoA0KIB8JIhAcKegoIaW50NjQuZ3QabiFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubH'
    'RlKSAmJiB0aGlzIDw9IHJ1bGVzLmd0PyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMn'
    'LmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcnCrMBCgtpbnQ2NC5ndF9sdBqjAWhhcyhydWxlcy5sdC'
    'kgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8'
    'PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aG'
    'FuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKuwEKFWludDY0Lmd0X2x0'
    'X2V4Y2x1c2l2ZRqhAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPCBydWxlcy5ndCAmJiAocn'
    'VsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3Jl'
    'YXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubH'
    'RdKSA6ICcnCsMBCgxpbnQ2NC5ndF9sdGUasgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUg'
    'Pj0gcnVsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8PSBydWxlcy5ndCk/IC'
    'd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdGVdKSA6ICcnCssBChZpbnQ2NC5ndF9sdG'
    'VfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYg'
    'KHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIG'
    'dyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVs'
    'ZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS6AcKA2d0ZRgFIAEoA0LTB8JIzwcKiAEKCW'
    'ludDY0Lmd0ZRp7IWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPCBy'
    'dWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm'
    '9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsIBCgxpbnQ2NC5ndGVfbHQasQFoYXMocnVsZXMubHQp'
    'ICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzID'
    'wgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVz'
    'IGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKyg'
    'EKFmludDY0Lmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwg'
    'cnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndm'
    'FsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVz'
    'Jy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtIBCg1pbnQ2NC5ndGVfbHRlGs'
    'ABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+IHJ1'
    'bGVzLmx0ZSB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChb'
    'cnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnCtoBChdpbnQ2NC5ndGVfbHRlX2V4Y2x1c2l2ZR'
    'q+AWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRl'
    'IDwgdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFty'
    'dWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJydIAVIDZ3RlEnkKAmluGAYgAygDQmnCSGYKZAoIaW'
    '50NjQuaW4aWCEodGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2YWx1ZSBtdXN0IGJlIGlu'
    'IGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJydSAmluEn0KBm5vdF9pbh'
    'gHIAMoA0JmwkhjCmEKDGludDY0Lm5vdF9pbhpRdGhpcyBpbiBydWxlcy5ub3RfaW4gPyAndmFs'
    'dWUgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydWxlcy5ub3RfaW5dKSA6ICcnUg'
    'Vub3RJbhI0CgdleGFtcGxlGAkgAygDQhrCSBcKFQoNaW50NjQuZXhhbXBsZRoEdHJ1ZVIHZXhh'
    'bXBsZSoJCOgHEICAgIACQgsKCWxlc3NfdGhhbkIOCgxncmVhdGVyX3RoYW4=');

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
    'CgtVSW50MzJSdWxlcxJxCgVjb25zdBgBIAEoDUJbwkhYClYKDHVpbnQzMi5jb25zdBpGdGhpcy'
    'AhPSBydWxlcy5jb25zdCA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3JtYXQoW3J1bGVzLmNv'
    'bnN0XSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgASgNQn3CSHoKeAoJdWludDMyLmx0GmshaGFzKH'
    'J1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVl'
    'IG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQ'
    'oDbHRlGAMgASgNQo0BwkiJAQqGAQoKdWludDMyLmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFo'
    'YXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdG'
    'hhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoC'
    'Z3QYBCABKA1CjQfCSIkHCnsKCXVpbnQzMi5ndBpuIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydW'
    'xlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJycKtAEKDHVpbnQzMi5ndF9sdBqjAWhhcyhydW'
    'xlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwg'
    'dGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbG'
    'VzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvAEKFnVpbnQz'
    'Mi5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3'
    'QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0'
    'IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIH'
    'J1bGVzLmx0XSkgOiAnJwrEAQoNdWludDMyLmd0X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1'
    'bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bG'
    'VzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3Vpbn'
    'QzMi5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVs'
    'ZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZS'
    'BtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZv'
    'cm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS7QcKA2d0ZRgFIAEoDULYB8'
    'JI1AcKiQEKCnVpbnQzMi5ndGUaeyFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAm'
    'JiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YW'
    'wgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkgOiAnJwrDAQoNdWludDMyLmd0ZV9sdBqxAWhh'
    'cyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLm'
    'x0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLm'
    'x0XSkgOiAnJwrLAQoXdWludDMyLmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYm'
    'IHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydW'
    'xlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3Ig'
    'bGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg51aW'
    '50MzIuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUg'
    'JiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IG'
    'JlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJwrbAQoYdWludDMyLmd0ZV'
    '9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3Rl'
    'ICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdC'
    'BiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJ0gBUgNndGUSegoCaW4YBi'
    'ADKA1CasJIZwplCgl1aW50MzIuaW4aWCEodGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2'
    'YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJy'
    'dSAmluEn4KBm5vdF9pbhgHIAMoDUJnwkhkCmIKDXVpbnQzMi5ub3RfaW4aUXRoaXMgaW4gcnVs'
    'ZXMubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZX'
    'Mubm90X2luXSkgOiAnJ1IFbm90SW4SNQoHZXhhbXBsZRgIIAMoDUIbwkgYChYKDnVpbnQzMi5l'
    'eGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJCCwoJbGVzc190aGFuQg4KDGdyZWF0ZX'
    'JfdGhhbg==');

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
    'CgtVSW50NjRSdWxlcxJxCgVjb25zdBgBIAEoBEJbwkhYClYKDHVpbnQ2NC5jb25zdBpGdGhpcy'
    'AhPSBydWxlcy5jb25zdCA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3JtYXQoW3J1bGVzLmNv'
    'bnN0XSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgASgEQn3CSHoKeAoJdWludDY0Lmx0GmshaGFzKH'
    'J1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVl'
    'IG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQ'
    'oDbHRlGAMgASgEQo0BwkiJAQqGAQoKdWludDY0Lmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFo'
    'YXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdG'
    'hhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoC'
    'Z3QYBCABKARCjQfCSIkHCnsKCXVpbnQ2NC5ndBpuIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydW'
    'xlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJycKtAEKDHVpbnQ2NC5ndF9sdBqjAWhhcyhydW'
    'xlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwg'
    'dGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbG'
    'VzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvAEKFnVpbnQ2'
    'NC5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3'
    'QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0'
    'IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIH'
    'J1bGVzLmx0XSkgOiAnJwrEAQoNdWludDY0Lmd0X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1'
    'bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bG'
    'VzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3Vpbn'
    'Q2NC5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVs'
    'ZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZS'
    'BtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZv'
    'cm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS7QcKA2d0ZRgFIAEoBELYB8'
    'JI1AcKiQEKCnVpbnQ2NC5ndGUaeyFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAm'
    'JiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YW'
    'wgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkgOiAnJwrDAQoNdWludDY0Lmd0ZV9sdBqxAWhh'
    'cyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLm'
    'x0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLm'
    'x0XSkgOiAnJwrLAQoXdWludDY0Lmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYm'
    'IHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydW'
    'xlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3Ig'
    'bGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg51aW'
    '50NjQuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUg'
    'JiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IG'
    'JlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJwrbAQoYdWludDY0Lmd0ZV'
    '9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3Rl'
    'ICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdC'
    'BiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJ0gBUgNndGUSegoCaW4YBi'
    'ADKARCasJIZwplCgl1aW50NjQuaW4aWCEodGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2'
    'YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJy'
    'dSAmluEn4KBm5vdF9pbhgHIAMoBEJnwkhkCmIKDXVpbnQ2NC5ub3RfaW4aUXRoaXMgaW4gcnVs'
    'ZXMubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZX'
    'Mubm90X2luXSkgOiAnJ1IFbm90SW4SNQoHZXhhbXBsZRgIIAMoBEIbwkgYChYKDnVpbnQ2NC5l'
    'eGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJCCwoJbGVzc190aGFuQg4KDGdyZWF0ZX'
    'JfdGhhbg==');

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
    'CgtTSW50MzJSdWxlcxJxCgVjb25zdBgBIAEoEUJbwkhYClYKDHNpbnQzMi5jb25zdBpGdGhpcy'
    'AhPSBydWxlcy5jb25zdCA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3JtYXQoW3J1bGVzLmNv'
    'bnN0XSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgASgRQn3CSHoKeAoJc2ludDMyLmx0GmshaGFzKH'
    'J1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVl'
    'IG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQ'
    'oDbHRlGAMgASgRQo0BwkiJAQqGAQoKc2ludDMyLmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFo'
    'YXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdG'
    'hhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoC'
    'Z3QYBCABKBFCjQfCSIkHCnsKCXNpbnQzMi5ndBpuIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydW'
    'xlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJycKtAEKDHNpbnQzMi5ndF9sdBqjAWhhcyhydW'
    'xlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwg'
    'dGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbG'
    'VzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvAEKFnNpbnQz'
    'Mi5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3'
    'QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0'
    'IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIH'
    'J1bGVzLmx0XSkgOiAnJwrEAQoNc2ludDMyLmd0X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1'
    'bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bG'
    'VzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3Npbn'
    'QzMi5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVs'
    'ZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZS'
    'BtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZv'
    'cm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS7QcKA2d0ZRgFIAEoEULYB8'
    'JI1AcKiQEKCnNpbnQzMi5ndGUaeyFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAm'
    'JiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YW'
    'wgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkgOiAnJwrDAQoNc2ludDMyLmd0ZV9sdBqxAWhh'
    'cyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLm'
    'x0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLm'
    'x0XSkgOiAnJwrLAQoXc2ludDMyLmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYm'
    'IHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydW'
    'xlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3Ig'
    'bGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg5zaW'
    '50MzIuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUg'
    'JiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IG'
    'JlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJwrbAQoYc2ludDMyLmd0ZV'
    '9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3Rl'
    'ICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdC'
    'BiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJ0gBUgNndGUSegoCaW4YBi'
    'ADKBFCasJIZwplCglzaW50MzIuaW4aWCEodGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2'
    'YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJy'
    'dSAmluEn4KBm5vdF9pbhgHIAMoEUJnwkhkCmIKDXNpbnQzMi5ub3RfaW4aUXRoaXMgaW4gcnVs'
    'ZXMubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZX'
    'Mubm90X2luXSkgOiAnJ1IFbm90SW4SNQoHZXhhbXBsZRgIIAMoEUIbwkgYChYKDnNpbnQzMi5l'
    'eGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJCCwoJbGVzc190aGFuQg4KDGdyZWF0ZX'
    'JfdGhhbg==');

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
    'CgtTSW50NjRSdWxlcxJxCgVjb25zdBgBIAEoEkJbwkhYClYKDHNpbnQ2NC5jb25zdBpGdGhpcy'
    'AhPSBydWxlcy5jb25zdCA/ICd2YWx1ZSBtdXN0IGVxdWFsICVzJy5mb3JtYXQoW3J1bGVzLmNv'
    'bnN0XSkgOiAnJ1IFY29uc3QSjwEKAmx0GAIgASgSQn3CSHoKeAoJc2ludDY0Lmx0GmshaGFzKH'
    'J1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3ZhbHVl'
    'IG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdBKiAQ'
    'oDbHRlGAMgASgSQo0BwkiJAQqGAQoKc2ludDY0Lmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFo'
    'YXMocnVsZXMuZ3QpICYmIHRoaXMgPiBydWxlcy5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdG'
    'hhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5sdGVdKSA6ICcnSABSA2x0ZRKgBwoC'
    'Z3QYBCABKBJCjQfCSIkHCnsKCXNpbnQ2NC5ndBpuIWhhcyhydWxlcy5sdCkgJiYgIWhhcyhydW'
    'xlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJycKtAEKDHNpbnQ2NC5ndF9sdBqjAWhhcyhydW'
    'xlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwg'
    'dGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbG'
    'VzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvAEKFnNpbnQ2'
    'NC5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3'
    'QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0'
    'IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIH'
    'J1bGVzLmx0XSkgOiAnJwrEAQoNc2ludDY0Lmd0X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1'
    'bGVzLmx0ZSA+PSBydWxlcy5ndCAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bG'
    'VzLmd0KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJycKzAEKF3Npbn'
    'Q2NC5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVs'
    'ZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZS'
    'BtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZv'
    'cm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS7QcKA2d0ZRgFIAEoEkLYB8'
    'JI1AcKiQEKCnNpbnQ2NC5ndGUaeyFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAm'
    'JiB0aGlzIDwgcnVsZXMuZ3RlPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YW'
    'wgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlXSkgOiAnJwrDAQoNc2ludDY0Lmd0ZV9sdBqxAWhh'
    'cyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3RlICYmICh0aGlzID49IHJ1bGVzLm'
    'x0IHx8IHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3Ig'
    'ZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLm'
    'x0XSkgOiAnJwrLAQoXc2ludDY0Lmd0ZV9sdF9leGNsdXNpdmUarwFoYXMocnVsZXMubHQpICYm'
    'IHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPCBydW'
    'xlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3Ig'
    'bGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcnCtMBCg5zaW'
    '50NjQuZ3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUg'
    'JiYgKHRoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IG'
    'JlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJwrbAQoYc2ludDY0Lmd0ZV'
    '9sdGVfZXhjbHVzaXZlGr4BaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3Rl'
    'ICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdC'
    'BiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJ0gBUgNndGUSegoCaW4YBi'
    'ADKBJCasJIZwplCglzaW50NjQuaW4aWCEodGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2'
    'YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJy'
    'dSAmluEn4KBm5vdF9pbhgHIAMoEkJnwkhkCmIKDXNpbnQ2NC5ub3RfaW4aUXRoaXMgaW4gcnVs'
    'ZXMubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZX'
    'Mubm90X2luXSkgOiAnJ1IFbm90SW4SNQoHZXhhbXBsZRgIIAMoEkIbwkgYChYKDnNpbnQ2NC5l'
    'eGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJCCwoJbGVzc190aGFuQg4KDGdyZWF0ZX'
    'JfdGhhbg==');

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
    'CgxGaXhlZDMyUnVsZXMScgoFY29uc3QYASABKAdCXMJIWQpXCg1maXhlZDMyLmNvbnN0GkZ0aG'
    'lzICE9IHJ1bGVzLmNvbnN0ID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZvcm1hdChbcnVsZXMu'
    'Y29uc3RdKSA6ICcnUgVjb25zdBKQAQoCbHQYAiABKAdCfsJIewp5CgpmaXhlZDMyLmx0GmshaG'
    'FzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3Zh'
    'bHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdB'
    'KjAQoDbHRlGAMgASgHQo4BwkiKAQqHAQoLZml4ZWQzMi5sdGUaeCFoYXMocnVsZXMuZ3RlKSAm'
    'JiAhaGFzKHJ1bGVzLmd0KSAmJiB0aGlzID4gcnVsZXMubHRlPyAndmFsdWUgbXVzdCBiZSBsZX'
    'NzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMubHRlXSkgOiAnJ0gAUgNsdGUS'
    'pQcKAmd0GAQgASgHQpIHwkiOBwp8CgpmaXhlZDMyLmd0Gm4haGFzKHJ1bGVzLmx0KSAmJiAhaG'
    'FzKHJ1bGVzLmx0ZSkgJiYgdGhpcyA8PSBydWxlcy5ndD8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRl'
    'ciB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0XSkgOiAnJwq1AQoNZml4ZWQzMi5ndF9sdBqjAW'
    'hhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMu'
    'bHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcy'
    'BhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvQEK'
    'F2ZpeGVkMzIuZ3RfbHRfZXhjbHVzaXZlGqEBaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IH'
    'J1bGVzLmd0ICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bG'
    'VzLmd0LCBydWxlcy5sdF0pIDogJycKxQEKDmZpeGVkMzIuZ3RfbHRlGrIBaGFzKHJ1bGVzLmx0'
    'ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ICYmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaX'
    'MgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3Mg'
    'dGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJw'
    'rNAQoYZml4ZWQzMi5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMu'
    'bHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndC'
    'k/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwg'
    'dG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS8gcKA2d0ZR'
    'gFIAEoB0LdB8JI2QcKigEKC2ZpeGVkMzIuZ3RlGnshaGFzKHJ1bGVzLmx0KSAmJiAhaGFzKHJ1'
    'bGVzLmx0ZSkgJiYgdGhpcyA8IHJ1bGVzLmd0ZT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZV0pIDogJycKxAEKDmZpeGVkMzIu'
    'Z3RlX2x0GrEBaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA+PSBydWxlcy5ndGUgJiYgKHRoaX'
    'MgPj0gcnVsZXMubHQgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0'
    'ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLm'
    'd0ZSwgcnVsZXMubHRdKSA6ICcnCswBChhmaXhlZDMyLmd0ZV9sdF9leGNsdXNpdmUarwFoYXMo'
    'cnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzIC'
    'YmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1'
    'YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKS'
    'A6ICcnCtQBCg9maXhlZDMyLmd0ZV9sdGUawAFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUg'
    'Pj0gcnVsZXMuZ3RlICYmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPCBydWxlcy5ndGUpPy'
    'AndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhh'
    'biBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJycK3A'
    'EKGWZpeGVkMzIuZ3RlX2x0ZV9leGNsdXNpdmUavgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5s'
    'dGUgPCBydWxlcy5ndGUgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8IHJ1bGVzLmd0ZS'
    'k/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBvciBsZXNzIHRo'
    'YW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnSA'
    'FSA2d0ZRJ7CgJpbhgGIAMoB0JrwkhoCmYKCmZpeGVkMzIuaW4aWCEodGhpcyBpbiBkeW4ocnVs'
    'ZXMpWydpbiddKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bG'
    'VzKVsnaW4nXV0pIDogJydSAmluEn8KBm5vdF9pbhgHIAMoB0JowkhlCmMKDmZpeGVkMzIubm90'
    'X2luGlF0aGlzIGluIHJ1bGVzLm5vdF9pbiA/ICd2YWx1ZSBtdXN0IG5vdCBiZSBpbiBsaXN0IC'
    'VzJy5mb3JtYXQoW3J1bGVzLm5vdF9pbl0pIDogJydSBW5vdEluEjYKB2V4YW1wbGUYCCADKAdC'
    'HMJIGQoXCg9maXhlZDMyLmV4YW1wbGUaBHRydWVSB2V4YW1wbGUqCQjoBxCAgICAAkILCglsZX'
    'NzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

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
    'CgxGaXhlZDY0UnVsZXMScgoFY29uc3QYASABKAZCXMJIWQpXCg1maXhlZDY0LmNvbnN0GkZ0aG'
    'lzICE9IHJ1bGVzLmNvbnN0ID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZvcm1hdChbcnVsZXMu'
    'Y29uc3RdKSA6ICcnUgVjb25zdBKQAQoCbHQYAiABKAZCfsJIewp5CgpmaXhlZDY0Lmx0GmshaG'
    'FzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8gJ3Zh'
    'bHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUgJsdB'
    'KjAQoDbHRlGAMgASgGQo4BwkiKAQqHAQoLZml4ZWQ2NC5sdGUaeCFoYXMocnVsZXMuZ3RlKSAm'
    'JiAhaGFzKHJ1bGVzLmd0KSAmJiB0aGlzID4gcnVsZXMubHRlPyAndmFsdWUgbXVzdCBiZSBsZX'
    'NzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMubHRlXSkgOiAnJ0gAUgNsdGUS'
    'pQcKAmd0GAQgASgGQpIHwkiOBwp8CgpmaXhlZDY0Lmd0Gm4haGFzKHJ1bGVzLmx0KSAmJiAhaG'
    'FzKHJ1bGVzLmx0ZSkgJiYgdGhpcyA8PSBydWxlcy5ndD8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRl'
    'ciB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0XSkgOiAnJwq1AQoNZml4ZWQ2NC5ndF9sdBqjAW'
    'hhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0gcnVsZXMu'
    'bHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcy'
    'BhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDogJycKvQEK'
    'F2ZpeGVkNjQuZ3RfbHRfZXhjbHVzaXZlGqEBaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IH'
    'J1bGVzLmd0ICYmIChydWxlcy5sdCA8PSB0aGlzICYmIHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFs'
    'dWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bG'
    'VzLmd0LCBydWxlcy5sdF0pIDogJycKxQEKDmZpeGVkNjQuZ3RfbHRlGrIBaGFzKHJ1bGVzLmx0'
    'ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ICYmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaX'
    'MgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgYW5kIGxlc3Mg'
    'dGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXSkgOiAnJw'
    'rNAQoYZml4ZWQ2NC5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMu'
    'bHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndC'
    'k/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwg'
    'dG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3QS8gcKA2d0ZR'
    'gFIAEoBkLdB8JI2QcKigEKC2ZpeGVkNjQuZ3RlGnshaGFzKHJ1bGVzLmx0KSAmJiAhaGFzKHJ1'
    'bGVzLmx0ZSkgJiYgdGhpcyA8IHJ1bGVzLmd0ZT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aG'
    'FuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZV0pIDogJycKxAEKDmZpeGVkNjQu'
    'Z3RlX2x0GrEBaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA+PSBydWxlcy5ndGUgJiYgKHRoaX'
    'MgPj0gcnVsZXMubHQgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0'
    'ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLm'
    'd0ZSwgcnVsZXMubHRdKSA6ICcnCswBChhmaXhlZDY0Lmd0ZV9sdF9leGNsdXNpdmUarwFoYXMo'
    'cnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy5sdCA8PSB0aGlzIC'
    'YmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1'
    'YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKS'
    'A6ICcnCtQBCg9maXhlZDY0Lmd0ZV9sdGUawAFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUg'
    'Pj0gcnVsZXMuZ3RlICYmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPCBydWxlcy5ndGUpPy'
    'AndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIGxlc3MgdGhh'
    'biBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0pIDogJycK3A'
    'EKGWZpeGVkNjQuZ3RlX2x0ZV9leGNsdXNpdmUavgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5s'
    'dGUgPCBydWxlcy5ndGUgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8IHJ1bGVzLmd0ZS'
    'k/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBvciBsZXNzIHRo'
    'YW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnSA'
    'FSA2d0ZRJ7CgJpbhgGIAMoBkJrwkhoCmYKCmZpeGVkNjQuaW4aWCEodGhpcyBpbiBkeW4ocnVs'
    'ZXMpWydpbiddKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bG'
    'VzKVsnaW4nXV0pIDogJydSAmluEn8KBm5vdF9pbhgHIAMoBkJowkhlCmMKDmZpeGVkNjQubm90'
    'X2luGlF0aGlzIGluIHJ1bGVzLm5vdF9pbiA/ICd2YWx1ZSBtdXN0IG5vdCBiZSBpbiBsaXN0IC'
    'VzJy5mb3JtYXQoW3J1bGVzLm5vdF9pbl0pIDogJydSBW5vdEluEjYKB2V4YW1wbGUYCCADKAZC'
    'HMJIGQoXCg9maXhlZDY0LmV4YW1wbGUaBHRydWVSB2V4YW1wbGUqCQjoBxCAgICAAkILCglsZX'
    'NzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

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
    'Cg1TRml4ZWQzMlJ1bGVzEnMKBWNvbnN0GAEgASgPQl3CSFoKWAoOc2ZpeGVkMzIuY29uc3QaRn'
    'RoaXMgIT0gcnVsZXMuY29uc3QgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycuZm9ybWF0KFtydWxl'
    'cy5jb25zdF0pIDogJydSBWNvbnN0EpEBCgJsdBgCIAEoD0J/wkh8CnoKC3NmaXhlZDMyLmx0Gm'
    'shaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8g'
    'J3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUg'
    'JsdBKkAQoDbHRlGAMgASgPQo8BwkiLAQqIAQoMc2ZpeGVkMzIubHRlGnghaGFzKHJ1bGVzLmd0'
    'ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYm'
    'UgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFID'
    'bHRlEqoHCgJndBgEIAEoD0KXB8JIkwcKfQoLc2ZpeGVkMzIuZ3QabiFoYXMocnVsZXMubHQpIC'
    'YmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDw9IHJ1bGVzLmd0PyAndmFsdWUgbXVzdCBiZSBn'
    'cmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcnCrYBCg5zZml4ZWQzMi5ndF'
    '9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0g'
    'cnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdG'
    'hhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDog'
    'JycKvgEKGHNmaXhlZDMyLmd0X2x0X2V4Y2x1c2l2ZRqhAWhhcyhydWxlcy5sdCkgJiYgcnVsZX'
    'MubHQgPCBydWxlcy5ndCAmJiAocnVsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0'
    'KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybW'
    'F0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcnCsYBCg9zZml4ZWQzMi5ndF9sdGUasgFoYXMo'
    'cnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy5sdG'
    'UgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBh'
    'bmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdG'
    'VdKSA6ICcnCs4BChlzZml4ZWQzMi5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkg'
    'JiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PS'
    'BydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4g'
    'b3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3'
    'QS9wcKA2d0ZRgFIAEoD0LiB8JI3gcKiwEKDHNmaXhlZDMyLmd0ZRp7IWhhcyhydWxlcy5sdCkg'
    'JiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPCBydWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIG'
    'dyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsUB'
    'Cg9zZml4ZWQzMi5ndGVfbHQasQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLm'
    'd0ZSAmJiAodGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11'
    'c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm'
    '1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKzQEKGXNmaXhlZDMyLmd0ZV9sdF9leGNs'
    'dXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy'
    '5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVy'
    'IHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZS'
    'wgcnVsZXMubHRdKSA6ICcnCtUBChBzZml4ZWQzMi5ndGVfbHRlGsABaGFzKHJ1bGVzLmx0ZSkg'
    'JiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzID'
    'wgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVz'
    'IGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy'
    '5sdGVdKSA6ICcnCt0BChpzZml4ZWQzMi5ndGVfbHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5s'
    'dGUpICYmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aG'
    'lzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bG'
    'VzLmx0ZV0pIDogJydIAVIDZ3RlEnwKAmluGAYgAygPQmzCSGkKZwoLc2ZpeGVkMzIuaW4aWCEo'
    'dGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLm'
    'Zvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJydSAmluEoABCgZub3RfaW4YByADKA9CacJI'
    'ZgpkCg9zZml4ZWQzMi5ub3RfaW4aUXRoaXMgaW4gcnVsZXMubm90X2luID8gJ3ZhbHVlIG11c3'
    'Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZXMubm90X2luXSkgOiAnJ1IFbm90SW4S'
    'NwoHZXhhbXBsZRgIIAMoD0IdwkgaChgKEHNmaXhlZDMyLmV4YW1wbGUaBHRydWVSB2V4YW1wbG'
    'UqCQjoBxCAgICAAkILCglsZXNzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

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
    'Cg1TRml4ZWQ2NFJ1bGVzEnMKBWNvbnN0GAEgASgQQl3CSFoKWAoOc2ZpeGVkNjQuY29uc3QaRn'
    'RoaXMgIT0gcnVsZXMuY29uc3QgPyAndmFsdWUgbXVzdCBlcXVhbCAlcycuZm9ybWF0KFtydWxl'
    'cy5jb25zdF0pIDogJydSBWNvbnN0EpEBCgJsdBgCIAEoEEJ/wkh8CnoKC3NmaXhlZDY0Lmx0Gm'
    'shaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+PSBydWxlcy5sdD8g'
    'J3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmx0XSkgOiAnJ0gAUg'
    'JsdBKkAQoDbHRlGAMgASgQQo8BwkiLAQqIAQoMc2ZpeGVkNjQubHRlGnghaGFzKHJ1bGVzLmd0'
    'ZSkgJiYgIWhhcyhydWxlcy5ndCkgJiYgdGhpcyA+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYm'
    'UgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFID'
    'bHRlEqoHCgJndBgEIAEoEEKXB8JIkwcKfQoLc2ZpeGVkNjQuZ3QabiFoYXMocnVsZXMubHQpIC'
    'YmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDw9IHJ1bGVzLmd0PyAndmFsdWUgbXVzdCBiZSBn'
    'cmVhdGVyIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3RdKSA6ICcnCrYBCg5zZml4ZWQ2NC5ndF'
    '9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPj0g'
    'cnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdG'
    'hhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdF0pIDog'
    'JycKvgEKGHNmaXhlZDY0Lmd0X2x0X2V4Y2x1c2l2ZRqhAWhhcyhydWxlcy5sdCkgJiYgcnVsZX'
    'MubHQgPCBydWxlcy5ndCAmJiAocnVsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDw9IHJ1bGVzLmd0'
    'KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybW'
    'F0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcnCsYBCg9zZml4ZWQ2NC5ndF9sdGUasgFoYXMo'
    'cnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPj0gcnVsZXMuZ3QgJiYgKHRoaXMgPiBydWxlcy5sdG'
    'UgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBh'
    'bmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdG'
    'VdKSA6ICcnCs4BChlzZml4ZWQ2NC5ndF9sdGVfZXhjbHVzaXZlGrABaGFzKHJ1bGVzLmx0ZSkg'
    'JiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8PS'
    'BydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4g'
    'b3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJydIAVICZ3'
    'QS9wcKA2d0ZRgFIAEoEELiB8JI3gcKiwEKDHNmaXhlZDY0Lmd0ZRp7IWhhcyhydWxlcy5sdCkg'
    'JiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPCBydWxlcy5ndGU/ICd2YWx1ZSBtdXN0IGJlIG'
    'dyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGVdKSA6ICcnCsUB'
    'Cg9zZml4ZWQ2NC5ndGVfbHQasQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLm'
    'd0ZSAmJiAodGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11'
    'c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm'
    '1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKzQEKGXNmaXhlZDY0Lmd0ZV9sdF9leGNs'
    'dXNpdmUarwFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3RlICYmIChydWxlcy'
    '5sdCA8PSB0aGlzICYmIHRoaXMgPCBydWxlcy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVy'
    'IHRoYW4gb3IgZXF1YWwgdG8gJXMgb3IgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZS'
    'wgcnVsZXMubHRdKSA6ICcnCtUBChBzZml4ZWQ2NC5ndGVfbHRlGsABaGFzKHJ1bGVzLmx0ZSkg'
    'JiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ZSAmJiAodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzID'
    'wgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVz'
    'IGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy'
    '5sdGVdKSA6ICcnCt0BChpzZml4ZWQ2NC5ndGVfbHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5s'
    'dGUpICYmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aG'
    'lzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRv'
    'ICVzIG9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bG'
    'VzLmx0ZV0pIDogJydIAVIDZ3RlEnwKAmluGAYgAygQQmzCSGkKZwoLc2ZpeGVkNjQuaW4aWCEo'
    'dGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2YWx1ZSBtdXN0IGJlIGluIGxpc3QgJXMnLm'
    'Zvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJydSAmluEoABCgZub3RfaW4YByADKBBCacJI'
    'ZgpkCg9zZml4ZWQ2NC5ub3RfaW4aUXRoaXMgaW4gcnVsZXMubm90X2luID8gJ3ZhbHVlIG11c3'
    'Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZXMubm90X2luXSkgOiAnJ1IFbm90SW4S'
    'NwoHZXhhbXBsZRgIIAMoEEIdwkgaChgKEHNmaXhlZDY0LmV4YW1wbGUaBHRydWVSB2V4YW1wbG'
    'UqCQjoBxCAgICAAkILCglsZXNzX3RoYW5CDgoMZ3JlYXRlcl90aGFu');

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
    'CglCb29sUnVsZXMSbwoFY29uc3QYASABKAhCWcJIVgpUCgpib29sLmNvbnN0GkZ0aGlzICE9IH'
    'J1bGVzLmNvbnN0ID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZvcm1hdChbcnVsZXMuY29uc3Rd'
    'KSA6ICcnUgVjb25zdBIzCgdleGFtcGxlGAIgAygIQhnCSBYKFAoMYm9vbC5leGFtcGxlGgR0cn'
    'VlUgdleGFtcGxlKgkI6AcQgICAgAI=');

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
    'CgtTdHJpbmdSdWxlcxJzCgVjb25zdBgBIAEoCUJdwkhaClgKDHN0cmluZy5jb25zdBpIdGhpcy'
    'AhPSBydWxlcy5jb25zdCA/ICd2YWx1ZSBtdXN0IGVxdWFsIGAlc2AnLmZvcm1hdChbcnVsZXMu'
    'Y29uc3RdKSA6ICcnUgVjb25zdBKDAQoDbGVuGBMgASgEQnHCSG4KbAoKc3RyaW5nLmxlbhpedW'
    'ludCh0aGlzLnNpemUoKSkgIT0gcnVsZXMubGVuID8gJ3ZhbHVlIGxlbmd0aCBtdXN0IGJlICVz'
    'IGNoYXJhY3RlcnMnLmZvcm1hdChbcnVsZXMubGVuXSkgOiAnJ1IDbGVuEqEBCgdtaW5fbGVuGA'
    'IgASgEQocBwkiDAQqAAQoOc3RyaW5nLm1pbl9sZW4abnVpbnQodGhpcy5zaXplKCkpIDwgcnVs'
    'ZXMubWluX2xlbiA/ICd2YWx1ZSBsZW5ndGggbXVzdCBiZSBhdCBsZWFzdCAlcyBjaGFyYWN0ZX'
    'JzJy5mb3JtYXQoW3J1bGVzLm1pbl9sZW5dKSA6ICcnUgZtaW5MZW4SnwEKB21heF9sZW4YAyAB'
    'KARChQHCSIEBCn8KDnN0cmluZy5tYXhfbGVuGm11aW50KHRoaXMuc2l6ZSgpKSA+IHJ1bGVzLm'
    '1heF9sZW4gPyAndmFsdWUgbGVuZ3RoIG11c3QgYmUgYXQgbW9zdCAlcyBjaGFyYWN0ZXJzJy5m'
    'b3JtYXQoW3J1bGVzLm1heF9sZW5dKSA6ICcnUgZtYXhMZW4SpQEKCWxlbl9ieXRlcxgUIAEoBE'
    'KHAcJIgwEKgAEKEHN0cmluZy5sZW5fYnl0ZXMabHVpbnQoYnl0ZXModGhpcykuc2l6ZSgpKSAh'
    'PSBydWxlcy5sZW5fYnl0ZXMgPyAndmFsdWUgbGVuZ3RoIG11c3QgYmUgJXMgYnl0ZXMnLmZvcm'
    '1hdChbcnVsZXMubGVuX2J5dGVzXSkgOiAnJ1IIbGVuQnl0ZXMSrQEKCW1pbl9ieXRlcxgEIAEo'
    'BEKPAcJIiwEKiAEKEHN0cmluZy5taW5fYnl0ZXMadHVpbnQoYnl0ZXModGhpcykuc2l6ZSgpKS'
    'A8IHJ1bGVzLm1pbl9ieXRlcyA/ICd2YWx1ZSBsZW5ndGggbXVzdCBiZSBhdCBsZWFzdCAlcyBi'
    'eXRlcycuZm9ybWF0KFtydWxlcy5taW5fYnl0ZXNdKSA6ICcnUghtaW5CeXRlcxKsAQoJbWF4X2'
    'J5dGVzGAUgASgEQo4BwkiKAQqHAQoQc3RyaW5nLm1heF9ieXRlcxpzdWludChieXRlcyh0aGlz'
    'KS5zaXplKCkpID4gcnVsZXMubWF4X2J5dGVzID8gJ3ZhbHVlIGxlbmd0aCBtdXN0IGJlIGF0IG'
    '1vc3QgJXMgYnl0ZXMnLmZvcm1hdChbcnVsZXMubWF4X2J5dGVzXSkgOiAnJ1IIbWF4Qnl0ZXMS'
    'lgEKB3BhdHRlcm4YBiABKAlCfMJIeQp3Cg5zdHJpbmcucGF0dGVybhplIXRoaXMubWF0Y2hlcy'
    'hydWxlcy5wYXR0ZXJuKSA/ICd2YWx1ZSBkb2VzIG5vdCBtYXRjaCByZWdleCBwYXR0ZXJuIGAl'
    'c2AnLmZvcm1hdChbcnVsZXMucGF0dGVybl0pIDogJydSB3BhdHRlcm4SjAEKBnByZWZpeBgHIA'
    'EoCUJ0wkhxCm8KDXN0cmluZy5wcmVmaXgaXiF0aGlzLnN0YXJ0c1dpdGgocnVsZXMucHJlZml4'
    'KSA/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIHByZWZpeCBgJXNgJy5mb3JtYXQoW3J1bGVzLnByZW'
    'ZpeF0pIDogJydSBnByZWZpeBKKAQoGc3VmZml4GAggASgJQnLCSG8KbQoNc3RyaW5nLnN1ZmZp'
    'eBpcIXRoaXMuZW5kc1dpdGgocnVsZXMuc3VmZml4KSA/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIH'
    'N1ZmZpeCBgJXNgJy5mb3JtYXQoW3J1bGVzLnN1ZmZpeF0pIDogJydSBnN1ZmZpeBKaAQoIY29u'
    'dGFpbnMYCSABKAlCfsJIewp5Cg9zdHJpbmcuY29udGFpbnMaZiF0aGlzLmNvbnRhaW5zKHJ1bG'
    'VzLmNvbnRhaW5zKSA/ICd2YWx1ZSBkb2VzIG5vdCBjb250YWluIHN1YnN0cmluZyBgJXNgJy5m'
    'b3JtYXQoW3J1bGVzLmNvbnRhaW5zXSkgOiAnJ1IIY29udGFpbnMSpQEKDG5vdF9jb250YWlucx'
    'gXIAEoCUKBAcJIfgp8ChNzdHJpbmcubm90X2NvbnRhaW5zGmV0aGlzLmNvbnRhaW5zKHJ1bGVz'
    'Lm5vdF9jb250YWlucykgPyAndmFsdWUgY29udGFpbnMgc3Vic3RyaW5nIGAlc2AnLmZvcm1hdC'
    'hbcnVsZXMubm90X2NvbnRhaW5zXSkgOiAnJ1ILbm90Q29udGFpbnMSegoCaW4YCiADKAlCasJI'
    'ZwplCglzdHJpbmcuaW4aWCEodGhpcyBpbiBkeW4ocnVsZXMpWydpbiddKSA/ICd2YWx1ZSBtdX'
    'N0IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbZHluKHJ1bGVzKVsnaW4nXV0pIDogJydSAmluEn4K'
    'Bm5vdF9pbhgLIAMoCUJnwkhkCmIKDXN0cmluZy5ub3RfaW4aUXRoaXMgaW4gcnVsZXMubm90X2'
    'luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZXMubm90X2lu'
    'XSkgOiAnJ1IFbm90SW4S5gEKBWVtYWlsGAwgASgIQs0BwkjJAQphCgxzdHJpbmcuZW1haWwSI3'
    'ZhbHVlIG11c3QgYmUgYSB2YWxpZCBlbWFpbCBhZGRyZXNzGiwhcnVsZXMuZW1haWwgfHwgdGhp'
    'cyA9PSAnJyB8fCB0aGlzLmlzRW1haWwoKQpkChJzdHJpbmcuZW1haWxfZW1wdHkSMnZhbHVlIG'
    'lzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBlbWFpbCBhZGRyZXNzGhohcnVsZXMuZW1h'
    'aWwgfHwgdGhpcyAhPSAnJ0gAUgVlbWFpbBLxAQoIaG9zdG5hbWUYDSABKAhC0gHCSM4BCmUKD3'
    'N0cmluZy5ob3N0bmFtZRIedmFsdWUgbXVzdCBiZSBhIHZhbGlkIGhvc3RuYW1lGjIhcnVsZXMu'
    'aG9zdG5hbWUgfHwgdGhpcyA9PSAnJyB8fCB0aGlzLmlzSG9zdG5hbWUoKQplChVzdHJpbmcuaG'
    '9zdG5hbWVfZW1wdHkSLXZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBob3N0'
    'bmFtZRodIXJ1bGVzLmhvc3RuYW1lIHx8IHRoaXMgIT0gJydIAFIIaG9zdG5hbWUSywEKAmlwGA'
    '4gASgIQrgBwki0AQpVCglzdHJpbmcuaXASIHZhbHVlIG11c3QgYmUgYSB2YWxpZCBJUCBhZGRy'
    'ZXNzGiYhcnVsZXMuaXAgfHwgdGhpcyA9PSAnJyB8fCB0aGlzLmlzSXAoKQpbCg9zdHJpbmcuaX'
    'BfZW1wdHkSL3ZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBJUCBhZGRyZXNz'
    'GhchcnVsZXMuaXAgfHwgdGhpcyAhPSAnJ0gAUgJpcBLcAQoEaXB2NBgPIAEoCELFAcJIwQEKXA'
    'oLc3RyaW5nLmlwdjQSInZhbHVlIG11c3QgYmUgYSB2YWxpZCBJUHY0IGFkZHJlc3MaKSFydWxl'
    'cy5pcHY0IHx8IHRoaXMgPT0gJycgfHwgdGhpcy5pc0lwKDQpCmEKEXN0cmluZy5pcHY0X2VtcH'
    'R5EjF2YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSVB2NCBhZGRyZXNzGhkh'
    'cnVsZXMuaXB2NCB8fCB0aGlzICE9ICcnSABSBGlwdjQS3AEKBGlwdjYYECABKAhCxQHCSMEBCl'
    'wKC3N0cmluZy5pcHY2EiJ2YWx1ZSBtdXN0IGJlIGEgdmFsaWQgSVB2NiBhZGRyZXNzGikhcnVs'
    'ZXMuaXB2NiB8fCB0aGlzID09ICcnIHx8IHRoaXMuaXNJcCg2KQphChFzdHJpbmcuaXB2Nl9lbX'
    'B0eRIxdmFsdWUgaXMgZW1wdHksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIElQdjYgYWRkcmVzcxoZ'
    'IXJ1bGVzLmlwdjYgfHwgdGhpcyAhPSAnJ0gAUgRpcHY2EsQBCgN1cmkYESABKAhCrwHCSKsBCl'
    'EKCnN0cmluZy51cmkSGXZhbHVlIG11c3QgYmUgYSB2YWxpZCBVUkkaKCFydWxlcy51cmkgfHwg'
    'dGhpcyA9PSAnJyB8fCB0aGlzLmlzVXJpKCkKVgoQc3RyaW5nLnVyaV9lbXB0eRIodmFsdWUgaX'
    'MgZW1wdHksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIFVSSRoYIXJ1bGVzLnVyaSB8fCB0aGlzICE9'
    'ICcnSABSA3VyaRJ4Cgd1cmlfcmVmGBIgASgIQl3CSFoKWAoOc3RyaW5nLnVyaV9yZWYSI3ZhbH'
    'VlIG11c3QgYmUgYSB2YWxpZCBVUkkgUmVmZXJlbmNlGiEhcnVsZXMudXJpX3JlZiB8fCB0aGlz'
    'LmlzVXJpUmVmKClIAFIGdXJpUmVmEpkCCgdhZGRyZXNzGBUgASgIQvwBwkj4AQqBAQoOc3RyaW'
    '5nLmFkZHJlc3MSLXZhbHVlIG11c3QgYmUgYSB2YWxpZCBob3N0bmFtZSwgb3IgaXAgYWRkcmVz'
    'cxpAIXJ1bGVzLmFkZHJlc3MgfHwgdGhpcyA9PSAnJyB8fCB0aGlzLmlzSG9zdG5hbWUoKSB8fC'
    'B0aGlzLmlzSXAoKQpyChRzdHJpbmcuYWRkcmVzc19lbXB0eRI8dmFsdWUgaXMgZW1wdHksIHdo'
    'aWNoIGlzIG5vdCBhIHZhbGlkIGhvc3RuYW1lLCBvciBpcCBhZGRyZXNzGhwhcnVsZXMuYWRkcm'
    'VzcyB8fCB0aGlzICE9ICcnSABSB2FkZHJlc3MSngIKBHV1aWQYFiABKAhChwLCSIMCCqUBCgtz'
    'dHJpbmcudXVpZBIadmFsdWUgbXVzdCBiZSBhIHZhbGlkIFVVSUQaeiFydWxlcy51dWlkIHx8IH'
    'RoaXMgPT0gJycgfHwgdGhpcy5tYXRjaGVzKCdeWzAtOWEtZkEtRl17OH0tWzAtOWEtZkEtRl17'
    'NH0tWzAtOWEtZkEtRl17NH0tWzAtOWEtZkEtRl17NH0tWzAtOWEtZkEtRl17MTJ9JCcpClkKEX'
    'N0cmluZy51dWlkX2VtcHR5Eil2YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQg'
    'VVVJRBoZIXJ1bGVzLnV1aWQgfHwgdGhpcyAhPSAnJ0gAUgR1dWlkEvcBCgV0dXVpZBghIAEoCE'
    'LeAcJI2gEKcwoMc3RyaW5nLnR1dWlkEiJ2YWx1ZSBtdXN0IGJlIGEgdmFsaWQgdHJpbW1lZCBV'
    'VUlEGj8hcnVsZXMudHV1aWQgfHwgdGhpcyA9PSAnJyB8fCB0aGlzLm1hdGNoZXMoJ15bMC05YS'
    '1mQS1GXXszMn0kJykKYwoSc3RyaW5nLnR1dWlkX2VtcHR5EjF2YWx1ZSBpcyBlbXB0eSwgd2hp'
    'Y2ggaXMgbm90IGEgdmFsaWQgdHJpbW1lZCBVVUlEGhohcnVsZXMudHV1aWQgfHwgdGhpcyAhPS'
    'AnJ0gAUgV0dXVpZBKnAgoRaXBfd2l0aF9wcmVmaXhsZW4YGiABKAhC+AHCSPQBCngKGHN0cmlu'
    'Zy5pcF93aXRoX3ByZWZpeGxlbhIfdmFsdWUgbXVzdCBiZSBhIHZhbGlkIElQIHByZWZpeBo7IX'
    'J1bGVzLmlwX3dpdGhfcHJlZml4bGVuIHx8IHRoaXMgPT0gJycgfHwgdGhpcy5pc0lwUHJlZml4'
    'KCkKeAoec3RyaW5nLmlwX3dpdGhfcHJlZml4bGVuX2VtcHR5Ei52YWx1ZSBpcyBlbXB0eSwgd2'
    'hpY2ggaXMgbm90IGEgdmFsaWQgSVAgcHJlZml4GiYhcnVsZXMuaXBfd2l0aF9wcmVmaXhsZW4g'
    'fHwgdGhpcyAhPSAnJ0gAUg9pcFdpdGhQcmVmaXhsZW4S4gIKE2lwdjRfd2l0aF9wcmVmaXhsZW'
    '4YGyABKAhCrwLCSKsCCpMBChpzdHJpbmcuaXB2NF93aXRoX3ByZWZpeGxlbhI1dmFsdWUgbXVz'
    'dCBiZSBhIHZhbGlkIElQdjQgYWRkcmVzcyB3aXRoIHByZWZpeCBsZW5ndGgaPiFydWxlcy5pcH'
    'Y0X3dpdGhfcHJlZml4bGVuIHx8IHRoaXMgPT0gJycgfHwgdGhpcy5pc0lwUHJlZml4KDQpCpIB'
    'CiBzdHJpbmcuaXB2NF93aXRoX3ByZWZpeGxlbl9lbXB0eRJEdmFsdWUgaXMgZW1wdHksIHdoaW'
    'NoIGlzIG5vdCBhIHZhbGlkIElQdjQgYWRkcmVzcyB3aXRoIHByZWZpeCBsZW5ndGgaKCFydWxl'
    'cy5pcHY0X3dpdGhfcHJlZml4bGVuIHx8IHRoaXMgIT0gJydIAFIRaXB2NFdpdGhQcmVmaXhsZW'
    '4S4gIKE2lwdjZfd2l0aF9wcmVmaXhsZW4YHCABKAhCrwLCSKsCCpMBChpzdHJpbmcuaXB2Nl93'
    'aXRoX3ByZWZpeGxlbhI1dmFsdWUgbXVzdCBiZSBhIHZhbGlkIElQdjYgYWRkcmVzcyB3aXRoIH'
    'ByZWZpeCBsZW5ndGgaPiFydWxlcy5pcHY2X3dpdGhfcHJlZml4bGVuIHx8IHRoaXMgPT0gJycg'
    'fHwgdGhpcy5pc0lwUHJlZml4KDYpCpIBCiBzdHJpbmcuaXB2Nl93aXRoX3ByZWZpeGxlbl9lbX'
    'B0eRJEdmFsdWUgaXMgZW1wdHksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIElQdjYgYWRkcmVzcyB3'
    'aXRoIHByZWZpeCBsZW5ndGgaKCFydWxlcy5pcHY2X3dpdGhfcHJlZml4bGVuIHx8IHRoaXMgIT'
    '0gJydIAFIRaXB2NldpdGhQcmVmaXhsZW4S/AEKCWlwX3ByZWZpeBgdIAEoCELcAcJI2AEKbAoQ'
    'c3RyaW5nLmlwX3ByZWZpeBIfdmFsdWUgbXVzdCBiZSBhIHZhbGlkIElQIHByZWZpeBo3IXJ1bG'
    'VzLmlwX3ByZWZpeCB8fCB0aGlzID09ICcnIHx8IHRoaXMuaXNJcFByZWZpeCh0cnVlKQpoChZz'
    'dHJpbmcuaXBfcHJlZml4X2VtcHR5Ei52YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdm'
    'FsaWQgSVAgcHJlZml4Gh4hcnVsZXMuaXBfcHJlZml4IHx8IHRoaXMgIT0gJydIAFIIaXBQcmVm'
    'aXgSjwIKC2lwdjRfcHJlZml4GB4gASgIQusBwkjnAQp1ChJzdHJpbmcuaXB2NF9wcmVmaXgSIX'
    'ZhbHVlIG11c3QgYmUgYSB2YWxpZCBJUHY0IHByZWZpeBo8IXJ1bGVzLmlwdjRfcHJlZml4IHx8'
    'IHRoaXMgPT0gJycgfHwgdGhpcy5pc0lwUHJlZml4KDQsIHRydWUpCm4KGHN0cmluZy5pcHY0X3'
    'ByZWZpeF9lbXB0eRIwdmFsdWUgaXMgZW1wdHksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIElQdjQg'
    'cHJlZml4GiAhcnVsZXMuaXB2NF9wcmVmaXggfHwgdGhpcyAhPSAnJ0gAUgppcHY0UHJlZml4Eo'
    '8CCgtpcHY2X3ByZWZpeBgfIAEoCELrAcJI5wEKdQoSc3RyaW5nLmlwdjZfcHJlZml4EiF2YWx1'
    'ZSBtdXN0IGJlIGEgdmFsaWQgSVB2NiBwcmVmaXgaPCFydWxlcy5pcHY2X3ByZWZpeCB8fCB0aG'
    'lzID09ICcnIHx8IHRoaXMuaXNJcFByZWZpeCg2LCB0cnVlKQpuChhzdHJpbmcuaXB2Nl9wcmVm'
    'aXhfZW1wdHkSMHZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBJUHY2IHByZW'
    'ZpeBogIXJ1bGVzLmlwdjZfcHJlZml4IHx8IHRoaXMgIT0gJydIAFIKaXB2NlByZWZpeBLCAgoN'
    'aG9zdF9hbmRfcG9ydBggIAEoCEKbAsJIlwIKmQEKFHN0cmluZy5ob3N0X2FuZF9wb3J0EkF2YW'
    'x1ZSBtdXN0IGJlIGEgdmFsaWQgaG9zdCAoaG9zdG5hbWUgb3IgSVAgYWRkcmVzcykgYW5kIHBv'
    'cnQgcGFpcho+IXJ1bGVzLmhvc3RfYW5kX3BvcnQgfHwgdGhpcyA9PSAnJyB8fCB0aGlzLmlzSG'
    '9zdEFuZFBvcnQodHJ1ZSkKeQoac3RyaW5nLmhvc3RfYW5kX3BvcnRfZW1wdHkSN3ZhbHVlIGlz'
    'IGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZCBob3N0IGFuZCBwb3J0IHBhaXIaIiFydWxlcy'
    '5ob3N0X2FuZF9wb3J0IHx8IHRoaXMgIT0gJydIAFILaG9zdEFuZFBvcnQSuAUKEHdlbGxfa25v'
    'd25fcmVnZXgYGCABKA4yGC5idWYudmFsaWRhdGUuS25vd25SZWdleELxBMJI7QQK8AEKI3N0cm'
    'luZy53ZWxsX2tub3duX3JlZ2V4LmhlYWRlcl9uYW1lEiZ2YWx1ZSBtdXN0IGJlIGEgdmFsaWQg'
    'SFRUUCBoZWFkZXIgbmFtZRqgAXJ1bGVzLndlbGxfa25vd25fcmVnZXggIT0gMSB8fCB0aGlzID'
    '09ICcnIHx8IHRoaXMubWF0Y2hlcyghaGFzKHJ1bGVzLnN0cmljdCkgfHwgcnVsZXMuc3RyaWN0'
    'ID8nXjo/WzAtOWEtekEtWiEjJCUmXCcqKy0uXl98flx4NjBdKyQnIDonXlteXHUwMDAwXHUwMD'
    'BBXHUwMDBEXSskJykKjQEKKXN0cmluZy53ZWxsX2tub3duX3JlZ2V4LmhlYWRlcl9uYW1lX2Vt'
    'cHR5EjV2YWx1ZSBpcyBlbXB0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSFRUUCBoZWFkZXIgbm'
    'FtZRopcnVsZXMud2VsbF9rbm93bl9yZWdleCAhPSAxIHx8IHRoaXMgIT0gJycK5wEKJHN0cmlu'
    'Zy53ZWxsX2tub3duX3JlZ2V4LmhlYWRlcl92YWx1ZRIndmFsdWUgbXVzdCBiZSBhIHZhbGlkIE'
    'hUVFAgaGVhZGVyIHZhbHVlGpUBcnVsZXMud2VsbF9rbm93bl9yZWdleCAhPSAyIHx8IHRoaXMu'
    'bWF0Y2hlcyghaGFzKHJ1bGVzLnN0cmljdCkgfHwgcnVsZXMuc3RyaWN0ID8nXlteXHUwMDAwLV'
    'x1MDAwOFx1MDAwQS1cdTAwMUZcdTAwN0ZdKiQnIDonXlteXHUwMDAwXHUwMDBBXHUwMDBEXSok'
    'JylIAFIOd2VsbEtub3duUmVnZXgSFgoGc3RyaWN0GBkgASgIUgZzdHJpY3QSNQoHZXhhbXBsZR'
    'giIAMoCUIbwkgYChYKDnN0cmluZy5leGFtcGxlGgR0cnVlUgdleGFtcGxlKgkI6AcQgICAgAJC'
    'DAoKd2VsbF9rbm93bg==');

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
    'CgpCeXRlc1J1bGVzEm0KBWNvbnN0GAEgASgMQlfCSFQKUgoLYnl0ZXMuY29uc3QaQ3RoaXMgIT'
    '0gcnVsZXMuY29uc3QgPyAndmFsdWUgbXVzdCBiZSAleCcuZm9ybWF0KFtydWxlcy5jb25zdF0p'
    'IDogJydSBWNvbnN0En0KA2xlbhgNIAEoBEJrwkhoCmYKCWJ5dGVzLmxlbhpZdWludCh0aGlzLn'
    'NpemUoKSkgIT0gcnVsZXMubGVuID8gJ3ZhbHVlIGxlbmd0aCBtdXN0IGJlICVzIGJ5dGVzJy5m'
    'b3JtYXQoW3J1bGVzLmxlbl0pIDogJydSA2xlbhKYAQoHbWluX2xlbhgCIAEoBEJ/wkh8CnoKDW'
    'J5dGVzLm1pbl9sZW4aaXVpbnQodGhpcy5zaXplKCkpIDwgcnVsZXMubWluX2xlbiA/ICd2YWx1'
    'ZSBsZW5ndGggbXVzdCBiZSBhdCBsZWFzdCAlcyBieXRlcycuZm9ybWF0KFtydWxlcy5taW5fbG'
    'VuXSkgOiAnJ1IGbWluTGVuEpABCgdtYXhfbGVuGAMgASgEQnfCSHQKcgoNYnl0ZXMubWF4X2xl'
    'bhphdWludCh0aGlzLnNpemUoKSkgPiBydWxlcy5tYXhfbGVuID8gJ3ZhbHVlIG11c3QgYmUgYX'
    'QgbW9zdCAlcyBieXRlcycuZm9ybWF0KFtydWxlcy5tYXhfbGVuXSkgOiAnJ1IGbWF4TGVuEpkB'
    'CgdwYXR0ZXJuGAQgASgJQn/CSHwKegoNYnl0ZXMucGF0dGVybhppIXN0cmluZyh0aGlzKS5tYX'
    'RjaGVzKHJ1bGVzLnBhdHRlcm4pID8gJ3ZhbHVlIG11c3QgbWF0Y2ggcmVnZXggcGF0dGVybiBg'
    'JXNgJy5mb3JtYXQoW3J1bGVzLnBhdHRlcm5dKSA6ICcnUgdwYXR0ZXJuEokBCgZwcmVmaXgYBS'
    'ABKAxCccJIbgpsCgxieXRlcy5wcmVmaXgaXCF0aGlzLnN0YXJ0c1dpdGgocnVsZXMucHJlZml4'
    'KSA/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIHByZWZpeCAleCcuZm9ybWF0KFtydWxlcy5wcmVmaX'
    'hdKSA6ICcnUgZwcmVmaXgShwEKBnN1ZmZpeBgGIAEoDEJvwkhsCmoKDGJ5dGVzLnN1ZmZpeBpa'
    'IXRoaXMuZW5kc1dpdGgocnVsZXMuc3VmZml4KSA/ICd2YWx1ZSBkb2VzIG5vdCBoYXZlIHN1Zm'
    'ZpeCAleCcuZm9ybWF0KFtydWxlcy5zdWZmaXhdKSA6ICcnUgZzdWZmaXgSjQEKCGNvbnRhaW5z'
    'GAcgASgMQnHCSG4KbAoOYnl0ZXMuY29udGFpbnMaWiF0aGlzLmNvbnRhaW5zKHJ1bGVzLmNvbn'
    'RhaW5zKSA/ICd2YWx1ZSBkb2VzIG5vdCBjb250YWluICV4Jy5mb3JtYXQoW3J1bGVzLmNvbnRh'
    'aW5zXSkgOiAnJ1IIY29udGFpbnMSmwEKAmluGAggAygMQooBwkiGAQqDAQoIYnl0ZXMuaW4ad2'
    'R5bihydWxlcylbJ2luJ10uc2l6ZSgpID4gMCAmJiAhKHRoaXMgaW4gZHluKHJ1bGVzKVsnaW4n'
    'XSkgPyAndmFsdWUgbXVzdCBiZSBpbiBsaXN0ICVzJy5mb3JtYXQoW2R5bihydWxlcylbJ2luJ1'
    '1dKSA6ICcnUgJpbhJ9CgZub3RfaW4YCSADKAxCZsJIYwphCgxieXRlcy5ub3RfaW4aUXRoaXMg'
    'aW4gcnVsZXMubm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdC'
    'hbcnVsZXMubm90X2luXSkgOiAnJ1IFbm90SW4S7wEKAmlwGAogASgIQtwBwkjYAQp0CghieXRl'
    'cy5pcBIgdmFsdWUgbXVzdCBiZSBhIHZhbGlkIElQIGFkZHJlc3MaRiFydWxlcy5pcCB8fCB0aG'
    'lzLnNpemUoKSA9PSAwIHx8IHRoaXMuc2l6ZSgpID09IDQgfHwgdGhpcy5zaXplKCkgPT0gMTYK'
    'YAoOYnl0ZXMuaXBfZW1wdHkSL3ZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3QgYSB2YWxpZC'
    'BJUCBhZGRyZXNzGh0hcnVsZXMuaXAgfHwgdGhpcy5zaXplKCkgIT0gMEgAUgJpcBLqAQoEaXB2'
    'NBgLIAEoCELTAcJIzwEKZQoKYnl0ZXMuaXB2NBIidmFsdWUgbXVzdCBiZSBhIHZhbGlkIElQdj'
    'QgYWRkcmVzcxozIXJ1bGVzLmlwdjQgfHwgdGhpcy5zaXplKCkgPT0gMCB8fCB0aGlzLnNpemUo'
    'KSA9PSA0CmYKEGJ5dGVzLmlwdjRfZW1wdHkSMXZhbHVlIGlzIGVtcHR5LCB3aGljaCBpcyBub3'
    'QgYSB2YWxpZCBJUHY0IGFkZHJlc3MaHyFydWxlcy5pcHY0IHx8IHRoaXMuc2l6ZSgpICE9IDBI'
    'AFIEaXB2NBLrAQoEaXB2NhgMIAEoCELUAcJI0AEKZgoKYnl0ZXMuaXB2NhIidmFsdWUgbXVzdC'
    'BiZSBhIHZhbGlkIElQdjYgYWRkcmVzcxo0IXJ1bGVzLmlwdjYgfHwgdGhpcy5zaXplKCkgPT0g'
    'MCB8fCB0aGlzLnNpemUoKSA9PSAxNgpmChBieXRlcy5pcHY2X2VtcHR5EjF2YWx1ZSBpcyBlbX'
    'B0eSwgd2hpY2ggaXMgbm90IGEgdmFsaWQgSVB2NiBhZGRyZXNzGh8hcnVsZXMuaXB2NiB8fCB0'
    'aGlzLnNpemUoKSAhPSAwSABSBGlwdjYSNAoHZXhhbXBsZRgOIAMoDEIawkgXChUKDWJ5dGVzLm'
    'V4YW1wbGUaBHRydWVSB2V4YW1wbGUqCQjoBxCAgICAAkIMCgp3ZWxsX2tub3du');

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
    'CglFbnVtUnVsZXMSbwoFY29uc3QYASABKAVCWcJIVgpUCgplbnVtLmNvbnN0GkZ0aGlzICE9IH'
    'J1bGVzLmNvbnN0ID8gJ3ZhbHVlIG11c3QgZXF1YWwgJXMnLmZvcm1hdChbcnVsZXMuY29uc3Rd'
    'KSA6ICcnUgVjb25zdBIhCgxkZWZpbmVkX29ubHkYAiABKAhSC2RlZmluZWRPbmx5EngKAmluGA'
    'MgAygFQmjCSGUKYwoHZW51bS5pbhpYISh0aGlzIGluIGR5bihydWxlcylbJ2luJ10pID8gJ3Zh'
    'bHVlIG11c3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtkeW4ocnVsZXMpWydpbiddXSkgOiAnJ1'
    'ICaW4SfAoGbm90X2luGAQgAygFQmXCSGIKYAoLZW51bS5ub3RfaW4aUXRoaXMgaW4gcnVsZXMu'
    'bm90X2luID8gJ3ZhbHVlIG11c3Qgbm90IGJlIGluIGxpc3QgJXMnLmZvcm1hdChbcnVsZXMubm'
    '90X2luXSkgOiAnJ1IFbm90SW4SMwoHZXhhbXBsZRgFIAMoBUIZwkgWChQKDGVudW0uZXhhbXBs'
    'ZRoEdHJ1ZVIHZXhhbXBsZSoJCOgHEICAgIAC');

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
      '6': '.buf.validate.FieldConstraints',
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
    'HiFydWxlcy51bmlxdWUgfHwgdGhpcy51bmlxdWUoKVIGdW5pcXVlEjQKBWl0ZW1zGAQgASgLMh'
    '4uYnVmLnZhbGlkYXRlLkZpZWxkQ29uc3RyYWludHNSBWl0ZW1zKgkI6AcQgICAgAI=');

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
      '6': '.buf.validate.FieldConstraints',
      '10': 'keys'
    },
    {
      '1': 'values',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.buf.validate.FieldConstraints',
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
    'VzJy5mb3JtYXQoW3J1bGVzLm1heF9wYWlyc10pIDogJydSCG1heFBhaXJzEjIKBGtleXMYBCAB'
    'KAsyHi5idWYudmFsaWRhdGUuRmllbGRDb25zdHJhaW50c1IEa2V5cxI2CgZ2YWx1ZXMYBSABKA'
    'syHi5idWYudmFsaWRhdGUuRmllbGRDb25zdHJhaW50c1IGdmFsdWVzKgkI6AcQgICAgAI=');

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
    'Cg1EdXJhdGlvblJ1bGVzEo4BCgVjb25zdBgCIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdG'
    'lvbkJdwkhaClgKDmR1cmF0aW9uLmNvbnN0GkZ0aGlzICE9IHJ1bGVzLmNvbnN0ID8gJ3ZhbHVl'
    'IG11c3QgZXF1YWwgJXMnLmZvcm1hdChbcnVsZXMuY29uc3RdKSA6ICcnUgVjb25zdBKsAQoCbH'
    'QYAyABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25Cf8JIfAp6CgtkdXJhdGlvbi5sdBpr'
    'IWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmIHRoaXMgPj0gcnVsZXMubHQ/IC'
    'd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5sdF0pIDogJydIAFIC'
    'bHQSvwEKA2x0ZRgEIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvbkKPAcJIiwEKiAEKDG'
    'R1cmF0aW9uLmx0ZRp4IWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmIHRoaXMg'
    'PiBydWxlcy5sdGU/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm'
    '9ybWF0KFtydWxlcy5sdGVdKSA6ICcnSABSA2x0ZRLFBwoCZ3QYBSABKAsyGS5nb29nbGUucHJv'
    'dG9idWYuRHVyYXRpb25ClwfCSJMHCn0KC2R1cmF0aW9uLmd0Gm4haGFzKHJ1bGVzLmx0KSAmJi'
    'AhaGFzKHJ1bGVzLmx0ZSkgJiYgdGhpcyA8PSBydWxlcy5ndD8gJ3ZhbHVlIG11c3QgYmUgZ3Jl'
    'YXRlciB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0XSkgOiAnJwq2AQoOZHVyYXRpb24uZ3RfbH'
    'QaowFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ICYmICh0aGlzID49IHJ1'
    'bGVzLmx0IHx8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW'
    '4gJXMgYW5kIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRdKSA6ICcn'
    'Cr4BChhkdXJhdGlvbi5ndF9sdF9leGNsdXNpdmUaoQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLm'
    'x0IDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/'
    'ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZXNzIHRoYW4gJXMnLmZvcm1hdC'
    'hbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwrGAQoPZHVyYXRpb24uZ3RfbHRlGrIBaGFzKHJ1'
    'bGVzLmx0ZSkgJiYgcnVsZXMubHRlID49IHJ1bGVzLmd0ICYmICh0aGlzID4gcnVsZXMubHRlIH'
    'x8IHRoaXMgPD0gcnVsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgYW5k'
    'IGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndCwgcnVsZXMubHRlXS'
    'kgOiAnJwrOAQoZZHVyYXRpb24uZ3RfbHRlX2V4Y2x1c2l2ZRqwAWhhcyhydWxlcy5sdGUpICYm'
    'IHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ICYmIChydWxlcy5sdGUgPCB0aGlzICYmIHRoaXMgPD0gcn'
    'VsZXMuZ3QpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gJXMgb3IgbGVzcyB0aGFuIG9y'
    'IGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0LCBydWxlcy5sdGVdKSA6ICcnSAFSAmd0Ep'
    'IICgNndGUYBiABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25C4gfCSN4HCosBCgxkdXJh'
    'dGlvbi5ndGUaeyFoYXMocnVsZXMubHQpICYmICFoYXMocnVsZXMubHRlKSAmJiB0aGlzIDwgcn'
    'VsZXMuZ3RlPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZv'
    'cm1hdChbcnVsZXMuZ3RlXSkgOiAnJwrFAQoPZHVyYXRpb24uZ3RlX2x0GrEBaGFzKHJ1bGVzLm'
    'x0KSAmJiBydWxlcy5sdCA+PSBydWxlcy5ndGUgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhp'
    'cyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0by'
    'AlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRdKSA6ICcn'
    'Cs0BChlkdXJhdGlvbi5ndGVfbHRfZXhjbHVzaXZlGq8BaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy'
    '5sdCA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHQgPD0gdGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3Rl'
    'KT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdG'
    'hhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0XSkgOiAnJwrVAQoQZHVyYXRpb24u'
    'Z3RlX2x0ZRrAAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndGUgJiYgKH'
    'RoaXMgPiBydWxlcy5sdGUgfHwgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJlIGdy'
    'ZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvICVzJy'
    '5mb3JtYXQoW3J1bGVzLmd0ZSwgcnVsZXMubHRlXSkgOiAnJwrdAQoaZHVyYXRpb24uZ3RlX2x0'
    'ZV9leGNsdXNpdmUavgFoYXMocnVsZXMubHRlKSAmJiBydWxlcy5sdGUgPCBydWxlcy5ndGUgJi'
    'YgKHJ1bGVzLmx0ZSA8IHRoaXMgJiYgdGhpcyA8IHJ1bGVzLmd0ZSk/ICd2YWx1ZSBtdXN0IGJl'
    'IGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJX'
    'MnLmZvcm1hdChbcnVsZXMuZ3RlLCBydWxlcy5sdGVdKSA6ICcnSAFSA2d0ZRKXAQoCaW4YByAD'
    'KAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25CbMJIaQpnCgtkdXJhdGlvbi5pbhpYISh0aG'
    'lzIGluIGR5bihydWxlcylbJ2luJ10pID8gJ3ZhbHVlIG11c3QgYmUgaW4gbGlzdCAlcycuZm9y'
    'bWF0KFtkeW4ocnVsZXMpWydpbiddXSkgOiAnJ1ICaW4SmwEKBm5vdF9pbhgIIAMoCzIZLmdvb2'
    'dsZS5wcm90b2J1Zi5EdXJhdGlvbkJpwkhmCmQKD2R1cmF0aW9uLm5vdF9pbhpRdGhpcyBpbiBy'
    'dWxlcy5ub3RfaW4gPyAndmFsdWUgbXVzdCBub3QgYmUgaW4gbGlzdCAlcycuZm9ybWF0KFtydW'
    'xlcy5ub3RfaW5dKSA6ICcnUgVub3RJbhJSCgdleGFtcGxlGAkgAygLMhkuZ29vZ2xlLnByb3Rv'
    'YnVmLkR1cmF0aW9uQh3CSBoKGAoQZHVyYXRpb24uZXhhbXBsZRoEdHJ1ZVIHZXhhbXBsZSoJCO'
    'gHEICAgIACQgsKCWxlc3NfdGhhbkIOCgxncmVhdGVyX3RoYW4=');

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
    'Cg5UaW1lc3RhbXBSdWxlcxKQAQoFY29uc3QYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZX'
    'N0YW1wQl7CSFsKWQoPdGltZXN0YW1wLmNvbnN0GkZ0aGlzICE9IHJ1bGVzLmNvbnN0ID8gJ3Zh'
    'bHVlIG11c3QgZXF1YWwgJXMnLmZvcm1hdChbcnVsZXMuY29uc3RdKSA6ICcnUgVjb25zdBKvAQ'
    'oCbHQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQoABwkh9CnsKDHRpbWVzdGFt'
    'cC5sdBprIWhhcyhydWxlcy5ndGUpICYmICFoYXMocnVsZXMuZ3QpICYmIHRoaXMgPj0gcnVsZX'
    'MubHQ/ICd2YWx1ZSBtdXN0IGJlIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5sdF0pIDog'
    'JydIAFICbHQSwQEKA2x0ZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCkAHCSI'
    'wBCokBCg10aW1lc3RhbXAubHRlGnghaGFzKHJ1bGVzLmd0ZSkgJiYgIWhhcyhydWxlcy5ndCkg'
    'JiYgdGhpcyA+IHJ1bGVzLmx0ZT8gJ3ZhbHVlIG11c3QgYmUgbGVzcyB0aGFuIG9yIGVxdWFsIH'
    'RvICVzJy5mb3JtYXQoW3J1bGVzLmx0ZV0pIDogJydIAFIDbHRlEnMKBmx0X25vdxgHIAEoCEJa'
    'wkhXClUKEHRpbWVzdGFtcC5sdF9ub3caQShydWxlcy5sdF9ub3cgJiYgdGhpcyA+IG5vdykgPy'
    'AndmFsdWUgbXVzdCBiZSBsZXNzIHRoYW4gbm93JyA6ICcnSABSBWx0Tm93EssHCgJndBgFIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCnAfCSJgHCn4KDHRpbWVzdGFtcC5ndBpuIW'
    'hhcyhydWxlcy5sdCkgJiYgIWhhcyhydWxlcy5sdGUpICYmIHRoaXMgPD0gcnVsZXMuZ3Q/ICd2'
    'YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndF0pIDogJycKtw'
    'EKD3RpbWVzdGFtcC5ndF9sdBqjAWhhcyhydWxlcy5sdCkgJiYgcnVsZXMubHQgPj0gcnVsZXMu'
    'Z3QgJiYgKHRoaXMgPj0gcnVsZXMubHQgfHwgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdX'
    'N0IGJlIGdyZWF0ZXIgdGhhbiAlcyBhbmQgbGVzcyB0aGFuICVzJy5mb3JtYXQoW3J1bGVzLmd0'
    'LCBydWxlcy5sdF0pIDogJycKvwEKGXRpbWVzdGFtcC5ndF9sdF9leGNsdXNpdmUaoQFoYXMocn'
    'VsZXMubHQpICYmIHJ1bGVzLmx0IDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0IDw9IHRoaXMgJiYg'
    'dGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAlcyBvciBsZX'
    'NzIHRoYW4gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bGVzLmx0XSkgOiAnJwrHAQoQdGltZXN0'
    'YW1wLmd0X2x0ZRqyAWhhcyhydWxlcy5sdGUpICYmIHJ1bGVzLmx0ZSA+PSBydWxlcy5ndCAmJi'
    'AodGhpcyA+IHJ1bGVzLmx0ZSB8fCB0aGlzIDw9IHJ1bGVzLmd0KT8gJ3ZhbHVlIG11c3QgYmUg'
    'Z3JlYXRlciB0aGFuICVzIGFuZCBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcn'
    'VsZXMuZ3QsIHJ1bGVzLmx0ZV0pIDogJycKzwEKGnRpbWVzdGFtcC5ndF9sdGVfZXhjbHVzaXZl'
    'GrABaGFzKHJ1bGVzLmx0ZSkgJiYgcnVsZXMubHRlIDwgcnVsZXMuZ3QgJiYgKHJ1bGVzLmx0ZS'
    'A8IHRoaXMgJiYgdGhpcyA8PSBydWxlcy5ndCk/ICd2YWx1ZSBtdXN0IGJlIGdyZWF0ZXIgdGhh'
    'biAlcyBvciBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gJXMnLmZvcm1hdChbcnVsZXMuZ3QsIHJ1bG'
    'VzLmx0ZV0pIDogJydIAVICZ3QSmAgKA2d0ZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBC5wfCSOMHCowBCg10aW1lc3RhbXAuZ3RlGnshaGFzKHJ1bGVzLmx0KSAmJiAhaGFzKH'
    'J1bGVzLmx0ZSkgJiYgdGhpcyA8IHJ1bGVzLmd0ZT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0'
    'aGFuIG9yIGVxdWFsIHRvICVzJy5mb3JtYXQoW3J1bGVzLmd0ZV0pIDogJycKxgEKEHRpbWVzdG'
    'FtcC5ndGVfbHQasQFoYXMocnVsZXMubHQpICYmIHJ1bGVzLmx0ID49IHJ1bGVzLmd0ZSAmJiAo'
    'dGhpcyA+PSBydWxlcy5sdCB8fCB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3'
    'JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIGFuZCBsZXNzIHRoYW4gJXMnLmZvcm1hdChbcnVs'
    'ZXMuZ3RlLCBydWxlcy5sdF0pIDogJycKzgEKGnRpbWVzdGFtcC5ndGVfbHRfZXhjbHVzaXZlGq'
    '8BaGFzKHJ1bGVzLmx0KSAmJiBydWxlcy5sdCA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHQgPD0g'
    'dGhpcyAmJiB0aGlzIDwgcnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG'
    '9yIGVxdWFsIHRvICVzIG9yIGxlc3MgdGhhbiAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVz'
    'Lmx0XSkgOiAnJwrWAQoRdGltZXN0YW1wLmd0ZV9sdGUawAFoYXMocnVsZXMubHRlKSAmJiBydW'
    'xlcy5sdGUgPj0gcnVsZXMuZ3RlICYmICh0aGlzID4gcnVsZXMubHRlIHx8IHRoaXMgPCBydWxl'
    'cy5ndGUpPyAndmFsdWUgbXVzdCBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gJXMgYW5kIG'
    'xlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0ZV0p'
    'IDogJycK3gEKG3RpbWVzdGFtcC5ndGVfbHRlX2V4Y2x1c2l2ZRq+AWhhcyhydWxlcy5sdGUpIC'
    'YmIHJ1bGVzLmx0ZSA8IHJ1bGVzLmd0ZSAmJiAocnVsZXMubHRlIDwgdGhpcyAmJiB0aGlzIDwg'
    'cnVsZXMuZ3RlKT8gJ3ZhbHVlIG11c3QgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvICVzIG'
    '9yIGxlc3MgdGhhbiBvciBlcXVhbCB0byAlcycuZm9ybWF0KFtydWxlcy5ndGUsIHJ1bGVzLmx0'
    'ZV0pIDogJydIAVIDZ3RlEnYKBmd0X25vdxgIIAEoCEJdwkhaClgKEHRpbWVzdGFtcC5ndF9ub3'
    'caRChydWxlcy5ndF9ub3cgJiYgdGhpcyA8IG5vdykgPyAndmFsdWUgbXVzdCBiZSBncmVhdGVy'
    'IHRoYW4gbm93JyA6ICcnSAFSBWd0Tm93EsABCgZ3aXRoaW4YCSABKAsyGS5nb29nbGUucHJvdG'
    '9idWYuRHVyYXRpb25CjAHCSIgBCoUBChB0aW1lc3RhbXAud2l0aGluGnF0aGlzIDwgbm93LXJ1'
    'bGVzLndpdGhpbiB8fCB0aGlzID4gbm93K3J1bGVzLndpdGhpbiA/ICd2YWx1ZSBtdXN0IGJlIH'
    'dpdGhpbiAlcyBvZiBub3cnLmZvcm1hdChbcnVsZXMud2l0aGluXSkgOiAnJ1IGd2l0aGluElQK'
    'B2V4YW1wbGUYCiADKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQh7CSBsKGQoRdGltZX'
    'N0YW1wLmV4YW1wbGUaBHRydWVSB2V4YW1wbGUqCQjoBxCAgICAAkILCglsZXNzX3RoYW5CDgoM'
    'Z3JlYXRlcl90aGFu');

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
    {'1': 'constraint_id', '3': 2, '4': 1, '5': 9, '10': 'constraintId'},
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
    'VsZBIrCgRydWxlGAYgASgLMhcuYnVmLnZhbGlkYXRlLkZpZWxkUGF0aFIEcnVsZRIjCg1jb25z'
    'dHJhaW50X2lkGAIgASgJUgxjb25zdHJhaW50SWQSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZR'
    'IXCgdmb3Jfa2V5GAQgASgIUgZmb3JLZXlKBAgBEAJSCmZpZWxkX3BhdGg=');

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

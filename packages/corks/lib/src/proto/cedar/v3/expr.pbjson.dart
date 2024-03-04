//
//  Generated code. Do not modify.
//  source: cedar/v3/expr.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use variableDescriptor instead')
const Variable$json = {
  '1': 'Variable',
  '2': [
    {'1': 'VARIABLE_UNSPECIFIED', '2': 0},
    {'1': 'VARIABLE_PRINCIPAL', '2': 1},
    {'1': 'VARIABLE_ACTION', '2': 2},
    {'1': 'VARIABLE_RESOURCE', '2': 3},
    {'1': 'VARIABLE_CONTEXT', '2': 4},
  ],
};

/// Descriptor for `Variable`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List variableDescriptor = $convert.base64Decode(
    'CghWYXJpYWJsZRIYChRWQVJJQUJMRV9VTlNQRUNJRklFRBAAEhYKElZBUklBQkxFX1BSSU5DSV'
    'BBTBABEhMKD1ZBUklBQkxFX0FDVElPThACEhUKEVZBUklBQkxFX1JFU09VUkNFEAMSFAoQVkFS'
    'SUFCTEVfQ09OVEVYVBAE');

@$core.Deprecated('Use slotIdDescriptor instead')
const SlotId$json = {
  '1': 'SlotId',
  '2': [
    {'1': 'SLOT_ID_UNSPECIFIED', '2': 0},
    {'1': 'SLOT_ID_PRINCIPAL', '2': 1},
    {'1': 'SLOT_ID_RESOURCE', '2': 2},
  ],
};

/// Descriptor for `SlotId`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List slotIdDescriptor = $convert.base64Decode(
    'CgZTbG90SWQSFwoTU0xPVF9JRF9VTlNQRUNJRklFRBAAEhUKEVNMT1RfSURfUFJJTkNJUEFMEA'
    'ESFAoQU0xPVF9JRF9SRVNPVVJDRRAC');

@$core.Deprecated('Use exprDescriptor instead')
const Expr$json = {
  '1': 'Expr',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.ExprValue', '9': 0, '10': 'value'},
    {
      '1': 'var',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ExprVar',
      '8': {'28700919': 'var_'},
      '9': 0,
      '10': 'var',
    },
    {'1': 'slot', '3': 3, '4': 1, '5': 11, '6': '.cedar.v3.ExprSlot', '9': 0, '10': 'slot'},
    {'1': 'unknown', '3': 4, '4': 1, '5': 11, '6': '.cedar.v3.ExprUnknown', '9': 0, '10': 'unknown'},
    {'1': 'not', '3': 5, '4': 1, '5': 11, '6': '.cedar.v3.ExprNot', '9': 0, '10': 'not'},
    {'1': 'neg', '3': 6, '4': 1, '5': 11, '6': '.cedar.v3.ExprNeg', '9': 0, '10': 'neg'},
    {'1': 'equals', '3': 7, '4': 1, '5': 11, '6': '.cedar.v3.ExprEquals', '9': 0, '10': 'equals'},
    {'1': 'not_equals', '3': 8, '4': 1, '5': 11, '6': '.cedar.v3.ExprNotEquals', '9': 0, '10': 'notEquals'},
    {
      '1': 'in',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ExprIn',
      '8': {'28700919': 'in_'},
      '9': 0,
      '10': 'in',
    },
    {'1': 'less_than', '3': 10, '4': 1, '5': 11, '6': '.cedar.v3.ExprLessThan', '9': 0, '10': 'lessThan'},
    {'1': 'less_than_or_equals', '3': 11, '4': 1, '5': 11, '6': '.cedar.v3.ExprLessThanOrEquals', '9': 0, '10': 'lessThanOrEquals'},
    {'1': 'greater_than', '3': 12, '4': 1, '5': 11, '6': '.cedar.v3.ExprGreaterThan', '9': 0, '10': 'greaterThan'},
    {'1': 'greater_than_or_equals', '3': 13, '4': 1, '5': 11, '6': '.cedar.v3.ExprGreaterThanOrEquals', '9': 0, '10': 'greaterThanOrEquals'},
    {'1': 'and', '3': 14, '4': 1, '5': 11, '6': '.cedar.v3.ExprAnd', '9': 0, '10': 'and'},
    {'1': 'or', '3': 15, '4': 1, '5': 11, '6': '.cedar.v3.ExprOr', '9': 0, '10': 'or'},
    {'1': 'plus', '3': 16, '4': 1, '5': 11, '6': '.cedar.v3.ExprPlus', '9': 0, '10': 'plus'},
    {'1': 'minus', '3': 17, '4': 1, '5': 11, '6': '.cedar.v3.ExprMinus', '9': 0, '10': 'minus'},
    {'1': 'times', '3': 18, '4': 1, '5': 11, '6': '.cedar.v3.ExprTimes', '9': 0, '10': 'times'},
    {'1': 'contains', '3': 19, '4': 1, '5': 11, '6': '.cedar.v3.ExprContains', '9': 0, '10': 'contains'},
    {'1': 'contains_all', '3': 20, '4': 1, '5': 11, '6': '.cedar.v3.ExprContainsAll', '9': 0, '10': 'containsAll'},
    {'1': 'contains_any', '3': 21, '4': 1, '5': 11, '6': '.cedar.v3.ExprContainsAny', '9': 0, '10': 'containsAny'},
    {'1': 'get_attribute', '3': 22, '4': 1, '5': 11, '6': '.cedar.v3.ExprGetAttribute', '9': 0, '10': 'getAttribute'},
    {'1': 'has_attribute', '3': 23, '4': 1, '5': 11, '6': '.cedar.v3.ExprHasAttribute', '9': 0, '10': 'hasAttribute'},
    {'1': 'like', '3': 24, '4': 1, '5': 11, '6': '.cedar.v3.ExprLike', '9': 0, '10': 'like'},
    {
      '1': 'is',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.ExprIs',
      '8': {'28700919': 'is_'},
      '9': 0,
      '10': 'is',
    },
    {'1': 'if_then_else', '3': 26, '4': 1, '5': 11, '6': '.cedar.v3.ExprIfThenElse', '9': 0, '10': 'ifThenElse'},
    {'1': 'set', '3': 27, '4': 1, '5': 11, '6': '.cedar.v3.ExprSet', '9': 0, '10': 'set'},
    {'1': 'record', '3': 28, '4': 1, '5': 11, '6': '.cedar.v3.ExprRecord', '9': 0, '10': 'record'},
    {'1': 'func_call', '3': 29, '4': 1, '5': 11, '6': '.cedar.v3.ExprFuncCall', '9': 0, '10': 'funcCall'},
  ],
  '8': [
    {'1': 'expr'},
  ],
};

/// Descriptor for `Expr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprDescriptor = $convert.base64Decode(
    'CgRFeHByEisKBXZhbHVlGAEgASgLMhMuY2VkYXIudjMuRXhwclZhbHVlSABSBXZhbHVlEjAKA3'
    'ZhchgCIAEoCzIRLmNlZGFyLnYzLkV4cHJWYXJCCbqPvm0EdmFyX0gAUgN2YXISKAoEc2xvdBgD'
    'IAEoCzISLmNlZGFyLnYzLkV4cHJTbG90SABSBHNsb3QSMQoHdW5rbm93bhgEIAEoCzIVLmNlZG'
    'FyLnYzLkV4cHJVbmtub3duSABSB3Vua25vd24SJQoDbm90GAUgASgLMhEuY2VkYXIudjMuRXhw'
    'ck5vdEgAUgNub3QSJQoDbmVnGAYgASgLMhEuY2VkYXIudjMuRXhwck5lZ0gAUgNuZWcSLgoGZX'
    'F1YWxzGAcgASgLMhQuY2VkYXIudjMuRXhwckVxdWFsc0gAUgZlcXVhbHMSOAoKbm90X2VxdWFs'
    'cxgIIAEoCzIXLmNlZGFyLnYzLkV4cHJOb3RFcXVhbHNIAFIJbm90RXF1YWxzEiwKAmluGAkgAS'
    'gLMhAuY2VkYXIudjMuRXhwckluQgi6j75tA2luX0gAUgJpbhI1CglsZXNzX3RoYW4YCiABKAsy'
    'Fi5jZWRhci52My5FeHByTGVzc1RoYW5IAFIIbGVzc1RoYW4STwoTbGVzc190aGFuX29yX2VxdW'
    'FscxgLIAEoCzIeLmNlZGFyLnYzLkV4cHJMZXNzVGhhbk9yRXF1YWxzSABSEGxlc3NUaGFuT3JF'
    'cXVhbHMSPgoMZ3JlYXRlcl90aGFuGAwgASgLMhkuY2VkYXIudjMuRXhwckdyZWF0ZXJUaGFuSA'
    'BSC2dyZWF0ZXJUaGFuElgKFmdyZWF0ZXJfdGhhbl9vcl9lcXVhbHMYDSABKAsyIS5jZWRhci52'
    'My5FeHByR3JlYXRlclRoYW5PckVxdWFsc0gAUhNncmVhdGVyVGhhbk9yRXF1YWxzEiUKA2FuZB'
    'gOIAEoCzIRLmNlZGFyLnYzLkV4cHJBbmRIAFIDYW5kEiIKAm9yGA8gASgLMhAuY2VkYXIudjMu'
    'RXhwck9ySABSAm9yEigKBHBsdXMYECABKAsyEi5jZWRhci52My5FeHByUGx1c0gAUgRwbHVzEi'
    'sKBW1pbnVzGBEgASgLMhMuY2VkYXIudjMuRXhwck1pbnVzSABSBW1pbnVzEisKBXRpbWVzGBIg'
    'ASgLMhMuY2VkYXIudjMuRXhwclRpbWVzSABSBXRpbWVzEjQKCGNvbnRhaW5zGBMgASgLMhYuY2'
    'VkYXIudjMuRXhwckNvbnRhaW5zSABSCGNvbnRhaW5zEj4KDGNvbnRhaW5zX2FsbBgUIAEoCzIZ'
    'LmNlZGFyLnYzLkV4cHJDb250YWluc0FsbEgAUgtjb250YWluc0FsbBI+Cgxjb250YWluc19hbn'
    'kYFSABKAsyGS5jZWRhci52My5FeHByQ29udGFpbnNBbnlIAFILY29udGFpbnNBbnkSQQoNZ2V0'
    'X2F0dHJpYnV0ZRgWIAEoCzIaLmNlZGFyLnYzLkV4cHJHZXRBdHRyaWJ1dGVIAFIMZ2V0QXR0cm'
    'lidXRlEkEKDWhhc19hdHRyaWJ1dGUYFyABKAsyGi5jZWRhci52My5FeHBySGFzQXR0cmlidXRl'
    'SABSDGhhc0F0dHJpYnV0ZRIoCgRsaWtlGBggASgLMhIuY2VkYXIudjMuRXhwckxpa2VIAFIEbG'
    'lrZRIsCgJpcxgZIAEoCzIQLmNlZGFyLnYzLkV4cHJJc0IIuo++bQNpc19IAFICaXMSPAoMaWZf'
    'dGhlbl9lbHNlGBogASgLMhguY2VkYXIudjMuRXhwcklmVGhlbkVsc2VIAFIKaWZUaGVuRWxzZR'
    'IlCgNzZXQYGyABKAsyES5jZWRhci52My5FeHByU2V0SABSA3NldBIuCgZyZWNvcmQYHCABKAsy'
    'FC5jZWRhci52My5FeHByUmVjb3JkSABSBnJlY29yZBI1CglmdW5jX2NhbGwYHSABKAsyFi5jZW'
    'Rhci52My5FeHByRnVuY0NhbGxIAFIIZnVuY0NhbGxCBgoEZXhwcg==');

@$core.Deprecated('Use exprValueDescriptor instead')
const ExprValue$json = {
  '1': 'ExprValue',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Value', '10': 'value'},
  ],
};

/// Descriptor for `ExprValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprValueDescriptor = $convert.base64Decode(
    'CglFeHByVmFsdWUSJQoFdmFsdWUYASABKAsyDy5jZWRhci52My5WYWx1ZVIFdmFsdWU=');

@$core.Deprecated('Use exprVarDescriptor instead')
const ExprVar$json = {
  '1': 'ExprVar',
  '2': [
    {'1': 'variable', '3': 1, '4': 1, '5': 14, '6': '.cedar.v3.Variable', '10': 'variable'},
  ],
};

/// Descriptor for `ExprVar`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprVarDescriptor = $convert.base64Decode(
    'CgdFeHByVmFyEi4KCHZhcmlhYmxlGAEgASgOMhIuY2VkYXIudjMuVmFyaWFibGVSCHZhcmlhYm'
    'xl');

@$core.Deprecated('Use exprSlotDescriptor instead')
const ExprSlot$json = {
  '1': 'ExprSlot',
  '2': [
    {'1': 'slot_id', '3': 1, '4': 1, '5': 14, '6': '.cedar.v3.SlotId', '10': 'slotId'},
  ],
};

/// Descriptor for `ExprSlot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprSlotDescriptor = $convert.base64Decode(
    'CghFeHByU2xvdBIpCgdzbG90X2lkGAEgASgOMhAuY2VkYXIudjMuU2xvdElkUgZzbG90SWQ=');

@$core.Deprecated('Use exprUnknownDescriptor instead')
const ExprUnknown$json = {
  '1': 'ExprUnknown',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ExprUnknown`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprUnknownDescriptor = $convert.base64Decode(
    'CgtFeHByVW5rbm93bhISCgRuYW1lGAEgASgJUgRuYW1l');

@$core.Deprecated('Use exprNotDescriptor instead')
const ExprNot$json = {
  '1': 'ExprNot',
  '2': [
    {'1': 'expr', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'expr'},
  ],
};

/// Descriptor for `ExprNot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprNotDescriptor = $convert.base64Decode(
    'CgdFeHByTm90EiIKBGV4cHIYASABKAsyDi5jZWRhci52My5FeHByUgRleHBy');

@$core.Deprecated('Use exprNegDescriptor instead')
const ExprNeg$json = {
  '1': 'ExprNeg',
  '2': [
    {'1': 'expr', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'expr'},
  ],
};

/// Descriptor for `ExprNeg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprNegDescriptor = $convert.base64Decode(
    'CgdFeHByTmVnEiIKBGV4cHIYASABKAsyDi5jZWRhci52My5FeHByUgRleHBy');

@$core.Deprecated('Use exprEqualsDescriptor instead')
const ExprEquals$json = {
  '1': 'ExprEquals',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprEquals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprEqualsDescriptor = $convert.base64Decode(
    'CgpFeHByRXF1YWxzEiIKBGxlZnQYASABKAsyDi5jZWRhci52My5FeHByUgRsZWZ0EiQKBXJpZ2'
    'h0GAIgASgLMg4uY2VkYXIudjMuRXhwclIFcmlnaHQ=');

@$core.Deprecated('Use exprNotEqualsDescriptor instead')
const ExprNotEquals$json = {
  '1': 'ExprNotEquals',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprNotEquals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprNotEqualsDescriptor = $convert.base64Decode(
    'Cg1FeHByTm90RXF1YWxzEiIKBGxlZnQYASABKAsyDi5jZWRhci52My5FeHByUgRsZWZ0EiQKBX'
    'JpZ2h0GAIgASgLMg4uY2VkYXIudjMuRXhwclIFcmlnaHQ=');

@$core.Deprecated('Use exprInDescriptor instead')
const ExprIn$json = {
  '1': 'ExprIn',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprInDescriptor = $convert.base64Decode(
    'CgZFeHBySW4SIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJAoFcmlnaHQYAi'
    'ABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprLessThanDescriptor instead')
const ExprLessThan$json = {
  '1': 'ExprLessThan',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprLessThan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprLessThanDescriptor = $convert.base64Decode(
    'CgxFeHByTGVzc1RoYW4SIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJAoFcm'
    'lnaHQYAiABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprLessThanOrEqualsDescriptor instead')
const ExprLessThanOrEquals$json = {
  '1': 'ExprLessThanOrEquals',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprLessThanOrEquals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprLessThanOrEqualsDescriptor = $convert.base64Decode(
    'ChRFeHByTGVzc1RoYW5PckVxdWFscxIiCgRsZWZ0GAEgASgLMg4uY2VkYXIudjMuRXhwclIEbG'
    'VmdBIkCgVyaWdodBgCIAEoCzIOLmNlZGFyLnYzLkV4cHJSBXJpZ2h0');

@$core.Deprecated('Use exprGreaterThanDescriptor instead')
const ExprGreaterThan$json = {
  '1': 'ExprGreaterThan',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprGreaterThan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprGreaterThanDescriptor = $convert.base64Decode(
    'Cg9FeHByR3JlYXRlclRoYW4SIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJA'
    'oFcmlnaHQYAiABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprGreaterThanOrEqualsDescriptor instead')
const ExprGreaterThanOrEquals$json = {
  '1': 'ExprGreaterThanOrEquals',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprGreaterThanOrEquals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprGreaterThanOrEqualsDescriptor = $convert.base64Decode(
    'ChdFeHByR3JlYXRlclRoYW5PckVxdWFscxIiCgRsZWZ0GAEgASgLMg4uY2VkYXIudjMuRXhwcl'
    'IEbGVmdBIkCgVyaWdodBgCIAEoCzIOLmNlZGFyLnYzLkV4cHJSBXJpZ2h0');

@$core.Deprecated('Use exprAndDescriptor instead')
const ExprAnd$json = {
  '1': 'ExprAnd',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprAnd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprAndDescriptor = $convert.base64Decode(
    'CgdFeHByQW5kEiIKBGxlZnQYASABKAsyDi5jZWRhci52My5FeHByUgRsZWZ0EiQKBXJpZ2h0GA'
    'IgASgLMg4uY2VkYXIudjMuRXhwclIFcmlnaHQ=');

@$core.Deprecated('Use exprOrDescriptor instead')
const ExprOr$json = {
  '1': 'ExprOr',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprOr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprOrDescriptor = $convert.base64Decode(
    'CgZFeHByT3ISIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJAoFcmlnaHQYAi'
    'ABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprPlusDescriptor instead')
const ExprPlus$json = {
  '1': 'ExprPlus',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprPlus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprPlusDescriptor = $convert.base64Decode(
    'CghFeHByUGx1cxIiCgRsZWZ0GAEgASgLMg4uY2VkYXIudjMuRXhwclIEbGVmdBIkCgVyaWdodB'
    'gCIAEoCzIOLmNlZGFyLnYzLkV4cHJSBXJpZ2h0');

@$core.Deprecated('Use exprMinusDescriptor instead')
const ExprMinus$json = {
  '1': 'ExprMinus',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprMinus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprMinusDescriptor = $convert.base64Decode(
    'CglFeHByTWludXMSIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJAoFcmlnaH'
    'QYAiABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprTimesDescriptor instead')
const ExprTimes$json = {
  '1': 'ExprTimes',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprTimes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprTimesDescriptor = $convert.base64Decode(
    'CglFeHByVGltZXMSIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJAoFcmlnaH'
    'QYAiABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprContainsDescriptor instead')
const ExprContains$json = {
  '1': 'ExprContains',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprContains`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprContainsDescriptor = $convert.base64Decode(
    'CgxFeHByQ29udGFpbnMSIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJAoFcm'
    'lnaHQYAiABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprContainsAllDescriptor instead')
const ExprContainsAll$json = {
  '1': 'ExprContainsAll',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprContainsAll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprContainsAllDescriptor = $convert.base64Decode(
    'Cg9FeHByQ29udGFpbnNBbGwSIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJA'
    'oFcmlnaHQYAiABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprContainsAnyDescriptor instead')
const ExprContainsAny$json = {
  '1': 'ExprContainsAny',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'right'},
  ],
};

/// Descriptor for `ExprContainsAny`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprContainsAnyDescriptor = $convert.base64Decode(
    'Cg9FeHByQ29udGFpbnNBbnkSIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSJA'
    'oFcmlnaHQYAiABKAsyDi5jZWRhci52My5FeHByUgVyaWdodA==');

@$core.Deprecated('Use exprGetAttributeDescriptor instead')
const ExprGetAttribute$json = {
  '1': 'ExprGetAttribute',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'attr', '3': 2, '4': 1, '5': 9, '10': 'attr'},
  ],
};

/// Descriptor for `ExprGetAttribute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprGetAttributeDescriptor = $convert.base64Decode(
    'ChBFeHByR2V0QXR0cmlidXRlEiIKBGxlZnQYASABKAsyDi5jZWRhci52My5FeHByUgRsZWZ0Eh'
    'IKBGF0dHIYAiABKAlSBGF0dHI=');

@$core.Deprecated('Use exprHasAttributeDescriptor instead')
const ExprHasAttribute$json = {
  '1': 'ExprHasAttribute',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'attr', '3': 2, '4': 1, '5': 9, '10': 'attr'},
  ],
};

/// Descriptor for `ExprHasAttribute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprHasAttributeDescriptor = $convert.base64Decode(
    'ChBFeHBySGFzQXR0cmlidXRlEiIKBGxlZnQYASABKAsyDi5jZWRhci52My5FeHByUgRsZWZ0Eh'
    'IKBGF0dHIYAiABKAlSBGF0dHI=');

@$core.Deprecated('Use exprLikeDescriptor instead')
const ExprLike$json = {
  '1': 'ExprLike',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'pattern', '3': 2, '4': 1, '5': 9, '10': 'pattern'},
  ],
};

/// Descriptor for `ExprLike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprLikeDescriptor = $convert.base64Decode(
    'CghFeHByTGlrZRIiCgRsZWZ0GAEgASgLMg4uY2VkYXIudjMuRXhwclIEbGVmdBIYCgdwYXR0ZX'
    'JuGAIgASgJUgdwYXR0ZXJu');

@$core.Deprecated('Use exprIsDescriptor instead')
const ExprIs$json = {
  '1': 'ExprIs',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'left'},
    {'1': 'entity_type', '3': 2, '4': 1, '5': 9, '10': 'entityType'},
    {
      '1': 'in',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Expr',
      '8': {'28700919': 'in_'},
      '9': 0,
      '10': 'in',
      '17': true,
    },
  ],
  '8': [
    {'1': '_in'},
  ],
};

/// Descriptor for `ExprIs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprIsDescriptor = $convert.base64Decode(
    'CgZFeHBySXMSIgoEbGVmdBgBIAEoCzIOLmNlZGFyLnYzLkV4cHJSBGxlZnQSHwoLZW50aXR5X3'
    'R5cGUYAiABKAlSCmVudGl0eVR5cGUSLQoCaW4YAyABKAsyDi5jZWRhci52My5FeHByQgi6j75t'
    'A2luX0gAUgJpbogBAUIFCgNfaW4=');

@$core.Deprecated('Use exprIfThenElseDescriptor instead')
const ExprIfThenElse$json = {
  '1': 'ExprIfThenElse',
  '2': [
    {
      '1': 'if',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Expr',
      '8': {'28700919': 'if_'},
      '10': 'if',
    },
    {'1': 'then', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'then'},
    {
      '1': 'else',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cedar.v3.Expr',
      '8': {'28700919': 'else_'},
      '10': 'else',
    },
  ],
};

/// Descriptor for `ExprIfThenElse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprIfThenElseDescriptor = $convert.base64Decode(
    'Cg5FeHBySWZUaGVuRWxzZRIoCgJpZhgBIAEoCzIOLmNlZGFyLnYzLkV4cHJCCLqPvm0DaWZfUg'
    'JpZhIiCgR0aGVuGAIgASgLMg4uY2VkYXIudjMuRXhwclIEdGhlbhIuCgRlbHNlGAMgASgLMg4u'
    'Y2VkYXIudjMuRXhwckIKuo++bQVlbHNlX1IEZWxzZQ==');

@$core.Deprecated('Use exprSetDescriptor instead')
const ExprSet$json = {
  '1': 'ExprSet',
  '2': [
    {'1': 'expressions', '3': 1, '4': 3, '5': 11, '6': '.cedar.v3.Expr', '10': 'expressions'},
  ],
};

/// Descriptor for `ExprSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprSetDescriptor = $convert.base64Decode(
    'CgdFeHByU2V0EjAKC2V4cHJlc3Npb25zGAEgAygLMg4uY2VkYXIudjMuRXhwclILZXhwcmVzc2'
    'lvbnM=');

@$core.Deprecated('Use exprRecordDescriptor instead')
const ExprRecord$json = {
  '1': 'ExprRecord',
  '2': [
    {'1': 'attributes', '3': 1, '4': 3, '5': 11, '6': '.cedar.v3.ExprRecord.AttributesEntry', '10': 'attributes'},
  ],
  '3': [ExprRecord_AttributesEntry$json],
};

@$core.Deprecated('Use exprRecordDescriptor instead')
const ExprRecord_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.cedar.v3.Expr', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ExprRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprRecordDescriptor = $convert.base64Decode(
    'CgpFeHByUmVjb3JkEkQKCmF0dHJpYnV0ZXMYASADKAsyJC5jZWRhci52My5FeHByUmVjb3JkLk'
    'F0dHJpYnV0ZXNFbnRyeVIKYXR0cmlidXRlcxpNCg9BdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEg'
    'ASgJUgNrZXkSJAoFdmFsdWUYAiABKAsyDi5jZWRhci52My5FeHByUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use exprFuncCallDescriptor instead')
const ExprFuncCall$json = {
  '1': 'ExprFuncCall',
  '2': [
    {'1': 'fn', '3': 1, '4': 1, '5': 9, '10': 'fn'},
    {'1': 'args', '3': 2, '4': 3, '5': 11, '6': '.cedar.v3.Expr', '10': 'args'},
  ],
};

/// Descriptor for `ExprFuncCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exprFuncCallDescriptor = $convert.base64Decode(
    'CgxFeHByRnVuY0NhbGwSDgoCZm4YASABKAlSAmZuEiIKBGFyZ3MYAiADKAsyDi5jZWRhci52My'
    '5FeHByUgRhcmdz');


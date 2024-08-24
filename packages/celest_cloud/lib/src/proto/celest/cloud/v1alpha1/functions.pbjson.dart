//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/functions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use function_Descriptor instead')
const Function_$json = {
  '1': 'Function',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'uid'},
    {'1': 'parent', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'function_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'functionId'},
  ],
  '7': {},
};

/// Descriptor for `Function`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List function_Descriptor = $convert.base64Decode(
    'CghGdW5jdGlvbhIXCgRuYW1lGAEgASgJQgPgQQhSBG5hbWUSHQoDdWlkGAIgASgJQgvgQQPijM'
    '/XCAIIAVIDdWlkEjwKBnBhcmVudBgDIAEoCUIk4EEC+kEeChxjbG91ZC5jZWxlc3QuZGV2L0Vu'
    'dmlyb25tZW50UgZwYXJlbnQSJwoLZnVuY3Rpb25faWQYBCABKAlCBuBBAuBBA1IKZnVuY3Rpb2'
    '5JZDp36kF0ChljbG91ZC5jZWxlc3QuZGV2L0Z1bmN0aW9uEkJwcm9qZWN0cy97cHJvamVjdH0v'
    'ZW52aXJvbm1lbnRzL3tlbnZpcm9ubWVudH0vZnVuY3Rpb25zL3tmdW5jdGlvbn0qCWZ1bmN0aW'
    '9uczIIZnVuY3Rpb24=');

@$core.Deprecated('Use functionInvocationDescriptor instead')
const FunctionInvocation$json = {
  '1': 'FunctionInvocation',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'uid'},
    {
      '1': 'input',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '8': {},
      '10': 'input'
    },
    {
      '1': 'start_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': {},
      '10': 'startTime'
    },
    {'1': 'log', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'log'},
    {
      '1': 'request',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.logging.type.HttpRequest',
      '8': {},
      '10': 'request'
    },
    {
      '1': 'response',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.FunctionInvocationResponse',
      '8': {},
      '9': 0,
      '10': 'response',
      '17': true
    },
  ],
  '7': {},
  '8': [
    {'1': '_response'},
  ],
};

/// Descriptor for `FunctionInvocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List functionInvocationDescriptor = $convert.base64Decode(
    'ChJGdW5jdGlvbkludm9jYXRpb24SFwoEbmFtZRgBIAEoCUID4EEIUgRuYW1lEh0KA3VpZBgCIA'
    'EoCUIL4EED4ozP1wgCCAFSA3VpZBI1CgVpbnB1dBgDIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5T'
    'dHJ1Y3RCBuBBAuBBA1IFaW5wdXQSQQoKc3RhcnRfdGltZRgEIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBCBuBBAuBBA1IJc3RhcnRUaW1lEhgKA2xvZxgFIAEoCUIG4EEC4EEDUgNs'
    'b2cSQgoHcmVxdWVzdBgGIAEoCzIgLmdvb2dsZS5sb2dnaW5nLnR5cGUuSHR0cFJlcXVlc3RCBu'
    'BBAeBBA1IHcmVxdWVzdBJaCghyZXNwb25zZRgHIAEoCzIxLmNlbGVzdC5jbG91ZC52MWFscGhh'
    'MS5GdW5jdGlvbkludm9jYXRpb25SZXNwb25zZUIG4EEB4EEDSABSCHJlc3BvbnNliAEBOq8B6k'
    'GrAQojY2xvdWQuY2VsZXN0LmRldi9GdW5jdGlvbkludm9jYXRpb24SW3Byb2plY3RzL3twcm9q'
    'ZWN0fS9lbnZpcm9ubWVudHMve2Vudmlyb25tZW50fS9mdW5jdGlvbnMve2Z1bmN0aW9ufS9pbn'
    'ZvY2F0aW9ucy97aW52b2NhdGlvbn0qE2Z1bmN0aW9uSW52b2NhdGlvbnMyEmZ1bmN0aW9uSW52'
    'b2NhdGlvbkILCglfcmVzcG9uc2U=');

@$core.Deprecated('Use functionInvocationResponseDescriptor instead')
const FunctionInvocationResponse$json = {
  '1': 'FunctionInvocationResponse',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    {
      '1': 'output',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'output'
    },
    {
      '1': 'duration',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '10': 'duration'
    },
  ],
};

/// Descriptor for `FunctionInvocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List functionInvocationResponseDescriptor =
    $convert.base64Decode(
        'ChpGdW5jdGlvbkludm9jYXRpb25SZXNwb25zZRISCgRjb2RlGAEgASgFUgRjb2RlEi8KBm91dH'
        'B1dBgCIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RSBm91dHB1dBI1CghkdXJhdGlvbhgD'
        'IAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24=');

@$core.Deprecated('Use getFunctionRequestDescriptor instead')
const GetFunctionRequest$json = {
  '1': 'GetFunctionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetFunctionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFunctionRequestDescriptor = $convert.base64Decode(
    'ChJHZXRGdW5jdGlvblJlcXVlc3QSNQoEbmFtZRgBIAEoCUIh4EEC+kEbChljbG91ZC5jZWxlc3'
    'QuZGV2L0Z1bmN0aW9uUgRuYW1l');

@$core.Deprecated('Use listFunctionsRequestDescriptor instead')
const ListFunctionsRequest$json = {
  '1': 'ListFunctionsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'orderBy'},
  ],
};

/// Descriptor for `ListFunctionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFunctionsRequestDescriptor = $convert.base64Decode(
    'ChRMaXN0RnVuY3Rpb25zUmVxdWVzdBI5CgZwYXJlbnQYASABKAlCIeBBAvpBGxIZY2xvdWQuY2'
    'VsZXN0LmRldi9GdW5jdGlvblIGcGFyZW50EiAKCXBhZ2Vfc2l6ZRgCIAEoBUID4EEBUghwYWdl'
    'U2l6ZRIiCgpwYWdlX3Rva2VuGAMgASgJQgPgQQFSCXBhZ2VUb2tlbhIbCgZmaWx0ZXIYBCABKA'
    'lCA+BBAVIGZmlsdGVyEh4KCG9yZGVyX2J5GAUgASgJQgPgQQFSB29yZGVyQnk=');

@$core.Deprecated('Use listFunctionsResponseDescriptor instead')
const ListFunctionsResponse$json = {
  '1': 'ListFunctionsResponse',
  '2': [
    {
      '1': 'functions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.Function',
      '10': 'functions'
    },
    {
      '1': 'next_page_token',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'nextPageToken',
      '17': true
    },
  ],
  '8': [
    {'1': '_next_page_token'},
  ],
};

/// Descriptor for `ListFunctionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFunctionsResponseDescriptor = $convert.base64Decode(
    'ChVMaXN0RnVuY3Rpb25zUmVzcG9uc2USPQoJZnVuY3Rpb25zGAEgAygLMh8uY2VsZXN0LmNsb3'
    'VkLnYxYWxwaGExLkZ1bmN0aW9uUglmdW5jdGlvbnMSKwoPbmV4dF9wYWdlX3Rva2VuGAIgASgJ'
    'SABSDW5leHRQYWdlVG9rZW6IAQFCEgoQX25leHRfcGFnZV90b2tlbg==');

@$core.Deprecated('Use invokeFunctionRequestDescriptor instead')
const InvokeFunctionRequest$json = {
  '1': 'InvokeFunctionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {
      '1': 'input',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '8': {},
      '10': 'input'
    },
  ],
};

/// Descriptor for `InvokeFunctionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invokeFunctionRequestDescriptor = $convert.base64Decode(
    'ChVJbnZva2VGdW5jdGlvblJlcXVlc3QSFwoEbmFtZRgBIAEoCUID4EECUgRuYW1lEjIKBWlucH'
    'V0GAIgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdEID4EECUgVpbnB1dA==');

@$core.Deprecated('Use invokeFunctionResponseDescriptor instead')
const InvokeFunctionResponse$json = {
  '1': 'InvokeFunctionResponse',
  '2': [
    {
      '1': 'invocation',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.FunctionInvocation',
      '10': 'invocation'
    },
  ],
};

/// Descriptor for `InvokeFunctionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invokeFunctionResponseDescriptor =
    $convert.base64Decode(
        'ChZJbnZva2VGdW5jdGlvblJlc3BvbnNlEkkKCmludm9jYXRpb24YASABKAsyKS5jZWxlc3QuY2'
        'xvdWQudjFhbHBoYTEuRnVuY3Rpb25JbnZvY2F0aW9uUgppbnZvY2F0aW9u');

@$core.Deprecated('Use getFunctionInvocationRequestDescriptor instead')
const GetFunctionInvocationRequest$json = {
  '1': 'GetFunctionInvocationRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `GetFunctionInvocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFunctionInvocationRequestDescriptor =
    $convert.base64Decode(
        'ChxHZXRGdW5jdGlvbkludm9jYXRpb25SZXF1ZXN0Ej8KBG5hbWUYASABKAlCK+BBAvpBJQojY2'
        'xvdWQuY2VsZXN0LmRldi9GdW5jdGlvbkludm9jYXRpb25SBG5hbWU=');

@$core.Deprecated('Use listFunctionInvocationsRequestDescriptor instead')
const ListFunctionInvocationsRequest$json = {
  '1': 'ListFunctionInvocationsRequest',
  '2': [
    {'1': 'parent', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'pageSize'},
    {'1': 'page_token', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'pageToken'},
    {'1': 'filter', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'filter'},
    {'1': 'order_by', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'orderBy'},
  ],
};

/// Descriptor for `ListFunctionInvocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFunctionInvocationsRequestDescriptor = $convert.base64Decode(
    'Ch5MaXN0RnVuY3Rpb25JbnZvY2F0aW9uc1JlcXVlc3QSQwoGcGFyZW50GAEgASgJQivgQQL6QS'
    'USI2Nsb3VkLmNlbGVzdC5kZXYvRnVuY3Rpb25JbnZvY2F0aW9uUgZwYXJlbnQSIAoJcGFnZV9z'
    'aXplGAIgASgFQgPgQQFSCHBhZ2VTaXplEiIKCnBhZ2VfdG9rZW4YAyABKAlCA+BBAVIJcGFnZV'
    'Rva2VuEhsKBmZpbHRlchgEIAEoCUID4EEBUgZmaWx0ZXISHgoIb3JkZXJfYnkYBSABKAlCA+BB'
    'AVIHb3JkZXJCeQ==');

@$core.Deprecated('Use listFunctionInvocationsResponseDescriptor instead')
const ListFunctionInvocationsResponse$json = {
  '1': 'ListFunctionInvocationsResponse',
  '2': [
    {
      '1': 'function_invocations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.celest.cloud.v1alpha1.FunctionInvocation',
      '10': 'functionInvocations'
    },
    {
      '1': 'next_page_token',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'nextPageToken',
      '17': true
    },
  ],
  '8': [
    {'1': '_next_page_token'},
  ],
};

/// Descriptor for `ListFunctionInvocationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFunctionInvocationsResponseDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0RnVuY3Rpb25JbnZvY2F0aW9uc1Jlc3BvbnNlElwKFGZ1bmN0aW9uX2ludm9jYXRpb2'
        '5zGAEgAygLMikuY2VsZXN0LmNsb3VkLnYxYWxwaGExLkZ1bmN0aW9uSW52b2NhdGlvblITZnVu'
        'Y3Rpb25JbnZvY2F0aW9ucxIrCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlIAFINbmV4dFBhZ2VUb2'
        'tlbogBAUISChBfbmV4dF9wYWdlX3Rva2Vu');

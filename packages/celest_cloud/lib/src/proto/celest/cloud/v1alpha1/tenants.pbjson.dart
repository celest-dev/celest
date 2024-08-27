//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/tenants.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tenantDescriptor instead')
const Tenant$json = {
  '1': 'Tenant',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'parent', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'parent'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'tenantId'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'title'},
    {'1': 'tenant', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'tenant'},
  ],
  '7': {},
};

/// Descriptor for `Tenant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tenantDescriptor = $convert.base64Decode(
    'CgZUZW5hbnQSFwoEbmFtZRgBIAEoCUID4EEIUgRuYW1lEj0KBnBhcmVudBgCIAEoCUIl4EEC+k'
    'EfCh1jbG91ZC5jZWxlc3QuZGV2L09yZ2FuaXphdGlvblIGcGFyZW50EiMKCXRlbmFudF9pZBgD'
    'IAEoCUIG4EEF4EEDUgh0ZW5hbnRJZBIZCgV0aXRsZRgEIAEoCUID4EEBUgV0aXRsZRI9CgZ0ZW'
    '5hbnQYBSABKAlCJeBBAvpBHwodY2xvdWQuY2VsZXN0LmRldi9Pcmdhbml6YXRpb25SBnRlbmFu'
    'dDpu6kFrChdjbG91ZC5jZWxlc3QuZGV2L1RlbmFudBIQdGVuYW50cy97dGVuYW50fRItb3JnYW'
    '5pemF0aW9ucy97b3JnYW5pemF0aW9ufS90ZW5hbnRzL3t0ZW5hbnR9Kgd0ZW5hbnRzMgZ0ZW5h'
    'bnQ=');

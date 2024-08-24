//
//  Generated code. Do not modify.
//  source: cedar/v3/entity_id.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use entityIdDescriptor instead')
const EntityId$json = {
  '1': 'EntityId',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `EntityId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityIdDescriptor = $convert.base64Decode(
    'CghFbnRpdHlJZBISCgR0eXBlGAEgASgJUgR0eXBlEg4KAmlkGAIgASgJUgJpZA==');

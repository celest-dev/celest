// This is a generated file - do not edit.
//
// Generated from google/api/field_behavior.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'field_behavior.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'field_behavior.pbenum.dart';

class Field_behavior {
  static final fieldBehavior = $pb.Extension<FieldBehavior>.repeated(
      _omitMessageNames ? '' : 'google.protobuf.FieldOptions',
      _omitFieldNames ? '' : 'fieldBehavior',
      1052,
      $pb.PbFieldType.PE,
      check: $pb.getCheckFunction($pb.PbFieldType.PE),
      valueOf: FieldBehavior.valueOf,
      enumValues: FieldBehavior.values);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(fieldBehavior);
  }
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

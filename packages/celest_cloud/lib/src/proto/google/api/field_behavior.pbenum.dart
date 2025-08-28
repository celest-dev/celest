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

/// An indicator of the behavior of a given field (for example, that a field
/// is required in requests, or given as output but ignored as input).
/// This **does not** change the behavior in protocol buffers itself; it only
/// denotes the behavior and may affect how API tooling handles the field.
///
/// Note: This enum **may** receive new values in the future.
class FieldBehavior extends $pb.ProtobufEnum {
  /// Conventional default for enums. Do not use this.
  static const FieldBehavior FIELD_BEHAVIOR_UNSPECIFIED =
      FieldBehavior._(0, _omitEnumNames ? '' : 'FIELD_BEHAVIOR_UNSPECIFIED');

  /// Specifically denotes a field as optional.
  /// While all fields in protocol buffers are optional, this may be specified
  /// for emphasis if appropriate.
  static const FieldBehavior OPTIONAL =
      FieldBehavior._(1, _omitEnumNames ? '' : 'OPTIONAL');

  /// Denotes a field as required.
  /// This indicates that the field **must** be provided as part of the request,
  /// and failure to do so will cause an error (usually `INVALID_ARGUMENT`).
  static const FieldBehavior REQUIRED =
      FieldBehavior._(2, _omitEnumNames ? '' : 'REQUIRED');

  /// Denotes a field as output only.
  /// This indicates that the field is provided in responses, but including the
  /// field in a request does nothing (the server *must* ignore it and
  /// *must not* throw an error as a result of the field's presence).
  static const FieldBehavior OUTPUT_ONLY =
      FieldBehavior._(3, _omitEnumNames ? '' : 'OUTPUT_ONLY');

  /// Denotes a field as input only.
  /// This indicates that the field is provided in requests, and the
  /// corresponding field is not included in output.
  static const FieldBehavior INPUT_ONLY =
      FieldBehavior._(4, _omitEnumNames ? '' : 'INPUT_ONLY');

  /// Denotes a field as immutable.
  /// This indicates that the field may be set once in a request to create a
  /// resource, but may not be changed thereafter.
  static const FieldBehavior IMMUTABLE =
      FieldBehavior._(5, _omitEnumNames ? '' : 'IMMUTABLE');

  /// Denotes that a (repeated) field is an unordered list.
  /// This indicates that the service may provide the elements of the list
  /// in any arbitrary  order, rather than the order the user originally
  /// provided. Additionally, the list's order may or may not be stable.
  static const FieldBehavior UNORDERED_LIST =
      FieldBehavior._(6, _omitEnumNames ? '' : 'UNORDERED_LIST');

  /// Denotes that this field returns a non-empty default value if not set.
  /// This indicates that if the user provides the empty value in a request,
  /// a non-empty value will be returned. The user will not be aware of what
  /// non-empty value to expect.
  static const FieldBehavior NON_EMPTY_DEFAULT =
      FieldBehavior._(7, _omitEnumNames ? '' : 'NON_EMPTY_DEFAULT');

  /// Denotes that the field in a resource (a message annotated with
  /// google.api.resource) is used in the resource name to uniquely identify the
  /// resource. For AIP-compliant APIs, this should only be applied to the
  /// `name` field on the resource.
  ///
  /// This behavior should not be applied to references to other resources within
  /// the message.
  ///
  /// The identifier field of resources often have different field behavior
  /// depending on the request it is embedded in (e.g. for Create methods name
  /// is optional and unused, while for Update methods it is required). Instead
  /// of method-specific annotations, only `IDENTIFIER` is required.
  static const FieldBehavior IDENTIFIER =
      FieldBehavior._(8, _omitEnumNames ? '' : 'IDENTIFIER');

  static const $core.List<FieldBehavior> values = <FieldBehavior>[
    FIELD_BEHAVIOR_UNSPECIFIED,
    OPTIONAL,
    REQUIRED,
    OUTPUT_ONLY,
    INPUT_ONLY,
    IMMUTABLE,
    UNORDERED_LIST,
    NON_EMPTY_DEFAULT,
    IDENTIFIER,
  ];

  static final $core.List<FieldBehavior?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static FieldBehavior? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FieldBehavior._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

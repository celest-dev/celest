// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// A region defines the service area of a Celest organization or project.
///
/// Projects deployed to a region are highly available within that region,
/// services used are within the boundaries of that region, and all data is
/// persisted within that region.
class Region extends $pb.ProtobufEnum {
  /// The region is not specified.
  static const Region REGION_UNSPECIFIED =
      Region._(0, _omitEnumNames ? '' : 'REGION_UNSPECIFIED');

  /// North America
  static const Region NORTH_AMERICA =
      Region._(1, _omitEnumNames ? '' : 'NORTH_AMERICA');

  /// Europe
  static const Region EUROPE = Region._(2, _omitEnumNames ? '' : 'EUROPE');

  /// Asia/Pacific
  static const Region ASIA_PACIFIC =
      Region._(3, _omitEnumNames ? '' : 'ASIA_PACIFIC');

  static const $core.List<Region> values = <Region>[
    REGION_UNSPECIFIED,
    NORTH_AMERICA,
    EUROPE,
    ASIA_PACIFIC,
  ];

  static final $core.List<Region?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Region? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Region._(super.value, super.name);
}

/// The lifecycle state of a Celest Cloud resource.
class LifecycleState extends $pb.ProtobufEnum {
  /// The state is not specified.
  static const LifecycleState LIFECYCLE_STATE_UNSPECIFIED =
      LifecycleState._(0, _omitEnumNames ? '' : 'LIFECYCLE_STATE_UNSPECIFIED');

  /// The resource is being created.
  static const LifecycleState CREATING =
      LifecycleState._(1, _omitEnumNames ? '' : 'CREATING');

  /// The resource failed to be created.
  static const LifecycleState CREATION_FAILED =
      LifecycleState._(2, _omitEnumNames ? '' : 'CREATION_FAILED');

  /// The resource is active.
  static const LifecycleState ACTIVE =
      LifecycleState._(3, _omitEnumNames ? '' : 'ACTIVE');

  /// The resource is being updated.
  static const LifecycleState UPDATING =
      LifecycleState._(4, _omitEnumNames ? '' : 'UPDATING');

  /// The resource failed to be updated.
  static const LifecycleState UPDATE_FAILED =
      LifecycleState._(5, _omitEnumNames ? '' : 'UPDATE_FAILED');

  /// The resource is being deleted.
  static const LifecycleState DELETING =
      LifecycleState._(6, _omitEnumNames ? '' : 'DELETING');

  /// The resource failed to be deleted.
  static const LifecycleState DELETION_FAILED =
      LifecycleState._(7, _omitEnumNames ? '' : 'DELETION_FAILED');

  /// The resource has been deleted and is waiting to be purged.
  static const LifecycleState DELETED =
      LifecycleState._(8, _omitEnumNames ? '' : 'DELETED');

  static const $core.List<LifecycleState> values = <LifecycleState>[
    LIFECYCLE_STATE_UNSPECIFIED,
    CREATING,
    CREATION_FAILED,
    ACTIVE,
    UPDATING,
    UPDATE_FAILED,
    DELETING,
    DELETION_FAILED,
    DELETED,
  ];

  static final $core.List<LifecycleState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static LifecycleState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LifecycleState._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///  A region defines the service area of a Celest organization or project.
///
///  Projects deployed to a region are highly available within that region,
///  services used are within the boundaries of that region, and all data is
///  persisted within that region.
class Region extends $pb.ProtobufEnum {
  static const Region REGION_UNSPECIFIED =
      Region._(0, _omitEnumNames ? '' : 'REGION_UNSPECIFIED');
  static const Region NORTH_AMERICA =
      Region._(1, _omitEnumNames ? '' : 'NORTH_AMERICA');
  static const Region EUROPE = Region._(2, _omitEnumNames ? '' : 'EUROPE');
  static const Region ASIA_PACIFIC =
      Region._(3, _omitEnumNames ? '' : 'ASIA_PACIFIC');

  static const $core.List<Region> values = <Region>[
    REGION_UNSPECIFIED,
    NORTH_AMERICA,
    EUROPE,
    ASIA_PACIFIC,
  ];

  static final $core.Map<$core.int, Region> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Region? valueOf($core.int value) => _byValue[value];

  const Region._($core.int v, $core.String n) : super(v, n);
}

/// The lifecycle state of a Celest Cloud resource.
class LifecycleState extends $pb.ProtobufEnum {
  static const LifecycleState LIFECYCLE_STATE_UNSPECIFIED =
      LifecycleState._(0, _omitEnumNames ? '' : 'LIFECYCLE_STATE_UNSPECIFIED');
  static const LifecycleState CREATING =
      LifecycleState._(1, _omitEnumNames ? '' : 'CREATING');
  static const LifecycleState CREATION_FAILED =
      LifecycleState._(2, _omitEnumNames ? '' : 'CREATION_FAILED');
  static const LifecycleState ACTIVE =
      LifecycleState._(3, _omitEnumNames ? '' : 'ACTIVE');
  static const LifecycleState UPDATING =
      LifecycleState._(4, _omitEnumNames ? '' : 'UPDATING');
  static const LifecycleState UPDATE_FAILED =
      LifecycleState._(5, _omitEnumNames ? '' : 'UPDATE_FAILED');
  static const LifecycleState DELETING =
      LifecycleState._(6, _omitEnumNames ? '' : 'DELETING');
  static const LifecycleState DELETION_FAILED =
      LifecycleState._(7, _omitEnumNames ? '' : 'DELETION_FAILED');
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

  static final $core.Map<$core.int, LifecycleState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static LifecycleState? valueOf($core.int value) => _byValue[value];

  const LifecycleState._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

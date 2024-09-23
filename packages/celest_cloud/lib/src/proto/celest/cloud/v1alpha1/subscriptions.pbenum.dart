//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/subscriptions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// A unit of measure.
class Measure extends $pb.ProtobufEnum {
  static const Measure MEASURE_UNSPECIFIED =
      Measure._(0, _omitEnumNames ? '' : 'MEASURE_UNSPECIFIED');
  static const Measure MEBIBYTES =
      Measure._(1, _omitEnumNames ? '' : 'MEBIBYTES');
  static const Measure GIBIBYTES =
      Measure._(2, _omitEnumNames ? '' : 'GIBIBYTES');
  static const Measure TEBIBYTES =
      Measure._(3, _omitEnumNames ? '' : 'TEBIBYTES');
  static const Measure MEGABYTES =
      Measure._(4, _omitEnumNames ? '' : 'MEGABYTES');
  static const Measure GIGABYTES =
      Measure._(5, _omitEnumNames ? '' : 'GIGABYTES');
  static const Measure TERABYTES =
      Measure._(6, _omitEnumNames ? '' : 'TERABYTES');

  static const $core.List<Measure> values = <Measure>[
    MEASURE_UNSPECIFIED,
    MEBIBYTES,
    GIBIBYTES,
    TEBIBYTES,
    MEGABYTES,
    GIGABYTES,
    TERABYTES,
  ];

  static final $core.Map<$core.int, Measure> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Measure? valueOf($core.int value) => _byValue[value];

  const Measure._($core.int v, $core.String n) : super(v, n);
}

/// The type of instance.
class InstanceType extends $pb.ProtobufEnum {
  static const InstanceType INSTANCE_TYPE_UNSPECIFIED =
      InstanceType._(0, _omitEnumNames ? '' : 'INSTANCE_TYPE_UNSPECIFIED');
  static const InstanceType MICRO =
      InstanceType._(1, _omitEnumNames ? '' : 'MICRO');
  static const InstanceType SMALL =
      InstanceType._(2, _omitEnumNames ? '' : 'SMALL');
  static const InstanceType MEDIUM =
      InstanceType._(3, _omitEnumNames ? '' : 'MEDIUM');
  static const InstanceType LARGE =
      InstanceType._(4, _omitEnumNames ? '' : 'LARGE');
  static const InstanceType QUAD =
      InstanceType._(5, _omitEnumNames ? '' : 'QUAD');
  static const InstanceType OCTA =
      InstanceType._(6, _omitEnumNames ? '' : 'OCTA');
  static const InstanceType HEXA =
      InstanceType._(7, _omitEnumNames ? '' : 'HEXA');

  static const $core.List<InstanceType> values = <InstanceType>[
    INSTANCE_TYPE_UNSPECIFIED,
    MICRO,
    SMALL,
    MEDIUM,
    LARGE,
    QUAD,
    OCTA,
    HEXA,
  ];

  static final $core.Map<$core.int, InstanceType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InstanceType? valueOf($core.int value) => _byValue[value];

  const InstanceType._($core.int v, $core.String n) : super(v, n);
}

/// The reason for the cancellation.
class CancelSubscriptionDetails_Reason extends $pb.ProtobufEnum {
  static const CancelSubscriptionDetails_Reason REASON_UNSPECIFIED =
      CancelSubscriptionDetails_Reason._(
          0, _omitEnumNames ? '' : 'REASON_UNSPECIFIED');
  static const CancelSubscriptionDetails_Reason CANCELLATION_REQUESTED =
      CancelSubscriptionDetails_Reason._(
          1, _omitEnumNames ? '' : 'CANCELLATION_REQUESTED');
  static const CancelSubscriptionDetails_Reason PAYMENT_DISPUTED =
      CancelSubscriptionDetails_Reason._(
          2, _omitEnumNames ? '' : 'PAYMENT_DISPUTED');
  static const CancelSubscriptionDetails_Reason PAYMENT_FAILED =
      CancelSubscriptionDetails_Reason._(
          3, _omitEnumNames ? '' : 'PAYMENT_FAILED');

  static const $core.List<CancelSubscriptionDetails_Reason> values =
      <CancelSubscriptionDetails_Reason>[
    REASON_UNSPECIFIED,
    CANCELLATION_REQUESTED,
    PAYMENT_DISPUTED,
    PAYMENT_FAILED,
  ];

  static final $core.Map<$core.int, CancelSubscriptionDetails_Reason> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CancelSubscriptionDetails_Reason? valueOf($core.int value) =>
      _byValue[value];

  const CancelSubscriptionDetails_Reason._($core.int v, $core.String n)
      : super(v, n);
}

/// The feedback for cancellation.
class CancelSubscriptionDetails_Feedback extends $pb.ProtobufEnum {
  static const CancelSubscriptionDetails_Feedback FEEDBACK_UNSPECIFIED =
      CancelSubscriptionDetails_Feedback._(
          0, _omitEnumNames ? '' : 'FEEDBACK_UNSPECIFIED');
  static const CancelSubscriptionDetails_Feedback CUSTOMER_SERVICE =
      CancelSubscriptionDetails_Feedback._(
          1, _omitEnumNames ? '' : 'CUSTOMER_SERVICE');
  static const CancelSubscriptionDetails_Feedback LOW_QUALITY =
      CancelSubscriptionDetails_Feedback._(
          2, _omitEnumNames ? '' : 'LOW_QUALITY');
  static const CancelSubscriptionDetails_Feedback MISSING_FEATURES =
      CancelSubscriptionDetails_Feedback._(
          3, _omitEnumNames ? '' : 'MISSING_FEATURES');
  static const CancelSubscriptionDetails_Feedback OTHER =
      CancelSubscriptionDetails_Feedback._(4, _omitEnumNames ? '' : 'OTHER');
  static const CancelSubscriptionDetails_Feedback SWITCHED_SERVICE =
      CancelSubscriptionDetails_Feedback._(
          5, _omitEnumNames ? '' : 'SWITCHED_SERVICE');
  static const CancelSubscriptionDetails_Feedback TOO_COMPLEX =
      CancelSubscriptionDetails_Feedback._(
          6, _omitEnumNames ? '' : 'TOO_COMPLEX');
  static const CancelSubscriptionDetails_Feedback TOO_EXPENSIVE =
      CancelSubscriptionDetails_Feedback._(
          7, _omitEnumNames ? '' : 'TOO_EXPENSIVE');
  static const CancelSubscriptionDetails_Feedback UNUSED =
      CancelSubscriptionDetails_Feedback._(8, _omitEnumNames ? '' : 'UNUSED');

  static const $core.List<CancelSubscriptionDetails_Feedback> values =
      <CancelSubscriptionDetails_Feedback>[
    FEEDBACK_UNSPECIFIED,
    CUSTOMER_SERVICE,
    LOW_QUALITY,
    MISSING_FEATURES,
    OTHER,
    SWITCHED_SERVICE,
    TOO_COMPLEX,
    TOO_EXPENSIVE,
    UNUSED,
  ];

  static final $core.Map<$core.int, CancelSubscriptionDetails_Feedback>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static CancelSubscriptionDetails_Feedback? valueOf($core.int value) =>
      _byValue[value];

  const CancelSubscriptionDetails_Feedback._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

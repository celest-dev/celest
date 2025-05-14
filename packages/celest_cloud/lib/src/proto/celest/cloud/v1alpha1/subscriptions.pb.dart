//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/subscriptions.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/duration.pb.dart' as $8;
import '../../../google/protobuf/empty.pb.dart' as $1;
import '../../../google/protobuf/timestamp.pb.dart' as $9;
import '../../../google/type/money.pb.dart' as $15;
import 'subscriptions.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'subscriptions.pbenum.dart';

enum Subscription_Plan { community, builder, enterprise, notSet }

enum Subscription_State {
  paymentRequired,
  active,
  paused,
  suspended,
  canceled,
  notSet
}

/// A subscription to the Celest Cloud service.
class Subscription extends $pb.GeneratedMessage {
  factory Subscription({
    $core.String? name,
    $core.String? parent,
    CommunitySubscriptionPlan? community,
    BuilderSubscriptionPlan? builder,
    EnterpriseSubscriptionPlan? enterprise,
    $9.Timestamp? createTime,
    $9.Timestamp? updateTime,
    SubscriptionPaymentRequired? paymentRequired,
    SubscriptionActive? active,
    SubscriptionPaused? paused,
    SubscriptionSuspended? suspended,
    SubscriptionCanceled? canceled,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (parent != null) {
      $result.parent = parent;
    }
    if (community != null) {
      $result.community = community;
    }
    if (builder != null) {
      $result.builder = builder;
    }
    if (enterprise != null) {
      $result.enterprise = enterprise;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (updateTime != null) {
      $result.updateTime = updateTime;
    }
    if (paymentRequired != null) {
      $result.paymentRequired = paymentRequired;
    }
    if (active != null) {
      $result.active = active;
    }
    if (paused != null) {
      $result.paused = paused;
    }
    if (suspended != null) {
      $result.suspended = suspended;
    }
    if (canceled != null) {
      $result.canceled = canceled;
    }
    return $result;
  }
  Subscription._() : super();
  factory Subscription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Subscription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Subscription_Plan> _Subscription_PlanByTag =
      {
    3: Subscription_Plan.community,
    4: Subscription_Plan.builder,
    5: Subscription_Plan.enterprise,
    0: Subscription_Plan.notSet
  };
  static const $core.Map<$core.int, Subscription_State>
      _Subscription_StateByTag = {
    8: Subscription_State.paymentRequired,
    9: Subscription_State.active,
    10: Subscription_State.paused,
    11: Subscription_State.suspended,
    12: Subscription_State.canceled,
    0: Subscription_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Subscription',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..oo(1, [8, 9, 10, 11, 12])
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'parent')
    ..aOM<CommunitySubscriptionPlan>(3, _omitFieldNames ? '' : 'community',
        subBuilder: CommunitySubscriptionPlan.create)
    ..aOM<BuilderSubscriptionPlan>(4, _omitFieldNames ? '' : 'builder',
        subBuilder: BuilderSubscriptionPlan.create)
    ..aOM<EnterpriseSubscriptionPlan>(5, _omitFieldNames ? '' : 'enterprise',
        subBuilder: EnterpriseSubscriptionPlan.create)
    ..aOM<$9.Timestamp>(6, _omitFieldNames ? '' : 'createTime',
        subBuilder: $9.Timestamp.create)
    ..aOM<$9.Timestamp>(7, _omitFieldNames ? '' : 'updateTime',
        subBuilder: $9.Timestamp.create)
    ..aOM<SubscriptionPaymentRequired>(
        8, _omitFieldNames ? '' : 'paymentRequired',
        subBuilder: SubscriptionPaymentRequired.create)
    ..aOM<SubscriptionActive>(9, _omitFieldNames ? '' : 'active',
        subBuilder: SubscriptionActive.create)
    ..aOM<SubscriptionPaused>(10, _omitFieldNames ? '' : 'paused',
        subBuilder: SubscriptionPaused.create)
    ..aOM<SubscriptionSuspended>(11, _omitFieldNames ? '' : 'suspended',
        subBuilder: SubscriptionSuspended.create)
    ..aOM<SubscriptionCanceled>(12, _omitFieldNames ? '' : 'canceled',
        subBuilder: SubscriptionCanceled.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Subscription clone() => Subscription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Subscription copyWith(void Function(Subscription) updates) =>
      super.copyWith((message) => updates(message as Subscription))
          as Subscription;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Subscription create() => Subscription._();
  Subscription createEmptyInstance() => create();
  static $pb.PbList<Subscription> createRepeated() =>
      $pb.PbList<Subscription>();
  @$core.pragma('dart2js:noInline')
  static Subscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Subscription>(create);
  static Subscription? _defaultInstance;

  Subscription_Plan whichPlan() => _Subscription_PlanByTag[$_whichOneof(0)]!;
  void clearPlan() => $_clearField($_whichOneof(0));

  Subscription_State whichState() => _Subscription_StateByTag[$_whichOneof(1)]!;
  void clearState() => $_clearField($_whichOneof(1));

  ///  Identifier. The resource name of the subscription.
  ///
  ///  Format: `users/{user}/subscription`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Output only. The parent resource which owns the subscription.
  @$pb.TagNumber(2)
  $core.String get parent => $_getSZ(1);
  @$pb.TagNumber(2)
  set parent($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => $_clearField(2);

  /// Subscription to the Community plan.
  @$pb.TagNumber(3)
  CommunitySubscriptionPlan get community => $_getN(2);
  @$pb.TagNumber(3)
  set community(CommunitySubscriptionPlan v) {
    $_setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCommunity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommunity() => $_clearField(3);
  @$pb.TagNumber(3)
  CommunitySubscriptionPlan ensureCommunity() => $_ensure(2);

  /// Subscription to a Builder plan.
  @$pb.TagNumber(4)
  BuilderSubscriptionPlan get builder => $_getN(3);
  @$pb.TagNumber(4)
  set builder(BuilderSubscriptionPlan v) {
    $_setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBuilder() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuilder() => $_clearField(4);
  @$pb.TagNumber(4)
  BuilderSubscriptionPlan ensureBuilder() => $_ensure(3);

  /// Subscription to an Enterprise plan.
  @$pb.TagNumber(5)
  EnterpriseSubscriptionPlan get enterprise => $_getN(4);
  @$pb.TagNumber(5)
  set enterprise(EnterpriseSubscriptionPlan v) {
    $_setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEnterprise() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnterprise() => $_clearField(5);
  @$pb.TagNumber(5)
  EnterpriseSubscriptionPlan ensureEnterprise() => $_ensure(4);

  /// Output only. The time the subscription was created.
  @$pb.TagNumber(6)
  $9.Timestamp get createTime => $_getN(5);
  @$pb.TagNumber(6)
  set createTime($9.Timestamp v) {
    $_setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => $_clearField(6);
  @$pb.TagNumber(6)
  $9.Timestamp ensureCreateTime() => $_ensure(5);

  /// Output only. The time the subscription was last updated.
  @$pb.TagNumber(7)
  $9.Timestamp get updateTime => $_getN(6);
  @$pb.TagNumber(7)
  set updateTime($9.Timestamp v) {
    $_setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUpdateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateTime() => $_clearField(7);
  @$pb.TagNumber(7)
  $9.Timestamp ensureUpdateTime() => $_ensure(6);

  /// The subscription requires payment.
  @$pb.TagNumber(8)
  SubscriptionPaymentRequired get paymentRequired => $_getN(7);
  @$pb.TagNumber(8)
  set paymentRequired(SubscriptionPaymentRequired v) {
    $_setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPaymentRequired() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymentRequired() => $_clearField(8);
  @$pb.TagNumber(8)
  SubscriptionPaymentRequired ensurePaymentRequired() => $_ensure(7);

  /// The subscription is active.
  @$pb.TagNumber(9)
  SubscriptionActive get active => $_getN(8);
  @$pb.TagNumber(9)
  set active(SubscriptionActive v) {
    $_setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasActive() => $_has(8);
  @$pb.TagNumber(9)
  void clearActive() => $_clearField(9);
  @$pb.TagNumber(9)
  SubscriptionActive ensureActive() => $_ensure(8);

  /// The subscription is paused.
  @$pb.TagNumber(10)
  SubscriptionPaused get paused => $_getN(9);
  @$pb.TagNumber(10)
  set paused(SubscriptionPaused v) {
    $_setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPaused() => $_has(9);
  @$pb.TagNumber(10)
  void clearPaused() => $_clearField(10);
  @$pb.TagNumber(10)
  SubscriptionPaused ensurePaused() => $_ensure(9);

  /// The subscription is suspended.
  @$pb.TagNumber(11)
  SubscriptionSuspended get suspended => $_getN(10);
  @$pb.TagNumber(11)
  set suspended(SubscriptionSuspended v) {
    $_setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSuspended() => $_has(10);
  @$pb.TagNumber(11)
  void clearSuspended() => $_clearField(11);
  @$pb.TagNumber(11)
  SubscriptionSuspended ensureSuspended() => $_ensure(10);

  /// The subscription is canceled.
  @$pb.TagNumber(12)
  SubscriptionCanceled get canceled => $_getN(11);
  @$pb.TagNumber(12)
  set canceled(SubscriptionCanceled v) {
    $_setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCanceled() => $_has(11);
  @$pb.TagNumber(12)
  void clearCanceled() => $_clearField(12);
  @$pb.TagNumber(12)
  SubscriptionCanceled ensureCanceled() => $_ensure(11);
}

/// The message for when a subscription requires payment.
class SubscriptionPaymentRequired extends $pb.GeneratedMessage {
  factory SubscriptionPaymentRequired({
    $core.String? paymentUri,
    $core.String? redirectUri,
  }) {
    final $result = create();
    if (paymentUri != null) {
      $result.paymentUri = paymentUri;
    }
    if (redirectUri != null) {
      $result.redirectUri = redirectUri;
    }
    return $result;
  }
  SubscriptionPaymentRequired._() : super();
  factory SubscriptionPaymentRequired.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionPaymentRequired.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionPaymentRequired',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'paymentUri')
    ..aOS(2, _omitFieldNames ? '' : 'redirectUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionPaymentRequired clone() =>
      SubscriptionPaymentRequired()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionPaymentRequired copyWith(
          void Function(SubscriptionPaymentRequired) updates) =>
      super.copyWith(
              (message) => updates(message as SubscriptionPaymentRequired))
          as SubscriptionPaymentRequired;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionPaymentRequired create() =>
      SubscriptionPaymentRequired._();
  SubscriptionPaymentRequired createEmptyInstance() => create();
  static $pb.PbList<SubscriptionPaymentRequired> createRepeated() =>
      $pb.PbList<SubscriptionPaymentRequired>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionPaymentRequired getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionPaymentRequired>(create);
  static SubscriptionPaymentRequired? _defaultInstance;

  /// The URI to redirect the user to.
  @$pb.TagNumber(1)
  $core.String get paymentUri => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentUri($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPaymentUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentUri() => $_clearField(1);

  /// The URI the user will be redirected to after payment.
  @$pb.TagNumber(2)
  $core.String get redirectUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set redirectUri($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRedirectUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearRedirectUri() => $_clearField(2);
}

/// The message for when a subscription is active.
class SubscriptionActive extends $pb.GeneratedMessage {
  factory SubscriptionActive({
    SubscriptionBillingInfo? billingInfo,
  }) {
    final $result = create();
    if (billingInfo != null) {
      $result.billingInfo = billingInfo;
    }
    return $result;
  }
  SubscriptionActive._() : super();
  factory SubscriptionActive.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionActive.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionActive',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<SubscriptionBillingInfo>(1, _omitFieldNames ? '' : 'billingInfo',
        subBuilder: SubscriptionBillingInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionActive clone() => SubscriptionActive()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionActive copyWith(void Function(SubscriptionActive) updates) =>
      super.copyWith((message) => updates(message as SubscriptionActive))
          as SubscriptionActive;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionActive create() => SubscriptionActive._();
  SubscriptionActive createEmptyInstance() => create();
  static $pb.PbList<SubscriptionActive> createRepeated() =>
      $pb.PbList<SubscriptionActive>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionActive getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionActive>(create);
  static SubscriptionActive? _defaultInstance;

  /// Optional. Billing information for the subscription, if a paid subscription.
  @$pb.TagNumber(1)
  SubscriptionBillingInfo get billingInfo => $_getN(0);
  @$pb.TagNumber(1)
  set billingInfo(SubscriptionBillingInfo v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBillingInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearBillingInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  SubscriptionBillingInfo ensureBillingInfo() => $_ensure(0);
}

/// Information about the subscription billing.
class SubscriptionBillingInfo extends $pb.GeneratedMessage {
  factory SubscriptionBillingInfo({
    $9.Timestamp? nextBillingTime,
  }) {
    final $result = create();
    if (nextBillingTime != null) {
      $result.nextBillingTime = nextBillingTime;
    }
    return $result;
  }
  SubscriptionBillingInfo._() : super();
  factory SubscriptionBillingInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionBillingInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionBillingInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<$9.Timestamp>(1, _omitFieldNames ? '' : 'nextBillingTime',
        subBuilder: $9.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionBillingInfo clone() =>
      SubscriptionBillingInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionBillingInfo copyWith(
          void Function(SubscriptionBillingInfo) updates) =>
      super.copyWith((message) => updates(message as SubscriptionBillingInfo))
          as SubscriptionBillingInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionBillingInfo create() => SubscriptionBillingInfo._();
  SubscriptionBillingInfo createEmptyInstance() => create();
  static $pb.PbList<SubscriptionBillingInfo> createRepeated() =>
      $pb.PbList<SubscriptionBillingInfo>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionBillingInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionBillingInfo>(create);
  static SubscriptionBillingInfo? _defaultInstance;

  /// The time when the subscription will be billed next.
  @$pb.TagNumber(1)
  $9.Timestamp get nextBillingTime => $_getN(0);
  @$pb.TagNumber(1)
  set nextBillingTime($9.Timestamp v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNextBillingTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearNextBillingTime() => $_clearField(1);
  @$pb.TagNumber(1)
  $9.Timestamp ensureNextBillingTime() => $_ensure(0);
}

/// The message for when a subscription is paused.
class SubscriptionPaused extends $pb.GeneratedMessage {
  factory SubscriptionPaused({
    $9.Timestamp? resumeTime,
  }) {
    final $result = create();
    if (resumeTime != null) {
      $result.resumeTime = resumeTime;
    }
    return $result;
  }
  SubscriptionPaused._() : super();
  factory SubscriptionPaused.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionPaused.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionPaused',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<$9.Timestamp>(1, _omitFieldNames ? '' : 'resumeTime',
        subBuilder: $9.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionPaused clone() => SubscriptionPaused()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionPaused copyWith(void Function(SubscriptionPaused) updates) =>
      super.copyWith((message) => updates(message as SubscriptionPaused))
          as SubscriptionPaused;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionPaused create() => SubscriptionPaused._();
  SubscriptionPaused createEmptyInstance() => create();
  static $pb.PbList<SubscriptionPaused> createRepeated() =>
      $pb.PbList<SubscriptionPaused>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionPaused getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionPaused>(create);
  static SubscriptionPaused? _defaultInstance;

  /// The time the subscription is scheduled to resume.
  @$pb.TagNumber(1)
  $9.Timestamp get resumeTime => $_getN(0);
  @$pb.TagNumber(1)
  set resumeTime($9.Timestamp v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResumeTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearResumeTime() => $_clearField(1);
  @$pb.TagNumber(1)
  $9.Timestamp ensureResumeTime() => $_ensure(0);
}

/// The message for when a subscription is suspended.
class SubscriptionSuspended extends $pb.GeneratedMessage {
  factory SubscriptionSuspended({
    $core.String? reason,
  }) {
    final $result = create();
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  SubscriptionSuspended._() : super();
  factory SubscriptionSuspended.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionSuspended.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionSuspended',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionSuspended clone() =>
      SubscriptionSuspended()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionSuspended copyWith(
          void Function(SubscriptionSuspended) updates) =>
      super.copyWith((message) => updates(message as SubscriptionSuspended))
          as SubscriptionSuspended;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionSuspended create() => SubscriptionSuspended._();
  SubscriptionSuspended createEmptyInstance() => create();
  static $pb.PbList<SubscriptionSuspended> createRepeated() =>
      $pb.PbList<SubscriptionSuspended>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionSuspended getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionSuspended>(create);
  static SubscriptionSuspended? _defaultInstance;

  /// The reason the subscription was suspended, if available.
  @$pb.TagNumber(1)
  $core.String get reason => $_getSZ(0);
  @$pb.TagNumber(1)
  set reason($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => $_clearField(1);
}

/// The message for when a subscription is canceled.
class SubscriptionCanceled extends $pb.GeneratedMessage {
  factory SubscriptionCanceled({
    $9.Timestamp? cancelTime,
    CancelSubscriptionDetails? details,
  }) {
    final $result = create();
    if (cancelTime != null) {
      $result.cancelTime = cancelTime;
    }
    if (details != null) {
      $result.details = details;
    }
    return $result;
  }
  SubscriptionCanceled._() : super();
  factory SubscriptionCanceled.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionCanceled.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionCanceled',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<$9.Timestamp>(1, _omitFieldNames ? '' : 'cancelTime',
        subBuilder: $9.Timestamp.create)
    ..aOM<CancelSubscriptionDetails>(2, _omitFieldNames ? '' : 'details',
        subBuilder: CancelSubscriptionDetails.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionCanceled clone() =>
      SubscriptionCanceled()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionCanceled copyWith(void Function(SubscriptionCanceled) updates) =>
      super.copyWith((message) => updates(message as SubscriptionCanceled))
          as SubscriptionCanceled;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionCanceled create() => SubscriptionCanceled._();
  SubscriptionCanceled createEmptyInstance() => create();
  static $pb.PbList<SubscriptionCanceled> createRepeated() =>
      $pb.PbList<SubscriptionCanceled>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionCanceled getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionCanceled>(create);
  static SubscriptionCanceled? _defaultInstance;

  /// The time the subscription was canceled.
  @$pb.TagNumber(1)
  $9.Timestamp get cancelTime => $_getN(0);
  @$pb.TagNumber(1)
  set cancelTime($9.Timestamp v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCancelTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearCancelTime() => $_clearField(1);
  @$pb.TagNumber(1)
  $9.Timestamp ensureCancelTime() => $_ensure(0);

  /// The details of the cancellation, if provided.
  @$pb.TagNumber(2)
  CancelSubscriptionDetails get details => $_getN(1);
  @$pb.TagNumber(2)
  set details(CancelSubscriptionDetails v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetails() => $_clearField(2);
  @$pb.TagNumber(2)
  CancelSubscriptionDetails ensureDetails() => $_ensure(1);
}

/// A Community subscription plan.
class CommunitySubscriptionPlan extends $pb.GeneratedMessage {
  factory CommunitySubscriptionPlan() => create();
  CommunitySubscriptionPlan._() : super();
  factory CommunitySubscriptionPlan.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommunitySubscriptionPlan.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommunitySubscriptionPlan',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommunitySubscriptionPlan clone() =>
      CommunitySubscriptionPlan()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommunitySubscriptionPlan copyWith(
          void Function(CommunitySubscriptionPlan) updates) =>
      super.copyWith((message) => updates(message as CommunitySubscriptionPlan))
          as CommunitySubscriptionPlan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommunitySubscriptionPlan create() => CommunitySubscriptionPlan._();
  CommunitySubscriptionPlan createEmptyInstance() => create();
  static $pb.PbList<CommunitySubscriptionPlan> createRepeated() =>
      $pb.PbList<CommunitySubscriptionPlan>();
  @$core.pragma('dart2js:noInline')
  static CommunitySubscriptionPlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommunitySubscriptionPlan>(create);
  static CommunitySubscriptionPlan? _defaultInstance;
}

/// A Builder subscription plan.
class BuilderSubscriptionPlan extends $pb.GeneratedMessage {
  factory BuilderSubscriptionPlan({
    $core.String? currencyCode,
    InstanceType? instanceType,
  }) {
    final $result = create();
    if (currencyCode != null) {
      $result.currencyCode = currencyCode;
    }
    if (instanceType != null) {
      $result.instanceType = instanceType;
    }
    return $result;
  }
  BuilderSubscriptionPlan._() : super();
  factory BuilderSubscriptionPlan.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BuilderSubscriptionPlan.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuilderSubscriptionPlan',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currencyCode')
    ..e<InstanceType>(
        2, _omitFieldNames ? '' : 'instanceType', $pb.PbFieldType.OE,
        defaultOrMaker: InstanceType.INSTANCE_TYPE_UNSPECIFIED,
        valueOf: InstanceType.valueOf,
        enumValues: InstanceType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BuilderSubscriptionPlan clone() =>
      BuilderSubscriptionPlan()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BuilderSubscriptionPlan copyWith(
          void Function(BuilderSubscriptionPlan) updates) =>
      super.copyWith((message) => updates(message as BuilderSubscriptionPlan))
          as BuilderSubscriptionPlan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuilderSubscriptionPlan create() => BuilderSubscriptionPlan._();
  BuilderSubscriptionPlan createEmptyInstance() => create();
  static $pb.PbList<BuilderSubscriptionPlan> createRepeated() =>
      $pb.PbList<BuilderSubscriptionPlan>();
  @$core.pragma('dart2js:noInline')
  static BuilderSubscriptionPlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuilderSubscriptionPlan>(create);
  static BuilderSubscriptionPlan? _defaultInstance;

  ///  Optional. The preferred currency for payment.
  ///
  ///  If not provided, it will be inferred from the user's location.
  @$pb.TagNumber(1)
  $core.String get currencyCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set currencyCode($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrencyCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrencyCode() => $_clearField(1);

  /// Required. The instance type for the plan.
  @$pb.TagNumber(2)
  InstanceType get instanceType => $_getN(1);
  @$pb.TagNumber(2)
  set instanceType(InstanceType v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInstanceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearInstanceType() => $_clearField(2);
}

/// An Enterprise subscription plan.
class EnterpriseSubscriptionPlan extends $pb.GeneratedMessage {
  factory EnterpriseSubscriptionPlan() => create();
  EnterpriseSubscriptionPlan._() : super();
  factory EnterpriseSubscriptionPlan.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnterpriseSubscriptionPlan.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnterpriseSubscriptionPlan',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnterpriseSubscriptionPlan clone() =>
      EnterpriseSubscriptionPlan()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnterpriseSubscriptionPlan copyWith(
          void Function(EnterpriseSubscriptionPlan) updates) =>
      super.copyWith(
              (message) => updates(message as EnterpriseSubscriptionPlan))
          as EnterpriseSubscriptionPlan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnterpriseSubscriptionPlan create() => EnterpriseSubscriptionPlan._();
  EnterpriseSubscriptionPlan createEmptyInstance() => create();
  static $pb.PbList<EnterpriseSubscriptionPlan> createRepeated() =>
      $pb.PbList<EnterpriseSubscriptionPlan>();
  @$core.pragma('dart2js:noInline')
  static EnterpriseSubscriptionPlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnterpriseSubscriptionPlan>(create);
  static EnterpriseSubscriptionPlan? _defaultInstance;
}

/// The request message for the `GetSubscription` method.
class GetSubscriptionRequest extends $pb.GeneratedMessage {
  factory GetSubscriptionRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetSubscriptionRequest._() : super();
  factory GetSubscriptionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetSubscriptionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSubscriptionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetSubscriptionRequest clone() =>
      GetSubscriptionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetSubscriptionRequest copyWith(
          void Function(GetSubscriptionRequest) updates) =>
      super.copyWith((message) => updates(message as GetSubscriptionRequest))
          as GetSubscriptionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSubscriptionRequest create() => GetSubscriptionRequest._();
  GetSubscriptionRequest createEmptyInstance() => create();
  static $pb.PbList<GetSubscriptionRequest> createRepeated() =>
      $pb.PbList<GetSubscriptionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSubscriptionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSubscriptionRequest>(create);
  static GetSubscriptionRequest? _defaultInstance;

  /// Required. The name of the subscription to get.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

enum ChangePlanRequest_Plan { community, builder, enterprise, notSet }

/// The request message for the `ChangePlan` method.
class ChangePlanRequest extends $pb.GeneratedMessage {
  factory ChangePlanRequest({
    $core.String? name,
    CommunitySubscriptionPlan? community,
    BuilderSubscriptionPlan? builder,
    EnterpriseSubscriptionPlan? enterprise,
    $core.String? redirectUri,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (community != null) {
      $result.community = community;
    }
    if (builder != null) {
      $result.builder = builder;
    }
    if (enterprise != null) {
      $result.enterprise = enterprise;
    }
    if (redirectUri != null) {
      $result.redirectUri = redirectUri;
    }
    return $result;
  }
  ChangePlanRequest._() : super();
  factory ChangePlanRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChangePlanRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ChangePlanRequest_Plan>
      _ChangePlanRequest_PlanByTag = {
    2: ChangePlanRequest_Plan.community,
    3: ChangePlanRequest_Plan.builder,
    4: ChangePlanRequest_Plan.enterprise,
    0: ChangePlanRequest_Plan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangePlanRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<CommunitySubscriptionPlan>(2, _omitFieldNames ? '' : 'community',
        subBuilder: CommunitySubscriptionPlan.create)
    ..aOM<BuilderSubscriptionPlan>(3, _omitFieldNames ? '' : 'builder',
        subBuilder: BuilderSubscriptionPlan.create)
    ..aOM<EnterpriseSubscriptionPlan>(4, _omitFieldNames ? '' : 'enterprise',
        subBuilder: EnterpriseSubscriptionPlan.create)
    ..aOS(6, _omitFieldNames ? '' : 'redirectUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChangePlanRequest clone() => ChangePlanRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChangePlanRequest copyWith(void Function(ChangePlanRequest) updates) =>
      super.copyWith((message) => updates(message as ChangePlanRequest))
          as ChangePlanRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePlanRequest create() => ChangePlanRequest._();
  ChangePlanRequest createEmptyInstance() => create();
  static $pb.PbList<ChangePlanRequest> createRepeated() =>
      $pb.PbList<ChangePlanRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangePlanRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangePlanRequest>(create);
  static ChangePlanRequest? _defaultInstance;

  ChangePlanRequest_Plan whichPlan() =>
      _ChangePlanRequest_PlanByTag[$_whichOneof(0)]!;
  void clearPlan() => $_clearField($_whichOneof(0));

  /// Required. The parent resource where the subscription will be updated.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// The Community plan.
  @$pb.TagNumber(2)
  CommunitySubscriptionPlan get community => $_getN(1);
  @$pb.TagNumber(2)
  set community(CommunitySubscriptionPlan v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCommunity() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommunity() => $_clearField(2);
  @$pb.TagNumber(2)
  CommunitySubscriptionPlan ensureCommunity() => $_ensure(1);

  /// A Builder plan.
  @$pb.TagNumber(3)
  BuilderSubscriptionPlan get builder => $_getN(2);
  @$pb.TagNumber(3)
  set builder(BuilderSubscriptionPlan v) {
    $_setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBuilder() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuilder() => $_clearField(3);
  @$pb.TagNumber(3)
  BuilderSubscriptionPlan ensureBuilder() => $_ensure(2);

  /// An Enterprise plan.
  @$pb.TagNumber(4)
  EnterpriseSubscriptionPlan get enterprise => $_getN(3);
  @$pb.TagNumber(4)
  set enterprise(EnterpriseSubscriptionPlan v) {
    $_setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEnterprise() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnterprise() => $_clearField(4);
  @$pb.TagNumber(4)
  EnterpriseSubscriptionPlan ensureEnterprise() => $_ensure(3);

  /// Optional. The URI to redirect the client after payment.
  @$pb.TagNumber(6)
  $core.String get redirectUri => $_getSZ(4);
  @$pb.TagNumber(6)
  set redirectUri($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRedirectUri() => $_has(4);
  @$pb.TagNumber(6)
  void clearRedirectUri() => $_clearField(6);
}

/// The response message for the `ChangePlan` method.
class ChangePlanResponse extends $pb.GeneratedMessage {
  factory ChangePlanResponse({
    Subscription? subscription,
  }) {
    final $result = create();
    if (subscription != null) {
      $result.subscription = subscription;
    }
    return $result;
  }
  ChangePlanResponse._() : super();
  factory ChangePlanResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChangePlanResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangePlanResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<Subscription>(1, _omitFieldNames ? '' : 'subscription',
        subBuilder: Subscription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChangePlanResponse clone() => ChangePlanResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChangePlanResponse copyWith(void Function(ChangePlanResponse) updates) =>
      super.copyWith((message) => updates(message as ChangePlanResponse))
          as ChangePlanResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePlanResponse create() => ChangePlanResponse._();
  ChangePlanResponse createEmptyInstance() => create();
  static $pb.PbList<ChangePlanResponse> createRepeated() =>
      $pb.PbList<ChangePlanResponse>();
  @$core.pragma('dart2js:noInline')
  static ChangePlanResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangePlanResponse>(create);
  static ChangePlanResponse? _defaultInstance;

  /// The updated subscription.
  @$pb.TagNumber(1)
  Subscription get subscription => $_getN(0);
  @$pb.TagNumber(1)
  set subscription(Subscription v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubscription() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscription() => $_clearField(1);
  @$pb.TagNumber(1)
  Subscription ensureSubscription() => $_ensure(0);
}

/// The request message for the `PauseSubscription` method.
class PauseSubscriptionRequest extends $pb.GeneratedMessage {
  factory PauseSubscriptionRequest({
    $core.String? name,
    $9.Timestamp? resumeTime,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (resumeTime != null) {
      $result.resumeTime = resumeTime;
    }
    return $result;
  }
  PauseSubscriptionRequest._() : super();
  factory PauseSubscriptionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PauseSubscriptionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseSubscriptionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<$9.Timestamp>(2, _omitFieldNames ? '' : 'resumeTime',
        subBuilder: $9.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PauseSubscriptionRequest clone() =>
      PauseSubscriptionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PauseSubscriptionRequest copyWith(
          void Function(PauseSubscriptionRequest) updates) =>
      super.copyWith((message) => updates(message as PauseSubscriptionRequest))
          as PauseSubscriptionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseSubscriptionRequest create() => PauseSubscriptionRequest._();
  PauseSubscriptionRequest createEmptyInstance() => create();
  static $pb.PbList<PauseSubscriptionRequest> createRepeated() =>
      $pb.PbList<PauseSubscriptionRequest>();
  @$core.pragma('dart2js:noInline')
  static PauseSubscriptionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseSubscriptionRequest>(create);
  static PauseSubscriptionRequest? _defaultInstance;

  /// Required. The name of the subscription to pause.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Optional. The time to resume the subscription.
  @$pb.TagNumber(2)
  $9.Timestamp get resumeTime => $_getN(1);
  @$pb.TagNumber(2)
  set resumeTime($9.Timestamp v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResumeTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearResumeTime() => $_clearField(2);
  @$pb.TagNumber(2)
  $9.Timestamp ensureResumeTime() => $_ensure(1);
}

/// The response message for the `PauseSubscription` method.
class PauseSubscriptionResponse extends $pb.GeneratedMessage {
  factory PauseSubscriptionResponse({
    Subscription? subscription,
  }) {
    final $result = create();
    if (subscription != null) {
      $result.subscription = subscription;
    }
    return $result;
  }
  PauseSubscriptionResponse._() : super();
  factory PauseSubscriptionResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PauseSubscriptionResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PauseSubscriptionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<Subscription>(1, _omitFieldNames ? '' : 'subscription',
        subBuilder: Subscription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PauseSubscriptionResponse clone() =>
      PauseSubscriptionResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PauseSubscriptionResponse copyWith(
          void Function(PauseSubscriptionResponse) updates) =>
      super.copyWith((message) => updates(message as PauseSubscriptionResponse))
          as PauseSubscriptionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PauseSubscriptionResponse create() => PauseSubscriptionResponse._();
  PauseSubscriptionResponse createEmptyInstance() => create();
  static $pb.PbList<PauseSubscriptionResponse> createRepeated() =>
      $pb.PbList<PauseSubscriptionResponse>();
  @$core.pragma('dart2js:noInline')
  static PauseSubscriptionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PauseSubscriptionResponse>(create);
  static PauseSubscriptionResponse? _defaultInstance;

  /// The updated subscription.
  @$pb.TagNumber(1)
  Subscription get subscription => $_getN(0);
  @$pb.TagNumber(1)
  set subscription(Subscription v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubscription() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscription() => $_clearField(1);
  @$pb.TagNumber(1)
  Subscription ensureSubscription() => $_ensure(0);
}

/// The request message for the `CancelSubscription` method.
class CancelSubscriptionRequest extends $pb.GeneratedMessage {
  factory CancelSubscriptionRequest({
    $core.String? name,
    CancelSubscriptionDetails? details,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (details != null) {
      $result.details = details;
    }
    return $result;
  }
  CancelSubscriptionRequest._() : super();
  factory CancelSubscriptionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CancelSubscriptionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelSubscriptionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<CancelSubscriptionDetails>(2, _omitFieldNames ? '' : 'details',
        subBuilder: CancelSubscriptionDetails.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CancelSubscriptionRequest clone() =>
      CancelSubscriptionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CancelSubscriptionRequest copyWith(
          void Function(CancelSubscriptionRequest) updates) =>
      super.copyWith((message) => updates(message as CancelSubscriptionRequest))
          as CancelSubscriptionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelSubscriptionRequest create() => CancelSubscriptionRequest._();
  CancelSubscriptionRequest createEmptyInstance() => create();
  static $pb.PbList<CancelSubscriptionRequest> createRepeated() =>
      $pb.PbList<CancelSubscriptionRequest>();
  @$core.pragma('dart2js:noInline')
  static CancelSubscriptionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelSubscriptionRequest>(create);
  static CancelSubscriptionRequest? _defaultInstance;

  /// Required. The name of the subscription to cancel.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Optional. Details of the cancellation.
  @$pb.TagNumber(2)
  CancelSubscriptionDetails get details => $_getN(1);
  @$pb.TagNumber(2)
  set details(CancelSubscriptionDetails v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetails() => $_clearField(2);
  @$pb.TagNumber(2)
  CancelSubscriptionDetails ensureDetails() => $_ensure(1);
}

/// Details of the cancellation of a subscription.
class CancelSubscriptionDetails extends $pb.GeneratedMessage {
  factory CancelSubscriptionDetails({
    CancelSubscriptionDetails_Reason? reason,
    CancelSubscriptionDetails_Feedback? feedback,
    $core.String? comment,
  }) {
    final $result = create();
    if (reason != null) {
      $result.reason = reason;
    }
    if (feedback != null) {
      $result.feedback = feedback;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  CancelSubscriptionDetails._() : super();
  factory CancelSubscriptionDetails.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CancelSubscriptionDetails.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelSubscriptionDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..e<CancelSubscriptionDetails_Reason>(
        1, _omitFieldNames ? '' : 'reason', $pb.PbFieldType.OE,
        defaultOrMaker: CancelSubscriptionDetails_Reason.REASON_UNSPECIFIED,
        valueOf: CancelSubscriptionDetails_Reason.valueOf,
        enumValues: CancelSubscriptionDetails_Reason.values)
    ..e<CancelSubscriptionDetails_Feedback>(
        2, _omitFieldNames ? '' : 'feedback', $pb.PbFieldType.OE,
        defaultOrMaker: CancelSubscriptionDetails_Feedback.FEEDBACK_UNSPECIFIED,
        valueOf: CancelSubscriptionDetails_Feedback.valueOf,
        enumValues: CancelSubscriptionDetails_Feedback.values)
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CancelSubscriptionDetails clone() =>
      CancelSubscriptionDetails()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CancelSubscriptionDetails copyWith(
          void Function(CancelSubscriptionDetails) updates) =>
      super.copyWith((message) => updates(message as CancelSubscriptionDetails))
          as CancelSubscriptionDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelSubscriptionDetails create() => CancelSubscriptionDetails._();
  CancelSubscriptionDetails createEmptyInstance() => create();
  static $pb.PbList<CancelSubscriptionDetails> createRepeated() =>
      $pb.PbList<CancelSubscriptionDetails>();
  @$core.pragma('dart2js:noInline')
  static CancelSubscriptionDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelSubscriptionDetails>(create);
  static CancelSubscriptionDetails? _defaultInstance;

  /// Optional. The reason for the cancellation.
  @$pb.TagNumber(1)
  CancelSubscriptionDetails_Reason get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason(CancelSubscriptionDetails_Reason v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => $_clearField(1);

  /// Optional. Customer feedback for the cancellation.
  @$pb.TagNumber(2)
  CancelSubscriptionDetails_Feedback get feedback => $_getN(1);
  @$pb.TagNumber(2)
  set feedback(CancelSubscriptionDetails_Feedback v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFeedback() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeedback() => $_clearField(2);

  /// Optional. Customer comments for the cancellation.
  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => $_clearField(3);
}

/// The response message for the `CancelSubscription` method.
class CancelSubscriptionResponse extends $pb.GeneratedMessage {
  factory CancelSubscriptionResponse({
    Subscription? subscription,
  }) {
    final $result = create();
    if (subscription != null) {
      $result.subscription = subscription;
    }
    return $result;
  }
  CancelSubscriptionResponse._() : super();
  factory CancelSubscriptionResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CancelSubscriptionResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelSubscriptionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<Subscription>(1, _omitFieldNames ? '' : 'subscription',
        subBuilder: Subscription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CancelSubscriptionResponse clone() =>
      CancelSubscriptionResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CancelSubscriptionResponse copyWith(
          void Function(CancelSubscriptionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CancelSubscriptionResponse))
          as CancelSubscriptionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelSubscriptionResponse create() => CancelSubscriptionResponse._();
  CancelSubscriptionResponse createEmptyInstance() => create();
  static $pb.PbList<CancelSubscriptionResponse> createRepeated() =>
      $pb.PbList<CancelSubscriptionResponse>();
  @$core.pragma('dart2js:noInline')
  static CancelSubscriptionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelSubscriptionResponse>(create);
  static CancelSubscriptionResponse? _defaultInstance;

  /// The updated subscription.
  @$pb.TagNumber(1)
  Subscription get subscription => $_getN(0);
  @$pb.TagNumber(1)
  set subscription(Subscription v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubscription() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscription() => $_clearField(1);
  @$pb.TagNumber(1)
  Subscription ensureSubscription() => $_ensure(0);
}

/// A quantity of a unit of measure.
class Quantity extends $pb.GeneratedMessage {
  factory Quantity({
    Measure? measure,
    $fixnum.Int64? units,
    $core.int? nanos,
  }) {
    final $result = create();
    if (measure != null) {
      $result.measure = measure;
    }
    if (units != null) {
      $result.units = units;
    }
    if (nanos != null) {
      $result.nanos = nanos;
    }
    return $result;
  }
  Quantity._() : super();
  factory Quantity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Quantity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Quantity',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..e<Measure>(1, _omitFieldNames ? '' : 'measure', $pb.PbFieldType.OE,
        defaultOrMaker: Measure.MEASURE_UNSPECIFIED,
        valueOf: Measure.valueOf,
        enumValues: Measure.values)
    ..aInt64(2, _omitFieldNames ? '' : 'units')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'nanos', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Quantity clone() => Quantity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Quantity copyWith(void Function(Quantity) updates) =>
      super.copyWith((message) => updates(message as Quantity)) as Quantity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Quantity create() => Quantity._();
  Quantity createEmptyInstance() => create();
  static $pb.PbList<Quantity> createRepeated() => $pb.PbList<Quantity>();
  @$core.pragma('dart2js:noInline')
  static Quantity getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Quantity>(create);
  static Quantity? _defaultInstance;

  /// The unit of measure.
  @$pb.TagNumber(1)
  Measure get measure => $_getN(0);
  @$pb.TagNumber(1)
  set measure(Measure v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMeasure() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeasure() => $_clearField(1);

  /// The whole number of units.
  @$pb.TagNumber(2)
  $fixnum.Int64 get units => $_getI64(1);
  @$pb.TagNumber(2)
  set units($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnits() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnits() => $_clearField(2);

  /// Number of nano (10^-9) units of the amount.
  /// (-- api-linter: core::0142::time-field-type=disabled
  ///     aip.dev/not-precedent: False positive --)
  @$pb.TagNumber(3)
  $core.int get nanos => $_getIZ(2);
  @$pb.TagNumber(3)
  set nanos($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNanos() => $_has(2);
  @$pb.TagNumber(3)
  void clearNanos() => $_clearField(3);
}

/// The request message for the `DescribePricing` method.
class DescribePricingRequest extends $pb.GeneratedMessage {
  factory DescribePricingRequest({
    $core.String? regionCode,
    $core.String? currencyCode,
  }) {
    final $result = create();
    if (regionCode != null) {
      $result.regionCode = regionCode;
    }
    if (currencyCode != null) {
      $result.currencyCode = currencyCode;
    }
    return $result;
  }
  DescribePricingRequest._() : super();
  factory DescribePricingRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DescribePricingRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DescribePricingRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'regionCode')
    ..aOS(2, _omitFieldNames ? '' : 'currencyCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DescribePricingRequest clone() =>
      DescribePricingRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DescribePricingRequest copyWith(
          void Function(DescribePricingRequest) updates) =>
      super.copyWith((message) => updates(message as DescribePricingRequest))
          as DescribePricingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DescribePricingRequest create() => DescribePricingRequest._();
  DescribePricingRequest createEmptyInstance() => create();
  static $pb.PbList<DescribePricingRequest> createRepeated() =>
      $pb.PbList<DescribePricingRequest>();
  @$core.pragma('dart2js:noInline')
  static DescribePricingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DescribePricingRequest>(create);
  static DescribePricingRequest? _defaultInstance;

  /// Optional. The region code to get pricing for.
  @$pb.TagNumber(1)
  $core.String get regionCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set regionCode($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRegionCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegionCode() => $_clearField(1);

  /// Optional. The currency code to get pricing for.
  @$pb.TagNumber(2)
  $core.String get currencyCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set currencyCode($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrencyCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrencyCode() => $_clearField(2);
}

/// The response message for the `DescribePricing` method.
class DescribePricingResponse extends $pb.GeneratedMessage {
  factory DescribePricingResponse({
    $core.String? regionCode,
    $core.String? currencyCode,
    $core.Iterable<Pricing>? prices,
  }) {
    final $result = create();
    if (regionCode != null) {
      $result.regionCode = regionCode;
    }
    if (currencyCode != null) {
      $result.currencyCode = currencyCode;
    }
    if (prices != null) {
      $result.prices.addAll(prices);
    }
    return $result;
  }
  DescribePricingResponse._() : super();
  factory DescribePricingResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DescribePricingResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DescribePricingResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'regionCode')
    ..aOS(2, _omitFieldNames ? '' : 'currencyCode')
    ..pc<Pricing>(3, _omitFieldNames ? '' : 'prices', $pb.PbFieldType.PM,
        subBuilder: Pricing.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DescribePricingResponse clone() =>
      DescribePricingResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DescribePricingResponse copyWith(
          void Function(DescribePricingResponse) updates) =>
      super.copyWith((message) => updates(message as DescribePricingResponse))
          as DescribePricingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DescribePricingResponse create() => DescribePricingResponse._();
  DescribePricingResponse createEmptyInstance() => create();
  static $pb.PbList<DescribePricingResponse> createRepeated() =>
      $pb.PbList<DescribePricingResponse>();
  @$core.pragma('dart2js:noInline')
  static DescribePricingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DescribePricingResponse>(create);
  static DescribePricingResponse? _defaultInstance;

  /// The region code for the pricing.
  @$pb.TagNumber(1)
  $core.String get regionCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set regionCode($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRegionCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegionCode() => $_clearField(1);

  /// The currency code for the pricing.
  @$pb.TagNumber(2)
  $core.String get currencyCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set currencyCode($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrencyCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrencyCode() => $_clearField(2);

  /// The pricing information for all subscription plans.
  @$pb.TagNumber(3)
  $pb.PbList<Pricing> get prices => $_getList(2);
}

enum Pricing_Promotion_Discount { amount, percentage, notSet }

enum Pricing_Promotion_Duration { forever, once, repeating, notSet }

/// A promotion for a subscription plan.
class Pricing_Promotion extends $pb.GeneratedMessage {
  factory Pricing_Promotion({
    $core.String? couponCode,
    $15.Money? amount,
    $core.int? percentage,
    $1.Empty? forever,
    $1.Empty? once,
    $8.Duration? repeating,
    $9.Timestamp? expireTime,
  }) {
    final $result = create();
    if (couponCode != null) {
      $result.couponCode = couponCode;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (percentage != null) {
      $result.percentage = percentage;
    }
    if (forever != null) {
      $result.forever = forever;
    }
    if (once != null) {
      $result.once = once;
    }
    if (repeating != null) {
      $result.repeating = repeating;
    }
    if (expireTime != null) {
      $result.expireTime = expireTime;
    }
    return $result;
  }
  Pricing_Promotion._() : super();
  factory Pricing_Promotion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Pricing_Promotion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Pricing_Promotion_Discount>
      _Pricing_Promotion_DiscountByTag = {
    2: Pricing_Promotion_Discount.amount,
    3: Pricing_Promotion_Discount.percentage,
    0: Pricing_Promotion_Discount.notSet
  };
  static const $core.Map<$core.int, Pricing_Promotion_Duration>
      _Pricing_Promotion_DurationByTag = {
    4: Pricing_Promotion_Duration.forever,
    5: Pricing_Promotion_Duration.once,
    6: Pricing_Promotion_Duration.repeating,
    0: Pricing_Promotion_Duration.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pricing.Promotion',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5, 6])
    ..aOS(1, _omitFieldNames ? '' : 'couponCode')
    ..aOM<$15.Money>(2, _omitFieldNames ? '' : 'amount',
        subBuilder: $15.Money.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'percentage', $pb.PbFieldType.O3)
    ..aOM<$1.Empty>(4, _omitFieldNames ? '' : 'forever',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(5, _omitFieldNames ? '' : 'once',
        subBuilder: $1.Empty.create)
    ..aOM<$8.Duration>(6, _omitFieldNames ? '' : 'repeating',
        subBuilder: $8.Duration.create)
    ..aOM<$9.Timestamp>(7, _omitFieldNames ? '' : 'expireTime',
        subBuilder: $9.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Pricing_Promotion clone() => Pricing_Promotion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Pricing_Promotion copyWith(void Function(Pricing_Promotion) updates) =>
      super.copyWith((message) => updates(message as Pricing_Promotion))
          as Pricing_Promotion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pricing_Promotion create() => Pricing_Promotion._();
  Pricing_Promotion createEmptyInstance() => create();
  static $pb.PbList<Pricing_Promotion> createRepeated() =>
      $pb.PbList<Pricing_Promotion>();
  @$core.pragma('dart2js:noInline')
  static Pricing_Promotion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Pricing_Promotion>(create);
  static Pricing_Promotion? _defaultInstance;

  Pricing_Promotion_Discount whichDiscount() =>
      _Pricing_Promotion_DiscountByTag[$_whichOneof(0)]!;
  void clearDiscount() => $_clearField($_whichOneof(0));

  Pricing_Promotion_Duration whichDuration() =>
      _Pricing_Promotion_DurationByTag[$_whichOneof(1)]!;
  void clearDuration() => $_clearField($_whichOneof(1));

  /// The coupon code for the promotion.
  @$pb.TagNumber(1)
  $core.String get couponCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set couponCode($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCouponCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouponCode() => $_clearField(1);

  /// The discount amount.
  @$pb.TagNumber(2)
  $15.Money get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($15.Money v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
  @$pb.TagNumber(2)
  $15.Money ensureAmount() => $_ensure(1);

  /// The discount percentage.
  @$pb.TagNumber(3)
  $core.int get percentage => $_getIZ(2);
  @$pb.TagNumber(3)
  set percentage($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPercentage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentage() => $_clearField(3);

  /// The promotion is applied forever.
  @$pb.TagNumber(4)
  $1.Empty get forever => $_getN(3);
  @$pb.TagNumber(4)
  set forever($1.Empty v) {
    $_setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasForever() => $_has(3);
  @$pb.TagNumber(4)
  void clearForever() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureForever() => $_ensure(3);

  /// The promotion is applied once.
  @$pb.TagNumber(5)
  $1.Empty get once => $_getN(4);
  @$pb.TagNumber(5)
  set once($1.Empty v) {
    $_setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnce() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnce() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureOnce() => $_ensure(4);

  /// The duration of the promotion.
  @$pb.TagNumber(6)
  $8.Duration get repeating => $_getN(5);
  @$pb.TagNumber(6)
  set repeating($8.Duration v) {
    $_setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRepeating() => $_has(5);
  @$pb.TagNumber(6)
  void clearRepeating() => $_clearField(6);
  @$pb.TagNumber(6)
  $8.Duration ensureRepeating() => $_ensure(5);

  /// Optional. The time the promotion expires.
  @$pb.TagNumber(7)
  $9.Timestamp get expireTime => $_getN(6);
  @$pb.TagNumber(7)
  set expireTime($9.Timestamp v) {
    $_setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasExpireTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpireTime() => $_clearField(7);
  @$pb.TagNumber(7)
  $9.Timestamp ensureExpireTime() => $_ensure(6);
}

enum Pricing_Plan { community, builder, enterprise, notSet }

/// Pricing information for a subscription plan.
class Pricing extends $pb.GeneratedMessage {
  factory Pricing({
    CommunitySubscriptionPlan? community,
    BuilderSubscriptionPlan? builder,
    EnterpriseSubscriptionPlan? enterprise,
    $15.Money? price,
    $core.Iterable<Pricing_Promotion>? promotions,
  }) {
    final $result = create();
    if (community != null) {
      $result.community = community;
    }
    if (builder != null) {
      $result.builder = builder;
    }
    if (enterprise != null) {
      $result.enterprise = enterprise;
    }
    if (price != null) {
      $result.price = price;
    }
    if (promotions != null) {
      $result.promotions.addAll(promotions);
    }
    return $result;
  }
  Pricing._() : super();
  factory Pricing.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Pricing.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Pricing_Plan> _Pricing_PlanByTag = {
    1: Pricing_Plan.community,
    2: Pricing_Plan.builder,
    3: Pricing_Plan.enterprise,
    0: Pricing_Plan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pricing',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<CommunitySubscriptionPlan>(1, _omitFieldNames ? '' : 'community',
        subBuilder: CommunitySubscriptionPlan.create)
    ..aOM<BuilderSubscriptionPlan>(2, _omitFieldNames ? '' : 'builder',
        subBuilder: BuilderSubscriptionPlan.create)
    ..aOM<EnterpriseSubscriptionPlan>(3, _omitFieldNames ? '' : 'enterprise',
        subBuilder: EnterpriseSubscriptionPlan.create)
    ..aOM<$15.Money>(4, _omitFieldNames ? '' : 'price',
        subBuilder: $15.Money.create)
    ..pc<Pricing_Promotion>(
        5, _omitFieldNames ? '' : 'promotions', $pb.PbFieldType.PM,
        subBuilder: Pricing_Promotion.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Pricing clone() => Pricing()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Pricing copyWith(void Function(Pricing) updates) =>
      super.copyWith((message) => updates(message as Pricing)) as Pricing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pricing create() => Pricing._();
  Pricing createEmptyInstance() => create();
  static $pb.PbList<Pricing> createRepeated() => $pb.PbList<Pricing>();
  @$core.pragma('dart2js:noInline')
  static Pricing getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pricing>(create);
  static Pricing? _defaultInstance;

  Pricing_Plan whichPlan() => _Pricing_PlanByTag[$_whichOneof(0)]!;
  void clearPlan() => $_clearField($_whichOneof(0));

  /// The Community plan.
  @$pb.TagNumber(1)
  CommunitySubscriptionPlan get community => $_getN(0);
  @$pb.TagNumber(1)
  set community(CommunitySubscriptionPlan v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommunity() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommunity() => $_clearField(1);
  @$pb.TagNumber(1)
  CommunitySubscriptionPlan ensureCommunity() => $_ensure(0);

  /// A Builder plan.
  @$pb.TagNumber(2)
  BuilderSubscriptionPlan get builder => $_getN(1);
  @$pb.TagNumber(2)
  set builder(BuilderSubscriptionPlan v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBuilder() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuilder() => $_clearField(2);
  @$pb.TagNumber(2)
  BuilderSubscriptionPlan ensureBuilder() => $_ensure(1);

  /// An Enterprise plan.
  @$pb.TagNumber(3)
  EnterpriseSubscriptionPlan get enterprise => $_getN(2);
  @$pb.TagNumber(3)
  set enterprise(EnterpriseSubscriptionPlan v) {
    $_setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEnterprise() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnterprise() => $_clearField(3);
  @$pb.TagNumber(3)
  EnterpriseSubscriptionPlan ensureEnterprise() => $_ensure(2);

  /// The price of the plan.
  @$pb.TagNumber(4)
  $15.Money get price => $_getN(3);
  @$pb.TagNumber(4)
  set price($15.Money v) {
    $_setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);
  @$pb.TagNumber(4)
  $15.Money ensurePrice() => $_ensure(3);

  /// Optional. The active promotions for the plan, if any.
  @$pb.TagNumber(5)
  $pb.PbList<Pricing_Promotion> get promotions => $_getList(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

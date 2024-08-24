//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/deployments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/logging/v2/log_entry.pb.dart' as $44;
import '../../../google/protobuf/timestamp.pb.dart' as $20;
import '../../../google/rpc/status.pb.dart' as $45;
import '../../ast/v1/resolved_ast.pb.dart' as $55;
import 'deployments.pbenum.dart';

export 'deployments.pbenum.dart';

///  A deployment of a Celest resource to the cloud.
///
///  Represents a long-running operation, similar to a [google.longrunning.Operation][] with additional functionality
///  for watching and streaming logs and errors.
class Deployment extends $pb.GeneratedMessage {
  factory Deployment({
    $core.String? name,
    $core.String? uid,
    $core.String? parent,
    $core.String? deploymentId,
    $20.Timestamp? createTime,
    $20.Timestamp? updateTime,
    $55.ResolvedProject? resolvedAst,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (parent != null) {
      $result.parent = parent;
    }
    if (deploymentId != null) {
      $result.deploymentId = deploymentId;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (updateTime != null) {
      $result.updateTime = updateTime;
    }
    if (resolvedAst != null) {
      $result.resolvedAst = resolvedAst;
    }
    return $result;
  }
  Deployment._() : super();
  factory Deployment.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Deployment.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Deployment',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'parent')
    ..aOS(4, _omitFieldNames ? '' : 'deploymentId')
    ..aOM<$20.Timestamp>(5, _omitFieldNames ? '' : 'createTime',
        subBuilder: $20.Timestamp.create)
    ..aOM<$20.Timestamp>(6, _omitFieldNames ? '' : 'updateTime',
        subBuilder: $20.Timestamp.create)
    ..aOM<$55.ResolvedProject>(14, _omitFieldNames ? '' : 'resolvedAst',
        subBuilder: $55.ResolvedProject.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Deployment clone() => Deployment()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Deployment copyWith(void Function(Deployment) updates) =>
      super.copyWith((message) => updates(message as Deployment)) as Deployment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Deployment create() => Deployment._();
  Deployment createEmptyInstance() => create();
  static $pb.PbList<Deployment> createRepeated() => $pb.PbList<Deployment>();
  @$core.pragma('dart2js:noInline')
  static Deployment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Deployment>(create);
  static Deployment? _defaultInstance;

  /// Identifier. The resource name of the deployment.
  /// Format: `projects/{project}/environments/{environment}/deployments/{deployment}`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// Output only. A system-generated unique identifier for the deployment.
  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  /// Required. The parent of the deployment.
  @$pb.TagNumber(3)
  $core.String get parent => $_getSZ(2);
  @$pb.TagNumber(3)
  set parent($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasParent() => $_has(2);
  @$pb.TagNumber(3)
  void clearParent() => clearField(3);

  ///  Immutable. A randomly assigned, unique identifier for the deployment.
  ///
  ///  Format: `dpl_{random}`
  @$pb.TagNumber(4)
  $core.String get deploymentId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deploymentId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDeploymentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeploymentId() => clearField(4);

  /// Output only. The time the deployment was created.
  @$pb.TagNumber(5)
  $20.Timestamp get createTime => $_getN(4);
  @$pb.TagNumber(5)
  set createTime($20.Timestamp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);
  @$pb.TagNumber(5)
  $20.Timestamp ensureCreateTime() => $_ensure(4);

  /// Output only. The time the deployment was last updated.
  @$pb.TagNumber(6)
  $20.Timestamp get updateTime => $_getN(5);
  @$pb.TagNumber(6)
  set updateTime($20.Timestamp v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUpdateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateTime() => clearField(6);
  @$pb.TagNumber(6)
  $20.Timestamp ensureUpdateTime() => $_ensure(5);

  /// Input only. The resolved AST of the project to deploy to the environment.
  @$pb.TagNumber(14)
  $55.ResolvedProject get resolvedAst => $_getN(6);
  @$pb.TagNumber(14)
  set resolvedAst($55.ResolvedProject v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasResolvedAst() => $_has(6);
  @$pb.TagNumber(14)
  void clearResolvedAst() => clearField(14);
  @$pb.TagNumber(14)
  $55.ResolvedProject ensureResolvedAst() => $_ensure(6);
}

///  Request message for `CreateDeployment` method.
///
///  (-- api-linter: core::0133::request-id-field=disabled
///      aip.dev/not-precedent: Deployment IDs are randomly generated always --)
class CreateDeploymentRequest extends $pb.GeneratedMessage {
  factory CreateDeploymentRequest({
    $core.String? parent,
    Deployment? deployment,
  }) {
    final $result = create();
    if (parent != null) {
      $result.parent = parent;
    }
    if (deployment != null) {
      $result.deployment = deployment;
    }
    return $result;
  }
  CreateDeploymentRequest._() : super();
  factory CreateDeploymentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateDeploymentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeploymentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOM<Deployment>(2, _omitFieldNames ? '' : 'deployment',
        subBuilder: Deployment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateDeploymentRequest clone() =>
      CreateDeploymentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateDeploymentRequest copyWith(
          void Function(CreateDeploymentRequest) updates) =>
      super.copyWith((message) => updates(message as CreateDeploymentRequest))
          as CreateDeploymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDeploymentRequest create() => CreateDeploymentRequest._();
  CreateDeploymentRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDeploymentRequest> createRepeated() =>
      $pb.PbList<CreateDeploymentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDeploymentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDeploymentRequest>(create);
  static CreateDeploymentRequest? _defaultInstance;

  /// Required. The parent of the deployment.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  /// Required. The deployment to create.
  @$pb.TagNumber(2)
  Deployment get deployment => $_getN(1);
  @$pb.TagNumber(2)
  set deployment(Deployment v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDeployment() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeployment() => clearField(2);
  @$pb.TagNumber(2)
  Deployment ensureDeployment() => $_ensure(1);
}

/// Request message for `GetDeployment` method.
class GetDeploymentRequest extends $pb.GeneratedMessage {
  factory GetDeploymentRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetDeploymentRequest._() : super();
  factory GetDeploymentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetDeploymentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDeploymentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetDeploymentRequest clone() =>
      GetDeploymentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetDeploymentRequest copyWith(void Function(GetDeploymentRequest) updates) =>
      super.copyWith((message) => updates(message as GetDeploymentRequest))
          as GetDeploymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDeploymentRequest create() => GetDeploymentRequest._();
  GetDeploymentRequest createEmptyInstance() => create();
  static $pb.PbList<GetDeploymentRequest> createRepeated() =>
      $pb.PbList<GetDeploymentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDeploymentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDeploymentRequest>(create);
  static GetDeploymentRequest? _defaultInstance;

  /// Required. The resource name of the deployment.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

/// Request message for `ListDeployments` method.
class ListDeploymentsRequest extends $pb.GeneratedMessage {
  factory ListDeploymentsRequest({
    $core.String? parent,
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (parent != null) {
      $result.parent = parent;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListDeploymentsRequest._() : super();
  factory ListDeploymentsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListDeploymentsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeploymentsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListDeploymentsRequest clone() =>
      ListDeploymentsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListDeploymentsRequest copyWith(
          void Function(ListDeploymentsRequest) updates) =>
      super.copyWith((message) => updates(message as ListDeploymentsRequest))
          as ListDeploymentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeploymentsRequest create() => ListDeploymentsRequest._();
  ListDeploymentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListDeploymentsRequest> createRepeated() =>
      $pb.PbList<ListDeploymentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListDeploymentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeploymentsRequest>(create);
  static ListDeploymentsRequest? _defaultInstance;

  /// Required. The parent of the deployments.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  /// The maximum number of deployments to return.
  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);

  /// A page token, received from a previous `ListDeployments` call.
  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => clearField(3);
}

/// Response message for `ListDeployments` method.
class ListDeploymentsResponse extends $pb.GeneratedMessage {
  factory ListDeploymentsResponse({
    $core.Iterable<Deployment>? deployments,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (deployments != null) {
      $result.deployments.addAll(deployments);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListDeploymentsResponse._() : super();
  factory ListDeploymentsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListDeploymentsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeploymentsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..pc<Deployment>(
        1, _omitFieldNames ? '' : 'deployments', $pb.PbFieldType.PM,
        subBuilder: Deployment.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListDeploymentsResponse clone() =>
      ListDeploymentsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListDeploymentsResponse copyWith(
          void Function(ListDeploymentsResponse) updates) =>
      super.copyWith((message) => updates(message as ListDeploymentsResponse))
          as ListDeploymentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeploymentsResponse create() => ListDeploymentsResponse._();
  ListDeploymentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListDeploymentsResponse> createRepeated() =>
      $pb.PbList<ListDeploymentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListDeploymentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeploymentsResponse>(create);
  static ListDeploymentsResponse? _defaultInstance;

  /// The deployments.
  @$pb.TagNumber(1)
  $core.List<Deployment> get deployments => $_getList(0);

  /// A token to retrieve the next page of deployments.
  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);
}

/// Request message for `DeleteDeployment` method.
class DeleteDeploymentRequest extends $pb.GeneratedMessage {
  factory DeleteDeploymentRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  DeleteDeploymentRequest._() : super();
  factory DeleteDeploymentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteDeploymentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDeploymentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteDeploymentRequest clone() =>
      DeleteDeploymentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteDeploymentRequest copyWith(
          void Function(DeleteDeploymentRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteDeploymentRequest))
          as DeleteDeploymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDeploymentRequest create() => DeleteDeploymentRequest._();
  DeleteDeploymentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDeploymentRequest> createRepeated() =>
      $pb.PbList<DeleteDeploymentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeploymentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDeploymentRequest>(create);
  static DeleteDeploymentRequest? _defaultInstance;

  /// Required. The resource name of the deployment.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

/// Request message for `WatchDeployment` method.
class WatchDeploymentRequest extends $pb.GeneratedMessage {
  factory WatchDeploymentRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  WatchDeploymentRequest._() : super();
  factory WatchDeploymentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WatchDeploymentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchDeploymentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WatchDeploymentRequest clone() =>
      WatchDeploymentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WatchDeploymentRequest copyWith(
          void Function(WatchDeploymentRequest) updates) =>
      super.copyWith((message) => updates(message as WatchDeploymentRequest))
          as WatchDeploymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchDeploymentRequest create() => WatchDeploymentRequest._();
  WatchDeploymentRequest createEmptyInstance() => create();
  static $pb.PbList<WatchDeploymentRequest> createRepeated() =>
      $pb.PbList<WatchDeploymentRequest>();
  @$core.pragma('dart2js:noInline')
  static WatchDeploymentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchDeploymentRequest>(create);
  static WatchDeploymentRequest? _defaultInstance;

  /// Required. The resource name of the deployment.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

/// Response message for `WatchDeployment` method.
class WatchDeploymentResponse extends $pb.GeneratedMessage {
  factory WatchDeploymentResponse({
    DeploymentOperationMetadata? metadata,
    $core.Iterable<$44.LogEntry>? logs,
  }) {
    final $result = create();
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (logs != null) {
      $result.logs.addAll(logs);
    }
    return $result;
  }
  WatchDeploymentResponse._() : super();
  factory WatchDeploymentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WatchDeploymentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchDeploymentResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<DeploymentOperationMetadata>(1, _omitFieldNames ? '' : 'metadata',
        subBuilder: DeploymentOperationMetadata.create)
    ..pc<$44.LogEntry>(2, _omitFieldNames ? '' : 'logs', $pb.PbFieldType.PM,
        subBuilder: $44.LogEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WatchDeploymentResponse clone() =>
      WatchDeploymentResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WatchDeploymentResponse copyWith(
          void Function(WatchDeploymentResponse) updates) =>
      super.copyWith((message) => updates(message as WatchDeploymentResponse))
          as WatchDeploymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchDeploymentResponse create() => WatchDeploymentResponse._();
  WatchDeploymentResponse createEmptyInstance() => create();
  static $pb.PbList<WatchDeploymentResponse> createRepeated() =>
      $pb.PbList<WatchDeploymentResponse>();
  @$core.pragma('dart2js:noInline')
  static WatchDeploymentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchDeploymentResponse>(create);
  static WatchDeploymentResponse? _defaultInstance;

  /// The metadata of the deployment.
  @$pb.TagNumber(1)
  DeploymentOperationMetadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(DeploymentOperationMetadata v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  DeploymentOperationMetadata ensureMetadata() => $_ensure(0);

  /// Logs since the last message.
  @$pb.TagNumber(2)
  $core.List<$44.LogEntry> get logs => $_getList(1);
}

/// Metadata for a deployment operation.
class DeploymentOperationMetadata extends $pb.GeneratedMessage {
  factory DeploymentOperationMetadata({
    $core.String? parent,
    Deployment_State? state,
    $20.Timestamp? createTime,
    $20.Timestamp? endTime,
    $45.Status? status,
  }) {
    final $result = create();
    if (parent != null) {
      $result.parent = parent;
    }
    if (state != null) {
      $result.state = state;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  DeploymentOperationMetadata._() : super();
  factory DeploymentOperationMetadata.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeploymentOperationMetadata.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeploymentOperationMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..e<Deployment_State>(2, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE,
        defaultOrMaker: Deployment_State.STATE_UNSPECIFIED,
        valueOf: Deployment_State.valueOf,
        enumValues: Deployment_State.values)
    ..aOM<$20.Timestamp>(3, _omitFieldNames ? '' : 'createTime',
        subBuilder: $20.Timestamp.create)
    ..aOM<$20.Timestamp>(4, _omitFieldNames ? '' : 'endTime',
        subBuilder: $20.Timestamp.create)
    ..aOM<$45.Status>(5, _omitFieldNames ? '' : 'status',
        subBuilder: $45.Status.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeploymentOperationMetadata clone() =>
      DeploymentOperationMetadata()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeploymentOperationMetadata copyWith(
          void Function(DeploymentOperationMetadata) updates) =>
      super.copyWith(
              (message) => updates(message as DeploymentOperationMetadata))
          as DeploymentOperationMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeploymentOperationMetadata create() =>
      DeploymentOperationMetadata._();
  DeploymentOperationMetadata createEmptyInstance() => create();
  static $pb.PbList<DeploymentOperationMetadata> createRepeated() =>
      $pb.PbList<DeploymentOperationMetadata>();
  @$core.pragma('dart2js:noInline')
  static DeploymentOperationMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeploymentOperationMetadata>(create);
  static DeploymentOperationMetadata? _defaultInstance;

  /// The name of the parent resource being deployed.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  /// The state of the deployment.
  @$pb.TagNumber(2)
  Deployment_State get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(Deployment_State v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  /// The time the operation was created.
  @$pb.TagNumber(3)
  $20.Timestamp get createTime => $_getN(2);
  @$pb.TagNumber(3)
  set createTime($20.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateTime() => clearField(3);
  @$pb.TagNumber(3)
  $20.Timestamp ensureCreateTime() => $_ensure(2);

  /// The time the operation finished running.
  @$pb.TagNumber(4)
  $20.Timestamp get endTime => $_getN(3);
  @$pb.TagNumber(4)
  set endTime($20.Timestamp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEndTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndTime() => clearField(4);
  @$pb.TagNumber(4)
  $20.Timestamp ensureEndTime() => $_ensure(3);

  /// If an error was encountered, the error status.
  @$pb.TagNumber(5)
  $45.Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status($45.Status v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
  @$pb.TagNumber(5)
  $45.Status ensureStatus() => $_ensure(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

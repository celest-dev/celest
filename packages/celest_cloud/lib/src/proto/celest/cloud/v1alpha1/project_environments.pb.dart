//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/project_environments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/any.pb.dart' as $14;
import '../../../google/protobuf/field_mask.pb.dart' as $13;
import '../../../google/protobuf/timestamp.pb.dart' as $9;
import 'common.pbenum.dart' as $17;
import 'project_environments.pbenum.dart';

export 'project_environments.pbenum.dart';

/// An environment for a Celest project.
class ProjectEnvironment extends $pb.GeneratedMessage {
  factory ProjectEnvironment({
    $core.String? name,
    $core.String? uid,
    $core.String? parent,
    $core.String? projectEnvironmentId,
    $core.String? displayName,
    $9.Timestamp? createTime,
    $9.Timestamp? updateTime,
    $9.Timestamp? deleteTime,
    $core.String? etag,
    $core.Map<$core.String, $core.String>? annotations,
    $core.bool? reconciling,
    $17.LifecycleState? state,
    $core.String? uri,
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
    if (projectEnvironmentId != null) {
      $result.projectEnvironmentId = projectEnvironmentId;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (updateTime != null) {
      $result.updateTime = updateTime;
    }
    if (deleteTime != null) {
      $result.deleteTime = deleteTime;
    }
    if (etag != null) {
      $result.etag = etag;
    }
    if (annotations != null) {
      $result.annotations.addAll(annotations);
    }
    if (reconciling != null) {
      $result.reconciling = reconciling;
    }
    if (state != null) {
      $result.state = state;
    }
    if (uri != null) {
      $result.uri = uri;
    }
    return $result;
  }
  ProjectEnvironment._() : super();
  factory ProjectEnvironment.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProjectEnvironment.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectEnvironment',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'parent')
    ..aOS(4, _omitFieldNames ? '' : 'projectEnvironmentId')
    ..aOS(5, _omitFieldNames ? '' : 'displayName')
    ..aOM<$9.Timestamp>(6, _omitFieldNames ? '' : 'createTime',
        subBuilder: $9.Timestamp.create)
    ..aOM<$9.Timestamp>(7, _omitFieldNames ? '' : 'updateTime',
        subBuilder: $9.Timestamp.create)
    ..aOM<$9.Timestamp>(8, _omitFieldNames ? '' : 'deleteTime',
        subBuilder: $9.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'etag')
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'annotations',
        entryClassName: 'ProjectEnvironment.AnnotationsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('celest.cloud.v1alpha1'))
    ..aOB(11, _omitFieldNames ? '' : 'reconciling')
    ..e<$17.LifecycleState>(
        12, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE,
        defaultOrMaker: $17.LifecycleState.LIFECYCLE_STATE_UNSPECIFIED,
        valueOf: $17.LifecycleState.valueOf,
        enumValues: $17.LifecycleState.values)
    ..aOS(13, _omitFieldNames ? '' : 'uri')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ProjectEnvironment clone() => ProjectEnvironment()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ProjectEnvironment copyWith(void Function(ProjectEnvironment) updates) =>
      super.copyWith((message) => updates(message as ProjectEnvironment))
          as ProjectEnvironment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectEnvironment create() => ProjectEnvironment._();
  ProjectEnvironment createEmptyInstance() => create();
  static $pb.PbList<ProjectEnvironment> createRepeated() =>
      $pb.PbList<ProjectEnvironment>();
  @$core.pragma('dart2js:noInline')
  static ProjectEnvironment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectEnvironment>(create);
  static ProjectEnvironment? _defaultInstance;

  /// Identifier. The resource name of the environment.
  /// Format: `projects/{project}/environments/{environment}`
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

  /// Output only. A system-generated unique identifier for the environment.
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

  /// Required. The parent of the environment.
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

  /// Immutable. The ID of the environment, typically the git branch associated with
  /// the environment.
  @$pb.TagNumber(4)
  $core.String get projectEnvironmentId => $_getSZ(3);
  @$pb.TagNumber(4)
  set projectEnvironmentId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProjectEnvironmentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProjectEnvironmentId() => clearField(4);

  /// Optional. The display name of the environment.
  @$pb.TagNumber(5)
  $core.String get displayName => $_getSZ(4);
  @$pb.TagNumber(5)
  set displayName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDisplayName() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplayName() => clearField(5);

  /// Output only. The time the environment was created.
  @$pb.TagNumber(6)
  $9.Timestamp get createTime => $_getN(5);
  @$pb.TagNumber(6)
  set createTime($9.Timestamp v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);
  @$pb.TagNumber(6)
  $9.Timestamp ensureCreateTime() => $_ensure(5);

  /// Output only. The time the environment was last updated.
  @$pb.TagNumber(7)
  $9.Timestamp get updateTime => $_getN(6);
  @$pb.TagNumber(7)
  set updateTime($9.Timestamp v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUpdateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateTime() => clearField(7);
  @$pb.TagNumber(7)
  $9.Timestamp ensureUpdateTime() => $_ensure(6);

  /// Output only. The time the environment was deleted.
  @$pb.TagNumber(8)
  $9.Timestamp get deleteTime => $_getN(7);
  @$pb.TagNumber(8)
  set deleteTime($9.Timestamp v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDeleteTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeleteTime() => clearField(8);
  @$pb.TagNumber(8)
  $9.Timestamp ensureDeleteTime() => $_ensure(7);

  /// Output only. A checksum computed by the server based on the current value
  /// of the ProjectEnvironment resource. This may be sent on update and delete requests to
  /// ensure the client has an up-to-date value before proceeding.
  @$pb.TagNumber(9)
  $core.String get etag => $_getSZ(8);
  @$pb.TagNumber(9)
  set etag($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEtag() => $_has(8);
  @$pb.TagNumber(9)
  void clearEtag() => clearField(9);

  /// Optional. Client-provided key-value pairs that are not directly used by the system.
  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get annotations => $_getMap(9);

  /// Output only. Indicates whether the environment is currently being reconciled.
  @$pb.TagNumber(11)
  $core.bool get reconciling => $_getBF(10);
  @$pb.TagNumber(11)
  set reconciling($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasReconciling() => $_has(10);
  @$pb.TagNumber(11)
  void clearReconciling() => clearField(11);

  /// Output only. The current state of the environment.
  @$pb.TagNumber(12)
  $17.LifecycleState get state => $_getN(11);
  @$pb.TagNumber(12)
  set state($17.LifecycleState v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasState() => $_has(11);
  @$pb.TagNumber(12)
  void clearState() => clearField(12);

  ///  Output only. The hosted URI of the environment.
  ///
  ///  Will be empty if the environment is not yet deployed.
  @$pb.TagNumber(13)
  $core.String get uri => $_getSZ(12);
  @$pb.TagNumber(13)
  set uri($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUri() => $_has(12);
  @$pb.TagNumber(13)
  void clearUri() => clearField(13);
}

/// Request message for the `CreateProjectEnvironment` method.
class CreateProjectEnvironmentRequest extends $pb.GeneratedMessage {
  factory CreateProjectEnvironmentRequest({
    $core.String? parent,
    ProjectEnvironment? projectEnvironment,
    $core.String? projectEnvironmentId,
    $core.String? requestId,
    $core.bool? validateOnly,
  }) {
    final $result = create();
    if (parent != null) {
      $result.parent = parent;
    }
    if (projectEnvironment != null) {
      $result.projectEnvironment = projectEnvironment;
    }
    if (projectEnvironmentId != null) {
      $result.projectEnvironmentId = projectEnvironmentId;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (validateOnly != null) {
      $result.validateOnly = validateOnly;
    }
    return $result;
  }
  CreateProjectEnvironmentRequest._() : super();
  factory CreateProjectEnvironmentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateProjectEnvironmentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateProjectEnvironmentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOM<ProjectEnvironment>(2, _omitFieldNames ? '' : 'projectEnvironment',
        subBuilder: ProjectEnvironment.create)
    ..aOS(3, _omitFieldNames ? '' : 'projectEnvironmentId')
    ..aOS(4, _omitFieldNames ? '' : 'requestId')
    ..aOB(5, _omitFieldNames ? '' : 'validateOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateProjectEnvironmentRequest clone() =>
      CreateProjectEnvironmentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateProjectEnvironmentRequest copyWith(
          void Function(CreateProjectEnvironmentRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateProjectEnvironmentRequest))
          as CreateProjectEnvironmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProjectEnvironmentRequest create() =>
      CreateProjectEnvironmentRequest._();
  CreateProjectEnvironmentRequest createEmptyInstance() => create();
  static $pb.PbList<CreateProjectEnvironmentRequest> createRepeated() =>
      $pb.PbList<CreateProjectEnvironmentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateProjectEnvironmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateProjectEnvironmentRequest>(
          create);
  static CreateProjectEnvironmentRequest? _defaultInstance;

  /// Required. The parent of the environment.
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

  /// Required. The environment to create.
  @$pb.TagNumber(2)
  ProjectEnvironment get projectEnvironment => $_getN(1);
  @$pb.TagNumber(2)
  set projectEnvironment(ProjectEnvironment v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProjectEnvironment() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectEnvironment() => clearField(2);
  @$pb.TagNumber(2)
  ProjectEnvironment ensureProjectEnvironment() => $_ensure(1);

  ///  Required. The identifier to use for the environment.
  ///
  ///  It must be 3 to 30 lowercase ASCII letters, digits, or hyphens.
  @$pb.TagNumber(3)
  $core.String get projectEnvironmentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set projectEnvironmentId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProjectEnvironmentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProjectEnvironmentId() => clearField(3);

  /// Optional. The request ID to use for the create request. If provided, ensures this
  /// request is idempotent.
  @$pb.TagNumber(4)
  $core.String get requestId => $_getSZ(3);
  @$pb.TagNumber(4)
  set requestId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRequestId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestId() => clearField(4);

  /// Optional. If set to true, the request will not create the environment, but will
  /// validate the request.
  @$pb.TagNumber(5)
  $core.bool get validateOnly => $_getBF(4);
  @$pb.TagNumber(5)
  set validateOnly($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasValidateOnly() => $_has(4);
  @$pb.TagNumber(5)
  void clearValidateOnly() => clearField(5);
}

/// Request message for the `GetProjectEnvironment` method.
class GetProjectEnvironmentRequest extends $pb.GeneratedMessage {
  factory GetProjectEnvironmentRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetProjectEnvironmentRequest._() : super();
  factory GetProjectEnvironmentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetProjectEnvironmentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProjectEnvironmentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetProjectEnvironmentRequest clone() =>
      GetProjectEnvironmentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetProjectEnvironmentRequest copyWith(
          void Function(GetProjectEnvironmentRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetProjectEnvironmentRequest))
          as GetProjectEnvironmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProjectEnvironmentRequest create() =>
      GetProjectEnvironmentRequest._();
  GetProjectEnvironmentRequest createEmptyInstance() => create();
  static $pb.PbList<GetProjectEnvironmentRequest> createRepeated() =>
      $pb.PbList<GetProjectEnvironmentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProjectEnvironmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProjectEnvironmentRequest>(create);
  static GetProjectEnvironmentRequest? _defaultInstance;

  /// Required. The name of the environment to retrieve.
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

/// Request message for the `UpdateProjectEnvironment` method.
class UpdateProjectEnvironmentRequest extends $pb.GeneratedMessage {
  factory UpdateProjectEnvironmentRequest({
    ProjectEnvironment? projectEnvironment,
    $13.FieldMask? updateMask,
    $core.String? requestId,
    $core.bool? allowMissing,
    $core.bool? validateOnly,
  }) {
    final $result = create();
    if (projectEnvironment != null) {
      $result.projectEnvironment = projectEnvironment;
    }
    if (updateMask != null) {
      $result.updateMask = updateMask;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (allowMissing != null) {
      $result.allowMissing = allowMissing;
    }
    if (validateOnly != null) {
      $result.validateOnly = validateOnly;
    }
    return $result;
  }
  UpdateProjectEnvironmentRequest._() : super();
  factory UpdateProjectEnvironmentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateProjectEnvironmentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectEnvironmentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<ProjectEnvironment>(1, _omitFieldNames ? '' : 'projectEnvironment',
        subBuilder: ProjectEnvironment.create)
    ..aOM<$13.FieldMask>(2, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $13.FieldMask.create)
    ..aOS(3, _omitFieldNames ? '' : 'requestId')
    ..aOB(4, _omitFieldNames ? '' : 'allowMissing')
    ..aOB(5, _omitFieldNames ? '' : 'validateOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateProjectEnvironmentRequest clone() =>
      UpdateProjectEnvironmentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateProjectEnvironmentRequest copyWith(
          void Function(UpdateProjectEnvironmentRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateProjectEnvironmentRequest))
          as UpdateProjectEnvironmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectEnvironmentRequest create() =>
      UpdateProjectEnvironmentRequest._();
  UpdateProjectEnvironmentRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectEnvironmentRequest> createRepeated() =>
      $pb.PbList<UpdateProjectEnvironmentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectEnvironmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectEnvironmentRequest>(
          create);
  static UpdateProjectEnvironmentRequest? _defaultInstance;

  /// Required. The environment to update.
  @$pb.TagNumber(1)
  ProjectEnvironment get projectEnvironment => $_getN(0);
  @$pb.TagNumber(1)
  set projectEnvironment(ProjectEnvironment v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProjectEnvironment() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectEnvironment() => clearField(1);
  @$pb.TagNumber(1)
  ProjectEnvironment ensureProjectEnvironment() => $_ensure(0);

  /// Optional. The update mask to apply to the environment.
  @$pb.TagNumber(2)
  $13.FieldMask get updateMask => $_getN(1);
  @$pb.TagNumber(2)
  set updateMask($13.FieldMask v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUpdateMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateMask() => clearField(2);
  @$pb.TagNumber(2)
  $13.FieldMask ensureUpdateMask() => $_ensure(1);

  /// Optional. The request ID to use for the update request. If provided, ensures this
  /// request is idempotent.
  @$pb.TagNumber(3)
  $core.String get requestId => $_getSZ(2);
  @$pb.TagNumber(3)
  set requestId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRequestId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestId() => clearField(3);

  /// If set to true, and the environment is not found, a new environment will be created.
  /// In this situation, `update_mask` is ignored.
  @$pb.TagNumber(4)
  $core.bool get allowMissing => $_getBF(3);
  @$pb.TagNumber(4)
  set allowMissing($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAllowMissing() => $_has(3);
  @$pb.TagNumber(4)
  void clearAllowMissing() => clearField(4);

  /// Optional. If set to true, the request will not update the environment, but will
  /// validate the request.
  @$pb.TagNumber(5)
  $core.bool get validateOnly => $_getBF(4);
  @$pb.TagNumber(5)
  set validateOnly($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasValidateOnly() => $_has(4);
  @$pb.TagNumber(5)
  void clearValidateOnly() => clearField(5);
}

/// Request message for `ListProjectEnvironments`.
class ListProjectEnvironmentsRequest extends $pb.GeneratedMessage {
  factory ListProjectEnvironmentsRequest({
    $core.String? parent,
    $core.int? pageSize,
    $core.String? pageToken,
    $core.String? filter,
    $core.String? orderBy,
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
    if (filter != null) {
      $result.filter = filter;
    }
    if (orderBy != null) {
      $result.orderBy = orderBy;
    }
    return $result;
  }
  ListProjectEnvironmentsRequest._() : super();
  factory ListProjectEnvironmentsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListProjectEnvironmentsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectEnvironmentsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..aOS(4, _omitFieldNames ? '' : 'filter')
    ..aOS(5, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListProjectEnvironmentsRequest clone() =>
      ListProjectEnvironmentsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListProjectEnvironmentsRequest copyWith(
          void Function(ListProjectEnvironmentsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListProjectEnvironmentsRequest))
          as ListProjectEnvironmentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectEnvironmentsRequest create() =>
      ListProjectEnvironmentsRequest._();
  ListProjectEnvironmentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListProjectEnvironmentsRequest> createRepeated() =>
      $pb.PbList<ListProjectEnvironmentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListProjectEnvironmentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectEnvironmentsRequest>(create);
  static ListProjectEnvironmentsRequest? _defaultInstance;

  /// Required. The parent of the environment.
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

  /// The maximum number of environments to return. The service may return fewer
  /// than this value. If unspecified, at most 100 environments will be returned.
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

  /// A page token, received from a previous `ListProjectEnvironments` call. Provide this
  /// to retrieve the subsequent page. When paginating, all other parameters
  /// provided to `ListProjectEnvironments` must match the call that provided the page
  /// token.
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

  /// The filter expression.
  @$pb.TagNumber(4)
  $core.String get filter => $_getSZ(3);
  @$pb.TagNumber(4)
  set filter($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => clearField(4);

  /// The order by expression.
  @$pb.TagNumber(5)
  $core.String get orderBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderBy($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOrderBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderBy() => clearField(5);
}

/// Response message for `ListProjectEnvironments`.
class ListProjectEnvironmentsResponse extends $pb.GeneratedMessage {
  factory ListProjectEnvironmentsResponse({
    $core.Iterable<ProjectEnvironment>? projectEnvironments,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (projectEnvironments != null) {
      $result.projectEnvironments.addAll(projectEnvironments);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListProjectEnvironmentsResponse._() : super();
  factory ListProjectEnvironmentsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListProjectEnvironmentsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectEnvironmentsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..pc<ProjectEnvironment>(
        1, _omitFieldNames ? '' : 'projectEnvironments', $pb.PbFieldType.PM,
        subBuilder: ProjectEnvironment.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListProjectEnvironmentsResponse clone() =>
      ListProjectEnvironmentsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListProjectEnvironmentsResponse copyWith(
          void Function(ListProjectEnvironmentsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListProjectEnvironmentsResponse))
          as ListProjectEnvironmentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectEnvironmentsResponse create() =>
      ListProjectEnvironmentsResponse._();
  ListProjectEnvironmentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListProjectEnvironmentsResponse> createRepeated() =>
      $pb.PbList<ListProjectEnvironmentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListProjectEnvironmentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectEnvironmentsResponse>(
          create);
  static ListProjectEnvironmentsResponse? _defaultInstance;

  /// The list of environments.
  @$pb.TagNumber(1)
  $core.List<ProjectEnvironment> get projectEnvironments => $_getList(0);

  /// A token to retrieve the next page of results. Pass this value in the
  /// `page_token` field in the subsequent call to `ListProjectEnvironments` method to
  /// retrieve the next page of results.
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

/// Request message for the `DeleteProjectEnvironment` method.
class DeleteProjectEnvironmentRequest extends $pb.GeneratedMessage {
  factory DeleteProjectEnvironmentRequest({
    $core.String? name,
    $core.String? requestId,
    $core.String? etag,
    $core.bool? allowMissing,
    $core.bool? validateOnly,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (etag != null) {
      $result.etag = etag;
    }
    if (allowMissing != null) {
      $result.allowMissing = allowMissing;
    }
    if (validateOnly != null) {
      $result.validateOnly = validateOnly;
    }
    return $result;
  }
  DeleteProjectEnvironmentRequest._() : super();
  factory DeleteProjectEnvironmentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteProjectEnvironmentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProjectEnvironmentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'requestId')
    ..aOS(3, _omitFieldNames ? '' : 'etag')
    ..aOB(4, _omitFieldNames ? '' : 'allowMissing')
    ..aOB(5, _omitFieldNames ? '' : 'validateOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteProjectEnvironmentRequest clone() =>
      DeleteProjectEnvironmentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteProjectEnvironmentRequest copyWith(
          void Function(DeleteProjectEnvironmentRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteProjectEnvironmentRequest))
          as DeleteProjectEnvironmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProjectEnvironmentRequest create() =>
      DeleteProjectEnvironmentRequest._();
  DeleteProjectEnvironmentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteProjectEnvironmentRequest> createRepeated() =>
      $pb.PbList<DeleteProjectEnvironmentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteProjectEnvironmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProjectEnvironmentRequest>(
          create);
  static DeleteProjectEnvironmentRequest? _defaultInstance;

  /// Required. The name of the environment to delete.
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

  /// Optional. The request ID to use for the delete request. If provided, ensures this
  /// request is idempotent.
  @$pb.TagNumber(2)
  $core.String get requestId => $_getSZ(1);
  @$pb.TagNumber(2)
  set requestId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestId() => clearField(2);

  /// Optional. The etag of the environment.
  /// If this is provided, it must match the server's etag.
  @$pb.TagNumber(3)
  $core.String get etag => $_getSZ(2);
  @$pb.TagNumber(3)
  set etag($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEtag() => $_has(2);
  @$pb.TagNumber(3)
  void clearEtag() => clearField(3);

  /// If set to true, and the environment is not found, the request will succeed
  /// but no action will be taken on the server.
  @$pb.TagNumber(4)
  $core.bool get allowMissing => $_getBF(3);
  @$pb.TagNumber(4)
  set allowMissing($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAllowMissing() => $_has(3);
  @$pb.TagNumber(4)
  void clearAllowMissing() => clearField(4);

  /// If set to true, the request is validated but not actually executed.
  @$pb.TagNumber(5)
  $core.bool get validateOnly => $_getBF(4);
  @$pb.TagNumber(5)
  set validateOnly($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasValidateOnly() => $_has(4);
  @$pb.TagNumber(5)
  void clearValidateOnly() => clearField(5);
}

enum ProjectAsset_Asset { inline, notSet }

/// An asset of a deployed Celest project.
class ProjectAsset extends $pb.GeneratedMessage {
  factory ProjectAsset({
    ProjectAsset_Type? type,
    $core.String? filename,
    $core.List<$core.int>? inline,
    $core.String? etag,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (filename != null) {
      $result.filename = filename;
    }
    if (inline != null) {
      $result.inline = inline;
    }
    if (etag != null) {
      $result.etag = etag;
    }
    return $result;
  }
  ProjectAsset._() : super();
  factory ProjectAsset.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProjectAsset.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ProjectAsset_Asset>
      _ProjectAsset_AssetByTag = {
    3: ProjectAsset_Asset.inline,
    0: ProjectAsset_Asset.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProjectAsset',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [3])
    ..e<ProjectAsset_Type>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: ProjectAsset_Type.TYPE_UNSPECIFIED,
        valueOf: ProjectAsset_Type.valueOf,
        enumValues: ProjectAsset_Type.values)
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'inline', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'etag')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ProjectAsset clone() => ProjectAsset()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ProjectAsset copyWith(void Function(ProjectAsset) updates) =>
      super.copyWith((message) => updates(message as ProjectAsset))
          as ProjectAsset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectAsset create() => ProjectAsset._();
  ProjectAsset createEmptyInstance() => create();
  static $pb.PbList<ProjectAsset> createRepeated() =>
      $pb.PbList<ProjectAsset>();
  @$core.pragma('dart2js:noInline')
  static ProjectAsset getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProjectAsset>(create);
  static ProjectAsset? _defaultInstance;

  ProjectAsset_Asset whichAsset() => _ProjectAsset_AssetByTag[$_whichOneof(0)]!;
  void clearAsset() => clearField($_whichOneof(0));

  /// The type of the asset.
  @$pb.TagNumber(1)
  ProjectAsset_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ProjectAsset_Type v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  /// The file name of the asset.
  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => clearField(2);

  /// Inline asset context.
  @$pb.TagNumber(3)
  $core.List<$core.int> get inline => $_getN(2);
  @$pb.TagNumber(3)
  set inline($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInline() => $_has(2);
  @$pb.TagNumber(3)
  void clearInline() => clearField(3);

  /// A checksum of the asset's content, computed by the client and
  /// verified by the server upon retrieval.
  @$pb.TagNumber(4)
  $core.String get etag => $_getSZ(3);
  @$pb.TagNumber(4)
  set etag($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEtag() => $_has(3);
  @$pb.TagNumber(4)
  void clearEtag() => clearField(4);
}

/// Request message for the `DeployProjectEnvironment` operation.
class DeployProjectEnvironmentRequest extends $pb.GeneratedMessage {
  factory DeployProjectEnvironmentRequest({
    $core.String? name,
    $core.String? requestId,
    $core.bool? validateOnly,
    $core.String? etag,
    $14.Any? resolvedProjectAst,
    $core.Iterable<ProjectAsset>? assets,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (validateOnly != null) {
      $result.validateOnly = validateOnly;
    }
    if (etag != null) {
      $result.etag = etag;
    }
    if (resolvedProjectAst != null) {
      $result.resolvedProjectAst = resolvedProjectAst;
    }
    if (assets != null) {
      $result.assets.addAll(assets);
    }
    return $result;
  }
  DeployProjectEnvironmentRequest._() : super();
  factory DeployProjectEnvironmentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeployProjectEnvironmentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeployProjectEnvironmentRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'requestId')
    ..aOB(3, _omitFieldNames ? '' : 'validateOnly')
    ..aOS(4, _omitFieldNames ? '' : 'etag')
    ..aOM<$14.Any>(5, _omitFieldNames ? '' : 'resolvedProjectAst',
        subBuilder: $14.Any.create)
    ..pc<ProjectAsset>(6, _omitFieldNames ? '' : 'assets', $pb.PbFieldType.PM,
        subBuilder: ProjectAsset.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeployProjectEnvironmentRequest clone() =>
      DeployProjectEnvironmentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeployProjectEnvironmentRequest copyWith(
          void Function(DeployProjectEnvironmentRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeployProjectEnvironmentRequest))
          as DeployProjectEnvironmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeployProjectEnvironmentRequest create() =>
      DeployProjectEnvironmentRequest._();
  DeployProjectEnvironmentRequest createEmptyInstance() => create();
  static $pb.PbList<DeployProjectEnvironmentRequest> createRepeated() =>
      $pb.PbList<DeployProjectEnvironmentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeployProjectEnvironmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeployProjectEnvironmentRequest>(
          create);
  static DeployProjectEnvironmentRequest? _defaultInstance;

  /// Required. The name of the environment to deploy.
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

  /// Optional. The request ID to use for the delete request. If provided, ensures this
  /// request is idempotent.
  @$pb.TagNumber(2)
  $core.String get requestId => $_getSZ(1);
  @$pb.TagNumber(2)
  set requestId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestId() => clearField(2);

  /// If set to true, the request is validated but not actually executed.
  @$pb.TagNumber(3)
  $core.bool get validateOnly => $_getBF(2);
  @$pb.TagNumber(3)
  set validateOnly($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValidateOnly() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidateOnly() => clearField(3);

  ///  Optional. The etag of the environment.
  ///
  ///  If provided, it must match the server's etag.
  @$pb.TagNumber(4)
  $core.String get etag => $_getSZ(3);
  @$pb.TagNumber(4)
  set etag($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEtag() => $_has(3);
  @$pb.TagNumber(4)
  void clearEtag() => clearField(4);

  ///  Input only. The environment's project AST.
  ///
  ///  Supported types:
  ///  - [celest.ast.v1.ResolvedProject]
  ///
  ///  (-- api-linter: core::0146::any=disabled
  ///      aip.dev/not-precedent: Since AST protos are maintained separately, this allows
  ///                             independent versioning and publishing of protobuf/Dart code. --)
  @$pb.TagNumber(5)
  $14.Any get resolvedProjectAst => $_getN(4);
  @$pb.TagNumber(5)
  set resolvedProjectAst($14.Any v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasResolvedProjectAst() => $_has(4);
  @$pb.TagNumber(5)
  void clearResolvedProjectAst() => clearField(5);
  @$pb.TagNumber(5)
  $14.Any ensureResolvedProjectAst() => $_ensure(4);

  /// Input only. The assets of the environment.
  @$pb.TagNumber(6)
  $core.List<ProjectAsset> get assets => $_getList(5);
}

/// Response message for the `DeployProjectEnvironment` operation.
class DeployProjectEnvironmentResponse extends $pb.GeneratedMessage {
  factory DeployProjectEnvironmentResponse({
    $core.String? uri,
    $14.Any? project,
  }) {
    final $result = create();
    if (uri != null) {
      $result.uri = uri;
    }
    if (project != null) {
      $result.project = project;
    }
    return $result;
  }
  DeployProjectEnvironmentResponse._() : super();
  factory DeployProjectEnvironmentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeployProjectEnvironmentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeployProjectEnvironmentResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uri')
    ..aOM<$14.Any>(2, _omitFieldNames ? '' : 'project',
        subBuilder: $14.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeployProjectEnvironmentResponse clone() =>
      DeployProjectEnvironmentResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeployProjectEnvironmentResponse copyWith(
          void Function(DeployProjectEnvironmentResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeployProjectEnvironmentResponse))
          as DeployProjectEnvironmentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeployProjectEnvironmentResponse create() =>
      DeployProjectEnvironmentResponse._();
  DeployProjectEnvironmentResponse createEmptyInstance() => create();
  static $pb.PbList<DeployProjectEnvironmentResponse> createRepeated() =>
      $pb.PbList<DeployProjectEnvironmentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeployProjectEnvironmentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeployProjectEnvironmentResponse>(
          create);
  static DeployProjectEnvironmentResponse? _defaultInstance;

  /// The URI of the deployed environment.
  @$pb.TagNumber(1)
  $core.String get uri => $_getSZ(0);
  @$pb.TagNumber(1)
  set uri($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearUri() => clearField(1);

  ///  The resolved project of the deployed environment, with any missing values filled in.
  ///
  ///  Will be the same type passed in via [celest.cloud.v1alpha1.ProjectEnvironments.DeployProjectEnvironment].
  ///
  ///  (-- api-linter: core::0146::any=disabled
  ///      aip.dev/not-precedent: Since AST protos are maintained separately, this allows
  ///                             independent versioning and publishing of protobuf/Dart code. --)
  @$pb.TagNumber(2)
  $14.Any get project => $_getN(1);
  @$pb.TagNumber(2)
  set project($14.Any v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProject() => $_has(1);
  @$pb.TagNumber(2)
  void clearProject() => clearField(2);
  @$pb.TagNumber(2)
  $14.Any ensureProject() => $_ensure(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

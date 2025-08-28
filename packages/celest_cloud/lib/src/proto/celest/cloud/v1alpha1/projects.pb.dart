// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/projects.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/field_mask.pb.dart' as $3;
import '../../../google/protobuf/timestamp.pb.dart' as $2;
import 'common.pbenum.dart' as $4;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// A project resource.
class Project extends $pb.GeneratedMessage {
  factory Project({
    $core.String? name,
    $core.String? uid,
    $core.String? parent,
    $core.String? projectId,
    $4.LifecycleState? state,
    $core.String? displayName,
    $2.Timestamp? createTime,
    $2.Timestamp? updateTime,
    $2.Timestamp? deleteTime,
    $2.Timestamp? purgeTime,
    $core.String? etag,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? annotations,
    $core.bool? reconciling,
    $core.Iterable<$4.Region>? regions,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (uid != null) result.uid = uid;
    if (parent != null) result.parent = parent;
    if (projectId != null) result.projectId = projectId;
    if (state != null) result.state = state;
    if (displayName != null) result.displayName = displayName;
    if (createTime != null) result.createTime = createTime;
    if (updateTime != null) result.updateTime = updateTime;
    if (deleteTime != null) result.deleteTime = deleteTime;
    if (purgeTime != null) result.purgeTime = purgeTime;
    if (etag != null) result.etag = etag;
    if (annotations != null) result.annotations.addEntries(annotations);
    if (reconciling != null) result.reconciling = reconciling;
    if (regions != null) result.regions.addAll(regions);
    return result;
  }

  Project._();

  factory Project.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Project.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Project',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'parent')
    ..aOS(4, _omitFieldNames ? '' : 'projectId')
    ..e<$4.LifecycleState>(
        5, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE,
        defaultOrMaker: $4.LifecycleState.LIFECYCLE_STATE_UNSPECIFIED,
        valueOf: $4.LifecycleState.valueOf,
        enumValues: $4.LifecycleState.values)
    ..aOS(6, _omitFieldNames ? '' : 'displayName')
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'createTime',
        subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(8, _omitFieldNames ? '' : 'updateTime',
        subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(9, _omitFieldNames ? '' : 'deleteTime',
        subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(10, _omitFieldNames ? '' : 'purgeTime',
        subBuilder: $2.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'etag')
    ..m<$core.String, $core.String>(12, _omitFieldNames ? '' : 'annotations',
        entryClassName: 'Project.AnnotationsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('celest.cloud.v1alpha1'))
    ..aOB(13, _omitFieldNames ? '' : 'reconciling')
    ..pc<$4.Region>(14, _omitFieldNames ? '' : 'regions', $pb.PbFieldType.KE,
        valueOf: $4.Region.valueOf,
        enumValues: $4.Region.values,
        defaultEnumValue: $4.Region.REGION_UNSPECIFIED)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Project copyWith(void Function(Project) updates) =>
      super.copyWith((message) => updates(message as Project)) as Project;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  @$core.override
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project? _defaultInstance;

  /// Identifier. The resource name of the project. Format:
  /// `organizations/{organization_id}/projects/{project_id}`.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// A system-generated unique identifier for the project.
  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  /// The parent organization of the project.
  @$pb.TagNumber(3)
  $core.String get parent => $_getSZ(2);
  @$pb.TagNumber(3)
  set parent($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParent() => $_has(2);
  @$pb.TagNumber(3)
  void clearParent() => $_clearField(3);

  /// Immutable. The unique, user-assigned id of the project.
  /// It must be 6 to 30 lowercase ASCII letters, digits, or hyphens.
  /// It must start with a letter.
  /// Trailing hyphens are prohibited.
  ///
  /// Example: `tokyo-rain-123`
  @$pb.TagNumber(4)
  $core.String get projectId => $_getSZ(3);
  @$pb.TagNumber(4)
  set projectId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProjectId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProjectId() => $_clearField(4);

  /// Output only. The project lifecycle state.
  @$pb.TagNumber(5)
  $4.LifecycleState get state => $_getN(4);
  @$pb.TagNumber(5)
  set state($4.LifecycleState value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => $_clearField(5);

  /// The display name of the project.
  @$pb.TagNumber(6)
  $core.String get displayName => $_getSZ(5);
  @$pb.TagNumber(6)
  set displayName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDisplayName() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplayName() => $_clearField(6);

  /// Output only. The time the project was created.
  @$pb.TagNumber(7)
  $2.Timestamp get createTime => $_getN(6);
  @$pb.TagNumber(7)
  set createTime($2.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCreateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTime() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureCreateTime() => $_ensure(6);

  /// Output only. The time the project was last updated.
  @$pb.TagNumber(8)
  $2.Timestamp get updateTime => $_getN(7);
  @$pb.TagNumber(8)
  set updateTime($2.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasUpdateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateTime() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureUpdateTime() => $_ensure(7);

  /// Output only. The time the project was soft-deleted.
  @$pb.TagNumber(9)
  $2.Timestamp get deleteTime => $_getN(8);
  @$pb.TagNumber(9)
  set deleteTime($2.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDeleteTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeleteTime() => $_clearField(9);
  @$pb.TagNumber(9)
  $2.Timestamp ensureDeleteTime() => $_ensure(8);

  /// Output only. The time the project is scheduled for permanent deletion.
  @$pb.TagNumber(10)
  $2.Timestamp get purgeTime => $_getN(9);
  @$pb.TagNumber(10)
  set purgeTime($2.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasPurgeTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearPurgeTime() => $_clearField(10);
  @$pb.TagNumber(10)
  $2.Timestamp ensurePurgeTime() => $_ensure(9);

  /// Output only. A checksum computed by the server based on the current value
  /// of the Project resource. This may be sent on update and delete requests to
  /// ensure the client has an up-to-date value before proceeding.
  @$pb.TagNumber(11)
  $core.String get etag => $_getSZ(10);
  @$pb.TagNumber(11)
  set etag($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasEtag() => $_has(10);
  @$pb.TagNumber(11)
  void clearEtag() => $_clearField(11);

  /// Client-provided key-value pairs that are not directly used by the system.
  @$pb.TagNumber(12)
  $pb.PbMap<$core.String, $core.String> get annotations => $_getMap(11);

  /// Output only. Indicates whether the project is currently being reconciled.
  @$pb.TagNumber(13)
  $core.bool get reconciling => $_getBF(12);
  @$pb.TagNumber(13)
  set reconciling($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasReconciling() => $_has(12);
  @$pb.TagNumber(13)
  void clearReconciling() => $_clearField(13);

  /// Optional. The project region(s) where resources are deployed.
  ///
  /// If not specified, the project region is determined by the organization's default region. Or if not
  /// set either, the region closest to the caller.
  ///
  /// **NOTE**: This functionality is only available in enterprise subscriptions.
  @$pb.TagNumber(14)
  $pb.PbList<$4.Region> get regions => $_getList(13);
}

/// Request message for the `CreateProject` method.
class CreateProjectRequest extends $pb.GeneratedMessage {
  factory CreateProjectRequest({
    $core.String? parent,
    $core.String? projectId,
    Project? project,
    $core.bool? validateOnly,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (projectId != null) result.projectId = projectId;
    if (project != null) result.project = project;
    if (validateOnly != null) result.validateOnly = validateOnly;
    return result;
  }

  CreateProjectRequest._();

  factory CreateProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateProjectRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOS(2, _omitFieldNames ? '' : 'projectId')
    ..aOM<Project>(3, _omitFieldNames ? '' : 'project',
        subBuilder: Project.create)
    ..aOB(4, _omitFieldNames ? '' : 'validateOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectRequest clone() =>
      CreateProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateProjectRequest copyWith(void Function(CreateProjectRequest) updates) =>
      super.copyWith((message) => updates(message as CreateProjectRequest))
          as CreateProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProjectRequest create() => CreateProjectRequest._();
  @$core.override
  CreateProjectRequest createEmptyInstance() => create();
  static $pb.PbList<CreateProjectRequest> createRepeated() =>
      $pb.PbList<CreateProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateProjectRequest>(create);
  static CreateProjectRequest? _defaultInstance;

  /// Required. The parent organization of the project.
  ///
  /// Format: `organizations/{organization}`
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// Required. The ID of the project to create.
  ///
  /// It must be 6 to 30 lowercase ASCII letters, digits, or hyphens.
  @$pb.TagNumber(2)
  $core.String get projectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set projectId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => $_clearField(2);

  /// The project to create.
  @$pb.TagNumber(3)
  Project get project => $_getN(2);
  @$pb.TagNumber(3)
  set project(Project value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProject() => $_has(2);
  @$pb.TagNumber(3)
  void clearProject() => $_clearField(3);
  @$pb.TagNumber(3)
  Project ensureProject() => $_ensure(2);

  /// If set to true, the request is validated but not actually executed.
  @$pb.TagNumber(4)
  $core.bool get validateOnly => $_getBF(3);
  @$pb.TagNumber(4)
  set validateOnly($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValidateOnly() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidateOnly() => $_clearField(4);
}

/// Request message for the `GetProject` method.
class GetProjectRequest extends $pb.GeneratedMessage {
  factory GetProjectRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  GetProjectRequest._();

  factory GetProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProjectRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectRequest clone() => GetProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProjectRequest copyWith(void Function(GetProjectRequest) updates) =>
      super.copyWith((message) => updates(message as GetProjectRequest))
          as GetProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProjectRequest create() => GetProjectRequest._();
  @$core.override
  GetProjectRequest createEmptyInstance() => create();
  static $pb.PbList<GetProjectRequest> createRepeated() =>
      $pb.PbList<GetProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProjectRequest>(create);
  static GetProjectRequest? _defaultInstance;

  /// The name of the project to retrieve.
  /// Format: `organizations/{organization}/projects/{project}`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// Request message for the `ListProjects` method.
class ListProjectsRequest extends $pb.GeneratedMessage {
  factory ListProjectsRequest({
    $core.String? parent,
    $core.int? pageSize,
    $core.String? pageToken,
    $core.String? filter,
    $core.String? orderBy,
    $core.bool? showDeleted,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageToken != null) result.pageToken = pageToken;
    if (filter != null) result.filter = filter;
    if (orderBy != null) result.orderBy = orderBy;
    if (showDeleted != null) result.showDeleted = showDeleted;
    return result;
  }

  ListProjectsRequest._();

  factory ListProjectsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..aOS(4, _omitFieldNames ? '' : 'filter')
    ..aOS(5, _omitFieldNames ? '' : 'orderBy')
    ..aOB(6, _omitFieldNames ? '' : 'showDeleted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsRequest clone() => ListProjectsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsRequest copyWith(void Function(ListProjectsRequest) updates) =>
      super.copyWith((message) => updates(message as ListProjectsRequest))
          as ListProjectsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectsRequest create() => ListProjectsRequest._();
  @$core.override
  ListProjectsRequest createEmptyInstance() => create();
  static $pb.PbList<ListProjectsRequest> createRepeated() =>
      $pb.PbList<ListProjectsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListProjectsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectsRequest>(create);
  static ListProjectsRequest? _defaultInstance;

  /// Required. The parent organization of the projects to list.
  ///
  /// Format: `organizations/{organization}`
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// Optional. The maximum number of projects to return.
  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);

  /// A page token, received from a previous `ListProjects` call.
  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => $_clearField(3);

  /// An optional filter to apply to the projects.
  @$pb.TagNumber(4)
  $core.String get filter => $_getSZ(3);
  @$pb.TagNumber(4)
  set filter($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => $_clearField(4);

  /// The order to sort the results by.
  @$pb.TagNumber(5)
  $core.String get orderBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderBy($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOrderBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderBy() => $_clearField(5);

  /// Include soft-deleted projects in the results.
  @$pb.TagNumber(6)
  $core.bool get showDeleted => $_getBF(5);
  @$pb.TagNumber(6)
  set showDeleted($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasShowDeleted() => $_has(5);
  @$pb.TagNumber(6)
  void clearShowDeleted() => $_clearField(6);
}

/// Response message for the `ListProjects` method.
class ListProjectsResponse extends $pb.GeneratedMessage {
  factory ListProjectsResponse({
    $core.Iterable<Project>? projects,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (projects != null) result.projects.addAll(projects);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  ListProjectsResponse._();

  factory ListProjectsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListProjectsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListProjectsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..pc<Project>(1, _omitFieldNames ? '' : 'projects', $pb.PbFieldType.PM,
        subBuilder: Project.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsResponse clone() =>
      ListProjectsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListProjectsResponse copyWith(void Function(ListProjectsResponse) updates) =>
      super.copyWith((message) => updates(message as ListProjectsResponse))
          as ListProjectsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListProjectsResponse create() => ListProjectsResponse._();
  @$core.override
  ListProjectsResponse createEmptyInstance() => create();
  static $pb.PbList<ListProjectsResponse> createRepeated() =>
      $pb.PbList<ListProjectsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListProjectsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListProjectsResponse>(create);
  static ListProjectsResponse? _defaultInstance;

  /// The projects in the organization.
  @$pb.TagNumber(1)
  $pb.PbList<Project> get projects => $_getList(0);

  /// A token to retrieve the next page of results.
  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Request message for the `UpdateProject` method.
class UpdateProjectRequest extends $pb.GeneratedMessage {
  factory UpdateProjectRequest({
    Project? project,
    $3.FieldMask? updateMask,
    $core.bool? allowMissing,
    $core.bool? validateOnly,
  }) {
    final result = create();
    if (project != null) result.project = project;
    if (updateMask != null) result.updateMask = updateMask;
    if (allowMissing != null) result.allowMissing = allowMissing;
    if (validateOnly != null) result.validateOnly = validateOnly;
    return result;
  }

  UpdateProjectRequest._();

  factory UpdateProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProjectRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<Project>(1, _omitFieldNames ? '' : 'project',
        subBuilder: Project.create)
    ..aOM<$3.FieldMask>(2, _omitFieldNames ? '' : 'updateMask',
        subBuilder: $3.FieldMask.create)
    ..aOB(3, _omitFieldNames ? '' : 'allowMissing')
    ..aOB(4, _omitFieldNames ? '' : 'validateOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectRequest clone() =>
      UpdateProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProjectRequest copyWith(void Function(UpdateProjectRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateProjectRequest))
          as UpdateProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProjectRequest create() => UpdateProjectRequest._();
  @$core.override
  UpdateProjectRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProjectRequest> createRepeated() =>
      $pb.PbList<UpdateProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProjectRequest>(create);
  static UpdateProjectRequest? _defaultInstance;

  /// The project to update.
  ///
  /// The project's `name` field is used to identify the project to update.
  /// Format: `organizations/{organization}/projects/{project}`
  @$pb.TagNumber(1)
  Project get project => $_getN(0);
  @$pb.TagNumber(1)
  set project(Project value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProject() => $_has(0);
  @$pb.TagNumber(1)
  void clearProject() => $_clearField(1);
  @$pb.TagNumber(1)
  Project ensureProject() => $_ensure(0);

  /// The update mask to apply to the project.
  @$pb.TagNumber(2)
  $3.FieldMask get updateMask => $_getN(1);
  @$pb.TagNumber(2)
  set updateMask($3.FieldMask value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdateMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateMask() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.FieldMask ensureUpdateMask() => $_ensure(1);

  /// If set to true, and the project is not found, a new project will be created.
  /// In this situation, `update_mask` is ignored.
  @$pb.TagNumber(3)
  $core.bool get allowMissing => $_getBF(2);
  @$pb.TagNumber(3)
  set allowMissing($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAllowMissing() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowMissing() => $_clearField(3);

  /// If set to true, the request is validated but not actually executed.
  @$pb.TagNumber(4)
  $core.bool get validateOnly => $_getBF(3);
  @$pb.TagNumber(4)
  set validateOnly($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValidateOnly() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidateOnly() => $_clearField(4);
}

/// Request message for the `DeleteProject` method.
class DeleteProjectRequest extends $pb.GeneratedMessage {
  factory DeleteProjectRequest({
    $core.String? name,
    $core.bool? force,
    $core.String? etag,
    $core.bool? allowMissing,
    $core.bool? validateOnly,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (force != null) result.force = force;
    if (etag != null) result.etag = etag;
    if (allowMissing != null) result.allowMissing = allowMissing;
    if (validateOnly != null) result.validateOnly = validateOnly;
    return result;
  }

  DeleteProjectRequest._();

  factory DeleteProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProjectRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'force')
    ..aOS(3, _omitFieldNames ? '' : 'etag')
    ..aOB(4, _omitFieldNames ? '' : 'allowMissing')
    ..aOB(5, _omitFieldNames ? '' : 'validateOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectRequest clone() =>
      DeleteProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProjectRequest copyWith(void Function(DeleteProjectRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteProjectRequest))
          as DeleteProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProjectRequest create() => DeleteProjectRequest._();
  @$core.override
  DeleteProjectRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteProjectRequest> createRepeated() =>
      $pb.PbList<DeleteProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProjectRequest>(create);
  static DeleteProjectRequest? _defaultInstance;

  /// Required. The name of the project to delete.
  ///
  /// Format: `organizations/{organization}/projects/{project}`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Optional. If set to true, any resources associated with the project will also be marked for deletion.
  /// (Otherwise, the request will only work if the project has no resources.)
  @$pb.TagNumber(2)
  $core.bool get force => $_getBF(1);
  @$pb.TagNumber(2)
  set force($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasForce() => $_has(1);
  @$pb.TagNumber(2)
  void clearForce() => $_clearField(2);

  /// Optional. The etag of the project.
  /// If this is provided, it must match the server's etag.
  @$pb.TagNumber(3)
  $core.String get etag => $_getSZ(2);
  @$pb.TagNumber(3)
  set etag($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEtag() => $_has(2);
  @$pb.TagNumber(3)
  void clearEtag() => $_clearField(3);

  /// Optional. If set to true, and the project is not found, the request will succeed
  /// but no action will be taken on the server.
  @$pb.TagNumber(4)
  $core.bool get allowMissing => $_getBF(3);
  @$pb.TagNumber(4)
  set allowMissing($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAllowMissing() => $_has(3);
  @$pb.TagNumber(4)
  void clearAllowMissing() => $_clearField(4);

  /// Optional. If set to true, the request is validated but not actually executed.
  @$pb.TagNumber(5)
  $core.bool get validateOnly => $_getBF(4);
  @$pb.TagNumber(5)
  set validateOnly($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasValidateOnly() => $_has(4);
  @$pb.TagNumber(5)
  void clearValidateOnly() => $_clearField(5);
}

/// Request message for the `UndeleteProject` method.
class UndeleteProjectRequest extends $pb.GeneratedMessage {
  factory UndeleteProjectRequest({
    $core.String? name,
    $core.bool? validateOnly,
    $core.String? etag,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (validateOnly != null) result.validateOnly = validateOnly;
    if (etag != null) result.etag = etag;
    return result;
  }

  UndeleteProjectRequest._();

  factory UndeleteProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UndeleteProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UndeleteProjectRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'validateOnly')
    ..aOS(3, _omitFieldNames ? '' : 'etag')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UndeleteProjectRequest clone() =>
      UndeleteProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UndeleteProjectRequest copyWith(
          void Function(UndeleteProjectRequest) updates) =>
      super.copyWith((message) => updates(message as UndeleteProjectRequest))
          as UndeleteProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UndeleteProjectRequest create() => UndeleteProjectRequest._();
  @$core.override
  UndeleteProjectRequest createEmptyInstance() => create();
  static $pb.PbList<UndeleteProjectRequest> createRepeated() =>
      $pb.PbList<UndeleteProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static UndeleteProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UndeleteProjectRequest>(create);
  static UndeleteProjectRequest? _defaultInstance;

  /// Required. The name of the project to undelete.
  ///
  /// Format: `organizations/{organization}/projects/{project}`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Optional. If set to true, the request is validated but not actually executed.
  @$pb.TagNumber(2)
  $core.bool get validateOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set validateOnly($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidateOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidateOnly() => $_clearField(2);

  /// Optional. The etag of the project.
  /// If this is provided, it must match the server's etag.
  @$pb.TagNumber(3)
  $core.String get etag => $_getSZ(2);
  @$pb.TagNumber(3)
  set etag($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEtag() => $_has(2);
  @$pb.TagNumber(3)
  void clearEtag() => $_clearField(3);
}

/// Request message for the `RenameProject` operation.
class RenameProjectRequest extends $pb.GeneratedMessage {
  factory RenameProjectRequest({
    $core.String? name,
    $core.String? projectId,
    $core.String? etag,
    $core.bool? validateOnly,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (projectId != null) result.projectId = projectId;
    if (etag != null) result.etag = etag;
    if (validateOnly != null) result.validateOnly = validateOnly;
    return result;
  }

  RenameProjectRequest._();

  factory RenameProjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenameProjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenameProjectRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'projectId')
    ..aOS(3, _omitFieldNames ? '' : 'etag')
    ..aOB(4, _omitFieldNames ? '' : 'validateOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenameProjectRequest clone() =>
      RenameProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenameProjectRequest copyWith(void Function(RenameProjectRequest) updates) =>
      super.copyWith((message) => updates(message as RenameProjectRequest))
          as RenameProjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenameProjectRequest create() => RenameProjectRequest._();
  @$core.override
  RenameProjectRequest createEmptyInstance() => create();
  static $pb.PbList<RenameProjectRequest> createRepeated() =>
      $pb.PbList<RenameProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static RenameProjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenameProjectRequest>(create);
  static RenameProjectRequest? _defaultInstance;

  /// Required. The name of the project to rename.
  ///
  /// Format: `organizations/{organization}/projects/{project}`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Required. The new project identifier.
  ///
  /// It must be 6 to 30 lowercase ASCII letters, digits, or hyphens.
  @$pb.TagNumber(2)
  $core.String get projectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set projectId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => $_clearField(2);

  /// Optional. The etag of the project.
  /// If this is provided, it must match the server's etag.
  @$pb.TagNumber(3)
  $core.String get etag => $_getSZ(2);
  @$pb.TagNumber(3)
  set etag($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEtag() => $_has(2);
  @$pb.TagNumber(3)
  void clearEtag() => $_clearField(3);

  /// Optional. If set to true, the request is validated but not actually executed.
  @$pb.TagNumber(4)
  $core.bool get validateOnly => $_getBF(3);
  @$pb.TagNumber(4)
  set validateOnly($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValidateOnly() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidateOnly() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

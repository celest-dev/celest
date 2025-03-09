//
//  Generated code. Do not modify.
//  source: celest/ast/v1/resolved_ast.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../cedar/v3/policy.pb.dart' as $52;
import '../../../google/protobuf/struct.pb.dart' as $22;
import 'features.pbenum.dart' as $54;
import 'resolved_ast.pbenum.dart';
import 'sdks.pb.dart' as $53;
import 'sdks.pbenum.dart' as $53;

export 'resolved_ast.pbenum.dart';

/// The resolved AST of a Celest project.
class ResolvedProject extends $pb.GeneratedMessage {
  factory ResolvedProject({
    $core.String? projectId,
    $core.String? environmentId,
    $core.Map<$core.String, ResolvedApi>? apis,
    $core.Iterable<ResolvedVariable>? variables,
    $core.Iterable<ResolvedSecret>? secrets,
    ResolvedAuth? auth,
    $core.Map<$core.String, ResolvedDatabase>? databases,
    SdkConfiguration? sdkConfig,
  }) {
    final $result = create();
    if (projectId != null) {
      $result.projectId = projectId;
    }
    if (environmentId != null) {
      $result.environmentId = environmentId;
    }
    if (apis != null) {
      $result.apis.addAll(apis);
    }
    if (variables != null) {
      $result.variables.addAll(variables);
    }
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    if (auth != null) {
      $result.auth = auth;
    }
    if (databases != null) {
      $result.databases.addAll(databases);
    }
    if (sdkConfig != null) {
      $result.sdkConfig = sdkConfig;
    }
    return $result;
  }
  ResolvedProject._() : super();
  factory ResolvedProject.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedProject.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedProject',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'projectId')
    ..aOS(2, _omitFieldNames ? '' : 'environmentId')
    ..m<$core.String, ResolvedApi>(3, _omitFieldNames ? '' : 'apis',
        entryClassName: 'ResolvedProject.ApisEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: ResolvedApi.create,
        valueDefaultOrMaker: ResolvedApi.getDefault,
        packageName: const $pb.PackageName('celest.ast.v1'))
    ..pc<ResolvedVariable>(
        4, _omitFieldNames ? '' : 'variables', $pb.PbFieldType.PM,
        subBuilder: ResolvedVariable.create)
    ..pc<ResolvedSecret>(
        5, _omitFieldNames ? '' : 'secrets', $pb.PbFieldType.PM,
        subBuilder: ResolvedSecret.create)
    ..aOM<ResolvedAuth>(6, _omitFieldNames ? '' : 'auth',
        subBuilder: ResolvedAuth.create)
    ..m<$core.String, ResolvedDatabase>(7, _omitFieldNames ? '' : 'databases',
        entryClassName: 'ResolvedProject.DatabasesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: ResolvedDatabase.create,
        valueDefaultOrMaker: ResolvedDatabase.getDefault,
        packageName: const $pb.PackageName('celest.ast.v1'))
    ..aOM<SdkConfiguration>(99, _omitFieldNames ? '' : 'sdkConfig',
        subBuilder: SdkConfiguration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedProject clone() => ResolvedProject()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedProject copyWith(void Function(ResolvedProject) updates) =>
      super.copyWith((message) => updates(message as ResolvedProject))
          as ResolvedProject;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedProject create() => ResolvedProject._();
  ResolvedProject createEmptyInstance() => create();
  static $pb.PbList<ResolvedProject> createRepeated() =>
      $pb.PbList<ResolvedProject>();
  @$core.pragma('dart2js:noInline')
  static ResolvedProject getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedProject>(create);
  static ResolvedProject? _defaultInstance;

  /// The user-provided identifier of the project.
  @$pb.TagNumber(1)
  $core.String get projectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set projectId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => clearField(1);

  /// The ID of the environment this projects resolves to.
  @$pb.TagNumber(2)
  $core.String get environmentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set environmentId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEnvironmentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnvironmentId() => clearField(2);

  /// The project's API endpoints, keyed by their `name`.
  @$pb.TagNumber(3)
  $core.Map<$core.String, ResolvedApi> get apis => $_getMap(2);

  /// The project's environment variables.
  @$pb.TagNumber(4)
  $core.List<ResolvedVariable> get variables => $_getList(3);

  /// The project's secrets.
  @$pb.TagNumber(5)
  $core.List<ResolvedSecret> get secrets => $_getList(4);

  /// The project's auth configuration.
  @$pb.TagNumber(6)
  ResolvedAuth get auth => $_getN(5);
  @$pb.TagNumber(6)
  set auth(ResolvedAuth v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAuth() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuth() => clearField(6);
  @$pb.TagNumber(6)
  ResolvedAuth ensureAuth() => $_ensure(5);

  /// The project's databases.
  @$pb.TagNumber(7)
  $core.Map<$core.String, ResolvedDatabase> get databases => $_getMap(6);

  /// Configuration of the Dart, Flutter, and Celest SDKs used to deploy the project.
  @$pb.TagNumber(99)
  SdkConfiguration get sdkConfig => $_getN(7);
  @$pb.TagNumber(99)
  set sdkConfig(SdkConfiguration v) {
    setField(99, v);
  }

  @$pb.TagNumber(99)
  $core.bool hasSdkConfig() => $_has(7);
  @$pb.TagNumber(99)
  void clearSdkConfig() => clearField(99);
  @$pb.TagNumber(99)
  SdkConfiguration ensureSdkConfig() => $_ensure(7);
}

/// The resolved AST of a Celest API.
class ResolvedApi extends $pb.GeneratedMessage {
  factory ResolvedApi({
    $core.String? apiId,
    $core.Map<$core.String, ResolvedFunction>? functions,
    $52.PolicySet? policySet,
  }) {
    final $result = create();
    if (apiId != null) {
      $result.apiId = apiId;
    }
    if (functions != null) {
      $result.functions.addAll(functions);
    }
    if (policySet != null) {
      $result.policySet = policySet;
    }
    return $result;
  }
  ResolvedApi._() : super();
  factory ResolvedApi.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedApi.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedApi',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'apiId')
    ..m<$core.String, ResolvedFunction>(2, _omitFieldNames ? '' : 'functions',
        entryClassName: 'ResolvedApi.FunctionsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: ResolvedFunction.create,
        valueDefaultOrMaker: ResolvedFunction.getDefault,
        packageName: const $pb.PackageName('celest.ast.v1'))
    ..aOM<$52.PolicySet>(3, _omitFieldNames ? '' : 'policySet',
        subBuilder: $52.PolicySet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedApi clone() => ResolvedApi()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedApi copyWith(void Function(ResolvedApi) updates) =>
      super.copyWith((message) => updates(message as ResolvedApi))
          as ResolvedApi;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedApi create() => ResolvedApi._();
  ResolvedApi createEmptyInstance() => create();
  static $pb.PbList<ResolvedApi> createRepeated() => $pb.PbList<ResolvedApi>();
  @$core.pragma('dart2js:noInline')
  static ResolvedApi getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedApi>(create);
  static ResolvedApi? _defaultInstance;

  ///  The unique identifier of the API within a project.
  ///
  ///  Typically, this is the basename of the file where the API is defined, e.g.
  ///     `celest/functions/greeting.dart` -> `greeting`
  @$pb.TagNumber(1)
  $core.String get apiId => $_getSZ(0);
  @$pb.TagNumber(1)
  set apiId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasApiId() => $_has(0);
  @$pb.TagNumber(1)
  void clearApiId() => clearField(1);

  /// The functions in the API.
  @$pb.TagNumber(2)
  $core.Map<$core.String, ResolvedFunction> get functions => $_getMap(1);

  ///  The policy set declared by the API.
  ///
  ///  This policy set is applied to all functions within the API.
  @$pb.TagNumber(3)
  $52.PolicySet get policySet => $_getN(2);
  @$pb.TagNumber(3)
  set policySet($52.PolicySet v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPolicySet() => $_has(2);
  @$pb.TagNumber(3)
  void clearPolicySet() => clearField(3);
  @$pb.TagNumber(3)
  $52.PolicySet ensurePolicySet() => $_ensure(2);
}

/// The resolved AST of a Celest function.
class ResolvedFunction extends $pb.GeneratedMessage {
  factory ResolvedFunction({
    $core.String? functionId,
    $core.String? parentId,
    ResolvedHttpConfig? httpConfig,
    ResolvedStreamConfig? streamConfig,
    $core.Iterable<$core.String>? variables,
    $core.Iterable<$core.String>? secrets,
    $52.PolicySet? policySet,
  }) {
    final $result = create();
    if (functionId != null) {
      $result.functionId = functionId;
    }
    if (parentId != null) {
      $result.parentId = parentId;
    }
    if (httpConfig != null) {
      $result.httpConfig = httpConfig;
    }
    if (streamConfig != null) {
      $result.streamConfig = streamConfig;
    }
    if (variables != null) {
      $result.variables.addAll(variables);
    }
    if (secrets != null) {
      $result.secrets.addAll(secrets);
    }
    if (policySet != null) {
      $result.policySet = policySet;
    }
    return $result;
  }
  ResolvedFunction._() : super();
  factory ResolvedFunction.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedFunction.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedFunction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'functionId')
    ..aOS(2, _omitFieldNames ? '' : 'parentId')
    ..aOM<ResolvedHttpConfig>(3, _omitFieldNames ? '' : 'httpConfig',
        subBuilder: ResolvedHttpConfig.create)
    ..aOM<ResolvedStreamConfig>(4, _omitFieldNames ? '' : 'streamConfig',
        subBuilder: ResolvedStreamConfig.create)
    ..pPS(5, _omitFieldNames ? '' : 'variables')
    ..pPS(6, _omitFieldNames ? '' : 'secrets')
    ..aOM<$52.PolicySet>(7, _omitFieldNames ? '' : 'policySet',
        subBuilder: $52.PolicySet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedFunction clone() => ResolvedFunction()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedFunction copyWith(void Function(ResolvedFunction) updates) =>
      super.copyWith((message) => updates(message as ResolvedFunction))
          as ResolvedFunction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedFunction create() => ResolvedFunction._();
  ResolvedFunction createEmptyInstance() => create();
  static $pb.PbList<ResolvedFunction> createRepeated() =>
      $pb.PbList<ResolvedFunction>();
  @$core.pragma('dart2js:noInline')
  static ResolvedFunction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedFunction>(create);
  static ResolvedFunction? _defaultInstance;

  ///  The unique identifier of the function within its API.
  ///
  ///  Typically, this is the name of the function as it appears in Dart, e.g.
  ///     `Future<String> sayHello()` -> `sayHello`
  @$pb.TagNumber(1)
  $core.String get functionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set functionId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFunctionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFunctionId() => clearField(1);

  /// The ID of the function's parent API.
  @$pb.TagNumber(2)
  $core.String get parentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set parentId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasParentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentId() => clearField(2);

  /// The resolved HTTP configuration of the function.
  @$pb.TagNumber(3)
  ResolvedHttpConfig get httpConfig => $_getN(2);
  @$pb.TagNumber(3)
  set httpConfig(ResolvedHttpConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHttpConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearHttpConfig() => clearField(3);
  @$pb.TagNumber(3)
  ResolvedHttpConfig ensureHttpConfig() => $_ensure(2);

  /// The resolved stream configuration of the function.
  @$pb.TagNumber(4)
  ResolvedStreamConfig get streamConfig => $_getN(3);
  @$pb.TagNumber(4)
  set streamConfig(ResolvedStreamConfig v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStreamConfig() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamConfig() => clearField(4);
  @$pb.TagNumber(4)
  ResolvedStreamConfig ensureStreamConfig() => $_ensure(3);

  /// The variables required by the function.
  @$pb.TagNumber(5)
  $core.List<$core.String> get variables => $_getList(4);

  /// The secrets required by the function.
  @$pb.TagNumber(6)
  $core.List<$core.String> get secrets => $_getList(5);

  /// The policy set declared by the function.
  @$pb.TagNumber(7)
  $52.PolicySet get policySet => $_getN(6);
  @$pb.TagNumber(7)
  set policySet($52.PolicySet v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPolicySet() => $_has(6);
  @$pb.TagNumber(7)
  void clearPolicySet() => clearField(7);
  @$pb.TagNumber(7)
  $52.PolicySet ensurePolicySet() => $_ensure(6);
}

/// The HTTP configuration of a [ResolvedFunction][].
class ResolvedHttpConfig extends $pb.GeneratedMessage {
  factory ResolvedHttpConfig({
    $core.int? status,
    ResolvedHttpRoute? route,
    $core.Iterable<ResolvedHttpRoute>? additionalRoutes,
    $core.Map<$core.String, $core.int>? statusMappings,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (route != null) {
      $result.route = route;
    }
    if (additionalRoutes != null) {
      $result.additionalRoutes.addAll(additionalRoutes);
    }
    if (statusMappings != null) {
      $result.statusMappings.addAll(statusMappings);
    }
    return $result;
  }
  ResolvedHttpConfig._() : super();
  factory ResolvedHttpConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedHttpConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedHttpConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOM<ResolvedHttpRoute>(2, _omitFieldNames ? '' : 'route',
        subBuilder: ResolvedHttpRoute.create)
    ..pc<ResolvedHttpRoute>(
        3, _omitFieldNames ? '' : 'additionalRoutes', $pb.PbFieldType.PM,
        subBuilder: ResolvedHttpRoute.create)
    ..m<$core.String, $core.int>(4, _omitFieldNames ? '' : 'statusMappings',
        entryClassName: 'ResolvedHttpConfig.StatusMappingsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3,
        packageName: const $pb.PackageName('celest.ast.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedHttpConfig clone() => ResolvedHttpConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedHttpConfig copyWith(void Function(ResolvedHttpConfig) updates) =>
      super.copyWith((message) => updates(message as ResolvedHttpConfig))
          as ResolvedHttpConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedHttpConfig create() => ResolvedHttpConfig._();
  ResolvedHttpConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedHttpConfig> createRepeated() =>
      $pb.PbList<ResolvedHttpConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedHttpConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedHttpConfig>(create);
  static ResolvedHttpConfig? _defaultInstance;

  /// The successful status code of the function.
  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  /// The resolved route configuration of the function.
  @$pb.TagNumber(2)
  ResolvedHttpRoute get route => $_getN(1);
  @$pb.TagNumber(2)
  set route(ResolvedHttpRoute v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoute() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoute() => clearField(2);
  @$pb.TagNumber(2)
  ResolvedHttpRoute ensureRoute() => $_ensure(1);

  /// Additional route configurations of the function.
  @$pb.TagNumber(3)
  $core.List<ResolvedHttpRoute> get additionalRoutes => $_getList(2);

  ///  A mapping of Dart types to HTTP status codes.
  ///
  ///  Dart types are represented as URIs with a scheme, host and path identifying the location
  ///  of the type's definition, and a fragment identifying the type itself.
  ///
  ///  For example:
  ///
  ///  - `dart:core#String`
  ///  - `package:celest/functions/greeting.dart#GreetingError`
  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.int> get statusMappings => $_getMap(3);
}

/// A route to an HTTP endpoint.
class ResolvedHttpRoute extends $pb.GeneratedMessage {
  factory ResolvedHttpRoute({
    $core.String? method,
    $core.String? path,
  }) {
    final $result = create();
    if (method != null) {
      $result.method = method;
    }
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  ResolvedHttpRoute._() : super();
  factory ResolvedHttpRoute.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedHttpRoute.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedHttpRoute',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'method')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedHttpRoute clone() => ResolvedHttpRoute()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedHttpRoute copyWith(void Function(ResolvedHttpRoute) updates) =>
      super.copyWith((message) => updates(message as ResolvedHttpRoute))
          as ResolvedHttpRoute;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedHttpRoute create() => ResolvedHttpRoute._();
  ResolvedHttpRoute createEmptyInstance() => create();
  static $pb.PbList<ResolvedHttpRoute> createRepeated() =>
      $pb.PbList<ResolvedHttpRoute>();
  @$core.pragma('dart2js:noInline')
  static ResolvedHttpRoute getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedHttpRoute>(create);
  static ResolvedHttpRoute? _defaultInstance;

  /// The HTTP method of the route.
  @$pb.TagNumber(1)
  $core.String get method => $_getSZ(0);
  @$pb.TagNumber(1)
  set method($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMethod() => $_has(0);
  @$pb.TagNumber(1)
  void clearMethod() => clearField(1);

  /// The path to the HTTP endpoint.
  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);
}

/// The stream configuration of a [ResolvedFunction][].
class ResolvedStreamConfig extends $pb.GeneratedMessage {
  factory ResolvedStreamConfig({
    ResolvedStreamConfig_Type? type,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  ResolvedStreamConfig._() : super();
  factory ResolvedStreamConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedStreamConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedStreamConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..e<ResolvedStreamConfig_Type>(
        1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker:
            ResolvedStreamConfig_Type.STREAM_CONFIG_TYPE_UNSPECIFIED,
        valueOf: ResolvedStreamConfig_Type.valueOf,
        enumValues: ResolvedStreamConfig_Type.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedStreamConfig clone() =>
      ResolvedStreamConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedStreamConfig copyWith(void Function(ResolvedStreamConfig) updates) =>
      super.copyWith((message) => updates(message as ResolvedStreamConfig))
          as ResolvedStreamConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedStreamConfig create() => ResolvedStreamConfig._();
  ResolvedStreamConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedStreamConfig> createRepeated() =>
      $pb.PbList<ResolvedStreamConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedStreamConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedStreamConfig>(create);
  static ResolvedStreamConfig? _defaultInstance;

  /// The type of the stream configuration.
  @$pb.TagNumber(1)
  ResolvedStreamConfig_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ResolvedStreamConfig_Type v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);
}

/// An environment variable and its value.
class ResolvedVariable extends $pb.GeneratedMessage {
  factory ResolvedVariable({
    $core.String? name,
    $core.String? value,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ResolvedVariable._() : super();
  factory ResolvedVariable.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedVariable.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedVariable',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedVariable clone() => ResolvedVariable()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedVariable copyWith(void Function(ResolvedVariable) updates) =>
      super.copyWith((message) => updates(message as ResolvedVariable))
          as ResolvedVariable;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedVariable create() => ResolvedVariable._();
  ResolvedVariable createEmptyInstance() => create();
  static $pb.PbList<ResolvedVariable> createRepeated() =>
      $pb.PbList<ResolvedVariable>();
  @$core.pragma('dart2js:noInline')
  static ResolvedVariable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedVariable>(create);
  static ResolvedVariable? _defaultInstance;

  /// The name of the environment variable.
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

  /// The value of the environment variable.
  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

/// A secret value.
class ResolvedSecret extends $pb.GeneratedMessage {
  factory ResolvedSecret({
    $core.String? name,
    $core.String? value,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ResolvedSecret._() : super();
  factory ResolvedSecret.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedSecret.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedSecret',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedSecret clone() => ResolvedSecret()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedSecret copyWith(void Function(ResolvedSecret) updates) =>
      super.copyWith((message) => updates(message as ResolvedSecret))
          as ResolvedSecret;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedSecret create() => ResolvedSecret._();
  ResolvedSecret createEmptyInstance() => create();
  static $pb.PbList<ResolvedSecret> createRepeated() =>
      $pb.PbList<ResolvedSecret>();
  @$core.pragma('dart2js:noInline')
  static ResolvedSecret getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedSecret>(create);
  static ResolvedSecret? _defaultInstance;

  /// The name of the secret.
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

  /// Input only. The value of the secret.
  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

/// The resolved AST of a Celest project's auth configuration.
class ResolvedAuth extends $pb.GeneratedMessage {
  factory ResolvedAuth({
    $core.Iterable<ResolvedAuthProvider>? providers,
    $core.Iterable<ResolvedExternalAuthProvider>? externalProviders,
  }) {
    final $result = create();
    if (providers != null) {
      $result.providers.addAll(providers);
    }
    if (externalProviders != null) {
      $result.externalProviders.addAll(externalProviders);
    }
    return $result;
  }
  ResolvedAuth._() : super();
  factory ResolvedAuth.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedAuth.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedAuth',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..pc<ResolvedAuthProvider>(
        1, _omitFieldNames ? '' : 'providers', $pb.PbFieldType.PM,
        subBuilder: ResolvedAuthProvider.create)
    ..pc<ResolvedExternalAuthProvider>(
        2, _omitFieldNames ? '' : 'externalProviders', $pb.PbFieldType.PM,
        subBuilder: ResolvedExternalAuthProvider.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedAuth clone() => ResolvedAuth()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedAuth copyWith(void Function(ResolvedAuth) updates) =>
      super.copyWith((message) => updates(message as ResolvedAuth))
          as ResolvedAuth;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedAuth create() => ResolvedAuth._();
  ResolvedAuth createEmptyInstance() => create();
  static $pb.PbList<ResolvedAuth> createRepeated() =>
      $pb.PbList<ResolvedAuth>();
  @$core.pragma('dart2js:noInline')
  static ResolvedAuth getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedAuth>(create);
  static ResolvedAuth? _defaultInstance;

  /// The auth providers of the project.
  @$pb.TagNumber(1)
  $core.List<ResolvedAuthProvider> get providers => $_getList(0);

  /// The external auth providers of the project.
  @$pb.TagNumber(2)
  $core.List<ResolvedExternalAuthProvider> get externalProviders =>
      $_getList(1);
}

enum ResolvedAuthProvider_Config {
  emailOtp,
  smsOtp,
  google,
  github,
  apple,
  notSet
}

/// A resolved auth provider configuration.
class ResolvedAuthProvider extends $pb.GeneratedMessage {
  factory ResolvedAuthProvider({
    $core.String? authProviderId,
    ResolvedAuthProvider_Type? type,
    ResolvedEmailOtpProviderConfig? emailOtp,
    ResolvedSmsOtpProviderConfig? smsOtp,
    ResolvedGoogleOAuthProviderConfig? google,
    ResolvedGitHubOAuthProviderConfig? github,
    ResolvedAppleOAuthProviderConfig? apple,
  }) {
    final $result = create();
    if (authProviderId != null) {
      $result.authProviderId = authProviderId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (emailOtp != null) {
      $result.emailOtp = emailOtp;
    }
    if (smsOtp != null) {
      $result.smsOtp = smsOtp;
    }
    if (google != null) {
      $result.google = google;
    }
    if (github != null) {
      $result.github = github;
    }
    if (apple != null) {
      $result.apple = apple;
    }
    return $result;
  }
  ResolvedAuthProvider._() : super();
  factory ResolvedAuthProvider.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedAuthProvider.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResolvedAuthProvider_Config>
      _ResolvedAuthProvider_ConfigByTag = {
    3: ResolvedAuthProvider_Config.emailOtp,
    4: ResolvedAuthProvider_Config.smsOtp,
    5: ResolvedAuthProvider_Config.google,
    6: ResolvedAuthProvider_Config.github,
    7: ResolvedAuthProvider_Config.apple,
    0: ResolvedAuthProvider_Config.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedAuthProvider',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6, 7])
    ..aOS(1, _omitFieldNames ? '' : 'authProviderId')
    ..e<ResolvedAuthProvider_Type>(
        2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker:
            ResolvedAuthProvider_Type.AUTH_PROVIDER_TYPE_UNSPECIFIED,
        valueOf: ResolvedAuthProvider_Type.valueOf,
        enumValues: ResolvedAuthProvider_Type.values)
    ..aOM<ResolvedEmailOtpProviderConfig>(3, _omitFieldNames ? '' : 'emailOtp',
        subBuilder: ResolvedEmailOtpProviderConfig.create)
    ..aOM<ResolvedSmsOtpProviderConfig>(4, _omitFieldNames ? '' : 'smsOtp',
        subBuilder: ResolvedSmsOtpProviderConfig.create)
    ..aOM<ResolvedGoogleOAuthProviderConfig>(5, _omitFieldNames ? '' : 'google',
        subBuilder: ResolvedGoogleOAuthProviderConfig.create)
    ..aOM<ResolvedGitHubOAuthProviderConfig>(6, _omitFieldNames ? '' : 'github',
        subBuilder: ResolvedGitHubOAuthProviderConfig.create)
    ..aOM<ResolvedAppleOAuthProviderConfig>(7, _omitFieldNames ? '' : 'apple',
        subBuilder: ResolvedAppleOAuthProviderConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedAuthProvider clone() =>
      ResolvedAuthProvider()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedAuthProvider copyWith(void Function(ResolvedAuthProvider) updates) =>
      super.copyWith((message) => updates(message as ResolvedAuthProvider))
          as ResolvedAuthProvider;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedAuthProvider create() => ResolvedAuthProvider._();
  ResolvedAuthProvider createEmptyInstance() => create();
  static $pb.PbList<ResolvedAuthProvider> createRepeated() =>
      $pb.PbList<ResolvedAuthProvider>();
  @$core.pragma('dart2js:noInline')
  static ResolvedAuthProvider getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedAuthProvider>(create);
  static ResolvedAuthProvider? _defaultInstance;

  ResolvedAuthProvider_Config whichConfig() =>
      _ResolvedAuthProvider_ConfigByTag[$_whichOneof(0)]!;
  void clearConfig() => clearField($_whichOneof(0));

  /// The ID of the auth provider.
  @$pb.TagNumber(1)
  $core.String get authProviderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set authProviderId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAuthProviderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthProviderId() => clearField(1);

  /// The type of the auth provider.
  @$pb.TagNumber(2)
  ResolvedAuthProvider_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ResolvedAuthProvider_Type v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// The configuration of an email OTP provider.
  @$pb.TagNumber(3)
  ResolvedEmailOtpProviderConfig get emailOtp => $_getN(2);
  @$pb.TagNumber(3)
  set emailOtp(ResolvedEmailOtpProviderConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEmailOtp() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmailOtp() => clearField(3);
  @$pb.TagNumber(3)
  ResolvedEmailOtpProviderConfig ensureEmailOtp() => $_ensure(2);

  /// The configuration of an SMS OTP provider.
  @$pb.TagNumber(4)
  ResolvedSmsOtpProviderConfig get smsOtp => $_getN(3);
  @$pb.TagNumber(4)
  set smsOtp(ResolvedSmsOtpProviderConfig v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSmsOtp() => $_has(3);
  @$pb.TagNumber(4)
  void clearSmsOtp() => clearField(4);
  @$pb.TagNumber(4)
  ResolvedSmsOtpProviderConfig ensureSmsOtp() => $_ensure(3);

  /// The configuration of a Google OAuth provider.
  @$pb.TagNumber(5)
  ResolvedGoogleOAuthProviderConfig get google => $_getN(4);
  @$pb.TagNumber(5)
  set google(ResolvedGoogleOAuthProviderConfig v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGoogle() => $_has(4);
  @$pb.TagNumber(5)
  void clearGoogle() => clearField(5);
  @$pb.TagNumber(5)
  ResolvedGoogleOAuthProviderConfig ensureGoogle() => $_ensure(4);

  /// The configuration of a Github OAuth provider.
  @$pb.TagNumber(6)
  ResolvedGitHubOAuthProviderConfig get github => $_getN(5);
  @$pb.TagNumber(6)
  set github(ResolvedGitHubOAuthProviderConfig v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGithub() => $_has(5);
  @$pb.TagNumber(6)
  void clearGithub() => clearField(6);
  @$pb.TagNumber(6)
  ResolvedGitHubOAuthProviderConfig ensureGithub() => $_ensure(5);

  /// The configuration of an Apple OAuth provider.
  @$pb.TagNumber(7)
  ResolvedAppleOAuthProviderConfig get apple => $_getN(6);
  @$pb.TagNumber(7)
  set apple(ResolvedAppleOAuthProviderConfig v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasApple() => $_has(6);
  @$pb.TagNumber(7)
  void clearApple() => clearField(7);
  @$pb.TagNumber(7)
  ResolvedAppleOAuthProviderConfig ensureApple() => $_ensure(6);
}

/// The configuration of an email OTP provider.
class ResolvedEmailOtpProviderConfig extends $pb.GeneratedMessage {
  factory ResolvedEmailOtpProviderConfig() => create();
  ResolvedEmailOtpProviderConfig._() : super();
  factory ResolvedEmailOtpProviderConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedEmailOtpProviderConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedEmailOtpProviderConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedEmailOtpProviderConfig clone() =>
      ResolvedEmailOtpProviderConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedEmailOtpProviderConfig copyWith(
          void Function(ResolvedEmailOtpProviderConfig) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedEmailOtpProviderConfig))
          as ResolvedEmailOtpProviderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedEmailOtpProviderConfig create() =>
      ResolvedEmailOtpProviderConfig._();
  ResolvedEmailOtpProviderConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedEmailOtpProviderConfig> createRepeated() =>
      $pb.PbList<ResolvedEmailOtpProviderConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedEmailOtpProviderConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedEmailOtpProviderConfig>(create);
  static ResolvedEmailOtpProviderConfig? _defaultInstance;
}

/// The configuration of an SMS OTP provider.
class ResolvedSmsOtpProviderConfig extends $pb.GeneratedMessage {
  factory ResolvedSmsOtpProviderConfig() => create();
  ResolvedSmsOtpProviderConfig._() : super();
  factory ResolvedSmsOtpProviderConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedSmsOtpProviderConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedSmsOtpProviderConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedSmsOtpProviderConfig clone() =>
      ResolvedSmsOtpProviderConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedSmsOtpProviderConfig copyWith(
          void Function(ResolvedSmsOtpProviderConfig) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedSmsOtpProviderConfig))
          as ResolvedSmsOtpProviderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedSmsOtpProviderConfig create() =>
      ResolvedSmsOtpProviderConfig._();
  ResolvedSmsOtpProviderConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedSmsOtpProviderConfig> createRepeated() =>
      $pb.PbList<ResolvedSmsOtpProviderConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedSmsOtpProviderConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedSmsOtpProviderConfig>(create);
  static ResolvedSmsOtpProviderConfig? _defaultInstance;
}

/// The configuration of a Google OAuth provider.
class ResolvedGoogleOAuthProviderConfig extends $pb.GeneratedMessage {
  factory ResolvedGoogleOAuthProviderConfig({
    ResolvedSecret? clientId,
    ResolvedSecret? clientSecret,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (clientSecret != null) {
      $result.clientSecret = clientSecret;
    }
    return $result;
  }
  ResolvedGoogleOAuthProviderConfig._() : super();
  factory ResolvedGoogleOAuthProviderConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedGoogleOAuthProviderConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedGoogleOAuthProviderConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<ResolvedSecret>(1, _omitFieldNames ? '' : 'clientId',
        subBuilder: ResolvedSecret.create)
    ..aOM<ResolvedSecret>(2, _omitFieldNames ? '' : 'clientSecret',
        subBuilder: ResolvedSecret.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedGoogleOAuthProviderConfig clone() =>
      ResolvedGoogleOAuthProviderConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedGoogleOAuthProviderConfig copyWith(
          void Function(ResolvedGoogleOAuthProviderConfig) updates) =>
      super.copyWith((message) =>
              updates(message as ResolvedGoogleOAuthProviderConfig))
          as ResolvedGoogleOAuthProviderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedGoogleOAuthProviderConfig create() =>
      ResolvedGoogleOAuthProviderConfig._();
  ResolvedGoogleOAuthProviderConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedGoogleOAuthProviderConfig> createRepeated() =>
      $pb.PbList<ResolvedGoogleOAuthProviderConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedGoogleOAuthProviderConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedGoogleOAuthProviderConfig>(
          create);
  static ResolvedGoogleOAuthProviderConfig? _defaultInstance;

  /// The client ID of the Google OAuth provider.
  @$pb.TagNumber(1)
  ResolvedSecret get clientId => $_getN(0);
  @$pb.TagNumber(1)
  set clientId(ResolvedSecret v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
  @$pb.TagNumber(1)
  ResolvedSecret ensureClientId() => $_ensure(0);

  /// The client secret of the Google OAuth provider.
  @$pb.TagNumber(2)
  ResolvedSecret get clientSecret => $_getN(1);
  @$pb.TagNumber(2)
  set clientSecret(ResolvedSecret v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasClientSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientSecret() => clearField(2);
  @$pb.TagNumber(2)
  ResolvedSecret ensureClientSecret() => $_ensure(1);
}

/// The configuration of a GitHub OAuth provider.
class ResolvedGitHubOAuthProviderConfig extends $pb.GeneratedMessage {
  factory ResolvedGitHubOAuthProviderConfig({
    ResolvedSecret? clientId,
    ResolvedSecret? clientSecret,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (clientSecret != null) {
      $result.clientSecret = clientSecret;
    }
    return $result;
  }
  ResolvedGitHubOAuthProviderConfig._() : super();
  factory ResolvedGitHubOAuthProviderConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedGitHubOAuthProviderConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedGitHubOAuthProviderConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<ResolvedSecret>(1, _omitFieldNames ? '' : 'clientId',
        subBuilder: ResolvedSecret.create)
    ..aOM<ResolvedSecret>(2, _omitFieldNames ? '' : 'clientSecret',
        subBuilder: ResolvedSecret.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedGitHubOAuthProviderConfig clone() =>
      ResolvedGitHubOAuthProviderConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedGitHubOAuthProviderConfig copyWith(
          void Function(ResolvedGitHubOAuthProviderConfig) updates) =>
      super.copyWith((message) =>
              updates(message as ResolvedGitHubOAuthProviderConfig))
          as ResolvedGitHubOAuthProviderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedGitHubOAuthProviderConfig create() =>
      ResolvedGitHubOAuthProviderConfig._();
  ResolvedGitHubOAuthProviderConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedGitHubOAuthProviderConfig> createRepeated() =>
      $pb.PbList<ResolvedGitHubOAuthProviderConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedGitHubOAuthProviderConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedGitHubOAuthProviderConfig>(
          create);
  static ResolvedGitHubOAuthProviderConfig? _defaultInstance;

  /// The client ID of the Github OAuth provider.
  @$pb.TagNumber(1)
  ResolvedSecret get clientId => $_getN(0);
  @$pb.TagNumber(1)
  set clientId(ResolvedSecret v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
  @$pb.TagNumber(1)
  ResolvedSecret ensureClientId() => $_ensure(0);

  /// The client secret of the Github OAuth provider.
  @$pb.TagNumber(2)
  ResolvedSecret get clientSecret => $_getN(1);
  @$pb.TagNumber(2)
  set clientSecret(ResolvedSecret v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasClientSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientSecret() => clearField(2);
  @$pb.TagNumber(2)
  ResolvedSecret ensureClientSecret() => $_ensure(1);
}

/// The configuration of an Apple OAuth provider.
class ResolvedAppleOAuthProviderConfig extends $pb.GeneratedMessage {
  factory ResolvedAppleOAuthProviderConfig({
    ResolvedSecret? clientId,
    ResolvedSecret? teamId,
    ResolvedSecret? keyId,
    ResolvedSecret? privateKey,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (teamId != null) {
      $result.teamId = teamId;
    }
    if (keyId != null) {
      $result.keyId = keyId;
    }
    if (privateKey != null) {
      $result.privateKey = privateKey;
    }
    return $result;
  }
  ResolvedAppleOAuthProviderConfig._() : super();
  factory ResolvedAppleOAuthProviderConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedAppleOAuthProviderConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedAppleOAuthProviderConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<ResolvedSecret>(1, _omitFieldNames ? '' : 'clientId',
        subBuilder: ResolvedSecret.create)
    ..aOM<ResolvedSecret>(2, _omitFieldNames ? '' : 'teamId',
        subBuilder: ResolvedSecret.create)
    ..aOM<ResolvedSecret>(3, _omitFieldNames ? '' : 'keyId',
        subBuilder: ResolvedSecret.create)
    ..aOM<ResolvedSecret>(4, _omitFieldNames ? '' : 'privateKey',
        subBuilder: ResolvedSecret.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedAppleOAuthProviderConfig clone() =>
      ResolvedAppleOAuthProviderConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedAppleOAuthProviderConfig copyWith(
          void Function(ResolvedAppleOAuthProviderConfig) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedAppleOAuthProviderConfig))
          as ResolvedAppleOAuthProviderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedAppleOAuthProviderConfig create() =>
      ResolvedAppleOAuthProviderConfig._();
  ResolvedAppleOAuthProviderConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedAppleOAuthProviderConfig> createRepeated() =>
      $pb.PbList<ResolvedAppleOAuthProviderConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedAppleOAuthProviderConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedAppleOAuthProviderConfig>(
          create);
  static ResolvedAppleOAuthProviderConfig? _defaultInstance;

  /// The client ID of the Apple OAuth provider.
  @$pb.TagNumber(1)
  ResolvedSecret get clientId => $_getN(0);
  @$pb.TagNumber(1)
  set clientId(ResolvedSecret v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
  @$pb.TagNumber(1)
  ResolvedSecret ensureClientId() => $_ensure(0);

  /// The team ID of the Apple OAuth provider.
  @$pb.TagNumber(2)
  ResolvedSecret get teamId => $_getN(1);
  @$pb.TagNumber(2)
  set teamId(ResolvedSecret v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTeamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeamId() => clearField(2);
  @$pb.TagNumber(2)
  ResolvedSecret ensureTeamId() => $_ensure(1);

  /// The key ID of the Apple OAuth provider.
  @$pb.TagNumber(3)
  ResolvedSecret get keyId => $_getN(2);
  @$pb.TagNumber(3)
  set keyId(ResolvedSecret v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKeyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyId() => clearField(3);
  @$pb.TagNumber(3)
  ResolvedSecret ensureKeyId() => $_ensure(2);

  /// The private key of the Apple OAuth provider.
  @$pb.TagNumber(4)
  ResolvedSecret get privateKey => $_getN(3);
  @$pb.TagNumber(4)
  set privateKey(ResolvedSecret v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrivateKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrivateKey() => clearField(4);
  @$pb.TagNumber(4)
  ResolvedSecret ensurePrivateKey() => $_ensure(3);
}

enum ResolvedExternalAuthProvider_Config { firebase, supabase, notSet }

/// A resolved external auth provider configuration.
class ResolvedExternalAuthProvider extends $pb.GeneratedMessage {
  factory ResolvedExternalAuthProvider({
    $core.String? authProviderId,
    ResolvedExternalAuthProvider_Type? type,
    ResolvedFirebaseExternalAuthProviderConfig? firebase,
    ResolvedSupabaseExternalAuthProviderConfig? supabase,
  }) {
    final $result = create();
    if (authProviderId != null) {
      $result.authProviderId = authProviderId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (firebase != null) {
      $result.firebase = firebase;
    }
    if (supabase != null) {
      $result.supabase = supabase;
    }
    return $result;
  }
  ResolvedExternalAuthProvider._() : super();
  factory ResolvedExternalAuthProvider.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedExternalAuthProvider.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResolvedExternalAuthProvider_Config>
      _ResolvedExternalAuthProvider_ConfigByTag = {
    3: ResolvedExternalAuthProvider_Config.firebase,
    4: ResolvedExternalAuthProvider_Config.supabase,
    0: ResolvedExternalAuthProvider_Config.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedExternalAuthProvider',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'authProviderId')
    ..e<ResolvedExternalAuthProvider_Type>(
        2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: ResolvedExternalAuthProvider_Type
            .EXTERNAL_AUTH_PROVIDER_TYPE_UNSPECIFIED,
        valueOf: ResolvedExternalAuthProvider_Type.valueOf,
        enumValues: ResolvedExternalAuthProvider_Type.values)
    ..aOM<ResolvedFirebaseExternalAuthProviderConfig>(
        3, _omitFieldNames ? '' : 'firebase',
        subBuilder: ResolvedFirebaseExternalAuthProviderConfig.create)
    ..aOM<ResolvedSupabaseExternalAuthProviderConfig>(
        4, _omitFieldNames ? '' : 'supabase',
        subBuilder: ResolvedSupabaseExternalAuthProviderConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedExternalAuthProvider clone() =>
      ResolvedExternalAuthProvider()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedExternalAuthProvider copyWith(
          void Function(ResolvedExternalAuthProvider) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedExternalAuthProvider))
          as ResolvedExternalAuthProvider;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedExternalAuthProvider create() =>
      ResolvedExternalAuthProvider._();
  ResolvedExternalAuthProvider createEmptyInstance() => create();
  static $pb.PbList<ResolvedExternalAuthProvider> createRepeated() =>
      $pb.PbList<ResolvedExternalAuthProvider>();
  @$core.pragma('dart2js:noInline')
  static ResolvedExternalAuthProvider getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedExternalAuthProvider>(create);
  static ResolvedExternalAuthProvider? _defaultInstance;

  ResolvedExternalAuthProvider_Config whichConfig() =>
      _ResolvedExternalAuthProvider_ConfigByTag[$_whichOneof(0)]!;
  void clearConfig() => clearField($_whichOneof(0));

  /// The ID of the external auth provider.
  @$pb.TagNumber(1)
  $core.String get authProviderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set authProviderId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAuthProviderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthProviderId() => clearField(1);

  /// The type of the external auth provider.
  @$pb.TagNumber(2)
  ResolvedExternalAuthProvider_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ResolvedExternalAuthProvider_Type v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// The configuration of a Firebase auth provider.
  @$pb.TagNumber(3)
  ResolvedFirebaseExternalAuthProviderConfig get firebase => $_getN(2);
  @$pb.TagNumber(3)
  set firebase(ResolvedFirebaseExternalAuthProviderConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFirebase() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirebase() => clearField(3);
  @$pb.TagNumber(3)
  ResolvedFirebaseExternalAuthProviderConfig ensureFirebase() => $_ensure(2);

  /// The configuration of a Supabase auth provider.
  @$pb.TagNumber(4)
  ResolvedSupabaseExternalAuthProviderConfig get supabase => $_getN(3);
  @$pb.TagNumber(4)
  set supabase(ResolvedSupabaseExternalAuthProviderConfig v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSupabase() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupabase() => clearField(4);
  @$pb.TagNumber(4)
  ResolvedSupabaseExternalAuthProviderConfig ensureSupabase() => $_ensure(3);
}

/// The configuration of an external Firebase auth provider.
class ResolvedFirebaseExternalAuthProviderConfig extends $pb.GeneratedMessage {
  factory ResolvedFirebaseExternalAuthProviderConfig({
    ResolvedVariable? projectId,
  }) {
    final $result = create();
    if (projectId != null) {
      $result.projectId = projectId;
    }
    return $result;
  }
  ResolvedFirebaseExternalAuthProviderConfig._() : super();
  factory ResolvedFirebaseExternalAuthProviderConfig.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedFirebaseExternalAuthProviderConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedFirebaseExternalAuthProviderConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<ResolvedVariable>(1, _omitFieldNames ? '' : 'projectId',
        subBuilder: ResolvedVariable.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedFirebaseExternalAuthProviderConfig clone() =>
      ResolvedFirebaseExternalAuthProviderConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedFirebaseExternalAuthProviderConfig copyWith(
          void Function(ResolvedFirebaseExternalAuthProviderConfig) updates) =>
      super.copyWith((message) =>
              updates(message as ResolvedFirebaseExternalAuthProviderConfig))
          as ResolvedFirebaseExternalAuthProviderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedFirebaseExternalAuthProviderConfig create() =>
      ResolvedFirebaseExternalAuthProviderConfig._();
  ResolvedFirebaseExternalAuthProviderConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedFirebaseExternalAuthProviderConfig>
      createRepeated() =>
          $pb.PbList<ResolvedFirebaseExternalAuthProviderConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedFirebaseExternalAuthProviderConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ResolvedFirebaseExternalAuthProviderConfig>(create);
  static ResolvedFirebaseExternalAuthProviderConfig? _defaultInstance;

  /// The Firebase project ID.
  @$pb.TagNumber(1)
  ResolvedVariable get projectId => $_getN(0);
  @$pb.TagNumber(1)
  set projectId(ResolvedVariable v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => clearField(1);
  @$pb.TagNumber(1)
  ResolvedVariable ensureProjectId() => $_ensure(0);
}

/// The configuration of an external Supabase auth provider.
class ResolvedSupabaseExternalAuthProviderConfig extends $pb.GeneratedMessage {
  factory ResolvedSupabaseExternalAuthProviderConfig({
    ResolvedVariable? projectUrl,
    ResolvedSecret? jwtSecret,
  }) {
    final $result = create();
    if (projectUrl != null) {
      $result.projectUrl = projectUrl;
    }
    if (jwtSecret != null) {
      $result.jwtSecret = jwtSecret;
    }
    return $result;
  }
  ResolvedSupabaseExternalAuthProviderConfig._() : super();
  factory ResolvedSupabaseExternalAuthProviderConfig.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedSupabaseExternalAuthProviderConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedSupabaseExternalAuthProviderConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<ResolvedVariable>(1, _omitFieldNames ? '' : 'projectUrl',
        subBuilder: ResolvedVariable.create)
    ..aOM<ResolvedSecret>(2, _omitFieldNames ? '' : 'jwtSecret',
        subBuilder: ResolvedSecret.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedSupabaseExternalAuthProviderConfig clone() =>
      ResolvedSupabaseExternalAuthProviderConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedSupabaseExternalAuthProviderConfig copyWith(
          void Function(ResolvedSupabaseExternalAuthProviderConfig) updates) =>
      super.copyWith((message) =>
              updates(message as ResolvedSupabaseExternalAuthProviderConfig))
          as ResolvedSupabaseExternalAuthProviderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedSupabaseExternalAuthProviderConfig create() =>
      ResolvedSupabaseExternalAuthProviderConfig._();
  ResolvedSupabaseExternalAuthProviderConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedSupabaseExternalAuthProviderConfig>
      createRepeated() =>
          $pb.PbList<ResolvedSupabaseExternalAuthProviderConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedSupabaseExternalAuthProviderConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ResolvedSupabaseExternalAuthProviderConfig>(create);
  static ResolvedSupabaseExternalAuthProviderConfig? _defaultInstance;

  /// Required. The Supabase project URL.
  @$pb.TagNumber(1)
  ResolvedVariable get projectUrl => $_getN(0);
  @$pb.TagNumber(1)
  set projectUrl(ResolvedVariable v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProjectUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectUrl() => clearField(1);
  @$pb.TagNumber(1)
  ResolvedVariable ensureProjectUrl() => $_ensure(0);

  /// Optional. The Supabase JWT secret.
  @$pb.TagNumber(2)
  ResolvedSecret get jwtSecret => $_getN(1);
  @$pb.TagNumber(2)
  set jwtSecret(ResolvedSecret v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasJwtSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearJwtSecret() => clearField(2);
  @$pb.TagNumber(2)
  ResolvedSecret ensureJwtSecret() => $_ensure(1);
}

enum ResolvedDatabase_Config { celest, notSet }

/// The resolved AST of a Celest database.
class ResolvedDatabase extends $pb.GeneratedMessage {
  factory ResolvedDatabase({
    $core.String? databaseId,
    ResolvedDatabase_Type? type,
    ResolvedDatabaseSchema? schema,
    ResolvedCelestDatabaseConfig? celest,
  }) {
    final $result = create();
    if (databaseId != null) {
      $result.databaseId = databaseId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (schema != null) {
      $result.schema = schema;
    }
    if (celest != null) {
      $result.celest = celest;
    }
    return $result;
  }
  ResolvedDatabase._() : super();
  factory ResolvedDatabase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedDatabase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResolvedDatabase_Config>
      _ResolvedDatabase_ConfigByTag = {
    4: ResolvedDatabase_Config.celest,
    0: ResolvedDatabase_Config.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedDatabase',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..oo(0, [4])
    ..aOS(1, _omitFieldNames ? '' : 'databaseId')
    ..e<ResolvedDatabase_Type>(
        2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: ResolvedDatabase_Type.DATABASE_TYPE_UNSPECIFIED,
        valueOf: ResolvedDatabase_Type.valueOf,
        enumValues: ResolvedDatabase_Type.values)
    ..aOM<ResolvedDatabaseSchema>(3, _omitFieldNames ? '' : 'schema',
        subBuilder: ResolvedDatabaseSchema.create)
    ..aOM<ResolvedCelestDatabaseConfig>(4, _omitFieldNames ? '' : 'celest',
        subBuilder: ResolvedCelestDatabaseConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedDatabase clone() => ResolvedDatabase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedDatabase copyWith(void Function(ResolvedDatabase) updates) =>
      super.copyWith((message) => updates(message as ResolvedDatabase))
          as ResolvedDatabase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedDatabase create() => ResolvedDatabase._();
  ResolvedDatabase createEmptyInstance() => create();
  static $pb.PbList<ResolvedDatabase> createRepeated() =>
      $pb.PbList<ResolvedDatabase>();
  @$core.pragma('dart2js:noInline')
  static ResolvedDatabase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedDatabase>(create);
  static ResolvedDatabase? _defaultInstance;

  ResolvedDatabase_Config whichConfig() =>
      _ResolvedDatabase_ConfigByTag[$_whichOneof(0)]!;
  void clearConfig() => clearField($_whichOneof(0));

  /// The unique identifier of the database within a project.
  @$pb.TagNumber(1)
  $core.String get databaseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set databaseId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDatabaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDatabaseId() => clearField(1);

  /// The type of the database.
  @$pb.TagNumber(2)
  ResolvedDatabase_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ResolvedDatabase_Type v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// The schema of the database.
  @$pb.TagNumber(3)
  ResolvedDatabaseSchema get schema => $_getN(2);
  @$pb.TagNumber(3)
  set schema(ResolvedDatabaseSchema v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSchema() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchema() => clearField(3);
  @$pb.TagNumber(3)
  ResolvedDatabaseSchema ensureSchema() => $_ensure(2);

  /// The provider configuration of a Celest database.
  @$pb.TagNumber(4)
  ResolvedCelestDatabaseConfig get celest => $_getN(3);
  @$pb.TagNumber(4)
  set celest(ResolvedCelestDatabaseConfig v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCelest() => $_has(3);
  @$pb.TagNumber(4)
  void clearCelest() => clearField(4);
  @$pb.TagNumber(4)
  ResolvedCelestDatabaseConfig ensureCelest() => $_ensure(3);
}

/// The configuration of a Celest database.
class ResolvedCelestDatabaseConfig extends $pb.GeneratedMessage {
  factory ResolvedCelestDatabaseConfig({
    ResolvedVariable? hostname,
    ResolvedSecret? token,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  ResolvedCelestDatabaseConfig._() : super();
  factory ResolvedCelestDatabaseConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedCelestDatabaseConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedCelestDatabaseConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<ResolvedVariable>(1, _omitFieldNames ? '' : 'hostname',
        subBuilder: ResolvedVariable.create)
    ..aOM<ResolvedSecret>(2, _omitFieldNames ? '' : 'token',
        subBuilder: ResolvedSecret.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedCelestDatabaseConfig clone() =>
      ResolvedCelestDatabaseConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedCelestDatabaseConfig copyWith(
          void Function(ResolvedCelestDatabaseConfig) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedCelestDatabaseConfig))
          as ResolvedCelestDatabaseConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedCelestDatabaseConfig create() =>
      ResolvedCelestDatabaseConfig._();
  ResolvedCelestDatabaseConfig createEmptyInstance() => create();
  static $pb.PbList<ResolvedCelestDatabaseConfig> createRepeated() =>
      $pb.PbList<ResolvedCelestDatabaseConfig>();
  @$core.pragma('dart2js:noInline')
  static ResolvedCelestDatabaseConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedCelestDatabaseConfig>(create);
  static ResolvedCelestDatabaseConfig? _defaultInstance;

  /// Required. The database hostname.
  @$pb.TagNumber(1)
  ResolvedVariable get hostname => $_getN(0);
  @$pb.TagNumber(1)
  set hostname(ResolvedVariable v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);
  @$pb.TagNumber(1)
  ResolvedVariable ensureHostname() => $_ensure(0);

  /// Required. The database token.
  @$pb.TagNumber(2)
  ResolvedSecret get token => $_getN(1);
  @$pb.TagNumber(2)
  set token(ResolvedSecret v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
  @$pb.TagNumber(2)
  ResolvedSecret ensureToken() => $_ensure(1);
}

enum ResolvedDatabaseSchema_Schema { drift, notSet }

/// The resolved AST of a Celest database schema.
class ResolvedDatabaseSchema extends $pb.GeneratedMessage {
  factory ResolvedDatabaseSchema({
    $core.String? databaseSchemaId,
    ResolvedDatabaseSchema_Type? type,
    ResolvedDriftDatabaseSchema? drift,
  }) {
    final $result = create();
    if (databaseSchemaId != null) {
      $result.databaseSchemaId = databaseSchemaId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (drift != null) {
      $result.drift = drift;
    }
    return $result;
  }
  ResolvedDatabaseSchema._() : super();
  factory ResolvedDatabaseSchema.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedDatabaseSchema.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResolvedDatabaseSchema_Schema>
      _ResolvedDatabaseSchema_SchemaByTag = {
    3: ResolvedDatabaseSchema_Schema.drift,
    0: ResolvedDatabaseSchema_Schema.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedDatabaseSchema',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..oo(0, [3])
    ..aOS(1, _omitFieldNames ? '' : 'databaseSchemaId')
    ..e<ResolvedDatabaseSchema_Type>(
        2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker:
            ResolvedDatabaseSchema_Type.DATABASE_SCHEMA_TYPE_UNSPECIFIED,
        valueOf: ResolvedDatabaseSchema_Type.valueOf,
        enumValues: ResolvedDatabaseSchema_Type.values)
    ..aOM<ResolvedDriftDatabaseSchema>(3, _omitFieldNames ? '' : 'drift',
        subBuilder: ResolvedDriftDatabaseSchema.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedDatabaseSchema clone() =>
      ResolvedDatabaseSchema()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedDatabaseSchema copyWith(
          void Function(ResolvedDatabaseSchema) updates) =>
      super.copyWith((message) => updates(message as ResolvedDatabaseSchema))
          as ResolvedDatabaseSchema;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedDatabaseSchema create() => ResolvedDatabaseSchema._();
  ResolvedDatabaseSchema createEmptyInstance() => create();
  static $pb.PbList<ResolvedDatabaseSchema> createRepeated() =>
      $pb.PbList<ResolvedDatabaseSchema>();
  @$core.pragma('dart2js:noInline')
  static ResolvedDatabaseSchema getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedDatabaseSchema>(create);
  static ResolvedDatabaseSchema? _defaultInstance;

  ResolvedDatabaseSchema_Schema whichSchema() =>
      _ResolvedDatabaseSchema_SchemaByTag[$_whichOneof(0)]!;
  void clearSchema() => clearField($_whichOneof(0));

  /// The unique identifier of the database schema within a project.
  @$pb.TagNumber(1)
  $core.String get databaseSchemaId => $_getSZ(0);
  @$pb.TagNumber(1)
  set databaseSchemaId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDatabaseSchemaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDatabaseSchemaId() => clearField(1);

  /// The type of the database schema.
  @$pb.TagNumber(2)
  ResolvedDatabaseSchema_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ResolvedDatabaseSchema_Type v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// The Drift database schema.
  @$pb.TagNumber(3)
  ResolvedDriftDatabaseSchema get drift => $_getN(2);
  @$pb.TagNumber(3)
  set drift(ResolvedDriftDatabaseSchema v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDrift() => $_has(2);
  @$pb.TagNumber(3)
  void clearDrift() => clearField(3);
  @$pb.TagNumber(3)
  ResolvedDriftDatabaseSchema ensureDrift() => $_ensure(2);
}

/// The resolved AST of a Drift database schema.
class ResolvedDriftDatabaseSchema extends $pb.GeneratedMessage {
  factory ResolvedDriftDatabaseSchema({
    $core.int? version,
    $22.Struct? schemaJson,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (schemaJson != null) {
      $result.schemaJson = schemaJson;
    }
    return $result;
  }
  ResolvedDriftDatabaseSchema._() : super();
  factory ResolvedDriftDatabaseSchema.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedDriftDatabaseSchema.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedDriftDatabaseSchema',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOM<$22.Struct>(2, _omitFieldNames ? '' : 'schemaJson',
        subBuilder: $22.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedDriftDatabaseSchema clone() =>
      ResolvedDriftDatabaseSchema()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedDriftDatabaseSchema copyWith(
          void Function(ResolvedDriftDatabaseSchema) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedDriftDatabaseSchema))
          as ResolvedDriftDatabaseSchema;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedDriftDatabaseSchema create() =>
      ResolvedDriftDatabaseSchema._();
  ResolvedDriftDatabaseSchema createEmptyInstance() => create();
  static $pb.PbList<ResolvedDriftDatabaseSchema> createRepeated() =>
      $pb.PbList<ResolvedDriftDatabaseSchema>();
  @$core.pragma('dart2js:noInline')
  static ResolvedDriftDatabaseSchema getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedDriftDatabaseSchema>(create);
  static ResolvedDriftDatabaseSchema? _defaultInstance;

  /// Required. The Drift schema version.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// Required. The Drift schema JSON.
  @$pb.TagNumber(2)
  $22.Struct get schemaJson => $_getN(1);
  @$pb.TagNumber(2)
  set schemaJson($22.Struct v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSchemaJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearSchemaJson() => clearField(2);
  @$pb.TagNumber(2)
  $22.Struct ensureSchemaJson() => $_ensure(1);
}

/// Configuration of the SDKs used to deploy the project.
class SdkConfiguration extends $pb.GeneratedMessage {
  factory SdkConfiguration({
    $53.Version? celest,
    $53.Sdk? dart,
    $53.Sdk? flutter,
    $53.SdkType? targetSdk,
    $core.Iterable<$54.FeatureFlag>? featureFlags,
  }) {
    final $result = create();
    if (celest != null) {
      $result.celest = celest;
    }
    if (dart != null) {
      $result.dart = dart;
    }
    if (flutter != null) {
      $result.flutter = flutter;
    }
    if (targetSdk != null) {
      $result.targetSdk = targetSdk;
    }
    if (featureFlags != null) {
      $result.featureFlags.addAll(featureFlags);
    }
    return $result;
  }
  SdkConfiguration._() : super();
  factory SdkConfiguration.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SdkConfiguration.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SdkConfiguration',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<$53.Version>(1, _omitFieldNames ? '' : 'celest',
        subBuilder: $53.Version.create)
    ..aOM<$53.Sdk>(2, _omitFieldNames ? '' : 'dart', subBuilder: $53.Sdk.create)
    ..aOM<$53.Sdk>(3, _omitFieldNames ? '' : 'flutter',
        subBuilder: $53.Sdk.create)
    ..e<$53.SdkType>(4, _omitFieldNames ? '' : 'targetSdk', $pb.PbFieldType.OE,
        defaultOrMaker: $53.SdkType.SDK_TYPE_UNSPECIFIED,
        valueOf: $53.SdkType.valueOf,
        enumValues: $53.SdkType.values)
    ..pc<$54.FeatureFlag>(
        5, _omitFieldNames ? '' : 'featureFlags', $pb.PbFieldType.KE,
        valueOf: $54.FeatureFlag.valueOf,
        enumValues: $54.FeatureFlag.values,
        defaultEnumValue: $54.FeatureFlag.FEATURE_FLAG_UNSPECIFIED)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SdkConfiguration clone() => SdkConfiguration()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SdkConfiguration copyWith(void Function(SdkConfiguration) updates) =>
      super.copyWith((message) => updates(message as SdkConfiguration))
          as SdkConfiguration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SdkConfiguration create() => SdkConfiguration._();
  SdkConfiguration createEmptyInstance() => create();
  static $pb.PbList<SdkConfiguration> createRepeated() =>
      $pb.PbList<SdkConfiguration>();
  @$core.pragma('dart2js:noInline')
  static SdkConfiguration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SdkConfiguration>(create);
  static SdkConfiguration? _defaultInstance;

  /// The Celest version used to deploy the project.
  @$pb.TagNumber(1)
  $53.Version get celest => $_getN(0);
  @$pb.TagNumber(1)
  set celest($53.Version v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCelest() => $_has(0);
  @$pb.TagNumber(1)
  void clearCelest() => clearField(1);
  @$pb.TagNumber(1)
  $53.Version ensureCelest() => $_ensure(0);

  /// The Dart SDK used to deploy the project.
  @$pb.TagNumber(2)
  $53.Sdk get dart => $_getN(1);
  @$pb.TagNumber(2)
  set dart($53.Sdk v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDart() => $_has(1);
  @$pb.TagNumber(2)
  void clearDart() => clearField(2);
  @$pb.TagNumber(2)
  $53.Sdk ensureDart() => $_ensure(1);

  /// The Flutter SDK used to deploy the project, if any.
  @$pb.TagNumber(3)
  $53.Sdk get flutter => $_getN(2);
  @$pb.TagNumber(3)
  set flutter($53.Sdk v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFlutter() => $_has(2);
  @$pb.TagNumber(3)
  void clearFlutter() => clearField(3);
  @$pb.TagNumber(3)
  $53.Sdk ensureFlutter() => $_ensure(2);

  /// The target SDK for deployment.
  @$pb.TagNumber(4)
  $53.SdkType get targetSdk => $_getN(3);
  @$pb.TagNumber(4)
  set targetSdk($53.SdkType v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTargetSdk() => $_has(3);
  @$pb.TagNumber(4)
  void clearTargetSdk() => clearField(4);

  /// The feature flags enabled by the project.
  @$pb.TagNumber(5)
  $core.List<$54.FeatureFlag> get featureFlags => $_getList(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

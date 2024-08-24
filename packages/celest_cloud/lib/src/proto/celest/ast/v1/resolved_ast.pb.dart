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
import 'features.pbenum.dart' as $53;
import 'resolved_ast.pbenum.dart';

export 'resolved_ast.pbenum.dart';

/// The resolved AST of a Celest project.
class ResolvedProject extends $pb.GeneratedMessage {
  factory ResolvedProject({
    $core.String? name,
    $core.Map<$core.String, ResolvedApi>? apis,
    $core.Iterable<ResolvedEnvironmentVariable>? environmentVariables,
    ResolvedAuth? auth,
    SdkInfo? sdkInfo,
    $core.Iterable<$53.FeatureFlag>? featureFlags,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (apis != null) {
      $result.apis.addAll(apis);
    }
    if (environmentVariables != null) {
      $result.environmentVariables.addAll(environmentVariables);
    }
    if (auth != null) {
      $result.auth = auth;
    }
    if (sdkInfo != null) {
      $result.sdkInfo = sdkInfo;
    }
    if (featureFlags != null) {
      $result.featureFlags.addAll(featureFlags);
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
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..m<$core.String, ResolvedApi>(2, _omitFieldNames ? '' : 'apis',
        entryClassName: 'ResolvedProject.ApisEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: ResolvedApi.create,
        valueDefaultOrMaker: ResolvedApi.getDefault,
        packageName: const $pb.PackageName('celest.ast.v1'))
    ..pc<ResolvedEnvironmentVariable>(
        3, _omitFieldNames ? '' : 'environmentVariables', $pb.PbFieldType.PM,
        subBuilder: ResolvedEnvironmentVariable.create)
    ..aOM<ResolvedAuth>(4, _omitFieldNames ? '' : 'auth',
        subBuilder: ResolvedAuth.create)
    ..aOM<SdkInfo>(5, _omitFieldNames ? '' : 'sdkInfo',
        subBuilder: SdkInfo.create)
    ..pc<$53.FeatureFlag>(
        6, _omitFieldNames ? '' : 'featureFlags', $pb.PbFieldType.KE,
        valueOf: $53.FeatureFlag.valueOf,
        enumValues: $53.FeatureFlag.values,
        defaultEnumValue: $53.FeatureFlag.FEATURE_FLAG_UNSPECIFIED)
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

  /// The user-provided name of the project.
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

  /// The project's API endpoints, keyed by their `name`.
  @$pb.TagNumber(2)
  $core.Map<$core.String, ResolvedApi> get apis => $_getMap(1);

  /// The project's environment variables.
  @$pb.TagNumber(3)
  $core.List<ResolvedEnvironmentVariable> get environmentVariables =>
      $_getList(2);

  /// The project's auth configuration.
  @$pb.TagNumber(4)
  ResolvedAuth get auth => $_getN(3);
  @$pb.TagNumber(4)
  set auth(ResolvedAuth v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAuth() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuth() => clearField(4);
  @$pb.TagNumber(4)
  ResolvedAuth ensureAuth() => $_ensure(3);

  /// The Dart and Flutter SDKs used to deploy the project.
  @$pb.TagNumber(5)
  SdkInfo get sdkInfo => $_getN(4);
  @$pb.TagNumber(5)
  set sdkInfo(SdkInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSdkInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearSdkInfo() => clearField(5);
  @$pb.TagNumber(5)
  SdkInfo ensureSdkInfo() => $_ensure(4);

  /// The feature flags enabled by the project.
  @$pb.TagNumber(6)
  $core.List<$53.FeatureFlag> get featureFlags => $_getList(5);
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
    $core.String? apiId,
    ResolvedHttpConfig? http,
    $core.bool? clientStreaming,
    $core.bool? serverStreaming,
    $core.Iterable<$core.String>? environmentVariables,
    $52.PolicySet? policySet,
  }) {
    final $result = create();
    if (functionId != null) {
      $result.functionId = functionId;
    }
    if (apiId != null) {
      $result.apiId = apiId;
    }
    if (http != null) {
      $result.http = http;
    }
    if (clientStreaming != null) {
      $result.clientStreaming = clientStreaming;
    }
    if (serverStreaming != null) {
      $result.serverStreaming = serverStreaming;
    }
    if (environmentVariables != null) {
      $result.environmentVariables.addAll(environmentVariables);
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
    ..aOS(2, _omitFieldNames ? '' : 'apiId')
    ..aOM<ResolvedHttpConfig>(3, _omitFieldNames ? '' : 'http',
        subBuilder: ResolvedHttpConfig.create)
    ..aOB(4, _omitFieldNames ? '' : 'clientStreaming')
    ..aOB(5, _omitFieldNames ? '' : 'serverStreaming')
    ..pPS(6, _omitFieldNames ? '' : 'environmentVariables')
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
  $core.String get apiId => $_getSZ(1);
  @$pb.TagNumber(2)
  set apiId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasApiId() => $_has(1);
  @$pb.TagNumber(2)
  void clearApiId() => clearField(2);

  /// The resolved HTTP configuration of the function.
  @$pb.TagNumber(3)
  ResolvedHttpConfig get http => $_getN(2);
  @$pb.TagNumber(3)
  set http(ResolvedHttpConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHttp() => $_has(2);
  @$pb.TagNumber(3)
  void clearHttp() => clearField(3);
  @$pb.TagNumber(3)
  ResolvedHttpConfig ensureHttp() => $_ensure(2);

  /// Whether the function is a client-streaming RPC.
  @$pb.TagNumber(4)
  $core.bool get clientStreaming => $_getBF(3);
  @$pb.TagNumber(4)
  set clientStreaming($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasClientStreaming() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientStreaming() => clearField(4);

  /// Whether the function is a server-streaming RPC.
  @$pb.TagNumber(5)
  $core.bool get serverStreaming => $_getBF(4);
  @$pb.TagNumber(5)
  set serverStreaming($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasServerStreaming() => $_has(4);
  @$pb.TagNumber(5)
  void clearServerStreaming() => clearField(5);

  /// The environment variables required by the function.
  @$pb.TagNumber(6)
  $core.List<$core.String> get environmentVariables => $_getList(5);

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
    $core.String? method,
    HttpPath? path,
    $core.int? statusCode,
    $core.Map<$core.String, $core.int>? errorStatus,
  }) {
    final $result = create();
    if (method != null) {
      $result.method = method;
    }
    if (path != null) {
      $result.path = path;
    }
    if (statusCode != null) {
      $result.statusCode = statusCode;
    }
    if (errorStatus != null) {
      $result.errorStatus.addAll(errorStatus);
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
    ..aOS(1, _omitFieldNames ? '' : 'method')
    ..aOM<HttpPath>(2, _omitFieldNames ? '' : 'path',
        subBuilder: HttpPath.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'statusCode', $pb.PbFieldType.O3)
    ..m<$core.String, $core.int>(4, _omitFieldNames ? '' : 'errorStatus',
        entryClassName: 'ResolvedHttpConfig.ErrorStatusEntry',
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

  /// The HTTP method of the function.
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

  /// The path of the function.
  @$pb.TagNumber(2)
  HttpPath get path => $_getN(1);
  @$pb.TagNumber(2)
  set path(HttpPath v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);
  @$pb.TagNumber(2)
  HttpPath ensurePath() => $_ensure(1);

  /// The successful status code of the function.
  @$pb.TagNumber(3)
  $core.int get statusCode => $_getIZ(2);
  @$pb.TagNumber(3)
  set statusCode($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatusCode() => clearField(3);

  ///  The error status mapping of the function.
  ///
  ///  The keys are the Dart types of the errors, and the values are the HTTP status codes.
  ///  Dart types are represented as URLs, with a scheme, host and path identifying the location
  ///  of the type's definition, and a fragment identifying the type itself.
  ///
  ///  For example:
  ///
  ///  - `dart:core#String`
  ///  - `package:celest/functions/greeting.dart#GreetingError`
  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.int> get errorStatus => $_getMap(3);
}

/// The path to an HTTP endpoint and its parameters.
class HttpPath extends $pb.GeneratedMessage {
  factory HttpPath({
    $core.String? path,
    $core.Map<$core.String, HttpParameter>? parameters,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    if (parameters != null) {
      $result.parameters.addAll(parameters);
    }
    return $result;
  }
  HttpPath._() : super();
  factory HttpPath.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HttpPath.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HttpPath',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..m<$core.String, HttpParameter>(2, _omitFieldNames ? '' : 'parameters',
        entryClassName: 'HttpPath.ParametersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: HttpParameter.create,
        valueDefaultOrMaker: HttpParameter.getDefault,
        packageName: const $pb.PackageName('celest.ast.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HttpPath clone() => HttpPath()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HttpPath copyWith(void Function(HttpPath) updates) =>
      super.copyWith((message) => updates(message as HttpPath)) as HttpPath;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HttpPath create() => HttpPath._();
  HttpPath createEmptyInstance() => create();
  static $pb.PbList<HttpPath> createRepeated() => $pb.PbList<HttpPath>();
  @$core.pragma('dart2js:noInline')
  static HttpPath getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HttpPath>(create);
  static HttpPath? _defaultInstance;

  /// The path of the HTTP endpoint.
  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  /// The parameters of the HTTP endpoint.
  @$pb.TagNumber(2)
  $core.Map<$core.String, HttpParameter> get parameters => $_getMap(1);
}

/// A parameter of an HTTP endpoint.
class HttpParameter extends $pb.GeneratedMessage {
  factory HttpParameter({
    $core.String? name,
    $core.String? type,
    $core.bool? required,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (required != null) {
      $result.required = required;
    }
    return $result;
  }
  HttpParameter._() : super();
  factory HttpParameter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HttpParameter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HttpParameter',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOB(3, _omitFieldNames ? '' : 'required')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HttpParameter clone() => HttpParameter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HttpParameter copyWith(void Function(HttpParameter) updates) =>
      super.copyWith((message) => updates(message as HttpParameter))
          as HttpParameter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HttpParameter create() => HttpParameter._();
  HttpParameter createEmptyInstance() => create();
  static $pb.PbList<HttpParameter> createRepeated() =>
      $pb.PbList<HttpParameter>();
  @$core.pragma('dart2js:noInline')
  static HttpParameter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HttpParameter>(create);
  static HttpParameter? _defaultInstance;

  /// The name of the parameter.
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

  ///  The Dart type of the parameter.
  ///
  ///  Dart types are represented as URLs, with a scheme, host and path identifying the location
  ///  of the type's definition, and a fragment identifying the type itself.
  ///
  ///  For example:
  ///
  ///  - `dart:core#String`
  ///  - `package:celest/functions/greeting.dart#GreetingError`
  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// Whether the parameter is required.
  @$pb.TagNumber(3)
  $core.bool get required => $_getBF(2);
  @$pb.TagNumber(3)
  set required($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRequired() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequired() => clearField(3);
}

/// An environment variable and its value.
class ResolvedEnvironmentVariable extends $pb.GeneratedMessage {
  factory ResolvedEnvironmentVariable({
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
  ResolvedEnvironmentVariable._() : super();
  factory ResolvedEnvironmentVariable.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResolvedEnvironmentVariable.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedEnvironmentVariable',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResolvedEnvironmentVariable clone() =>
      ResolvedEnvironmentVariable()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResolvedEnvironmentVariable copyWith(
          void Function(ResolvedEnvironmentVariable) updates) =>
      super.copyWith(
              (message) => updates(message as ResolvedEnvironmentVariable))
          as ResolvedEnvironmentVariable;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolvedEnvironmentVariable create() =>
      ResolvedEnvironmentVariable._();
  ResolvedEnvironmentVariable createEmptyInstance() => create();
  static $pb.PbList<ResolvedEnvironmentVariable> createRepeated() =>
      $pb.PbList<ResolvedEnvironmentVariable>();
  @$core.pragma('dart2js:noInline')
  static ResolvedEnvironmentVariable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolvedEnvironmentVariable>(create);
  static ResolvedEnvironmentVariable? _defaultInstance;

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

/// The resolved AST of a Celest project's auth configuration.
class ResolvedAuth extends $pb.GeneratedMessage {
  factory ResolvedAuth({
    $core.Iterable<ResolvedAuthProvider>? providers,
  }) {
    final $result = create();
    if (providers != null) {
      $result.providers.addAll(providers);
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
}

/// The resolved AST of an auth provider to a Celest project.
class ResolvedAuthProvider extends $pb.GeneratedMessage {
  factory ResolvedAuthProvider({
    AuthProviderType? type,
    $core.String? providerId,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (providerId != null) {
      $result.providerId = providerId;
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolvedAuthProvider',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..e<AuthProviderType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: AuthProviderType.AUTH_PROVIDER_TYPE_UNSPECIFIED,
        valueOf: AuthProviderType.valueOf,
        enumValues: AuthProviderType.values)
    ..aOS(2, _omitFieldNames ? '' : 'providerId')
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

  /// The type of the auth provider.
  @$pb.TagNumber(1)
  AuthProviderType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(AuthProviderType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  ///  The identifier of the auth provider.
  ///
  ///  Defaults to `celest` for first-party providers.
  @$pb.TagNumber(2)
  $core.String get providerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set providerId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProviderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProviderId() => clearField(2);
}

/// Information about the Dart and Flutter SDKs used to deploy the project.
class SdkInfo extends $pb.GeneratedMessage {
  factory SdkInfo({
    Sdk? dartSdk,
    Sdk? flutterSdk,
    $core.Iterable<$core.String>? enabledExperiments,
  }) {
    final $result = create();
    if (dartSdk != null) {
      $result.dartSdk = dartSdk;
    }
    if (flutterSdk != null) {
      $result.flutterSdk = flutterSdk;
    }
    if (enabledExperiments != null) {
      $result.enabledExperiments.addAll(enabledExperiments);
    }
    return $result;
  }
  SdkInfo._() : super();
  factory SdkInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SdkInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SdkInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOM<Sdk>(1, _omitFieldNames ? '' : 'dartSdk', subBuilder: Sdk.create)
    ..aOM<Sdk>(2, _omitFieldNames ? '' : 'flutterSdk', subBuilder: Sdk.create)
    ..pPS(3, _omitFieldNames ? '' : 'enabledExperiments')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SdkInfo clone() => SdkInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SdkInfo copyWith(void Function(SdkInfo) updates) =>
      super.copyWith((message) => updates(message as SdkInfo)) as SdkInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SdkInfo create() => SdkInfo._();
  SdkInfo createEmptyInstance() => create();
  static $pb.PbList<SdkInfo> createRepeated() => $pb.PbList<SdkInfo>();
  @$core.pragma('dart2js:noInline')
  static SdkInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SdkInfo>(create);
  static SdkInfo? _defaultInstance;

  /// The Dart SDK.
  @$pb.TagNumber(1)
  Sdk get dartSdk => $_getN(0);
  @$pb.TagNumber(1)
  set dartSdk(Sdk v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDartSdk() => $_has(0);
  @$pb.TagNumber(1)
  void clearDartSdk() => clearField(1);
  @$pb.TagNumber(1)
  Sdk ensureDartSdk() => $_ensure(0);

  /// The Flutter SDK.
  @$pb.TagNumber(2)
  Sdk get flutterSdk => $_getN(1);
  @$pb.TagNumber(2)
  set flutterSdk(Sdk v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFlutterSdk() => $_has(1);
  @$pb.TagNumber(2)
  void clearFlutterSdk() => clearField(2);
  @$pb.TagNumber(2)
  Sdk ensureFlutterSdk() => $_ensure(1);

  /// The Dart experiments enabled for the project.
  @$pb.TagNumber(3)
  $core.List<$core.String> get enabledExperiments => $_getList(2);
}

/// Information about an SDK.
class Sdk extends $pb.GeneratedMessage {
  factory Sdk({
    $core.String? name,
    Version? version,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  Sdk._() : super();
  factory Sdk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Sdk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sdk',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<Version>(2, _omitFieldNames ? '' : 'version',
        subBuilder: Version.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Sdk clone() => Sdk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Sdk copyWith(void Function(Sdk) updates) =>
      super.copyWith((message) => updates(message as Sdk)) as Sdk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sdk create() => Sdk._();
  Sdk createEmptyInstance() => create();
  static $pb.PbList<Sdk> createRepeated() => $pb.PbList<Sdk>();
  @$core.pragma('dart2js:noInline')
  static Sdk getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sdk>(create);
  static Sdk? _defaultInstance;

  /// The name of the SDK.
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

  /// The version of the SDK.
  @$pb.TagNumber(2)
  Version get version => $_getN(1);
  @$pb.TagNumber(2)
  set version(Version v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
  @$pb.TagNumber(2)
  Version ensureVersion() => $_ensure(1);
}

/// A semantic version, broken down by its components.
class Version extends $pb.GeneratedMessage {
  factory Version({
    $core.int? major,
    $core.int? minor,
    $core.int? patch,
    $core.Iterable<$22.Value>? preRelease,
    $core.Iterable<$22.Value>? build,
    $core.String? rawVersion,
  }) {
    final $result = create();
    if (major != null) {
      $result.major = major;
    }
    if (minor != null) {
      $result.minor = minor;
    }
    if (patch != null) {
      $result.patch = patch;
    }
    if (preRelease != null) {
      $result.preRelease.addAll(preRelease);
    }
    if (build != null) {
      $result.build.addAll(build);
    }
    if (rawVersion != null) {
      $result.rawVersion = rawVersion;
    }
    return $result;
  }
  Version._() : super();
  factory Version.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Version.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Version',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'major', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'minor', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'patch', $pb.PbFieldType.O3)
    ..pc<$22.Value>(4, _omitFieldNames ? '' : 'preRelease', $pb.PbFieldType.PM,
        subBuilder: $22.Value.create)
    ..pc<$22.Value>(5, _omitFieldNames ? '' : 'build', $pb.PbFieldType.PM,
        subBuilder: $22.Value.create)
    ..aOS(6, _omitFieldNames ? '' : 'rawVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Version clone() => Version()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Version copyWith(void Function(Version) updates) =>
      super.copyWith((message) => updates(message as Version)) as Version;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Version create() => Version._();
  Version createEmptyInstance() => create();
  static $pb.PbList<Version> createRepeated() => $pb.PbList<Version>();
  @$core.pragma('dart2js:noInline')
  static Version getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Version>(create);
  static Version? _defaultInstance;

  /// The major version number: "1" in "1.2.3".
  @$pb.TagNumber(1)
  $core.int get major => $_getIZ(0);
  @$pb.TagNumber(1)
  set major($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMajor() => $_has(0);
  @$pb.TagNumber(1)
  void clearMajor() => clearField(1);

  /// The minor version number: "2" in "1.2.3".
  @$pb.TagNumber(2)
  $core.int get minor => $_getIZ(1);
  @$pb.TagNumber(2)
  set minor($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMinor() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinor() => clearField(2);

  /// The patch version number: "3" in "1.2.3".
  @$pb.TagNumber(3)
  $core.int get patch => $_getIZ(2);
  @$pb.TagNumber(3)
  set patch($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPatch() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatch() => clearField(3);

  ///  The pre-release identifier: "foo" in "1.2.3-foo".
  ///
  ///  This is split into a list of components, each of which may be either a
  ///  string or a non-negative integer. It may also be empty, indicating that
  ///  this version has no pre-release identifier.
  @$pb.TagNumber(4)
  $core.List<$22.Value> get preRelease => $_getList(3);

  ///  The build identifier: "foo" in "1.2.3+foo".
  ///
  ///  This is split into a list of components, each of which may be either a
  ///  string or a non-negative integer. It may also be empty, indicating that
  ///  this version has no build identifier.
  @$pb.TagNumber(5)
  $core.List<$22.Value> get build => $_getList(4);

  /// The original version string.
  @$pb.TagNumber(6)
  $core.String get rawVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set rawVersion($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRawVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearRawVersion() => clearField(6);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

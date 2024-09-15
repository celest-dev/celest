//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/functions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/logging/type/http_request.pb.dart' as $42;
import '../../../google/protobuf/duration.pb.dart' as $17;
import '../../../google/protobuf/struct.pb.dart' as $22;
import '../../../google/protobuf/timestamp.pb.dart' as $20;

/// A Celest function, deployed to an environment.
class Function_ extends $pb.GeneratedMessage {
  factory Function_({
    $core.String? name,
    $core.String? uid,
    $core.String? parent,
    $core.String? functionId,
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
    if (functionId != null) {
      $result.functionId = functionId;
    }
    return $result;
  }
  Function_._() : super();
  factory Function_.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Function_.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Function',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'parent')
    ..aOS(4, _omitFieldNames ? '' : 'functionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Function_ clone() => Function_()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Function_ copyWith(void Function(Function_) updates) =>
      super.copyWith((message) => updates(message as Function_)) as Function_;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Function_ create() => Function_._();
  Function_ createEmptyInstance() => create();
  static $pb.PbList<Function_> createRepeated() => $pb.PbList<Function_>();
  @$core.pragma('dart2js:noInline')
  static Function_ getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Function_>(create);
  static Function_? _defaultInstance;

  /// Identifier. The resource name of the function.
  /// Format: `projects/{project}/environments/{environment}/functions/{function}`
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

  /// A system-generated unique identifier for the function.
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

  /// Required. The ID of the function's parent environment.
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

  /// Required. The unique identifier of the function within its environment.
  @$pb.TagNumber(4)
  $core.String get functionId => $_getSZ(3);
  @$pb.TagNumber(4)
  set functionId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFunctionId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFunctionId() => clearField(4);
}

/// A single invocation of a function.
class FunctionInvocation extends $pb.GeneratedMessage {
  factory FunctionInvocation({
    $core.String? name,
    $core.String? uid,
    $22.Struct? input,
    $20.Timestamp? startTime,
    $core.String? log,
    $42.HttpRequest? request,
    FunctionInvocationResponse? response,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (input != null) {
      $result.input = input;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (log != null) {
      $result.log = log;
    }
    if (request != null) {
      $result.request = request;
    }
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  FunctionInvocation._() : super();
  factory FunctionInvocation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FunctionInvocation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionInvocation',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uid')
    ..aOM<$22.Struct>(3, _omitFieldNames ? '' : 'input',
        subBuilder: $22.Struct.create)
    ..aOM<$20.Timestamp>(4, _omitFieldNames ? '' : 'startTime',
        subBuilder: $20.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'log')
    ..aOM<$42.HttpRequest>(6, _omitFieldNames ? '' : 'request',
        subBuilder: $42.HttpRequest.create)
    ..aOM<FunctionInvocationResponse>(7, _omitFieldNames ? '' : 'response',
        subBuilder: FunctionInvocationResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FunctionInvocation clone() => FunctionInvocation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FunctionInvocation copyWith(void Function(FunctionInvocation) updates) =>
      super.copyWith((message) => updates(message as FunctionInvocation))
          as FunctionInvocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionInvocation create() => FunctionInvocation._();
  FunctionInvocation createEmptyInstance() => create();
  static $pb.PbList<FunctionInvocation> createRepeated() =>
      $pb.PbList<FunctionInvocation>();
  @$core.pragma('dart2js:noInline')
  static FunctionInvocation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionInvocation>(create);
  static FunctionInvocation? _defaultInstance;

  /// The name of the function to invoke.
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

  /// A system-generated unique identifier for the invocation.
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

  /// The input to the function.
  @$pb.TagNumber(3)
  $22.Struct get input => $_getN(2);
  @$pb.TagNumber(3)
  set input($22.Struct v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInput() => $_has(2);
  @$pb.TagNumber(3)
  void clearInput() => clearField(3);
  @$pb.TagNumber(3)
  $22.Struct ensureInput() => $_ensure(2);

  /// The start time of the invocation.
  @$pb.TagNumber(4)
  $20.Timestamp get startTime => $_getN(3);
  @$pb.TagNumber(4)
  set startTime($20.Timestamp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);
  @$pb.TagNumber(4)
  $20.Timestamp ensureStartTime() => $_ensure(3);

  ///  The log name of the invocation.
  ///
  ///  This can be used with LogServiceV2.ListLogEntries and LogServiceV2.TailLogEntries to
  ///  retrieve the logs for the invocation.
  @$pb.TagNumber(5)
  $core.String get log => $_getSZ(4);
  @$pb.TagNumber(5)
  set log($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLog() => $_has(4);
  @$pb.TagNumber(5)
  void clearLog() => clearField(5);

  /// The HTTP request of the invocation.
  @$pb.TagNumber(6)
  $42.HttpRequest get request => $_getN(5);
  @$pb.TagNumber(6)
  set request($42.HttpRequest v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearRequest() => clearField(6);
  @$pb.TagNumber(6)
  $42.HttpRequest ensureRequest() => $_ensure(5);

  /// The response of the invocation, if complete.
  @$pb.TagNumber(7)
  FunctionInvocationResponse get response => $_getN(6);
  @$pb.TagNumber(7)
  set response(FunctionInvocationResponse v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasResponse() => $_has(6);
  @$pb.TagNumber(7)
  void clearResponse() => clearField(7);
  @$pb.TagNumber(7)
  FunctionInvocationResponse ensureResponse() => $_ensure(6);
}

/// The response of a function invocation.
class FunctionInvocationResponse extends $pb.GeneratedMessage {
  factory FunctionInvocationResponse({
    $core.int? code,
    $22.Struct? output,
    $17.Duration? duration,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (output != null) {
      $result.output = output;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    return $result;
  }
  FunctionInvocationResponse._() : super();
  factory FunctionInvocationResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FunctionInvocationResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionInvocationResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOM<$22.Struct>(2, _omitFieldNames ? '' : 'output',
        subBuilder: $22.Struct.create)
    ..aOM<$17.Duration>(3, _omitFieldNames ? '' : 'duration',
        subBuilder: $17.Duration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FunctionInvocationResponse clone() =>
      FunctionInvocationResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FunctionInvocationResponse copyWith(
          void Function(FunctionInvocationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as FunctionInvocationResponse))
          as FunctionInvocationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionInvocationResponse create() => FunctionInvocationResponse._();
  FunctionInvocationResponse createEmptyInstance() => create();
  static $pb.PbList<FunctionInvocationResponse> createRepeated() =>
      $pb.PbList<FunctionInvocationResponse>();
  @$core.pragma('dart2js:noInline')
  static FunctionInvocationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionInvocationResponse>(create);
  static FunctionInvocationResponse? _defaultInstance;

  /// The HTTP status code.
  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  /// The output of the function.
  @$pb.TagNumber(2)
  $22.Struct get output => $_getN(1);
  @$pb.TagNumber(2)
  set output($22.Struct v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOutput() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutput() => clearField(2);
  @$pb.TagNumber(2)
  $22.Struct ensureOutput() => $_ensure(1);

  /// The runtime duration of the invocation.
  @$pb.TagNumber(3)
  $17.Duration get duration => $_getN(2);
  @$pb.TagNumber(3)
  set duration($17.Duration v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);
  @$pb.TagNumber(3)
  $17.Duration ensureDuration() => $_ensure(2);
}

/// The request message for Functions.GetFunction.
class GetFunctionRequest extends $pb.GeneratedMessage {
  factory GetFunctionRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetFunctionRequest._() : super();
  factory GetFunctionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetFunctionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFunctionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetFunctionRequest clone() => GetFunctionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetFunctionRequest copyWith(void Function(GetFunctionRequest) updates) =>
      super.copyWith((message) => updates(message as GetFunctionRequest))
          as GetFunctionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFunctionRequest create() => GetFunctionRequest._();
  GetFunctionRequest createEmptyInstance() => create();
  static $pb.PbList<GetFunctionRequest> createRepeated() =>
      $pb.PbList<GetFunctionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFunctionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFunctionRequest>(create);
  static GetFunctionRequest? _defaultInstance;

  /// Required. The name of the function to retrieve.
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

/// The request message for Functions.ListFunctions.
class ListFunctionsRequest extends $pb.GeneratedMessage {
  factory ListFunctionsRequest({
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
  ListFunctionsRequest._() : super();
  factory ListFunctionsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListFunctionsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListFunctionsRequest',
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
  ListFunctionsRequest clone() =>
      ListFunctionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListFunctionsRequest copyWith(void Function(ListFunctionsRequest) updates) =>
      super.copyWith((message) => updates(message as ListFunctionsRequest))
          as ListFunctionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFunctionsRequest create() => ListFunctionsRequest._();
  ListFunctionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListFunctionsRequest> createRepeated() =>
      $pb.PbList<ListFunctionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListFunctionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListFunctionsRequest>(create);
  static ListFunctionsRequest? _defaultInstance;

  /// Required. The parent of the functions to list.
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

  /// The maximum number of functions to return.
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

  /// A page token, received from a previous `ListFunctions` call.
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

  /// An optional filter to apply to the functions.
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

  /// The order to sort the results by.
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

/// The response message for Functions.ListFunctions.
class ListFunctionsResponse extends $pb.GeneratedMessage {
  factory ListFunctionsResponse({
    $core.Iterable<Function_>? functions,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (functions != null) {
      $result.functions.addAll(functions);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListFunctionsResponse._() : super();
  factory ListFunctionsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListFunctionsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListFunctionsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..pc<Function_>(1, _omitFieldNames ? '' : 'functions', $pb.PbFieldType.PM,
        subBuilder: Function_.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListFunctionsResponse clone() =>
      ListFunctionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListFunctionsResponse copyWith(
          void Function(ListFunctionsResponse) updates) =>
      super.copyWith((message) => updates(message as ListFunctionsResponse))
          as ListFunctionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFunctionsResponse create() => ListFunctionsResponse._();
  ListFunctionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListFunctionsResponse> createRepeated() =>
      $pb.PbList<ListFunctionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListFunctionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListFunctionsResponse>(create);
  static ListFunctionsResponse? _defaultInstance;

  /// The functions.
  @$pb.TagNumber(1)
  $core.List<Function_> get functions => $_getList(0);

  /// A token to retrieve the next page of results.
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

/// The request message for Functions.InvokeFunction.
class InvokeFunctionRequest extends $pb.GeneratedMessage {
  factory InvokeFunctionRequest({
    $core.String? name,
    $22.Struct? input,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (input != null) {
      $result.input = input;
    }
    return $result;
  }
  InvokeFunctionRequest._() : super();
  factory InvokeFunctionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvokeFunctionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvokeFunctionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<$22.Struct>(2, _omitFieldNames ? '' : 'input',
        subBuilder: $22.Struct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InvokeFunctionRequest clone() =>
      InvokeFunctionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InvokeFunctionRequest copyWith(
          void Function(InvokeFunctionRequest) updates) =>
      super.copyWith((message) => updates(message as InvokeFunctionRequest))
          as InvokeFunctionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvokeFunctionRequest create() => InvokeFunctionRequest._();
  InvokeFunctionRequest createEmptyInstance() => create();
  static $pb.PbList<InvokeFunctionRequest> createRepeated() =>
      $pb.PbList<InvokeFunctionRequest>();
  @$core.pragma('dart2js:noInline')
  static InvokeFunctionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvokeFunctionRequest>(create);
  static InvokeFunctionRequest? _defaultInstance;

  /// Required. The name of the function to invoke.
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

  /// Required. The input to the function.
  @$pb.TagNumber(2)
  $22.Struct get input => $_getN(1);
  @$pb.TagNumber(2)
  set input($22.Struct v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInput() => $_has(1);
  @$pb.TagNumber(2)
  void clearInput() => clearField(2);
  @$pb.TagNumber(2)
  $22.Struct ensureInput() => $_ensure(1);
}

/// The response message for Functions.InvokeFunction.
class InvokeFunctionResponse extends $pb.GeneratedMessage {
  factory InvokeFunctionResponse({
    FunctionInvocation? invocation,
  }) {
    final $result = create();
    if (invocation != null) {
      $result.invocation = invocation;
    }
    return $result;
  }
  InvokeFunctionResponse._() : super();
  factory InvokeFunctionResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvokeFunctionResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvokeFunctionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOM<FunctionInvocation>(1, _omitFieldNames ? '' : 'invocation',
        subBuilder: FunctionInvocation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InvokeFunctionResponse clone() =>
      InvokeFunctionResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InvokeFunctionResponse copyWith(
          void Function(InvokeFunctionResponse) updates) =>
      super.copyWith((message) => updates(message as InvokeFunctionResponse))
          as InvokeFunctionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvokeFunctionResponse create() => InvokeFunctionResponse._();
  InvokeFunctionResponse createEmptyInstance() => create();
  static $pb.PbList<InvokeFunctionResponse> createRepeated() =>
      $pb.PbList<InvokeFunctionResponse>();
  @$core.pragma('dart2js:noInline')
  static InvokeFunctionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvokeFunctionResponse>(create);
  static InvokeFunctionResponse? _defaultInstance;

  /// The function invocation.
  @$pb.TagNumber(1)
  FunctionInvocation get invocation => $_getN(0);
  @$pb.TagNumber(1)
  set invocation(FunctionInvocation v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInvocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvocation() => clearField(1);
  @$pb.TagNumber(1)
  FunctionInvocation ensureInvocation() => $_ensure(0);
}

/// The request message for Functions.GetFunctionInvocation.
class GetFunctionInvocationRequest extends $pb.GeneratedMessage {
  factory GetFunctionInvocationRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetFunctionInvocationRequest._() : super();
  factory GetFunctionInvocationRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetFunctionInvocationRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetFunctionInvocationRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetFunctionInvocationRequest clone() =>
      GetFunctionInvocationRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetFunctionInvocationRequest copyWith(
          void Function(GetFunctionInvocationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetFunctionInvocationRequest))
          as GetFunctionInvocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFunctionInvocationRequest create() =>
      GetFunctionInvocationRequest._();
  GetFunctionInvocationRequest createEmptyInstance() => create();
  static $pb.PbList<GetFunctionInvocationRequest> createRepeated() =>
      $pb.PbList<GetFunctionInvocationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFunctionInvocationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetFunctionInvocationRequest>(create);
  static GetFunctionInvocationRequest? _defaultInstance;

  /// Required. The name of the function invocation to retrieve.
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

/// The request message for Functions.ListFunctionInvocations.
class ListFunctionInvocationsRequest extends $pb.GeneratedMessage {
  factory ListFunctionInvocationsRequest({
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
  ListFunctionInvocationsRequest._() : super();
  factory ListFunctionInvocationsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListFunctionInvocationsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListFunctionInvocationsRequest',
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
  ListFunctionInvocationsRequest clone() =>
      ListFunctionInvocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListFunctionInvocationsRequest copyWith(
          void Function(ListFunctionInvocationsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListFunctionInvocationsRequest))
          as ListFunctionInvocationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFunctionInvocationsRequest create() =>
      ListFunctionInvocationsRequest._();
  ListFunctionInvocationsRequest createEmptyInstance() => create();
  static $pb.PbList<ListFunctionInvocationsRequest> createRepeated() =>
      $pb.PbList<ListFunctionInvocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListFunctionInvocationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListFunctionInvocationsRequest>(create);
  static ListFunctionInvocationsRequest? _defaultInstance;

  /// Required. The parent of the invocations to list.
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

  /// The maximum number of invocations to return.
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

  /// A page token, received from a previous `ListFunctionInvocations` call.
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

  /// An optional filter to apply to the invocations.
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

  /// The order to sort the results by.
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

/// The response message for Functions.ListFunctionInvocations.
class ListFunctionInvocationsResponse extends $pb.GeneratedMessage {
  factory ListFunctionInvocationsResponse({
    $core.Iterable<FunctionInvocation>? functionInvocations,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (functionInvocations != null) {
      $result.functionInvocations.addAll(functionInvocations);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListFunctionInvocationsResponse._() : super();
  factory ListFunctionInvocationsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListFunctionInvocationsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListFunctionInvocationsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..pc<FunctionInvocation>(
        1, _omitFieldNames ? '' : 'functionInvocations', $pb.PbFieldType.PM,
        subBuilder: FunctionInvocation.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListFunctionInvocationsResponse clone() =>
      ListFunctionInvocationsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListFunctionInvocationsResponse copyWith(
          void Function(ListFunctionInvocationsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListFunctionInvocationsResponse))
          as ListFunctionInvocationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFunctionInvocationsResponse create() =>
      ListFunctionInvocationsResponse._();
  ListFunctionInvocationsResponse createEmptyInstance() => create();
  static $pb.PbList<ListFunctionInvocationsResponse> createRepeated() =>
      $pb.PbList<ListFunctionInvocationsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListFunctionInvocationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListFunctionInvocationsResponse>(
          create);
  static ListFunctionInvocationsResponse? _defaultInstance;

  /// The invocations.
  @$pb.TagNumber(1)
  $core.List<FunctionInvocation> get functionInvocations => $_getList(0);

  /// A token to retrieve the next page of results.
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

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

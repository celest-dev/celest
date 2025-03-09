//
//  Generated code. Do not modify.
//  source: google/logging/v2/logging_config.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../longrunning/operations.pb.dart' as $2;
import '../../protobuf/empty.pb.dart' as $1;
import 'logging_config.pb.dart' as $3;

export 'logging_config.pb.dart';

@$pb.GrpcServiceName('google.logging.v2.ConfigServiceV2')
class ConfigServiceV2Client extends $grpc.Client {
  static final _$listBuckets =
      $grpc.ClientMethod<$3.ListBucketsRequest, $3.ListBucketsResponse>(
          '/google.logging.v2.ConfigServiceV2/ListBuckets',
          ($3.ListBucketsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListBucketsResponse.fromBuffer(value));
  static final _$getBucket =
      $grpc.ClientMethod<$3.GetBucketRequest, $3.LogBucket>(
          '/google.logging.v2.ConfigServiceV2/GetBucket',
          ($3.GetBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogBucket.fromBuffer(value));
  static final _$createBucketAsync =
      $grpc.ClientMethod<$3.CreateBucketRequest, $2.Operation>(
          '/google.logging.v2.ConfigServiceV2/CreateBucketAsync',
          ($3.CreateBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$updateBucketAsync =
      $grpc.ClientMethod<$3.UpdateBucketRequest, $2.Operation>(
          '/google.logging.v2.ConfigServiceV2/UpdateBucketAsync',
          ($3.UpdateBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$createBucket =
      $grpc.ClientMethod<$3.CreateBucketRequest, $3.LogBucket>(
          '/google.logging.v2.ConfigServiceV2/CreateBucket',
          ($3.CreateBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogBucket.fromBuffer(value));
  static final _$updateBucket =
      $grpc.ClientMethod<$3.UpdateBucketRequest, $3.LogBucket>(
          '/google.logging.v2.ConfigServiceV2/UpdateBucket',
          ($3.UpdateBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogBucket.fromBuffer(value));
  static final _$deleteBucket =
      $grpc.ClientMethod<$3.DeleteBucketRequest, $1.Empty>(
          '/google.logging.v2.ConfigServiceV2/DeleteBucket',
          ($3.DeleteBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$undeleteBucket =
      $grpc.ClientMethod<$3.UndeleteBucketRequest, $1.Empty>(
          '/google.logging.v2.ConfigServiceV2/UndeleteBucket',
          ($3.UndeleteBucketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$listViews =
      $grpc.ClientMethod<$3.ListViewsRequest, $3.ListViewsResponse>(
          '/google.logging.v2.ConfigServiceV2/ListViews',
          ($3.ListViewsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListViewsResponse.fromBuffer(value));
  static final _$getView = $grpc.ClientMethod<$3.GetViewRequest, $3.LogView>(
      '/google.logging.v2.ConfigServiceV2/GetView',
      ($3.GetViewRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.LogView.fromBuffer(value));
  static final _$createView =
      $grpc.ClientMethod<$3.CreateViewRequest, $3.LogView>(
          '/google.logging.v2.ConfigServiceV2/CreateView',
          ($3.CreateViewRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogView.fromBuffer(value));
  static final _$updateView =
      $grpc.ClientMethod<$3.UpdateViewRequest, $3.LogView>(
          '/google.logging.v2.ConfigServiceV2/UpdateView',
          ($3.UpdateViewRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogView.fromBuffer(value));
  static final _$deleteView =
      $grpc.ClientMethod<$3.DeleteViewRequest, $1.Empty>(
          '/google.logging.v2.ConfigServiceV2/DeleteView',
          ($3.DeleteViewRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$listSinks =
      $grpc.ClientMethod<$3.ListSinksRequest, $3.ListSinksResponse>(
          '/google.logging.v2.ConfigServiceV2/ListSinks',
          ($3.ListSinksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListSinksResponse.fromBuffer(value));
  static final _$getSink = $grpc.ClientMethod<$3.GetSinkRequest, $3.LogSink>(
      '/google.logging.v2.ConfigServiceV2/GetSink',
      ($3.GetSinkRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.LogSink.fromBuffer(value));
  static final _$createSink =
      $grpc.ClientMethod<$3.CreateSinkRequest, $3.LogSink>(
          '/google.logging.v2.ConfigServiceV2/CreateSink',
          ($3.CreateSinkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogSink.fromBuffer(value));
  static final _$updateSink =
      $grpc.ClientMethod<$3.UpdateSinkRequest, $3.LogSink>(
          '/google.logging.v2.ConfigServiceV2/UpdateSink',
          ($3.UpdateSinkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogSink.fromBuffer(value));
  static final _$deleteSink =
      $grpc.ClientMethod<$3.DeleteSinkRequest, $1.Empty>(
          '/google.logging.v2.ConfigServiceV2/DeleteSink',
          ($3.DeleteSinkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$createLink =
      $grpc.ClientMethod<$3.CreateLinkRequest, $2.Operation>(
          '/google.logging.v2.ConfigServiceV2/CreateLink',
          ($3.CreateLinkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$deleteLink =
      $grpc.ClientMethod<$3.DeleteLinkRequest, $2.Operation>(
          '/google.logging.v2.ConfigServiceV2/DeleteLink',
          ($3.DeleteLinkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));
  static final _$listLinks =
      $grpc.ClientMethod<$3.ListLinksRequest, $3.ListLinksResponse>(
          '/google.logging.v2.ConfigServiceV2/ListLinks',
          ($3.ListLinksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListLinksResponse.fromBuffer(value));
  static final _$getLink = $grpc.ClientMethod<$3.GetLinkRequest, $3.Link>(
      '/google.logging.v2.ConfigServiceV2/GetLink',
      ($3.GetLinkRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Link.fromBuffer(value));
  static final _$listExclusions =
      $grpc.ClientMethod<$3.ListExclusionsRequest, $3.ListExclusionsResponse>(
          '/google.logging.v2.ConfigServiceV2/ListExclusions',
          ($3.ListExclusionsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListExclusionsResponse.fromBuffer(value));
  static final _$getExclusion =
      $grpc.ClientMethod<$3.GetExclusionRequest, $3.LogExclusion>(
          '/google.logging.v2.ConfigServiceV2/GetExclusion',
          ($3.GetExclusionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogExclusion.fromBuffer(value));
  static final _$createExclusion =
      $grpc.ClientMethod<$3.CreateExclusionRequest, $3.LogExclusion>(
          '/google.logging.v2.ConfigServiceV2/CreateExclusion',
          ($3.CreateExclusionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogExclusion.fromBuffer(value));
  static final _$updateExclusion =
      $grpc.ClientMethod<$3.UpdateExclusionRequest, $3.LogExclusion>(
          '/google.logging.v2.ConfigServiceV2/UpdateExclusion',
          ($3.UpdateExclusionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.LogExclusion.fromBuffer(value));
  static final _$deleteExclusion =
      $grpc.ClientMethod<$3.DeleteExclusionRequest, $1.Empty>(
          '/google.logging.v2.ConfigServiceV2/DeleteExclusion',
          ($3.DeleteExclusionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getCmekSettings =
      $grpc.ClientMethod<$3.GetCmekSettingsRequest, $3.CmekSettings>(
          '/google.logging.v2.ConfigServiceV2/GetCmekSettings',
          ($3.GetCmekSettingsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.CmekSettings.fromBuffer(value));
  static final _$updateCmekSettings =
      $grpc.ClientMethod<$3.UpdateCmekSettingsRequest, $3.CmekSettings>(
          '/google.logging.v2.ConfigServiceV2/UpdateCmekSettings',
          ($3.UpdateCmekSettingsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.CmekSettings.fromBuffer(value));
  static final _$getSettings =
      $grpc.ClientMethod<$3.GetSettingsRequest, $3.Settings>(
          '/google.logging.v2.ConfigServiceV2/GetSettings',
          ($3.GetSettingsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Settings.fromBuffer(value));
  static final _$updateSettings =
      $grpc.ClientMethod<$3.UpdateSettingsRequest, $3.Settings>(
          '/google.logging.v2.ConfigServiceV2/UpdateSettings',
          ($3.UpdateSettingsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Settings.fromBuffer(value));
  static final _$copyLogEntries =
      $grpc.ClientMethod<$3.CopyLogEntriesRequest, $2.Operation>(
          '/google.logging.v2.ConfigServiceV2/CopyLogEntries',
          ($3.CopyLogEntriesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Operation.fromBuffer(value));

  ConfigServiceV2Client($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.ListBucketsResponse> listBuckets(
      $3.ListBucketsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBuckets, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogBucket> getBucket($3.GetBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBucket, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> createBucketAsync(
      $3.CreateBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBucketAsync, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> updateBucketAsync(
      $3.UpdateBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateBucketAsync, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogBucket> createBucket(
      $3.CreateBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBucket, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogBucket> updateBucket(
      $3.UpdateBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateBucket, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteBucket($3.DeleteBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteBucket, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> undeleteBucket(
      $3.UndeleteBucketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undeleteBucket, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListViewsResponse> listViews(
      $3.ListViewsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listViews, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogView> getView($3.GetViewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getView, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogView> createView($3.CreateViewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createView, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogView> updateView($3.UpdateViewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateView, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteView($3.DeleteViewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteView, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListSinksResponse> listSinks(
      $3.ListSinksRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listSinks, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogSink> getSink($3.GetSinkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSink, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogSink> createSink($3.CreateSinkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSink, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogSink> updateSink($3.UpdateSinkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSink, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteSink($3.DeleteSinkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteSink, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> createLink($3.CreateLinkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLink, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> deleteLink($3.DeleteLinkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteLink, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListLinksResponse> listLinks(
      $3.ListLinksRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listLinks, request, options: options);
  }

  $grpc.ResponseFuture<$3.Link> getLink($3.GetLinkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLink, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListExclusionsResponse> listExclusions(
      $3.ListExclusionsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listExclusions, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogExclusion> getExclusion(
      $3.GetExclusionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getExclusion, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogExclusion> createExclusion(
      $3.CreateExclusionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createExclusion, request, options: options);
  }

  $grpc.ResponseFuture<$3.LogExclusion> updateExclusion(
      $3.UpdateExclusionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateExclusion, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteExclusion(
      $3.DeleteExclusionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteExclusion, request, options: options);
  }

  $grpc.ResponseFuture<$3.CmekSettings> getCmekSettings(
      $3.GetCmekSettingsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCmekSettings, request, options: options);
  }

  $grpc.ResponseFuture<$3.CmekSettings> updateCmekSettings(
      $3.UpdateCmekSettingsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateCmekSettings, request, options: options);
  }

  $grpc.ResponseFuture<$3.Settings> getSettings($3.GetSettingsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSettings, request, options: options);
  }

  $grpc.ResponseFuture<$3.Settings> updateSettings(
      $3.UpdateSettingsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSettings, request, options: options);
  }

  $grpc.ResponseFuture<$2.Operation> copyLogEntries(
      $3.CopyLogEntriesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$copyLogEntries, request, options: options);
  }
}

@$pb.GrpcServiceName('google.logging.v2.ConfigServiceV2')
abstract class ConfigServiceV2ServiceBase extends $grpc.Service {
  $core.String get $name => 'google.logging.v2.ConfigServiceV2';

  ConfigServiceV2ServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$3.ListBucketsRequest, $3.ListBucketsResponse>(
            'ListBuckets',
            listBuckets_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.ListBucketsRequest.fromBuffer(value),
            ($3.ListBucketsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetBucketRequest, $3.LogBucket>(
        'GetBucket',
        getBucket_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetBucketRequest.fromBuffer(value),
        ($3.LogBucket value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateBucketRequest, $2.Operation>(
        'CreateBucketAsync',
        createBucketAsync_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateBucketRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateBucketRequest, $2.Operation>(
        'UpdateBucketAsync',
        updateBucketAsync_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.UpdateBucketRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateBucketRequest, $3.LogBucket>(
        'CreateBucket',
        createBucket_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateBucketRequest.fromBuffer(value),
        ($3.LogBucket value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateBucketRequest, $3.LogBucket>(
        'UpdateBucket',
        updateBucket_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.UpdateBucketRequest.fromBuffer(value),
        ($3.LogBucket value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteBucketRequest, $1.Empty>(
        'DeleteBucket',
        deleteBucket_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.DeleteBucketRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UndeleteBucketRequest, $1.Empty>(
        'UndeleteBucket',
        undeleteBucket_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.UndeleteBucketRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListViewsRequest, $3.ListViewsResponse>(
        'ListViews',
        listViews_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ListViewsRequest.fromBuffer(value),
        ($3.ListViewsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetViewRequest, $3.LogView>(
        'GetView',
        getView_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetViewRequest.fromBuffer(value),
        ($3.LogView value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateViewRequest, $3.LogView>(
        'CreateView',
        createView_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateViewRequest.fromBuffer(value),
        ($3.LogView value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateViewRequest, $3.LogView>(
        'UpdateView',
        updateView_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateViewRequest.fromBuffer(value),
        ($3.LogView value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteViewRequest, $1.Empty>(
        'DeleteView',
        deleteView_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.DeleteViewRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListSinksRequest, $3.ListSinksResponse>(
        'ListSinks',
        listSinks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ListSinksRequest.fromBuffer(value),
        ($3.ListSinksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetSinkRequest, $3.LogSink>(
        'GetSink',
        getSink_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetSinkRequest.fromBuffer(value),
        ($3.LogSink value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateSinkRequest, $3.LogSink>(
        'CreateSink',
        createSink_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateSinkRequest.fromBuffer(value),
        ($3.LogSink value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateSinkRequest, $3.LogSink>(
        'UpdateSink',
        updateSink_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateSinkRequest.fromBuffer(value),
        ($3.LogSink value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteSinkRequest, $1.Empty>(
        'DeleteSink',
        deleteSink_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.DeleteSinkRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateLinkRequest, $2.Operation>(
        'CreateLink',
        createLink_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateLinkRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteLinkRequest, $2.Operation>(
        'DeleteLink',
        deleteLink_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.DeleteLinkRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListLinksRequest, $3.ListLinksResponse>(
        'ListLinks',
        listLinks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ListLinksRequest.fromBuffer(value),
        ($3.ListLinksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetLinkRequest, $3.Link>(
        'GetLink',
        getLink_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetLinkRequest.fromBuffer(value),
        ($3.Link value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListExclusionsRequest,
            $3.ListExclusionsResponse>(
        'ListExclusions',
        listExclusions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.ListExclusionsRequest.fromBuffer(value),
        ($3.ListExclusionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetExclusionRequest, $3.LogExclusion>(
        'GetExclusion',
        getExclusion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.GetExclusionRequest.fromBuffer(value),
        ($3.LogExclusion value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateExclusionRequest, $3.LogExclusion>(
        'CreateExclusion',
        createExclusion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateExclusionRequest.fromBuffer(value),
        ($3.LogExclusion value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateExclusionRequest, $3.LogExclusion>(
        'UpdateExclusion',
        updateExclusion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.UpdateExclusionRequest.fromBuffer(value),
        ($3.LogExclusion value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteExclusionRequest, $1.Empty>(
        'DeleteExclusion',
        deleteExclusion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.DeleteExclusionRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetCmekSettingsRequest, $3.CmekSettings>(
        'GetCmekSettings',
        getCmekSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.GetCmekSettingsRequest.fromBuffer(value),
        ($3.CmekSettings value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.UpdateCmekSettingsRequest, $3.CmekSettings>(
            'UpdateCmekSettings',
            updateCmekSettings_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.UpdateCmekSettingsRequest.fromBuffer(value),
            ($3.CmekSettings value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetSettingsRequest, $3.Settings>(
        'GetSettings',
        getSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.GetSettingsRequest.fromBuffer(value),
        ($3.Settings value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateSettingsRequest, $3.Settings>(
        'UpdateSettings',
        updateSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.UpdateSettingsRequest.fromBuffer(value),
        ($3.Settings value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CopyLogEntriesRequest, $2.Operation>(
        'CopyLogEntries',
        copyLogEntries_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CopyLogEntriesRequest.fromBuffer(value),
        ($2.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$3.ListBucketsResponse> listBuckets_Pre($grpc.ServiceCall call,
      $async.Future<$3.ListBucketsRequest> request) async {
    return listBuckets(call, await request);
  }

  $async.Future<$3.LogBucket> getBucket_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetBucketRequest> request) async {
    return getBucket(call, await request);
  }

  $async.Future<$2.Operation> createBucketAsync_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateBucketRequest> request) async {
    return createBucketAsync(call, await request);
  }

  $async.Future<$2.Operation> updateBucketAsync_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateBucketRequest> request) async {
    return updateBucketAsync(call, await request);
  }

  $async.Future<$3.LogBucket> createBucket_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateBucketRequest> request) async {
    return createBucket(call, await request);
  }

  $async.Future<$3.LogBucket> updateBucket_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateBucketRequest> request) async {
    return updateBucket(call, await request);
  }

  $async.Future<$1.Empty> deleteBucket_Pre($grpc.ServiceCall call,
      $async.Future<$3.DeleteBucketRequest> request) async {
    return deleteBucket(call, await request);
  }

  $async.Future<$1.Empty> undeleteBucket_Pre($grpc.ServiceCall call,
      $async.Future<$3.UndeleteBucketRequest> request) async {
    return undeleteBucket(call, await request);
  }

  $async.Future<$3.ListViewsResponse> listViews_Pre($grpc.ServiceCall call,
      $async.Future<$3.ListViewsRequest> request) async {
    return listViews(call, await request);
  }

  $async.Future<$3.LogView> getView_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GetViewRequest> request) async {
    return getView(call, await request);
  }

  $async.Future<$3.LogView> createView_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateViewRequest> request) async {
    return createView(call, await request);
  }

  $async.Future<$3.LogView> updateView_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateViewRequest> request) async {
    return updateView(call, await request);
  }

  $async.Future<$1.Empty> deleteView_Pre($grpc.ServiceCall call,
      $async.Future<$3.DeleteViewRequest> request) async {
    return deleteView(call, await request);
  }

  $async.Future<$3.ListSinksResponse> listSinks_Pre($grpc.ServiceCall call,
      $async.Future<$3.ListSinksRequest> request) async {
    return listSinks(call, await request);
  }

  $async.Future<$3.LogSink> getSink_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GetSinkRequest> request) async {
    return getSink(call, await request);
  }

  $async.Future<$3.LogSink> createSink_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateSinkRequest> request) async {
    return createSink(call, await request);
  }

  $async.Future<$3.LogSink> updateSink_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateSinkRequest> request) async {
    return updateSink(call, await request);
  }

  $async.Future<$1.Empty> deleteSink_Pre($grpc.ServiceCall call,
      $async.Future<$3.DeleteSinkRequest> request) async {
    return deleteSink(call, await request);
  }

  $async.Future<$2.Operation> createLink_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateLinkRequest> request) async {
    return createLink(call, await request);
  }

  $async.Future<$2.Operation> deleteLink_Pre($grpc.ServiceCall call,
      $async.Future<$3.DeleteLinkRequest> request) async {
    return deleteLink(call, await request);
  }

  $async.Future<$3.ListLinksResponse> listLinks_Pre($grpc.ServiceCall call,
      $async.Future<$3.ListLinksRequest> request) async {
    return listLinks(call, await request);
  }

  $async.Future<$3.Link> getLink_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GetLinkRequest> request) async {
    return getLink(call, await request);
  }

  $async.Future<$3.ListExclusionsResponse> listExclusions_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.ListExclusionsRequest> request) async {
    return listExclusions(call, await request);
  }

  $async.Future<$3.LogExclusion> getExclusion_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetExclusionRequest> request) async {
    return getExclusion(call, await request);
  }

  $async.Future<$3.LogExclusion> createExclusion_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateExclusionRequest> request) async {
    return createExclusion(call, await request);
  }

  $async.Future<$3.LogExclusion> updateExclusion_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateExclusionRequest> request) async {
    return updateExclusion(call, await request);
  }

  $async.Future<$1.Empty> deleteExclusion_Pre($grpc.ServiceCall call,
      $async.Future<$3.DeleteExclusionRequest> request) async {
    return deleteExclusion(call, await request);
  }

  $async.Future<$3.CmekSettings> getCmekSettings_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetCmekSettingsRequest> request) async {
    return getCmekSettings(call, await request);
  }

  $async.Future<$3.CmekSettings> updateCmekSettings_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateCmekSettingsRequest> request) async {
    return updateCmekSettings(call, await request);
  }

  $async.Future<$3.Settings> getSettings_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetSettingsRequest> request) async {
    return getSettings(call, await request);
  }

  $async.Future<$3.Settings> updateSettings_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateSettingsRequest> request) async {
    return updateSettings(call, await request);
  }

  $async.Future<$2.Operation> copyLogEntries_Pre($grpc.ServiceCall call,
      $async.Future<$3.CopyLogEntriesRequest> request) async {
    return copyLogEntries(call, await request);
  }

  $async.Future<$3.ListBucketsResponse> listBuckets(
      $grpc.ServiceCall call, $3.ListBucketsRequest request);
  $async.Future<$3.LogBucket> getBucket(
      $grpc.ServiceCall call, $3.GetBucketRequest request);
  $async.Future<$2.Operation> createBucketAsync(
      $grpc.ServiceCall call, $3.CreateBucketRequest request);
  $async.Future<$2.Operation> updateBucketAsync(
      $grpc.ServiceCall call, $3.UpdateBucketRequest request);
  $async.Future<$3.LogBucket> createBucket(
      $grpc.ServiceCall call, $3.CreateBucketRequest request);
  $async.Future<$3.LogBucket> updateBucket(
      $grpc.ServiceCall call, $3.UpdateBucketRequest request);
  $async.Future<$1.Empty> deleteBucket(
      $grpc.ServiceCall call, $3.DeleteBucketRequest request);
  $async.Future<$1.Empty> undeleteBucket(
      $grpc.ServiceCall call, $3.UndeleteBucketRequest request);
  $async.Future<$3.ListViewsResponse> listViews(
      $grpc.ServiceCall call, $3.ListViewsRequest request);
  $async.Future<$3.LogView> getView(
      $grpc.ServiceCall call, $3.GetViewRequest request);
  $async.Future<$3.LogView> createView(
      $grpc.ServiceCall call, $3.CreateViewRequest request);
  $async.Future<$3.LogView> updateView(
      $grpc.ServiceCall call, $3.UpdateViewRequest request);
  $async.Future<$1.Empty> deleteView(
      $grpc.ServiceCall call, $3.DeleteViewRequest request);
  $async.Future<$3.ListSinksResponse> listSinks(
      $grpc.ServiceCall call, $3.ListSinksRequest request);
  $async.Future<$3.LogSink> getSink(
      $grpc.ServiceCall call, $3.GetSinkRequest request);
  $async.Future<$3.LogSink> createSink(
      $grpc.ServiceCall call, $3.CreateSinkRequest request);
  $async.Future<$3.LogSink> updateSink(
      $grpc.ServiceCall call, $3.UpdateSinkRequest request);
  $async.Future<$1.Empty> deleteSink(
      $grpc.ServiceCall call, $3.DeleteSinkRequest request);
  $async.Future<$2.Operation> createLink(
      $grpc.ServiceCall call, $3.CreateLinkRequest request);
  $async.Future<$2.Operation> deleteLink(
      $grpc.ServiceCall call, $3.DeleteLinkRequest request);
  $async.Future<$3.ListLinksResponse> listLinks(
      $grpc.ServiceCall call, $3.ListLinksRequest request);
  $async.Future<$3.Link> getLink(
      $grpc.ServiceCall call, $3.GetLinkRequest request);
  $async.Future<$3.ListExclusionsResponse> listExclusions(
      $grpc.ServiceCall call, $3.ListExclusionsRequest request);
  $async.Future<$3.LogExclusion> getExclusion(
      $grpc.ServiceCall call, $3.GetExclusionRequest request);
  $async.Future<$3.LogExclusion> createExclusion(
      $grpc.ServiceCall call, $3.CreateExclusionRequest request);
  $async.Future<$3.LogExclusion> updateExclusion(
      $grpc.ServiceCall call, $3.UpdateExclusionRequest request);
  $async.Future<$1.Empty> deleteExclusion(
      $grpc.ServiceCall call, $3.DeleteExclusionRequest request);
  $async.Future<$3.CmekSettings> getCmekSettings(
      $grpc.ServiceCall call, $3.GetCmekSettingsRequest request);
  $async.Future<$3.CmekSettings> updateCmekSettings(
      $grpc.ServiceCall call, $3.UpdateCmekSettingsRequest request);
  $async.Future<$3.Settings> getSettings(
      $grpc.ServiceCall call, $3.GetSettingsRequest request);
  $async.Future<$3.Settings> updateSettings(
      $grpc.ServiceCall call, $3.UpdateSettingsRequest request);
  $async.Future<$2.Operation> copyLogEntries(
      $grpc.ServiceCall call, $3.CopyLogEntriesRequest request);
}

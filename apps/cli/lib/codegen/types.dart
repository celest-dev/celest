// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core' as core;
import 'dart:isolate' as isolate;
import 'dart:typed_data';

import 'package:aws_common/aws_common.dart' as aws_common;
import 'package:built_collection/built_collection.dart' as built_collection;
import 'package:built_value/built_value.dart' as built_value;
import 'package:built_value/json_object.dart' as built_value_json_object;
import 'package:built_value/serializer.dart' as built_value_serializer;
import 'package:celest/celest.dart' as celest;
import 'package:code_builder/code_builder.dart';
import 'package:fixnum/fixnum.dart';
import 'package:functions_framework/serve.dart' as functions_framework;
import 'package:meta/meta.dart' as meta;
import 'package:shelf/shelf.dart' as shelf;

/// Common type references used throughout code generation.
abstract class DartTypes {
  DartTypes._();

  /// `dart:core` types.
  static const core = _Core();

  /// `dart:async` types.
  static const async = _Async();

  /// `package:aws_common` types.
  static const awsCommon = _AwsCommon();

  /// `package:built_value` types.
  static const builtValue = BuiltValueType._();

  /// `package:celest` types.
  static const celest = _Celest();

  /// `dart:convert` types.
  static const convert = _Convert();

  /// `package:fixnum` types.
  static const fixNum = FixNum();

  /// `package:functions_framework` types.
  static const functionsFramework = _FunctionsFramework();

  /// `dart:isolate` types.
  static const isolate = _Isolate();

  /// `package:meta` types.
  static const meta = _Meta();

  /// `package:shelf` types.
  static const shelf = _Shelf();

  /// `package:shelf_router` types.
  static const shelfRouter = ShelfRouter();

  /// `package:test` types.
  static const test = _Test();

  /// `dart:typed_data` types.
  static const typedData = _TypedData();
}

/// `dart:core` types
class _Core {
  const _Core();

  static const _url = 'dart:core';

  /// Creates a [core.BigInt] reference.
  Reference get bigInt => const Reference('BigInt', _url);

  /// Creates a [core.bool] reference.
  Reference get bool => const Reference('bool', _url);

  /// Creates a [core.DateTime] reference.
  Reference get dateTime => const Reference('DateTime', _url);

  /// Creates a [core.Deprecated] reference.
  Reference get deprecated => const Reference('Deprecated', _url);

  /// Creates a [core.double] reference.
  Reference get double => const Reference('double', _url);

  /// Creates a [core.Duration] reference.
  Reference get duration => const Reference('Duration', _url);

  /// Creates a [core.Exception] reference.
  Reference get exception => const Reference('Exception', _url);

  /// Creates a [core.Function] reference.
  Reference get function => const Reference('Function', _url);

  /// Creates an [core.int] reference.
  Reference get int => const Reference('int', _url);

  /// Creates a [core.Iterable] reference.
  Reference iterable([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'Iterable'
          ..url = _url
          ..types.addAll([
            if (ref != null) ref,
          ]),
      );

  /// Creates a [core.List] reference.
  Reference list([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'List'
          ..url = _url
          ..types.addAll([
            if (ref != null) ref,
          ]),
      );

  /// Creates a [core.Map] reference.
  Reference map(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'Map'
          ..url = _url
          ..types.add(key)
          ..types.add(value),
      );

  /// Creates an [core.MapEntry] reference.
  Reference get mapEntry => const Reference('MapEntry', _url);

  /// Creates a [core.Null] reference.
  Reference get null$ => const Reference('Null', _url);

  /// Creates an [core.Object] reference.
  Reference get object => const Reference('Object', _url);

  /// Creates a [core.override] reference.
  Reference get override => const Reference('override', _url);

  /// Creates a [core.RegExp] reference.
  Reference get regExp => const Reference('RegExp', _url);

  /// Creates a [core.Set] reference.
  Reference set(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'Set'
          ..url = _url
          ..types.add(ref),
      );

  /// Create a [core.StateError] reference.
  Reference get stateError => const Reference('StateError', _url);

  /// Creates a [core.String] reference.
  Reference get string => const Reference('String', _url);

  /// Creates a [core.Type] reference.
  Reference get type => const Reference('Type', _url);

  /// Creates a [core.Uri] reference.
  Reference get uri => const Reference('Uri', _url);

  /// Creates a `void` reference.
  Reference get void$ => const Reference('void');
}

/// `dart:async` types
class _Async {
  const _Async();

  static const _url = 'dart:async';

  /// Creates a [Future] reference.
  Reference future(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'Future'
          ..url = _url
          ..types.add(ref),
      );

  /// Creates a [FutureOr] reference.
  Reference futureOr(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'FutureOr'
          ..url = _url
          ..types.add(ref),
      );

  /// Creates a [Stream] reference.
  Reference stream([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'Stream'
          ..url = _url
          ..types.addAll([
            if (ref != null) ref,
          ]),
      );

  /// Creates a `runZoned` refererence.
  Reference get runZoned => const Reference('runZoned', _url);
}

/// `package:aws_common` types.
class _AwsCommon {
  const _AwsCommon();

  static const _url = 'package:aws_common/aws_common.dart';

  /// Creates an [aws_common.AWSEquatable] reference.
  Reference awsEquatable(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'AWSEquatable'
          ..url = _url
          ..types.add(ref),
      );

  /// Creates an [aws_common.AWSHeaders] reference.
  Reference get awsHeaders => const Reference('AWSHeaders', _url);

  /// Creates an [aws_common.AWSHttpClient] reference.
  Reference get awsHttpClient => const Reference('AWSHttpClient', _url);

  /// Creates an [aws_common.AWSHttpMethod] reference.
  Reference get awsHttpMethod => const Reference('AWSHttpMethod', _url);

  /// Creates an [aws_common.AWSSerializable] reference.
  Reference get awsSerializable => const Reference('AWSSerializable', _url);

  /// Creates an [aws_common.AWSService] reference.
  Reference get awsService => const Reference('AWSService', _url);

  /// Creates an [aws_common.AWSBaseHttpRequest] reference.
  Reference get awsBaseHttpRequest =>
      const Reference('AWSBaseHttpRequest', _url);

  /// Creates an [aws_common.AWSBaseHttpResponse] reference.
  Reference get awsBaseHttpResponse =>
      const Reference('AWSBaseHttpResponse', _url);

  /// Creates an [aws_common.AWSHttpRequest] reference.
  Reference get awsHttpRequest => const Reference('AWSHttpRequest', _url);

  /// Creates an [aws_common.AWSStreamedHttpRequest] reference.
  Reference get awsStreamedHttpRequest =>
      const Reference('AWSStreamedHttpRequest', _url);

  /// Creates a secure [aws_common.uuid] instance.
  Expression uuid() => const Reference('uuid', _url).call([], {
        'secure': literalTrue,
      });
}

/// `package:built_value` types
class BuiltValueType {
  const BuiltValueType._();

  static const mainUrl = 'package:built_value/built_value.dart';
  static const serializerUrl = 'package:built_value/serializer.dart';
  static const jsonUrl = 'package:built_value/json_object.dart';
  static const collectionUrl = 'package:built_collection/built_collection.dart';

  /// A [built_value.BuiltValue] reference.
  Reference get builtValue => const Reference('BuiltValue', mainUrl);

  /// A [built_value.BuiltValueField] reference.
  Reference get builtValueField => const Reference('BuiltValueField', mainUrl);

  /// A [built_value.BuiltValueHook] reference.
  Reference get builtValueHook => const Reference('BuiltValueHook', mainUrl);

  /// Creates a [built_value.Built] reference for [ref] and its builder class,
  /// [builderRef].
  Reference built(Reference ref, Reference builderRef) => TypeReference(
        (t) => t
          ..symbol = 'Built'
          ..url = mainUrl
          ..types.addAll([ref, builderRef]),
      );

  /// Creates a [built_collection.BuiltList] reference for generic type [ref].
  Reference builtList(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'BuiltList'
          ..url = collectionUrl
          ..types.add(ref),
      );

  /// Creates a [built_collection.BuiltListMultimap] reference with key [key]
  /// and [value] generic types.
  ///
  /// For example, a key of [core.String] and value of [core.String] creates
  /// a `BuiltListMultimap<String, String>` which is the same a
  /// `Map<String, List<String>>` when built.
  Reference builtListMultimap(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'BuiltListMultimap'
          ..url = collectionUrl
          ..types.addAll([key, value]),
      );

  /// Creates a [built_collection.BuiltMap] reference with [key] and [value]
  /// generic types.
  Reference builtMap(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'BuiltMap'
          ..url = collectionUrl
          ..types.add(key)
          ..types.add(value),
      );

  /// Creates a [built_collection.BuiltSet] reference for generic type [ref].
  Reference builtSet(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'BuiltSet'
          ..url = collectionUrl
          ..types.add(ref),
      );

  /// Creates a [built_collection.BuiltSetMultimap] reference with key [key]
  /// and [value] generic types.
  ///
  /// For example, a key of [core.String] and value of [core.String] creates
  /// a `BuiltSetMultimap<String, String>` which is the same a
  /// `Map<String, Set<String>>` when built.
  Reference builtSetMultimap(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'BuiltSetMultimap'
          ..url = collectionUrl
          ..types.addAll([key, value]),
      );

  /// Creates a [built_value_serializer.FullType] reference.
  Reference get fullType => const Reference('FullType', serializerUrl);

  /// Creates a [built_value_json_object.JsonObject] reference.
  Reference get jsonObject => const Reference('JsonObject', jsonUrl);

  /// The builder for [built_collection.ListBuilder].
  Reference listBuilder(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'ListBuilder'
          ..url = collectionUrl
          ..types.add(ref),
      );

  /// The builder for [built_collection.BuiltListMultimap].
  Reference listMultimapBuilder(Reference key, Reference value) =>
      TypeReference(
        (t) => t
          ..symbol = 'ListMultimapBuilder'
          ..url = collectionUrl
          ..types.addAll([key, value]),
      );

  /// The builder for [built_collection.MapBuilder].
  Reference mapBuilder(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'MapBuilder'
          ..url = collectionUrl
          ..types.addAll([key, value]),
      );

  /// Creates a [built_value.newBuiltValueToStringHelper] reference.
  Reference get newBuiltValueToStringHelper =>
      const Reference('newBuiltValueToStringHelper', mainUrl);

  /// Creates a [built_value_serializer.PrimitiveSerializer] reference for
  /// generic type [ref].
  Reference primitiveSerializer(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'PrimitiveSerializer'
          ..url = serializerUrl
          ..types.add(ref),
      );

  /// The builder for [built_collection.SetBuilder].
  Reference setBuilder(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'SetBuilder'
          ..url = collectionUrl
          ..types.add(ref),
      );

  /// The builder for [built_collection.BuiltSetMultimap].
  Reference setMultimapBuilder(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'SetMultimapBuilder'
          ..url = collectionUrl
          ..types.addAll([key, value]),
      );

  /// Creates a [built_value_serializer.Serializers] reference.
  Reference get serializers => const Reference('Serializers', serializerUrl);
}

/// `package:celest` types
class _Celest {
  const _Celest();

  static const _url = 'package:celest/celest.dart';

  /// Creates a [celest.BuildEnvironment] reference.
  Reference get buildEnvironment => const Reference('BuildEnvironment', _url);

  /// Creates a [celest.CloudApi] reference.
  Reference get cloudApi => const Reference('CloudApi', _url);

  /// Creates a [celest.CloudFunction] reference.
  Reference cloudFunction([Reference? input, Reference? output]) =>
      TypeReference(
        (t) => t
          ..symbol = 'CloudFunction'
          ..url = _url
          ..types.addAll([
            if (input != null) input,
            if (output != null) output,
          ]),
      );

  /// Creates a [celest.CloudWidget] reference.
  Reference get cloudWidget => const Reference('CloudWidget', _url);

  /// Creates a [celest.CloudWidgetSet] reference.
  Reference get cloudWidgetSet => const Reference('CloudWidgetSet', _url);

  /// Creates a [celest.FunctionContext] reference.
  Reference get functionContext => const Reference('FunctionContext', _url);

  /// Creates a [celest.ProjectContext] reference.
  Reference get projectContext => const Reference('ProjectContext', _url);

  /// Creates a `celest.runWithContext` reference.
  Reference get runWithContext => const Reference(
        'runWithContext',
        'package:celest/src/core/project_context.dart',
      );
}

/// `dart:convert` types
class _Convert {
  const _Convert();

  static const _url = 'dart:convert';

  /// Creates a [convert.base64Decode] reference.
  Reference get base64Decode => const Reference('base64Decode', _url);

  /// Creates a [convert.base64Encode] reference.
  Reference get base64Encode => const Reference('base64Encode', _url);

  /// Creates a [convert.jsonEncode] reference.
  Reference get jsonEncode => const Reference('jsonEncode', _url);

  /// Creates a [convert.jsonDecode] reference.
  Reference get jsonDecode => const Reference('jsonDecode', _url);

  /// Creates a [convert.utf8] reference.
  Reference get utf8 => const Reference('utf8', _url);
}

/// `package:fixnum` types
class FixNum {
  const FixNum();

  static const url = 'package:fixnum/fixnum.dart';

  /// Creates an [Int64] reference.
  Reference get int64 => const Reference('Int64', url);
}

/// `package:functions_framework` types
class _FunctionsFramework {
  const _FunctionsFramework();

  static const _url = 'package:functions_framework/serve.dart';

  /// Creates a [functions_framework.FunctionTarget] reference.
  Reference get functionTarget => const Reference('FunctionTarget', _url);

  /// Creates a [functions_framework.JsonWithContextFunctionTarget] reference.
  Reference get jsonWithContextFunctionTarget =>
      const Reference('JsonWithContextFunctionTarget', _url);

  /// Creates a [functions_framework.serve] reference.
  Reference get serve => const Reference('serve', _url);
}

/// `dart:isolate` types
class _Isolate {
  const _Isolate();

  static const _url = 'dart:isolate';

  /// Creates a [isolate.SendPort] reference.
  Reference get sendPort => const Reference('SendPort', _url);
}

/// `package:meta` types.
class _Meta {
  const _Meta();

  static const _url = 'package:meta/meta.dart';

  /// Creates a [meta.experimental] reference.
  Reference get experimental => const Reference('experimental', _url);

  /// Creates a [meta.internal] reference.
  Reference get internal => const Reference('internal', _url);

  /// Creates a [meta.immutable] reference.
  Reference get immutable => const Reference('immutable', _url);
}

/// `package:shelf` types
class _Shelf {
  const _Shelf();

  static const _url = 'package:shelf/shelf.dart';

  /// Creates a [shelf.Handler] reference.
  Reference get handler => const Reference('Handler', _url);

  /// Creates a [shelf.Middleware] reference.
  Reference get middleware => const Reference('Middleware', _url);

  /// Creates a [shelf.Pipeline] reference.
  Reference get pipeline => const Reference('Pipeline', _url);

  /// Creates a [shelf.Request] reference.
  Reference get request => const Reference('Request', _url);

  /// Creates a [shelf.Response] reference.
  Reference get response => const Reference('Response', _url);
}

/// `package:shelf_router` types
class ShelfRouter {
  const ShelfRouter();

  static const url = 'package:shelf_router/shelf_router.dart';

  /// Creates a [shelf_router.Route] reference.
  Reference get route => const Reference('Route', url);

  /// Creates a [shelf_router.Router] reference.
  Reference get router => const Reference('Router', url);
}

/// `package:test` types
class _Test {
  const _Test();

  static const _url = 'package:test/test.dart';

  /// Creates an `test` reference.
  Reference get test => const Reference('test', _url);
}

/// `dart:typed_data` types
class _TypedData {
  const _TypedData();

  static const _url = 'dart:typed_data';

  /// Creates a [Uint8List] reference.
  Reference get uint8List => const Reference('Uint8List', _url);
}

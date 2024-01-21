// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io' as io;
import 'dart:isolate' as isolate;
import 'dart:typed_data';

import 'package:aws_common/aws_common.dart' as aws_common;
import 'package:built_collection/built_collection.dart' as built_collection;
import 'package:built_value/built_value.dart' as built_value;
import 'package:built_value/json_object.dart' as built_value_json_object;
import 'package:built_value/serializer.dart' as built_value_serializer;
import 'package:celest/celest.dart' as celest;
import 'package:celest/src/runtime/serve.dart' as celest_runtime;
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_core/celest_core.dart' as celest_core;
import 'package:celest_core/src/util/globals.dart' as celest_globals;
import 'package:code_builder/code_builder.dart';
import 'package:fixnum/fixnum.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' as meta;
import 'package:path/path.dart' as path;
import 'package:shelf/shelf.dart' as shelf;

final class DartTypeReference extends Reference {
  const DartTypeReference(
    super.symbol, [
    super.url,
    this._wireType,
  ]);

  String get typeUri => '$url#$symbol';
  String get wireTypeUri => _wireType ?? typeUri;
  final String? _wireType;

  static final _checkerCache = <DartTypeReference, TypeChecker>{};

  TypeChecker get checker => _checkerCache[this] ??= _checker;
  TypeChecker get _checker {
    assert(url != null);
    return TypeChecker.fromUrl(typeUri);
  }
}

final _allTypes = () {
  final container = _DartTypeContainer();
  container.add(DartTypes.core.bigInt);
  container.add(DartTypes.core.bool);
  container.add(DartTypes.core.dateTime);
  container.add(DartTypes.core.deprecated);
  container.add(DartTypes.core.double);
  container.add(DartTypes.core.duration);
  container.add(DartTypes.core.dynamic);
  container.add(DartTypes.core.exception);
  container.add(DartTypes.core.function);
  container.add(DartTypes.core.int);
  container.add(DartTypes.core.mapEntry);
  container.add(DartTypes.core.never);
  container.add(DartTypes.core.null$);
  container.add(DartTypes.core.object);
  container.add(DartTypes.core.override);
  container.add(DartTypes.core.regExp);
  container.add(DartTypes.core.stackTrace);
  container.add(DartTypes.core.stateError);
  container.add(DartTypes.core.string);
  container.add(DartTypes.core.type);
  container.add(DartTypes.core.uri);
  container.add(DartTypes.core.uriData);
  container.add(DartTypes.core.void$);
  container.add(DartTypes.typedData.uint8List);
  return container;
}();

class _DartTypeContainer {
  final Map<String, DartTypeReference> _types = {};

  void add(DartTypeReference type) {
    _types[type.typeUri] = type;
  }
}

/// Common type references used throughout code generation.
abstract class DartTypes {
  DartTypes._();

  static DartTypeReference? fromUri(String uri) => _allTypes._types[uri];

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

  /// Access to various global values.
  static const globals = _Globals();

  /// `package:http` types.
  static const http = _Http();

  /// `dart:io` types.
  static const io = _Io();

  /// `dart:isolate` types.
  static const isolate = _Isolate();

  /// `package:meta` types.
  static const meta = _Meta();

  /// `package:path` types.
  static const path = _Path();

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

  /// Creates a [ArgumentError] reference.
  DartTypeReference get argumentError =>
      const DartTypeReference('ArgumentError', _url);

  /// Creates a [AssertionError] reference.
  DartTypeReference get assertionError =>
      const DartTypeReference('AssertionError', _url);

  /// Creates a [BigInt] reference.
  DartTypeReference get bigInt => const DartTypeReference(
        'BigInt',
        _url,
        'dart:core#String',
      );

  /// Creates a [bool] reference.
  DartTypeReference get bool => const DartTypeReference('bool', _url);

  /// Creates a [ConcurrentModificationError] reference.
  DartTypeReference get concurrentModificationError =>
      const DartTypeReference('ConcurrentModificationError', _url);

  /// Creates a [DateTime] reference.
  DartTypeReference get dateTime => const DartTypeReference(
        'DateTime',
        _url,
        'dart:core#String',
      );

  /// Creates a [Deprecated] reference.
  DartTypeReference get deprecated =>
      const DartTypeReference('Deprecated', _url);

  /// Creates a [double] reference.
  DartTypeReference get double => const DartTypeReference('double', _url);

  /// Creates a [Duration] reference.
  DartTypeReference get duration => const DartTypeReference(
        'Duration',
        _url,
        'dart:core#Map',
      );

  /// Creates a [dynamic] reference.
  DartTypeReference get dynamic => const DartTypeReference('dynamic', _url);

  /// Creates a [Error] reference.
  DartTypeReference get error => const DartTypeReference('Error', _url);

  /// Creates a [Exception] reference.
  DartTypeReference get exception => const DartTypeReference('Exception', _url);

  /// Creates a [FormatException] reference.
  DartTypeReference get formatException =>
      const DartTypeReference('FormatException', _url);

  /// Creates a [Function] reference.
  DartTypeReference get function => const DartTypeReference('Function', _url);

  /// Creates a [Future] reference.
  Reference future(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'Future'
          ..url = _url
          ..types.add(ref),
      );

  /// Creates a [IndexError] reference.
  DartTypeReference get indexError =>
      const DartTypeReference('IndexError', _url);

  /// Creates an [int] reference.
  DartTypeReference get int => const DartTypeReference('int', _url);

  /// Creates a [Iterable] reference.
  Reference iterable([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'Iterable'
          ..url = _url
          ..types.addAll([
            if (ref != null) ref,
          ]),
      );

  /// Creates a [List] reference.
  Reference list([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'List'
          ..url = _url
          ..types.addAll([
            if (ref != null) ref,
          ]),
      );

  /// Creates a [Map] reference.
  Reference map([Reference? key, Reference? value]) => TypeReference(
        (t) => t
          ..symbol = 'Map'
          ..url = _url
          ..types.addAll(
            [
              if (key != null) key,
              if (key != null && value != null) value,
            ],
          ),
      );

  /// Creates an [MapEntry] reference.
  DartTypeReference get mapEntry => const DartTypeReference('MapEntry', _url);

  /// Creates a [OutOfMemoryError] reference.
  DartTypeReference get outOfMemoryError =>
      const DartTypeReference('OutOfMemoryError', _url);

  /// Creates an [Never] reference.
  DartTypeReference get never => const DartTypeReference('Never', _url);

  /// Creates a [NoSuchMethodError] reference.
  DartTypeReference get noSuchMethodError =>
      const DartTypeReference('NoSuchMethodError', _url);

  /// Creates a [Null] reference.
  DartTypeReference get null$ => const DartTypeReference('Null', _url);

  /// Creates a [num] reference.
  DartTypeReference get num => const DartTypeReference('num', _url);

  /// Creates an [Object] reference.
  DartTypeReference get object => const DartTypeReference('Object', _url);

  /// Creates a [override] reference.
  DartTypeReference get override => const DartTypeReference('override', _url);

  /// Creates a [RangeError] reference.
  DartTypeReference get rangeError =>
      const DartTypeReference('RangeError', _url);

  /// Creates a [RegExp] reference.
  DartTypeReference get regExp => const DartTypeReference(
        'RegExp',
        _url,
        'dart:core#String',
      );

  /// Creates a [Set] reference.
  Reference set(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'Set'
          ..url = _url
          ..types.add(ref),
      );

  /// Creates a [StackOverflowError] reference.
  DartTypeReference get stackOverflowError =>
      const DartTypeReference('StackOverflowError', _url);

  /// Creates a [StackTrace] reference.
  DartTypeReference get stackTrace => const DartTypeReference(
        'StackTrace',
        _url,
        'dart:core#String',
      );

  /// Create a [StateError] reference.
  DartTypeReference get stateError =>
      const DartTypeReference('StateError', _url);

  /// Creates a [Stream] reference.
  Reference stream([Reference? ref]) => TypeReference(
        (t) => t
          ..symbol = 'Stream'
          ..url = _url
          ..types.addAll([
            if (ref != null) ref,
          ]),
      );

  /// Creates a [String] reference.
  DartTypeReference get string => const DartTypeReference('String', _url);

  /// Creates a [StringBuffer] reference.
  DartTypeReference get stringBuffer =>
      const DartTypeReference('StringBuffer', _url);

  /// Creates a [Type] reference.
  DartTypeReference get type => const DartTypeReference('Type', _url);

  /// Creates a [TypeError] reference.
  DartTypeReference get typeError => const DartTypeReference('TypeError', _url);

  /// Create a [UnimplementedError] reference.
  DartTypeReference get unimplementedError =>
      const DartTypeReference('UnimplementedError', _url);

  /// Create a [UnsupportedError] reference.
  DartTypeReference get unsupportedError =>
      const DartTypeReference('UnsupportedError', _url);

  /// Creates a [Uri] reference.
  DartTypeReference get uri => const DartTypeReference(
        'Uri',
        _url,
        'dart:core#String',
      );

  /// Creates a [UriData] reference.
  DartTypeReference get uriData => const DartTypeReference(
        'UriData',
        _url,
        'dart:core#String',
      );

  /// Creates a `void` reference.
  DartTypeReference get void$ => const DartTypeReference('void');
}

/// `dart:async` types
class _Async {
  const _Async();

  static const _url = 'dart:async';

  /// Creates a [FutureOr] reference.
  Reference futureOr(Reference ref) => TypeReference(
        (t) => t
          ..symbol = 'FutureOr'
          ..url = _url
          ..types.add(ref),
      );

  /// Creates a `runZoned` refererence.
  DartTypeReference get runZoned => const DartTypeReference('runZoned', _url);
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
  DartTypeReference get awsHeaders =>
      const DartTypeReference('AWSHeaders', _url);

  /// Creates an [aws_common.AWSHttpClient] reference.
  DartTypeReference get awsHttpClient =>
      const DartTypeReference('AWSHttpClient', _url);

  /// Creates an [aws_common.AWSHttpMethod] reference.
  DartTypeReference get awsHttpMethod =>
      const DartTypeReference('AWSHttpMethod', _url);

  /// Creates an [aws_common.AWSSerializable] reference.
  DartTypeReference get awsSerializable =>
      const DartTypeReference('AWSSerializable', _url);

  /// Creates an [aws_common.AWSService] reference.
  DartTypeReference get awsService =>
      const DartTypeReference('AWSService', _url);

  /// Creates an [aws_common.AWSBaseHttpRequest] reference.
  DartTypeReference get awsBaseHttpRequest =>
      const DartTypeReference('AWSBaseHttpRequest', _url);

  /// Creates an [aws_common.AWSBaseHttpResponse] reference.
  DartTypeReference get awsBaseHttpResponse =>
      const DartTypeReference('AWSBaseHttpResponse', _url);

  /// Creates an [aws_common.AWSHttpRequest] reference.
  DartTypeReference get awsHttpRequest =>
      const DartTypeReference('AWSHttpRequest', _url);

  /// Creates an [aws_common.AWSStreamedHttpRequest] reference.
  DartTypeReference get awsStreamedHttpRequest =>
      const DartTypeReference('AWSStreamedHttpRequest', _url);

  /// Creates a secure [aws_common.uuid] instance.
  Expression uuid() => const DartTypeReference('uuid', _url).call([], {
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
  DartTypeReference get builtValue =>
      const DartTypeReference('BuiltValue', mainUrl);

  /// A [built_value.BuiltValueField] reference.
  DartTypeReference get builtValueField =>
      const DartTypeReference('BuiltValueField', mainUrl);

  /// A [built_value.BuiltValueHook] reference.
  DartTypeReference get builtValueHook =>
      const DartTypeReference('BuiltValueHook', mainUrl);

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
  /// For example, a key of [String] and value of [String] creates
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
  /// For example, a key of [String] and value of [String] creates
  /// a `BuiltSetMultimap<String, String>` which is the same a
  /// `Map<String, Set<String>>` when built.
  Reference builtSetMultimap(Reference key, Reference value) => TypeReference(
        (t) => t
          ..symbol = 'BuiltSetMultimap'
          ..url = collectionUrl
          ..types.addAll([key, value]),
      );

  /// Creates a [built_value_serializer.FullType] reference.
  DartTypeReference get fullType =>
      const DartTypeReference('FullType', serializerUrl);

  /// Creates a [built_value_json_object.JsonObject] reference.
  DartTypeReference get jsonObject =>
      const DartTypeReference('JsonObject', jsonUrl);

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
  DartTypeReference get newBuiltValueToStringHelper =>
      const DartTypeReference('newBuiltValueToStringHelper', mainUrl);

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
  DartTypeReference get serializers =>
      const DartTypeReference('Serializers', serializerUrl);
}

/// Access to various global values.
class _Globals {
  const _Globals();

  static const _celestGlobalsUrl = 'package:celest_core/src/util/globals.dart';

  /// Creates a [celest_globals.kIsWeb] reference.
  DartTypeReference get kIsWeb =>
      const DartTypeReference('kIsWeb', _celestGlobalsUrl);
}

/// `package:celest` types
class _Celest {
  const _Celest();

  static const _url = 'package:celest/celest.dart';
  static const _runtimeUrl = 'package:celest/src/runtime/serve.dart';

  /// Creates a [celest.BadRequestException] reference.
  DartTypeReference get badRequestException =>
      const DartTypeReference('BadRequestException', _url);

  /// Creates a [celest.BuildEnvironment] reference.
  DartTypeReference get buildEnvironment =>
      const DartTypeReference('BuildEnvironment', _url);

  /// Creates a [celest_runtime.celestEnv] reference.
  DartTypeReference get celestEnv =>
      const DartTypeReference('celestEnv', _runtimeUrl);

  /// Creates a [celest_core.CelestEnvironment] reference.
  DartTypeReference get celestEnvironment =>
      const DartTypeReference('CelestEnvironment', _url);

  /// Creates a [celest_runtime.CelestResponse] reference.
  DartTypeReference get celestResponse =>
      const DartTypeReference('CelestResponse', _runtimeUrl);

  /// Creates a [celest.CloudApi] reference.
  DartTypeReference get cloudApi => const DartTypeReference('CloudApi', _url);

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
  DartTypeReference get cloudWidget =>
      const DartTypeReference('CloudWidget', _url);

  /// Creates a [celest.EnvironmentVariable] reference.
  DartTypeReference get environmentVariable =>
      const DartTypeReference('EnvironmentVariable', _url);

  /// Creates a [celest.FunctionContext] reference.
  DartTypeReference get functionContext =>
      const DartTypeReference('FunctionContext', _url);

  /// Creates a [celest.InternalServerException] reference.
  DartTypeReference get internalServerException =>
      const DartTypeReference('InternalServerException', _url);

  /// Creates a [celest.JsonMap] reference.
  DartTypeReference get jsonMap => const DartTypeReference('JsonMap', _url);

  /// Creates a [celest_core.Serializer] reference.
  TypeReference serializer([Reference? dartType]) => TypeReference(
        (t) => t
          ..symbol = 'Serializer'
          ..url = _url
          ..types.addAll([
            if (dartType != null) dartType,
          ]),
      );

  /// Creates a [celest_core.SerializationException] reference.
  DartTypeReference get serializationException =>
      const DartTypeReference('SerializationException', _url);

  /// Creates a [celest_core.Serializers] reference.
  DartTypeReference get serializers =>
      const DartTypeReference('Serializers', _url);

  /// Creates a [celest_runtime.serve] reference.
  DartTypeReference get serve => const DartTypeReference('serve', _runtimeUrl);

  /// Creates a [celest_runtime.CloudFunctionTarget] reference.
  DartTypeReference get cloudFunctionTarget =>
      const DartTypeReference('CloudFunctionTarget', _runtimeUrl);
}

/// `dart:convert` types
class _Convert {
  const _Convert();

  static const _url = 'dart:convert';

  /// Creates a [convert.base64Decode] reference.
  DartTypeReference get base64Decode =>
      const DartTypeReference('base64Decode', _url);

  /// Creates a [convert.base64Encode] reference.
  DartTypeReference get base64Encode =>
      const DartTypeReference('base64Encode', _url);

  /// Creates a [convert.jsonEncode] reference.
  DartTypeReference get jsonEncode =>
      const DartTypeReference('jsonEncode', _url);

  /// Creates a [convert.jsonDecode] reference.
  DartTypeReference get jsonDecode =>
      const DartTypeReference('jsonDecode', _url);

  /// Creates a [convert.utf8] reference.
  DartTypeReference get utf8 => const DartTypeReference('utf8', _url);
}

/// `package:fixnum` types
class FixNum {
  const FixNum();

  static const url = 'package:fixnum/fixnum.dart';

  /// Creates an [Int64] reference.
  DartTypeReference get int64 => const DartTypeReference('Int64', url);
}

/// `package:functions_framework` types
class _FunctionsFramework {
  const _FunctionsFramework();

  static const _url = 'package:functions_framework/serve.dart';

  /// Creates a [functions_framework.serve] reference.
  DartTypeReference get serve => const DartTypeReference('serve', _url);
}

class _Http {
  const _Http();

  static const _url = 'package:http/http.dart';

  /// Creates a [http.BaseClient] reference.
  DartTypeReference get baseClient =>
      const DartTypeReference('BaseClient', _url);

  /// Creates a [http.Client] reference.
  DartTypeReference get client => const DartTypeReference('Client', _url);
}

/// `dart:io` types
class _Io {
  const _Io();

  static const _url = 'dart:io';

  /// Creates a [io.File] reference.
  DartTypeReference get file => const DartTypeReference('File', _url);

  /// Creates a [io.Platform] reference.
  DartTypeReference get platform => const DartTypeReference('Platform', _url);

  /// Creates a [io.stdout] reference.
  DartTypeReference get stdout => const DartTypeReference('stdout', _url);
}

/// `dart:isolate` types
class _Isolate {
  const _Isolate();

  static const _url = 'dart:isolate';

  /// Creates a [isolate.SendPort] reference.
  DartTypeReference get sendPort => const DartTypeReference('SendPort', _url);
}

/// `package:meta` types.
class _Meta {
  const _Meta();

  static const _url = 'package:meta/meta.dart';

  /// Creates a [meta.experimental] reference.
  DartTypeReference get experimental =>
      const DartTypeReference('experimental', _url);

  /// Creates a [meta.internal] reference.
  DartTypeReference get internal => const DartTypeReference('internal', _url);

  /// Creates a [meta.immutable] reference.
  DartTypeReference get immutable => const DartTypeReference('immutable', _url);
}

/// `package:path` types
class _Path {
  const _Path();

  static const _url = 'package:path/path.dart';

  /// Creates a [path.join] reference.
  DartTypeReference get join => const DartTypeReference('join', _url);
}

/// `package:shelf` types
class _Shelf {
  const _Shelf();

  static const _url = 'package:shelf/shelf.dart';

  /// Creates a [shelf.Handler] reference.
  DartTypeReference get handler => const DartTypeReference('Handler', _url);

  /// Creates a [shelf.Middleware] reference.
  DartTypeReference get middleware =>
      const DartTypeReference('Middleware', _url);

  /// Creates a [shelf.Pipeline] reference.
  DartTypeReference get pipeline => const DartTypeReference('Pipeline', _url);

  /// Creates a [shelf.Request] reference.
  DartTypeReference get request => const DartTypeReference('Request', _url);

  /// Creates a [shelf.Response] reference.
  DartTypeReference get response => const DartTypeReference('Response', _url);
}

/// `package:shelf_router` types
class ShelfRouter {
  const ShelfRouter();

  static const url = 'package:shelf_router/shelf_router.dart';

  /// Creates a [shelf_router.Route] reference.
  DartTypeReference get route => const DartTypeReference('Route', url);

  /// Creates a [shelf_router.Router] reference.
  DartTypeReference get router => const DartTypeReference('Router', url);
}

/// `package:test` types
class _Test {
  const _Test();

  static const _url = 'package:test/test.dart';

  /// Creates an `test` reference.
  DartTypeReference get test => const DartTypeReference('test', _url);
}

/// `dart:typed_data` types
class _TypedData {
  const _TypedData();

  static const _url = 'dart:typed_data';

  /// Creates a [Uint8List] reference.
  DartTypeReference get uint8List => const DartTypeReference(
        'Uint8List',
        _url,
        'dart:core#String',
      );
}

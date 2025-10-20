// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart' as built_collection;
import 'package:built_value/built_value.dart' as built_value;
import 'package:built_value/json_object.dart' as built_value_json_object;
import 'package:built_value/serializer.dart' as built_value_serializer;
import 'package:celest/celest.dart' as celest;
import 'package:celest/src/runtime/serve.dart' as celest_runtime;
import 'package:celest_auth/celest_auth.dart' as celest_auth;
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_core/celest_core.dart' as celest_core;
import 'package:celest_core/src/util/globals.dart' as celest_globals;
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart' as collection;
import 'package:fixnum/fixnum.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:libcoder/libcoder.dart' as libcoder;
import 'package:meta/meta.dart' as meta;
import 'package:native_storage/native_storage.dart' as native_storage;
import 'package:path/path.dart' as path;
import 'package:shelf/shelf.dart' as shelf;

final class DartTypeReference extends Reference {
  const DartTypeReference(super.symbol, [super.url, this.wireType]);

  String get typeUri => '$url#$symbol';
  final Reference? wireType;

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

  /// `package:built_value` types.
  static const builtValue = BuiltValueType._();

  /// `package:celest` types.
  static const celest = _Celest();

  /// `package:celest_auth` types.
  static const celestAuth = _CelestAuth();

  /// `package:collection` types.
  static const collection = _Collection();

  /// `dart:convert` types.
  static const convert = _Convert();

  /// `package:cross_file` types.
  static const crossFile = _XFile();

  /// `package:drift` types.
  static const drift = _Drift();

  /// `package:fixnum` types.
  static const fixNum = FixNum();

  /// `package:flutter` types.
  static const flutter = _Flutter();

  /// `package:functions_framework` types.
  static const functionsFramework = _FunctionsFramework();

  /// Access to various global values.
  static const globals = _Globals();

  /// `package:http` types.
  static const http = _Http();

  /// `package:http_parser` types.
  static const httpParser = _HttpParser();

  /// `dart:io` types.
  static const io = _Io();

  /// `dart:isolate` types.
  static const isolate = _Isolate();

  /// `package:libcoder` types.
  static const libcoder = _Libcoder();

  /// `package:meta` types.
  static const meta = _Meta();

  /// `package:native_storage` types.
  static const nativeStorage = _NativeStorage();

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
  DartTypeReference get bigInt => DartTypeReference('BigInt', _url, string);

  /// Creates a [bool] reference.
  DartTypeReference get bool => const DartTypeReference('bool', _url);

  /// Creates a [ConcurrentModificationError] reference.
  DartTypeReference get concurrentModificationError =>
      const DartTypeReference('ConcurrentModificationError', _url);

  /// Creates a [DateTime] reference.
  DartTypeReference get dateTime => DartTypeReference('DateTime', _url, string);

  /// Creates a [Deprecated] reference.
  DartTypeReference get deprecated =>
      const DartTypeReference('Deprecated', _url);

  /// Creates a [double] reference.
  DartTypeReference get double => const DartTypeReference('double', _url);

  /// Creates a [Duration] reference.
  DartTypeReference get duration =>
      DartTypeReference('Duration', _url, map(string, object.nullable));

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
  Reference future([Reference? ref]) => TypeReference(
    (t) => t
      ..symbol = 'Future'
      ..url = _url
      ..types.addAll([if (ref != null) ref]),
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
      ..types.addAll([if (ref != null) ref]),
  );

  /// Creates a [List] reference.
  Reference list([Reference? ref]) => TypeReference(
    (t) => t
      ..symbol = 'List'
      ..url = _url
      ..types.addAll([if (ref != null) ref]),
  );

  /// Creates a [Map] reference.
  Reference map([Reference? key, Reference? value]) => TypeReference(
    (t) => t
      ..symbol = 'Map'
      ..url = _url
      ..types.addAll([
        if (key != null) key,
        if (key != null && value != null) value,
      ]),
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
  DartTypeReference get regExp => DartTypeReference('RegExp', _url, string);

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
  DartTypeReference get stackTrace =>
      DartTypeReference('StackTrace', _url, string);

  /// Create a [StateError] reference.
  DartTypeReference get stateError =>
      const DartTypeReference('StateError', _url);

  /// Creates a [Stream] reference.
  Reference stream([Reference? ref]) => TypeReference(
    (t) => t
      ..symbol = 'Stream'
      ..url = _url
      ..types.addAll([if (ref != null) ref]),
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
  DartTypeReference get uri => DartTypeReference('Uri', _url, string);

  /// Creates a [UriData] reference.
  DartTypeReference get uriData => DartTypeReference('UriData', _url, string);

  /// Creates a `void` reference.
  DartTypeReference get void$ => const DartTypeReference('void', _url);
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
  static const _coreUrl = 'package:celest_core/celest_core.dart';
  static const _runtimeUrl = 'package:celest/src/runtime/serve.dart';
  static const _contextUrl = 'package:celest/src/core/context.dart';

  /// Creates a [celest_runtime.AuthMiddleware] reference.
  DartTypeReference get authMiddleware =>
      const DartTypeReference('AuthMiddleware', _runtimeUrl);

  /// Creates a [celest.BadRequestException] reference.
  DartTypeReference get badRequestException =>
      const DartTypeReference('BadRequestException', _coreUrl);

  /// Creates a [celest.CloudApi] reference.
  DartTypeReference get cloudApi => const DartTypeReference('CloudApi', _url);

  /// Creates a [celest.CloudException] reference.
  DartTypeReference get cloudException =>
      const DartTypeReference('CloudException', _coreUrl);

  /// Creates a [celest.CloudFunction] reference.
  Reference get cloudFunction => const DartTypeReference('CloudFunction', _url);

  /// Creates a [celest.CloudWidget] reference.
  DartTypeReference get cloudWidget =>
      const DartTypeReference('CloudWidget', _url);

  /// Creates a [celest.Context] reference.
  DartTypeReference get context =>
      const DartTypeReference('Context', _contextUrl);

  /// Creates a [celest.Environment] reference.
  DartTypeReference get environment =>
      const DartTypeReference('Environment', _url);

  /// Creates a [celest.env] reference.
  DartTypeReference get environmentVariable =>
      const DartTypeReference('env', _url);

  /// Creates a [celest.secret] reference.
  DartTypeReference get secret => const DartTypeReference('secret', _url);

  /// Creates a [celest_runtime.FirebaseAuthMiddleware] reference.
  DartTypeReference get firebaseAuthMiddleware =>
      const DartTypeReference('FirebaseAuthMiddleware', _runtimeUrl);

  /// Creates a [celest_core.InternalServerError] reference.
  DartTypeReference get internalServerError =>
      const DartTypeReference('InternalServerError', _coreUrl);

  /// Creates a [celest_core.JsonList] reference.
  DartTypeReference get jsonList =>
      const DartTypeReference('JsonList', _coreUrl);

  /// Creates a [celest_core.JsonMap] reference.
  DartTypeReference get jsonMap => const DartTypeReference('JsonMap', _coreUrl);

  /// Creates a [celest_core.JsonValue] reference.
  DartTypeReference get jsonValue =>
      const DartTypeReference('JsonValue', _coreUrl);

  /// Creates a [celest_core.JsonUtf8] reference.
  DartTypeReference get jsonUtf8 =>
      const DartTypeReference('JsonUtf8', _coreUrl);

  /// Creates a [celest_runtime.Middleware] reference.
  DartTypeReference get middleware =>
      const DartTypeReference('Middleware', _runtimeUrl);

  /// Creates a [celest_core.Serializer] reference.
  TypeReference serializer([Reference? dartType]) => TypeReference(
    (t) => t
      ..symbol = 'Serializer'
      ..url = _coreUrl
      ..types.addAll([if (dartType != null) dartType]),
  );

  /// Creates a [celest_core.SerializationException] reference.
  DartTypeReference get serializationException =>
      const DartTypeReference('SerializationException', _coreUrl);

  /// Creates a [celest_core.Serializers] reference.
  DartTypeReference get serializers =>
      const DartTypeReference('Serializers', _coreUrl);

  /// Creates a [celest_runtime.SupabaseAuthMiddleware] reference.
  DartTypeReference get supabaseAuthMiddleware =>
      const DartTypeReference('SupabaseAuthMiddleware', _runtimeUrl);

  /// Creates a [celest_core.TypeToken] reference.
  DartTypeReference get typeToken =>
      const DartTypeReference('TypeToken', _coreUrl);

  /// Creates a [celest_runtime.serve] reference.
  DartTypeReference get serve => const DartTypeReference('serve', _runtimeUrl);

  /// Creates a [celest_runtime.CloudFunctionTarget] reference.
  DartTypeReference get cloudFunctionTarget =>
      const DartTypeReference('CloudFunctionTarget', _runtimeUrl);

  /// Creates a [celest_runtime.CloudFunctionHttpTarget] reference.
  DartTypeReference get cloudFunctionHttpTarget =>
      const DartTypeReference('CloudFunctionHttpTarget', _runtimeUrl);

  /// Creates a [celest_runtime.CloudEventSourceTarget] reference.
  DartTypeReference get cloudEventSourceTarget =>
      const DartTypeReference('CloudEventSourceTarget', _runtimeUrl);

  /// Creates a `context` reference.
  DartTypeReference get globalContext =>
      const DartTypeReference('context', _contextUrl);

  /// Creates a `ContextKey` reference.
  DartTypeReference get contextKey =>
      const DartTypeReference('ContextKey', _contextUrl);
}

/// `package:celest_auth` types
class _CelestAuth {
  const _CelestAuth();

  static const _url = 'package:celest_auth/celest_auth.dart';

  /// Creates a [celest_auth.AuthProviderType] reference.
  DartTypeReference get authProviderType =>
      const DartTypeReference('AuthProviderType', _url);

  /// Creates a [celest_auth.TokenSource] reference.
  DartTypeReference get tokenSource =>
      const DartTypeReference('TokenSource', _url);
}

class _Collection {
  const _Collection();

  static const _url = 'package:collection/collection.dart';

  /// Creates a [collection.DelegatingList] reference.
  TypeReference delegatingList(TypeReference elementType) => TypeReference(
    (t) => t
      ..symbol = 'DelegatingList'
      ..url = _url
      ..types.add(elementType),
  );

  /// Creates a [collection.DelegatingMap] reference.
  TypeReference delegatingMap(Reference keyType, Reference valueType) =>
      TypeReference(
        (t) => t
          ..symbol = 'DelegatingMap'
          ..url = _url
          ..types.addAll([keyType, valueType]),
      );

  /// Creates a [collection.DelegatingSet] reference.
  TypeReference delegatingSet(TypeReference elementType) => TypeReference(
    (t) => t
      ..symbol = 'DelegatingSet'
      ..url = _url
      ..types.add(elementType),
  );
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

  /// Creates a [convert.json] reference.
  DartTypeReference get json => const DartTypeReference('json', _url);

  /// Creates a [convert.jsonEncode] reference.
  DartTypeReference get jsonEncode =>
      const DartTypeReference('jsonEncode', _url);

  /// Creates a [convert.JsonUtf8Encoder] reference.
  DartTypeReference get jsonUtf8Encoder =>
      const DartTypeReference('JsonUtf8Encoder', _url);

  /// Creates a [convert.jsonDecode] reference.
  DartTypeReference get jsonDecode =>
      const DartTypeReference('jsonDecode', _url);

  /// Creates a [convert.utf8] reference.
  DartTypeReference get utf8 => const DartTypeReference('utf8', _url);
}

/// `package:drift` types
class _Drift {
  const _Drift();
  DartTypeReference get queryExecutor => const DartTypeReference(
    'QueryExecutor',
    'package:drift/src/runtime/executor/executor.dart',
  );
  DartTypeReference get generatedDatabase => const DartTypeReference(
    'GeneratedDatabase',
    'package:drift/src/runtime/api/runtime_api.dart',
  );
  DartTypeReference get nativeDatabase =>
      const DartTypeReference('NativeDatabase', 'package:drift/native.dart');
  DartTypeReference get hranaDatabase => const DartTypeReference(
    'HranaDatabase',
    'package:drift_hrana/drift_hrana.dart',
  );
}

/// `package:libcoder` types
class _Libcoder {
  const _Libcoder();

  static const _url = 'package:libcoder/libcoder.dart';

  /// Creates a [libcoder.coder] reference.
  TypeReference get coder$ => TypeReference(
    (t) => t
      ..symbol = 'coder'
      ..url = _url,
  );

  /// Creates a [libcoder.Decoder] reference.
  TypeReference decoder([Reference? valueType]) => TypeReference(
    (t) => t
      ..symbol = 'Decoder'
      ..url = _url
      ..types.addAll([if (valueType != null) valueType]),
  );

  /// Creates a [libcoder.Encoder] reference.
  TypeReference encoder([Reference? valueType]) => TypeReference(
    (t) => t
      ..symbol = 'Encoder'
      ..url = _url
      ..types.addAll([if (valueType != null) valueType]),
  );

  /// Creates a [libcoder.GlobalCoder] reference.
  TypeReference get globalCoder => TypeReference(
    (t) => t
      ..symbol = 'GlobalCoder'
      ..url = _url,
  );

  /// Creates a [libcoder.CoderConfig] reference.
  TypeReference coderConfig([Reference? valueType]) => TypeReference(
    (t) => t
      ..symbol = 'CoderConfig'
      ..url = _url
      ..types.addAll([if (valueType != null) valueType]),
  );

  /// Creates a [libcoder.Coder] reference.
  TypeReference coderProtocol([Reference? valueType]) => TypeReference(
    (t) => t
      ..symbol = 'Coder'
      ..url = _url
      ..types.addAll([if (valueType != null) valueType]),
  );

  /// Creates a [libcoder.FormFieldsEncoder] reference.
  TypeReference get formFieldsEncoder => TypeReference(
    (t) => t
      ..symbol = 'FormFieldsEncoder'
      ..url = _url,
  );

  /// Creates a [libcoder.Typeref] reference.
  TypeReference typeref([Reference? valueType]) => TypeReference(
    (t) => t
      ..symbol = 'Typeref'
      ..url = _url
      ..types.addAll([if (valueType != null) valueType]),
  );
}

/// `package:flutter` types
class _Flutter {
  const _Flutter();

  static const _servicesUrl = 'package:flutter/services.dart';
  static const _dartUiUrl = 'dart:ui';

  /// Creates a [flutter.RootIsolateToken] reference.
  DartTypeReference get rootIsolateToken =>
      const DartTypeReference('RootIsolateToken', _dartUiUrl);

  /// Creates a [flutter.ServicesBinding] reference.
  DartTypeReference get servicesBiding =>
      const DartTypeReference('ServicesBinding', _servicesUrl);

  /// Creates a [flutter.BackgroundIsolateBinaryMessenger] reference.
  DartTypeReference get backgroundIsolateBinaryMessenger =>
      const DartTypeReference('BackgroundIsolateBinaryMessenger', _servicesUrl);
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

  /// Creates a [http.BaseResponse] reference.
  DartTypeReference get baseResponse =>
      const DartTypeReference('BaseResponse', _url);

  /// Creates a [http.MultipartFile] reference.
  DartTypeReference get multipartFile =>
      const DartTypeReference('MultipartFile', _url);

  /// Creates a [http.MultipartRequest] reference.
  DartTypeReference get multipartRequest =>
      const DartTypeReference('MultipartRequest', _url);

  /// Creates a [http.Request] reference.
  DartTypeReference get request => const DartTypeReference('Request', _url);

  /// Creates a [http.Response] reference.
  DartTypeReference get response => const DartTypeReference('Response', _url);

  /// Creates a [http.StreamedRequest] reference.
  DartTypeReference get streamedRequest =>
      const DartTypeReference('StreamedRequest', _url);

  /// Creates a [http.StreamedResponse] reference.
  DartTypeReference get streamedResponse =>
      const DartTypeReference('StreamedResponse', _url);
}

class _HttpParser {
  const _HttpParser();

  static const _url = 'package:http_parser/http_parser.dart';

  /// Creates a [http_parser.MediaType] reference.
  DartTypeReference get mediaType => const DartTypeReference('MediaType', _url);
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

  /// Creates an [isolate.Isolate] reference.
  Reference get isolate => TypeReference(
    (t) => t
      ..symbol = 'Isolate'
      ..url = _url,
  );

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

  /// Creates a [meta.visibleForTesting] reference.
  DartTypeReference get visibleForTesting =>
      const DartTypeReference('visibleForTesting', _url);
}

/// `package:native_storage` types
class _NativeStorage {
  const _NativeStorage();

  static const _url = 'package:native_storage/native_storage.dart';

  /// Creates a [native_storage.NativeStorage] reference.
  DartTypeReference get nativeStorage =>
      const DartTypeReference('NativeStorage', _url);
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
  DartTypeReference get uint8List =>
      DartTypeReference('Uint8List', _url, DartTypes.core.string);
}

class _XFile {
  const _XFile();

  static const _url = 'package:cross_file/cross_file.dart';

  /// Creates a [cross_file.XFile] reference.
  DartTypeReference get xFile => const DartTypeReference('XFile', _url);
}

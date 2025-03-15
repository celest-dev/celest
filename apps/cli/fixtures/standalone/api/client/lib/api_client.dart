// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:io';

import 'package:api_client/src/functions.dart';
import 'package:api_client/src/serializers.dart';
import 'package:celest_core/_internal.dart' as _$celest;
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/util/globals.dart' as _$celest;
import 'package:http/http.dart' as _$http_http;
import 'package:native_storage/native_storage.dart'
    as _$native_storage_native_storage;

export 'package:celest_backend/exceptions/demo.dart' show BadNameException;
export 'package:celest_backend/exceptions/exceptions.dart'
    show
        CustomError,
        CustomErrorToFromJson,
        CustomErrorWithStackTrace,
        CustomException,
        CustomExceptionToFromJson;
export 'package:celest_backend/exceptions/overrides.dart'
    show OverriddenException;
export 'package:celest_backend/models/classes.dart'
    show
        DefaultValues,
        Empty,
        Fields,
        FromJsonAndToJson,
        FromJsonStatic,
        MixedFields,
        NamedFields,
        NestedClass,
        NonMapFromAndToJson,
        NonMapToJson,
        NonMapToJsonWithDefaults,
        OnlyFromJson,
        OnlyToJson,
        OnlyToJsonWithDefaults;
export 'package:celest_backend/models/cycles.dart'
    show Node, Parent, SelfReferencing;
export 'package:celest_backend/models/demo.dart' show Person;
export 'package:celest_backend/models/exceptions.dart'
    show SupportedErrorType, SupportedExceptionType;
export 'package:celest_backend/models/extension_types.dart'
    show
        Color,
        ColorX,
        ColorXFromJson,
        ColorXFromJsonImpl,
        ColorXFromJsonStatic,
        ColorXImpl,
        ColorXToFromJson,
        ColorXToJson,
        ColorXToJsonImpl,
        StringX,
        StringXFromJson,
        StringXFromJsonImpl,
        StringXFromJsonStatic,
        StringXImpl,
        StringXPrivateCtor,
        StringXPrivateCtorImpl,
        StringXPrivateField,
        StringXPrivateFieldImpl,
        StringXToFromJson,
        StringXToJson,
        StringXToJsonImpl,
        Value,
        ValueX,
        ValueXFromJson,
        ValueXFromJsonImpl,
        ValueXFromJsonStatic,
        ValueXImpl,
        ValueXToFromJson,
        ValueXToJson,
        ValueXToJsonImpl;
export 'package:celest_backend/models/generic_wrappers.dart'
    show GenericWrappers;
export 'package:celest_backend/models/metadata.dart'
    show Exportable, LiteralEnum, Serializable;
export 'package:celest_backend/models/overrides.dart'
    show NestedChild, NestedGrandparent, NestedParent;
export 'package:celest_backend/models/parameter_types.dart'
    show ComplexClass, ComplexStruct, MyEnum, SimpleClass, SimpleStruct;
export 'package:celest_backend/models/records.dart'
    show NamedFieldsRecord, Nested, NullableNested;
export 'package:celest_backend/models/sealed_classes.dart'
    show
        Circle,
        CircleWithOverriddenCustomJson,
        OkResult,
        OkShapeResult,
        Rectangle,
        RectangleWithOverriddenCustomJson,
        Result,
        Shape,
        ShapeWithOverriddenCustomJson,
        SwappedResult;
export 'package:celest_backend/models/typedefs.dart' show Portfolio;

final Celest celest = Celest();

enum CelestEnvironment {
  local,
  production;

  Uri get baseUri => switch (this) {
    local =>
      _$celest.kIsWeb || !Platform.isAndroid
          ? Uri.parse('http://localhost:7777')
          : Uri.parse('http://10.0.2.2:7777'),
    production => Uri.parse('https://example.celest.run'),
  };
}

class Celest with _$celest.CelestBase {
  var _initialized = false;

  late CelestEnvironment _currentEnvironment;

  late final _$native_storage_native_storage.NativeStorage nativeStorage =
      _$native_storage_native_storage.NativeStorage(scope: 'celest');

  @override
  late _$http_http.Client httpClient = _$celest.CelestHttpClient(
    secureStorage: nativeStorage.secure,
  );

  late Uri _baseUri;

  final _functions = CelestFunctions();

  T _checkInitialized<T>(T Function() value) {
    if (!_initialized) {
      throw StateError(
        'Celest has not been initialized. Make sure to call `celest.init()` at the start of your `main` method.',
      );
    }
    return value();
  }

  CelestEnvironment get currentEnvironment =>
      _checkInitialized(() => _currentEnvironment);

  @override
  Uri get baseUri => _checkInitialized(() => _baseUri);

  CelestFunctions get functions => _checkInitialized(() => _functions);

  void init({
    CelestEnvironment environment = CelestEnvironment.local,
    _$celest.Serializers? serializers,
  }) {
    _currentEnvironment = environment;
    _baseUri = environment.baseUri;
    if (!_initialized) {
      initSerializers(serializers: serializers);
    }
    _initialized = true;
  }
}

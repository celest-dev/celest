// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async';
import 'dart:io';

import 'package:celest_core/_internal.dart' as _$celest;
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/util/globals.dart' as _$celest;
import 'package:firebase_test_client/src/auth.dart';
import 'package:firebase_test_client/src/functions.dart';
import 'package:firebase_test_client/src/serializers.dart';
import 'package:http/http.dart' as _$http_http;
import 'package:native_storage/native_storage.dart'
    as _$native_storage_native_storage;

export 'package:celest_auth/celest_auth.dart';
export 'src/auth.dart';

final Celest celest = Celest();

enum CelestEnvironment {
  local;

  Uri get baseUri => switch (this) {
        local => _$celest.kIsWeb || !Platform.isAndroid
            ? Uri.parse('http://localhost:53733')
            : Uri.parse('http://10.0.2.2:53733'),
      };
}

class Celest with _$celest.CelestBase {
  var _initialized = false;

  late CelestEnvironment _currentEnvironment;

  late final _$native_storage_native_storage.NativeStorage nativeStorage =
      _$native_storage_native_storage.NativeStorage(scope: 'celest');

  @override
  late _$http_http.Client httpClient =
      _$celest.CelestHttpClient(secureStorage: nativeStorage.secure);

  late Uri _baseUri;

  final _functions = CelestFunctions();

  late final CelestAuth _auth = CelestAuth(
    this,
    storage: nativeStorage,
  );

  T _checkInitialized<T>(T Function() value) {
    if (!_initialized) {
      throw StateError(
          'Celest has not been initialized. Make sure to call `celest.init()` at the start of your `main` method.');
    }
    return value();
  }

  CelestEnvironment get currentEnvironment =>
      _checkInitialized(() => _currentEnvironment);

  @override
  Uri get baseUri => _checkInitialized(() => _baseUri);

  CelestFunctions get functions => _checkInitialized(() => _functions);

  CelestAuth get auth => _checkInitialized(() => _auth);

  void init({
    CelestEnvironment environment = CelestEnvironment.local,
    _$celest.Serializers? serializers,
    ExternalAuth? externalAuth,
  }) {
    if (_initialized && environment != _currentEnvironment) {
      _auth.signOut();
    }
    _currentEnvironment = environment;
    _baseUri = environment.baseUri;
    scheduleMicrotask(() => _auth.init(externalAuth: externalAuth));
    if (!_initialized) {
      initSerializers(serializers: serializers);
    }
    _initialized = true;
  }
}

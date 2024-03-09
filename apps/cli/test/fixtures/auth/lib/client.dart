// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _$async;
import 'dart:io' as _$io;

import 'package:celest_core/_internal.dart';
import 'package:celest_core/src/util/globals.dart';
import 'package:http/http.dart' as _$http;

import 'src/client/auth.dart';
import 'src/client/functions.dart';
import 'src/client/serializers.dart';

export 'package:celest_auth/celest_auth.dart';

final Celest celest = Celest();

enum CelestEnvironment {
  local,
  production;

  Uri get baseUri => switch (this) {
        local => kIsWeb || !_$io.Platform.isAndroid
            ? Uri.parse('http://localhost:7777')
            : Uri.parse('http://10.0.2.2:7777'),
        production => Uri.parse('https://example.celest.run'),
      };
}

class Celest with CelestBase {
  var _initialized = false;

  late CelestEnvironment _currentEnvironment;

  late final SecureStorage _secureStorage = SecureStorage();

  @override
  late _$http.Client httpClient =
      CelestHttpClient(secureStorage: _secureStorage);

  late Uri _baseUri;

  final _functions = CelestFunctions();

  late final CelestAuth _auth = CelestAuth(
    this,
    secureStorage: _secureStorage,
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

  void init({CelestEnvironment environment = CelestEnvironment.local}) {
    if (_initialized && environment != _currentEnvironment) {
      _auth.signOut();
    }
    _currentEnvironment = environment;
    _baseUri = environment.baseUri;
    _$async.scheduleMicrotask(_auth.init);
    if (!_initialized) {
      initSerializers();
    }
    _initialized = true;
  }
}

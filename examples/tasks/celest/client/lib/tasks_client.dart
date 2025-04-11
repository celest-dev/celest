// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:io';

import 'package:celest_core/_internal.dart' as _$celest;
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/util/globals.dart' as _$celest;
import 'package:http/http.dart' as _$http_http;
import 'package:native_storage/native_storage.dart'
    as _$native_storage_native_storage;
import 'package:tasks_client/src/functions.dart';
import 'package:tasks_client/src/serializers.dart';

export 'package:celest_backend/src/database/task_database.dart'
    show Priority, Task;
export 'package:celest_backend/src/functions/tasks.dart' show ServerException;

final Celest celest = Celest();

enum CelestEnvironment {
  local,
  production;

  Uri get baseUri => switch (this) {
        local => _$celest.kIsWeb || !Platform.isAndroid
            ? Uri.parse('http://localhost:7777')
            : Uri.parse('http://10.0.2.2:7777'),
        production => Uri.parse('https://tasks-694b15.fly.dev'),
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

  void init({
    CelestEnvironment environment = CelestEnvironment.local,
    _$celest.Serializers? serializers,
  }) {
    if (_initialized) {
      _reset();
    }
    _currentEnvironment = environment;
    _baseUri = environment.baseUri;
    initSerializers(serializers: serializers);
    _initialized = true;
  }

  void _reset() {
    _initialized = false;
  }
}

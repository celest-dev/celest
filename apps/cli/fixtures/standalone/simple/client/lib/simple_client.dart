// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:io';

import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/util/globals.dart' as _$celest;

final Celest celest = Celest();

enum CelestEnvironment {
  local,
  production;

  Uri get baseUri => switch (this) {
        local => _$celest.kIsWeb || !Platform.isAndroid
            ? Uri.parse('http://localhost:7777')
            : Uri.parse('http://10.0.2.2:7777'),
        production => Uri.parse('https://example.celest.run'),
      };
}

class Celest {
  var _initialized = false;

  late CelestEnvironment _currentEnvironment;

  T _checkInitialized<T>(T Function() value) {
    if (!_initialized) {
      throw StateError(
          'Celest has not been initialized. Make sure to call `celest.init()` at the start of your `main` method.');
    }
    return value();
  }

  CelestEnvironment get currentEnvironment =>
      _checkInitialized(() => _currentEnvironment);

  void init({
    CelestEnvironment environment = CelestEnvironment.local,
    _$celest.Serializers? serializers,
  }) {
    _currentEnvironment = environment;
    _initialized = true;
  }
}

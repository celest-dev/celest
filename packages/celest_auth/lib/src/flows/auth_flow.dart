@internal
library;

import 'dart:async';

import 'package:celest_auth/src/state/auth_state.dart';
import 'package:meta/meta.dart';

/// Base type for all authentication flows.
abstract interface class AuthFlow {
  void cancel();
}

final class AuthFlowController {
  AuthFlowController(this._sink);

  final StreamSink<AuthState> _sink;
  var _isClosed = false;

  Future<R> capture<R extends AuthState>(
    Future<R> Function() action,
  ) async {
    try {
      final result = await action();
      if (!_isClosed) {
        _sink.add(result);
      }
      return result;
    } on Object catch (e, st) {
      if (!_isClosed) {
        _sink.addError(e, st);
      }
      rethrow;
    }
  }

  void cancel() {
    if (_isClosed) {
      return;
    }
    _isClosed = true;
    _sink.close();
  }
}

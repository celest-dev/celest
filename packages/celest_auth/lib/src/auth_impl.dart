import 'dart:async';
import 'dart:convert';

import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/flows/idp_flow.dart';
import 'package:celest_auth/src/model/cloud_interop.dart';
import 'package:celest_auth/src/model/initial_uri.dart';
import 'package:celest_auth/src/version.dart';
import 'package:celest_cloud/celest_cloud.dart' as celest_cloud;
import 'package:celest_core/_internal.dart';
import 'package:celest_core/celest_core.dart';
import 'package:native_authentication/native_authentication.dart';
import 'package:native_storage/native_storage.dart';
import 'package:stream_transform/stream_transform.dart';

export 'flows/email_flow.dart';
export 'flows/idp_flow.dart';

final class AuthImpl implements Auth {
  AuthImpl(
    this.celest, {
    NativeStorage? storage,
    celest_cloud.CelestCloud? cloud,
  }) : _storage = (storage ?? celest.nativeStorage).scoped('/celest/auth') {
    this.cloud = cloud ??
        celest_cloud.CelestCloud(
          authenticator: Authenticator(
            secureStorage: _storage.secure,
            onRevoke: signOut,
          ),
          uri: celest.baseUri,
          httpClient: celest.httpClient,
          userAgent: 'celest/$packageVersion',
        );
  }

  AuthState? _authState;

  @override
  Stream<AuthState> get authStateChanges {
    final stream = _authStateController.stream;
    if (_authState case final currentState?) {
      return stream.startWith(currentState);
    }
    return stream;
  }

  final StreamController<AuthState> _authStateController =
      StreamController.broadcast();

  StreamSubscription<AuthState>? _authStateSubscription;
  StreamSubscription<AuthState>? _authFlowSubscription;

  @override
  Future<AuthState> init() {
    return _init ??= Future.sync(() async {
      _authStateSubscription =
          _authStateController.stream.listen((state) => _authState = state);
      final initialState = await _initialState.onError((e, st) {
        return const Unauthenticated();
      });
      _authStateController.add(initialState);
      return initialState;
    });
  }

  Future<AuthState> get _initialState async {
    var initialState = await _hydrateSession();
    if (initialState != null) {
      return initialState;
    }
    if (localStorage.read('userId') == null) {
      _reset();
      return const Unauthenticated();
    }
    try {
      final user = await cloud.users.get('users/me');
      initialState = Authenticated(user: user.toCelest());
    } on UnauthorizedException {
      initialState = const Unauthenticated();
      _reset();
    } on NotFoundException {
      initialState = const Unauthenticated();
      _reset();
    }
    return initialState;
  }

  Future<AuthState?> _hydrateSession() async {
    final pendingSessionId = localStorage.read('pendingSessionId');
    if (pendingSessionId == null) {
      return null;
    }
    try {
      final pendingSessionStateJson =
          await secureStorage.read('session/$pendingSessionId');
      if (pendingSessionStateJson == null) {
        return null;
      }
      final pendingSessionState = celest_cloud.SessionState.fromJson(
        jsonDecode(pendingSessionStateJson) as Map<String, dynamic>,
      );
      final callbackUri = initialUri;
      if (callbackUri == null ||
          pendingSessionState is! celest_cloud.IdpSessionAuthorize) {
        return null;
      }
      final result = await cloud.authentication.idp.postRedirect(
        state: pendingSessionState,
        redirectUri: callbackUri,
      );
      return result.toCelest(hub: this, sink: _authStateController.sink);
    } finally {
      localStorage.delete('pendingSessionId');
      secureStorage.delete('session/$pendingSessionId').ignore();
    }
  }

  Future<AuthState>? _init;

  Future<AuthFlowController> requestFlow() async {
    final authState = _authState ?? await init();
    switch (authState) {
      case AuthFlowInProgress():
        throw Exception('Auth flow already in progress');
      case Authenticated():
        throw Exception(
          'User is already authenticated. Sign out before continuing.',
        );
      case Unauthenticated():
        unawaited(_authFlowSubscription?.cancel());
        final previousState = authState;
        final controller = StreamController<AuthState>(
          sync: true,
          onCancel: () => _authStateController.add(previousState),
        );
        _authFlowSubscription = controller.stream.listen(
          _authStateController.add,
          onError: (Object error, StackTrace stackTrace) {
            _authStateController.addError(error, stackTrace);
            controller.close().ignore();
          },
          onDone: () => _authFlowSubscription = null,
          cancelOnError: true,
        );
        return AuthFlowController(controller);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await cloud.authentication.endSession(null);
    } on Object {
      // TODO(dnys1): Log error
    } finally {
      _reset();
      if (!_authStateController.isClosed) {
        _authStateController.add(const Unauthenticated());
      }
    }
  }

  void _reset() {
    localStorage.delete('userId');
    secureStorage.delete('cork').ignore();
  }

  final CelestBase celest;
  late final celest_cloud.CelestCloud cloud;
  final NativeAuthentication nativeAuth = NativeAuthentication();
  final NativeStorage _storage;

  NativeStorage get localStorage => _storage;
  IsolatedNativeStorage get secureStorage => _storage.secure.isolated;

  Future<void> close() async {
    await _authStateSubscription?.cancel();
    await _authFlowSubscription?.cancel();
    await _authStateController.close();
    localStorage.close();
    await secureStorage.close();
  }
}

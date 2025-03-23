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
export 'flows/sms_flow.dart';

final class AuthImpl implements Auth {
  AuthImpl(
    this.celest, {
    NativeStorage? storage,
    celest_cloud.CelestCloud? cloud,
    this.authProviders = const [],
  }) : _storage = (storage ?? celest.nativeStorage).scoped('/celest/auth') {
    this.cloud = cloud ??
        celest_cloud.CelestCloud(
          authenticator: Authenticator(
            secureStorage: _storage.secure,
            onRevoke: _revokeSession,
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

  final Map<AuthProviderType, StreamSubscription<void>> _authProviderSubs = {};

  @override
  Future<AuthState> init({
    TokenSource? externalAuth,
  }) {
    return _init ??= Future.sync(() async {
      _authStateSubscription =
          _authStateController.stream.listen((state) => _authState = state);
      final initialState = await _initialState(externalAuth: externalAuth)
          .onError((e, st) => const Unauthenticated());
      _authStateController.add(initialState);
      return initialState;
    });
  }

  void _subscribeToExternalAuth(
    AuthProviderType type,
    Stream<String?> tokenSource,
  ) {
    if (_authProviderSubs.containsKey(type)) {
      throw StateError('Internal error. Duplicate auth provider subscription');
    }
    _authProviderSubs[type] = tokenSource.listen(
      (token) async {
        if (token == null) {
          _revokeSession();
          return;
        }
        await secureStorage.write('cork', token);
        if (_authState is! Authenticated) {
          final user = await cloud.users.get('users/me');
          _authStateController.add(Authenticated(user: user.toCelest()));
        }
      },
      onError: _authStateController.addError,
      cancelOnError: false,
    );
  }

  Future<AuthState> _initialState({
    TokenSource? externalAuth,
  }) async {
    if (externalAuth != null) {
      _subscribeToExternalAuth(externalAuth.provider, externalAuth);
    } else if (authProviders.isNotEmpty) {
      final provider = authProviders.first;
      throw StateError(
        'Celest Auth is configured to use external auth, but no token '
        'source was provided. Provide a token source by calling '
        '`celest.init(externalAuth: ExternalAuthProvider.${provider.name}(...))`.',
      );
    }
    var initialState = await _hydrateSession();
    if (initialState != null) {
      return initialState;
    }
    if (localStorage.read('userId') == null) {
      _revokeSession();
      return const Unauthenticated();
    }
    try {
      final user = await cloud.users.get('users/me');
      initialState = Authenticated(user: user.toCelest());
    } on UnauthorizedException {
      initialState = const Unauthenticated();
      _revokeSession();
    } on NotFoundException {
      initialState = const Unauthenticated();
      _revokeSession();
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
      _revokeSession();
    }
  }

  void _revokeSession() {
    localStorage.delete('userId');
    unawaited(secureStorage.delete('cork'));
    if (_authState != null && !_authStateController.isClosed) {
      _authStateController.add(const Unauthenticated());
    }
  }

  final CelestBase celest;
  late final celest_cloud.CelestCloud cloud;
  final NativeAuthentication nativeAuth = NativeAuthentication();
  final NativeStorage _storage;

  final List<AuthProviderType> authProviders;

  NativeStorage get localStorage => _storage;
  IsolatedNativeStorage get secureStorage => _storage.secure.isolated;

  @override
  Future<void> close() async {
    for (final subscription in _authProviderSubs.values) {
      subscription.cancel().ignore();
    }
    _authProviderSubs.clear();
    await _authStateSubscription?.cancel();
    await _authFlowSubscription?.cancel();
    await _authStateController.close();
  }
}

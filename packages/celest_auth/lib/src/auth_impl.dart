import 'dart:async';

import 'package:celest_auth/celest_auth.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_core/_internal.dart';
import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/auth_client.dart';
import 'package:stream_transform/stream_transform.dart';

export 'flows/email_flow.dart';

final class AuthImpl implements Auth {
  AuthImpl(
    this.celest, {
    required PlatformSecureStorage secureStorage,
    PlatformLocalStorage? localStorage,
  })  : secureStorage = secureStorage.scoped('celest_auth'),
        localStorage = (localStorage ??
                PlatformLocalStorage(
                    namespace: secureStorage.namespace,
                    scope: secureStorage.scope))
            .scoped('celest_auth');

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

  late final StreamSubscription<AuthState> _authStateSubscription;
  StreamSubscription<AuthState>? _authFlowSubscription;

  @override
  Future<AuthState> init() {
    return _init ??= Future.sync(() async {
      _authStateSubscription =
          _authStateController.stream.listen((state) => _authState = state);
      AuthState initialState;
      try {
        final user = await protocol.userInfo();
        initialState = Authenticated(user: user);
        _authStateController.add(initialState);
      } on UnauthorizedException {
        initialState = const Unauthenticated();
        signOut();
      }
      return initialState;
    });
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
          (state) => _authStateController.add(state),
          onError: (error, stackTrace) {
            // TODO(dnys1)
          },
          onDone: () => _authFlowSubscription = null,
          cancelOnError: true,
        );
        return AuthFlowController(controller.sink);
    }
  }

  @override
  Future<void> signOut() async {
    localStorage.delete('userId');
    secureStorage.isolated.delete('cork').ignore();
    try {
      await protocol.signOut();
    } finally {
      _authStateController.add(const Unauthenticated());
    }
  }

  final CelestBase celest;
  final PlatformLocalStorage localStorage;
  final PlatformSecureStorage secureStorage;

  late final AuthClient protocol = AuthClient(celest);

  Future<void> close() async {
    localStorage.close();
    secureStorage.close();
    await _authStateSubscription.cancel();
    await _authFlowSubscription?.cancel();
    await _authStateController.close();
  }
}

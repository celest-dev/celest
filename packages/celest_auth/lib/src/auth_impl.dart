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
    required this.secureStorage,
    LocalStorage? localStorage,
  }) : localStorage = localStorage ?? LocalStorage();

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
    secureStorage.delete('cork');
    try {
      await protocol.signOut();
    } finally {
      _authStateController.add(const Unauthenticated());
    }
  }

  final CelestBase celest;
  final LocalStorage localStorage;
  final SecureStorage secureStorage;

  late final AuthClient protocol = AuthClient(celest);

  Future<void> close() async {
    await _authStateSubscription.cancel();
    await _authFlowSubscription?.cancel();
    await _authStateController.close();
  }
}

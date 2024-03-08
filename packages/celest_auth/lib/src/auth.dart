import 'dart:async';

import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/platform/auth_platform.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/auth/auth_client.dart';
import 'package:celest_core/src/storage/local/local_storage.dart';
import 'package:celest_core/src/storage/secure/secure_storage.dart';
import 'package:stream_transform/stream_transform.dart';

/// Coordinates and delegates to the various [AuthFlow] to orchestrate
/// authentication activities.
///
/// Generated Celest clients extend this class and mix in the various
/// [AuthFlow]s supported by the backend.
abstract interface class Auth {
  /// **NOTE**: Must be called before any other getters or methods are accessed.
  ///
  /// Initializes Celest Auth, returning the initial [AuthState].
  Future<AuthState> init();

  AuthState get authState;
  Stream<AuthState> get authStateChanges;

  /// Signs out the current user, if any.
  void signOut();
}

final class AuthImpl implements Auth {
  AuthImpl(
    this.celest, {
    LocalStorage? localStorage,
    SecureStorage? secureStorage,
  })  : localStorage = localStorage ?? LocalStorage(),
        secureStorage = secureStorage ?? SecureStorage();

  @override
  AuthState get authState => _authState;
  AuthState _authState =
      const Unauthenticated(); // TODO(dnys1): const AuthInitializing();

  @override
  Stream<AuthState> get authStateChanges =>
      _authStateController.stream.startWith(_authState);

  final StreamController<AuthState> _authStateController =
      StreamController.broadcast();

  late final StreamSubscription<AuthState> _authStateSubscription;
  StreamSubscription<AuthFlowState>? _authFlowSubscription;

  @override
  Future<AuthState> init() {
    return _init ??= Future.sync(() {
      _authStateSubscription =
          _authStateController.stream.listen((state) => _authState = state);
      // TODO(dnys1): Proper init
      return authStateChanges.first;
    });
  }

  Future<AuthState>? _init;

  Future<StreamSink<FlowState>>
      requestFlow<FlowState extends AuthFlowState>() async {
    switch (_authState) {
      case AuthInitializing():
        await authStateChanges.firstWhere(
          (state) => state is! AuthInitializing,
        );
        return requestFlow();
      case AuthFlowState():
        throw Exception('Auth flow already in progress');
      case Authenticated():
        throw Exception(
          'User is already authenticated. Sign out before continuing.',
        );
      case Unauthenticated() || NeedsReauthentication():
        unawaited(_authFlowSubscription?.cancel());
        final previousState = _authState;
        final controller = StreamController<FlowState>(
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
        return controller.sink;
    }
  }

  @override
  void signOut() {
    localStorage.delete('userId');
    secureStorage.delete('cork');
    _authStateController.add(const Unauthenticated());
  }

  final CelestBase celest;
  final LocalStorage localStorage;
  final SecureStorage secureStorage;

  late final AuthClient protocol = AuthClient(celest);
  late final AuthPlatform platform = AuthPlatform(protocol: protocol);

  Future<void> close() async {
    await _authStateSubscription.cancel();
    await _authFlowSubscription?.cancel();
    await _authStateController.close();
  }
}

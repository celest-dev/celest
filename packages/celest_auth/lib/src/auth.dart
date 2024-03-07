import 'dart:async';

import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/platform/auth_platform.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/storage/local/local_storage.dart';
// ignore: implementation_imports
import 'package:celest_core/src/storage/secure/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Coordinates and delegates to the various [AuthFlow] to orchestrate
/// authentication activities.
///
/// Generated Celest clients extend this class and mix in the various
/// [AuthFlow]s supported by the backend.
abstract interface class Auth {
  AuthState get authState;
  Stream<AuthState> get authStateChanges;
}

abstract base class AuthImpl implements Auth {
  AuthImpl({
    required this.baseUri,
    required this.httpClient,
  }) {
    init();
  }

  @override
  AuthState get authState => _authState;
  AuthState _authState =
      const Unauthenticated(); // TODO(dnys1): const AuthInitializing();

  @override
  Stream<AuthState> get authStateChanges => _authStateController.stream;

  final StreamController<AuthState> _authStateController =
      StreamController.broadcast(sync: true);

  late final StreamSubscription<AuthState> _authStateSubscription;
  StreamSubscription<AuthFlowState>? _authFlowSubscription;

  /// Initializes Celest Auth.
  ///
  /// Must be called before any other getters or methods are accessed.
  @mustCallSuper
  void init() {
    _authStateSubscription =
        authStateChanges.listen((state) => _authState = state);
  }

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
        assert(_authFlowSubscription == null);
        final previousState = _authState;
        final controller = StreamController<FlowState>(
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

  final Uri baseUri;
  final http.Client httpClient;

  final LocalStorage localStorage = LocalStorage();
  final SecureStorage secureStorage = SecureStorage();

  late final AuthClient protocol = AuthClient(
    baseUri: baseUri,
    httpClient: httpClient,
  );
  late final AuthPlatform platform = AuthPlatform(protocol: protocol);

  Future<void> close() async {
    await _authStateSubscription.cancel();
    await _authFlowSubscription?.cancel();
    await _authStateController.close();
  }
}

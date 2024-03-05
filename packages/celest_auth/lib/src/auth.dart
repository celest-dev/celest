import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/platform/auth_platform.dart';
import 'package:celest_auth/src/storage/secure_storage.dart';
import 'package:celest_core/celest_core.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Coordinates and delegates to the various [AuthFlow] to orchestrate
/// authentication activities.
///
/// Generated Celest clients extend this class and mix in the various
/// [AuthFlow]s supported by the backend.
abstract interface class Auth {
  /// Whether the user is currently authenticated.
  bool get isAuthenticated;
}

abstract base class AuthImpl implements Auth {
  AuthImpl({
    required this.baseUri,
    required this.httpClient,
  }) {
    init();
  }

  /// Initializes Celest Auth.
  ///
  /// Must be called before any other getters or methods are accessed.
  @mustCallSuper
  void init() {
    final cork = secureStorage.read('cork');
    _isAuthenticated = cork != null;
  }

  @override
  bool get isAuthenticated => _isAuthenticated;
  late bool _isAuthenticated;

  final Uri baseUri;
  final http.Client httpClient;
  final SecureStorage secureStorage = SecureStorage();

  late final AuthClient protocol = AuthClient(
    baseUri: baseUri,
    httpClient: httpClient,
  );
  late final AuthPlatform platform = AuthPlatform(protocol: protocol);
}

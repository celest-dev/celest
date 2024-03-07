import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/platform/auth_platform.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/storage/secure/secure_storage.dart';
// ignore: implementation_imports
import 'package:celest_core/src/storage/storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Coordinates and delegates to the various [AuthFlow] to orchestrate
/// authentication activities.
///
/// Generated Celest clients extend this class and mix in the various
/// [AuthFlow]s supported by the backend.
abstract interface class Auth {}

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
  void init() {}

  final Uri baseUri;
  final http.Client httpClient;
  final Storage secureStorage = SecureStorage();

  late final AuthClient protocol = AuthClient(
    baseUri: baseUri,
    httpClient: httpClient,
  );
  late final AuthPlatform platform = AuthPlatform(protocol: protocol);
}

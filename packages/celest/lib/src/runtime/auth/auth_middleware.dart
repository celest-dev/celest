import 'package:celest/src/core/context.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart' as shelf;

/// {@template celest.runtime.auth_middleware}
/// The base class for Celest authentication middleware.
/// {@endtemplate}
abstract base class AuthMiddleware {
  /// {@macro celest.runtime.auth_middleware}
  const AuthMiddleware();

  /// Creates a new [AuthMiddleware] which authenticates using one of the given
  /// [middlewares].
  ///
  /// The middleware iterates through the given [middlewares] and authenticates
  /// using the first middleware that returns a non-null user.
  const factory AuthMiddleware.oneOf(
    List<AuthMiddleware> middlewares, {
    bool required,
  }) = _OneOfAuthMiddleware;

  /// Authenticates the given [request] and returns the authenticated user.
  Future<User?> authenticate(shelf.Request request);

  /// Whether the user is required to be authenticated.
  bool get required;

  /// Implements [shelf.Middleware].
  shelf.Handler call(shelf.Handler innerHandler) {
    return (shelf.Request request) async {
      final user = await authenticate(request);
      if (user == null && required) {
        throw const CloudException.unauthorized('Unauthorized');
      }
      if (user != null) {
        context.put(ContextKey.principal, user);
      }
      return innerHandler(request);
    };
  }
}

final class _OneOfAuthMiddleware extends AuthMiddleware {
  const _OneOfAuthMiddleware(
    this.middlewares, {
    this.required = false,
  });

  static final Logger _logger = Logger('AuthMiddleware');

  final List<AuthMiddleware> middlewares;

  @override
  final bool required;

  @override
  Future<User?> authenticate(shelf.Request request) async {
    for (final middleware in middlewares) {
      try {
        final user = await middleware.authenticate(request);
        if (user != null) {
          return user;
        }
      } on Object catch (e, st) {
        _logger.warning(
          'Failed to authenticate with ${middleware.runtimeType}',
          e,
          st,
        );
        continue;
      }
    }
    if (required) {
      throw const CloudException.unauthorized('Unauthorized');
    }
    return null;
  }
}

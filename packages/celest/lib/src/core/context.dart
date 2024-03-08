import 'package:celest/celest.dart';

/// The context of a [CloudFunction] invocation.
abstract final class Context {
  const Context._();

  /// A context reference to the [User] invoking a [CloudFunction].
  ///
  /// ## Example
  ///
  /// To inject a user into an `@authenticated` function:
  ///
  /// ```dart
  /// @authenticated
  /// Future<void> sayHello({
  ///  @Context.user() required User user,
  /// }) async {
  ///  print('Hello, ${user.displayName}!');
  /// }
  /// ```
  const factory Context.user() = _ContextKey.user;
}

final class _ContextKey extends Context {
  const _ContextKey._(this.key) : super._();

  const _ContextKey.user() : this._('user');

  final String key;
}

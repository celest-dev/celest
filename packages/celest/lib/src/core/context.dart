import 'package:celest/celest.dart';

/// The context of a [CloudFunction] invocation.
abstract final class Context {
  /// A context reference to the [User] invoking a [CloudFunction].
  ///
  /// ## Example
  ///
  /// To inject a user into an `@authenticated` function:
  ///
  /// ```dart
  /// @authenticated
  /// Future<void> sayHello({
  ///   @Context.user required User user,
  /// }) async {
  ///  print('Hello, ${user.displayName}!');
  /// }
  /// ```
  ///
  /// If a user is injected to a `@public` or private function, then the
  /// user parameter must be nullable:
  ///
  /// ```dart
  /// @public
  /// Future<void> sayHello({
  ///   @Context.user User? user,
  /// }) async {
  ///   print('Hello, ${user?.displayName ?? 'stranger'}!');
  /// }
  /// ```
  static const user = _UserContext();
}

final class _UserContext implements Context {
  const _UserContext();
}

import 'package:celest/celest.dart';

/// {@template celest.core.principal}
/// A contextual reference to the principal ([User]) invoking a [CloudFunction].
///
/// For more information, see [Authorizing your functions](https://celest.dev/docs/functions/authorizing-functions).
///
/// ## Example
///
/// To inject a user into an `@authenticated` function:
///
/// ```dart
/// @authenticated
/// Future<void> sayHello({
///   @principal required User user,
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
///   @principal User? user,
/// }) async {
///   print('Hello, ${user?.displayName ?? 'stranger'}!');
/// }
/// ```
/// {@endtemplate}
const principal = _UserContext();

/// {@template celest.core.context}
/// The context of a [CloudFunction] invocation.
/// {@endtemplate}
final class Context {
  const Context._();

  /// {@macro celest.core.principal}
  @Deprecated('Use @principal instead.')
  static const Context user = principal;
}

final class _UserContext implements Context {
  const _UserContext();
}

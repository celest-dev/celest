import 'package:celest/celest.dart';
import 'package:meta/meta_meta.dart';

/// Marks a function or library as a cloud API.
///
/// Celest Functions are written as normal Dart functions in the `celest/functions`
/// folder of your project.
///
/// To turn a function into a cloud function, add the `@cloud` annotation:
///
/// ```dart
/// // A helper function (not a cloud function).
/// String greet(String name) => 'Hello, $name!';
///
/// // A cloud function which exposes the greeting logic.
/// @cloud
/// Future<String> sayHello(Person person) async {
///  return greet(person.name);
/// }
/// ```
///
/// For more information, see [Creating functions](https://celest.dev/docs/functions/creating-functions).
const cloud = _Cloud();

@Target({TargetKind.function, TargetKind.library})
final class _Cloud {
  const _Cloud();
}

/// Marks an extension type definition as a custom implementation or its
/// representation type.
///
/// Custom implementations can be used to redefine the behavior of a type
/// in Celest by changing some aspects of its interface. The most common
/// use case for custom implementations is to customize serialization logic
/// for a type which you do not own.
///
/// See the [docs](https://celest.dev/docs/functions/data-types#custom-implementations) for more information.
const customOverride = _CustomOverride();

@Target({TargetKind.extensionType})
final class _CustomOverride {
  const _CustomOverride();
}

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
const principal = ContextKey.principal;

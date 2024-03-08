import 'package:celest/src/core/entity.dart';

/// A grant which provides access to all authenticated users.
///
/// ## Example
///
/// ```dart
/// import 'package:celest/celest.dart';
///
/// @authenticated
/// Future<void> sayHello() async {
///   print('User is authenticated!');
/// }
/// ```
const authenticated = _Authenticated();

final class _Role implements Entity {
  const _Role({
    required this.name,
  });

  static const _Role authenticated = _Role(name: r'$authenticated');

  final String name;
}

/// An assignment which grants a set of permissions to a specific group of
/// [Entity]s.
final class _Grant {
  const _Grant({
    required this.to,
  });

  /// The group of [Entity] which are granted access.
  final List<Entity> to;
}

final class _Authenticated extends _Grant {
  const _Authenticated() : super(to: const [_Role.authenticated]);
}

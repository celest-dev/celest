import 'package:celest_core/celest_core.dart';

final class PasskeyException implements CelestException {
  const PasskeyException({
    required this.message,
  });

  @override
  final String message;

  @override
  String toString() => 'PasskeyException: $message';
}

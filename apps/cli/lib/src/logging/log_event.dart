import 'package:logging/logging.dart';

extension LogEvent on Logger {
  static const Level level = Level('EVENT', 1500);

  /// Log message at [level].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void event(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(level, message, error, stackTrace);
}

import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:cli_util/cli_logging.dart' as cli_logging;
import 'package:dcli/dcli.dart';
import 'package:mason_logger/mason_logger.dart' as mason_logger;

/// An interface which conforms to the [mason_logger.Logger] interface, but
/// which properly accounts for [ansiColorsEnabled].
class CliLogger implements mason_logger.Logger {
  CliLogger({
    this.theme = const mason_logger.LogTheme(),
    this.progressOptions = const mason_logger.ProgressOptions(),
  });

  @override
  final mason_logger.LogTheme theme;

  @override
  mason_logger.Level level = mason_logger.Level.verbose;

  @override
  mason_logger.ProgressOptions progressOptions =
      const mason_logger.ProgressOptions();

  late final mason_logger.Logger _logger = mason_logger.Logger(
    theme: theme,
    level: level,
    progressOptions: progressOptions,
  );

  @override
  void alert(String? message, {mason_logger.LogStyle? style}) {
    if (ansiColorsEnabled) {
      return _logger.alert(message, style: style);
    }
    stderr.writeln(message);
  }

  @override
  List<T> chooseAny<T extends Object?>(
    String? message, {
    required List<T> choices,
    List<T>? defaultValues,
    String Function(T choice)? display,
  }) {
    if (ansiColorsEnabled) {
      return _logger.chooseAny(
        message,
        choices: choices,
        defaultValues: defaultValues,
        display: display,
      );
    }
    throw UnimplementedError('chooseAny is not implemented yet');
  }

  @override
  T chooseOne<T extends Object?>(
    String? message, {
    required List<T> choices,
    T? defaultValue,
    String Function(T choice)? display,
  }) {
    if (ansiColorsEnabled) {
      return _logger.chooseOne(
        message,
        choices: choices,
        defaultValue: defaultValue,
        display: display,
      );
    }
    throw UnimplementedError('chooseOne is not implemented yet');
  }

  @override
  bool confirm(String? message, {bool defaultValue = false}) {
    if (!stdin.hasTerminal) {
      return true;
    }
    if (ansiColorsEnabled) {
      return _logger.confirm(message, defaultValue: defaultValue);
    }
    final suffix = ' ${defaultValue.toYesNo()}';
    final resolvedMessage = '$message$suffix ';
    stdout.write(resolvedMessage);
    String? input;
    try {
      input = stdin.readLineSync();
    } on FormatException catch (_) {
      // FormatExceptions can occur due to utf8 decoding errors
      // so we treat them as the user pressing enter (e.g. use `defaultValue`).
      stdout.writeln();
    }
    return input == null || input.isEmpty
        ? defaultValue
        : input.toBoolean() ?? defaultValue;
  }

  @override
  void delayed(String? message) {
    throw UnimplementedError("Don't use delayed");
  }

  @override
  void detail(String? message, {mason_logger.LogStyle? style}) {
    if (ansiColorsEnabled) {
      return _logger.detail(message, style: style);
    }
    stdout.writeln(message);
  }

  @override
  void err(String? message, {mason_logger.LogStyle? style}) {
    if (ansiColorsEnabled) {
      return _logger.err(message, style: style);
    }
    stderr.writeln(message);
  }

  @override
  void flush([void Function(String? p1)? print]) {
    if (ansiColorsEnabled) {
      return _logger.flush(print);
    }
    stdout.flush().ignore();
    stderr.flush().ignore();
  }

  @override
  void info(String? message, {mason_logger.LogStyle? style}) {
    if (ansiColorsEnabled) {
      return _logger.info(message, style: style);
    }
    stdout.writeln(message);
  }

  @override
  mason_logger.Progress progress(
    String message, {
    mason_logger.ProgressOptions? options,
  }) {
    if (ansiColorsEnabled) {
      return _logger.progress(message, options: options);
    }
    final ci = platform.environment['CI'] ?? '';
    return _CliProgress(
      useAnsi: ci.toBoolean() ?? false,
      message: '$message...',
    );
  }

  @override
  String prompt(String? message, {Object? defaultValue, bool hidden = false}) {
    if (ansiColorsEnabled) {
      return ask(
        message.toString(),
        defaultValue: defaultValue?.toString(),
        hidden: hidden,
      );
    }
    final resolvedDefaultValue = switch (defaultValue) {
      final defaultValue? when '$defaultValue'.isNotEmpty => ' ($defaultValue)',
      _ => ':',
    };
    final resolvedMessage = '$message$resolvedDefaultValue ';
    stdout.write(resolvedMessage);
    final input = hidden ? _readLineHiddenSync() : stdin.readLineSync()?.trim();
    return input == null || input.isEmpty ? resolvedDefaultValue : input;
  }

  @override
  List<String> promptAny(String? message, {String separator = ','}) {
    if (ansiColorsEnabled) {
      return _logger.promptAny(message, separator: separator);
    }
    throw UnimplementedError('promptAny is not implemented yet');
  }

  @override
  void success(String? message, {mason_logger.LogStyle? style}) {
    if (ansiColorsEnabled) {
      return _logger.success(message, style: style);
    }
    stdout.writeln(message);
  }

  @override
  void warn(String? message, {String tag = '', mason_logger.LogStyle? style}) {
    if (ansiColorsEnabled) {
      return _logger.warn(message, tag: tag, style: style);
    }
    stderr.writeln(message);
  }

  @override
  void write(String? message) {
    if (ansiColorsEnabled) {
      return _logger.write(message);
    }
    stdout.write(message);
  }

  String _readLineHiddenSync() {
    const lineFeed = 10;
    const carriageReturn = 13;
    const delete = 127;
    final value = <int>[];

    try {
      stdin
        ..echoMode = false
        ..lineMode = false;
      int char;
      do {
        char = stdin.readByteSync();
        if (char != lineFeed && char != carriageReturn) {
          final shouldDelete = char == delete && value.isNotEmpty;
          shouldDelete ? value.removeLast() : value.add(char);
        }
      } while (char != lineFeed && char != carriageReturn);
    } finally {
      stdin
        ..lineMode = true
        ..echoMode = true;
    }
    stdout.writeln();
    return utf8.decode(value);
  }
}

final class _CliProgress implements mason_logger.Progress {
  _CliProgress({required bool useAnsi, required String message})
      : _progress = useAnsi
            ? cli_logging.AnsiProgress(cli_logging.Ansi(true), message)
            : null {
    if (!useAnsi) {
      stdout.writeln(message);
    }
  }

  final cli_logging.Progress? _progress;

  @override
  void cancel() {
    _progress?.cancel();
  }

  @override
  void complete([String? update]) {
    if (_progress != null) {
      return _progress.finish(message: update);
    }
    if (update != null) {
      stdout.writeln(update);
    }
  }

  @override
  void fail([String? update]) {
    if (_progress != null) {
      return _progress.finish(message: update);
    }
    if (update != null) {
      stderr.writeln(update);
    }
  }

  @override
  void update(String update) {
    stdout.writeln(update);
  }
}

extension on bool {
  String toYesNo() {
    return this == true ? 'Y/n' : 'y/N';
  }
}

extension on String {
  bool? toBoolean() {
    switch (toLowerCase()) {
      case 'y':
      case 'yea':
      case 'yeah':
      case 'yep':
      case 'yes':
      case 'yup':
        return true;
      case 'n':
      case 'no':
      case 'nope':
        return false;
      default:
        return null;
    }
  }
}

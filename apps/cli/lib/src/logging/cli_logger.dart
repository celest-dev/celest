import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:cli_util/cli_logging.dart' as cli_logging;
import 'package:dart_console/dart_console.dart';
import 'package:mason_logger/mason_logger.dart' as mason_logger;

/// An interface which conforms to the [mason_logger.Logger] interface, but
/// which properly accounts for [ansiColorsEnabled].
class CliLogger implements mason_logger.Logger {
  CliLogger({
    this.theme = const mason_logger.LogTheme(),
    this.progressOptions = const mason_logger.ProgressOptions(),
  });

  static final Console console = Console();

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
    final input = console.readLine(cancelOnBreak: true);
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
    stdout.write('$message ');
    final input = hidden
        ? _readLineHiddenSync()
        : console.readLine(cancelOnBreak: true)?.trim();
    if (input == null) {
      throw const CancellationException();
    }
    return input.isEmpty ? defaultValue?.toString() ?? '' : input;
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

  void writeln(String? message) {
    if (ansiColorsEnabled) {
      return _logger.write('$message${Platform.lineTerminator}');
    }
    stdout.writeln(message);
  }

  String _readLineHiddenSync() {
    try {
      stdin
        ..echoMode = false
        ..lineMode = false;

      final value = <String>[];
      while (true) {
        final key = console.readKey();
        final char = key.char;
        if (key.isControl) {
          switch (key.controlChar) {
            case ControlCharacter.backspace:
              if (value.isNotEmpty) {
                value.removeLast();
                stdout.write('\b \b');
              }
            case ControlCharacter.enter:
              return value.join();
            case ControlCharacter.escape:
              return '';
            case ControlCharacter.ctrlC || ControlCharacter.ctrlD:
              throw const CancellationException();
            default:
              break;
          }
        } else {
          stdout.write('*');
          value.add(char);
        }
      }
    } finally {
      stdin
        ..lineMode = true
        ..echoMode = true;
    }
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

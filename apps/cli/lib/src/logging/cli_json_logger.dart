import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/logging/cli_logger.dart';
import 'package:celest_cli/src/logging/log_message.dart';
import 'package:mason_logger/mason_logger.dart' as mason_logger;

void _writeLog(LogMessage log) {
  stdout.writeln(jsonEncode(log.toJson()));
}

/// An interface which conforms to the [mason_logger.Logger] interface, but
/// which uses JSON input and output.
class CliJsonLogger extends CliLogger {
  CliJsonLogger()
    : super(progressOptions: const mason_logger.ProgressOptions()) {
    level = mason_logger.Level.verbose;
  }

  final _queue = <String?>[];

  String? _readLine() => stdin.readLineSync();

  String _readLineHidden() {
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

  @override
  void alert(String? message, {mason_logger.LogStyle? style}) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.alert(message: message));
  }

  @override
  List<T> chooseAny<T extends Object?>(
    String? message, {
    required List<T> choices,
    List<T>? defaultValues,
    String Function(T choice)? display,
  }) {
    if (message == null) {
      throw ArgumentError.notNull('message');
    }
    String displayChoice(T choice) {
      if (display != null) {
        return display(choice);
      }
      return choice.toString();
    }

    final options = choices.map(displayChoice).toList();
    final defaults = defaultValues?.map(displayChoice).toList();
    _writeLog(
      LogMessage.chooseAny(
        message: message,
        choices: options,
        defaultValues: defaults,
      ),
    );
    final selection = _readLine();
    if (selection == null || selection.isEmpty) {
      if (defaultValues != null) {
        return defaultValues;
      }
      throw Exception('Required to choose at least one option');
    }
    final selectedJson = jsonDecode(selection);
    if (selectedJson is! List) {
      throw Exception('Expected a JSON-encoded list of selections');
    }
    final selectedOptions = selectedJson.cast<String>();
    final selectedChoices = <T>{};
    for (final selected in selectedOptions) {
      final option = options.indexOf(selected);
      if (option == -1) {
        throw Exception('Unknown selection: $selected');
      }
      selectedChoices.add(choices[option]);
    }
    return selectedChoices.toList();
  }

  @override
  T chooseOne<T extends Object?>(
    String? message, {
    required List<T> choices,
    T? defaultValue,
    String Function(T choice)? display,
  }) {
    if (message == null) {
      throw ArgumentError.notNull('message');
    }
    String displayChoice(T choice) {
      if (display != null) {
        return display(choice);
      }
      return choice.toString();
    }

    final options = choices.map(displayChoice).toList();
    final defaultOption =
        defaultValue != null ? displayChoice(defaultValue) : null;
    _writeLog(
      LogMessage.chooseOne(
        message: message,
        choices: options,
        defaultValue: defaultOption,
      ),
    );
    final selectedOption = _readLine();
    if (selectedOption == null || selectedOption.isEmpty) {
      if (defaultValue != null) {
        return defaultValue;
      }
      throw Exception('Required to choose an option');
    }
    for (final choice in choices) {
      if (displayChoice(choice) == selectedOption) {
        return choice;
      }
    }
    throw Exception('Unknown selection: $selectedOption');
  }

  @override
  bool confirm(String? message, {bool defaultValue = false}) {
    if (message == null) {
      throw ArgumentError.notNull('message');
    }
    _writeLog(LogMessage.confirm(message: message, defaultValue: defaultValue));
    final response = _readLine();
    if (response == null || response.isEmpty) {
      return defaultValue;
    }
    return response.toLowerCase().startsWith('y');
  }

  @override
  void delayed(String? message) {
    _queue.add(message);
  }

  @override
  void detail(String? message, {mason_logger.LogStyle? style}) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.detail(message: message));
  }

  @override
  void err(String? message, {mason_logger.LogStyle? style}) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.err(message: message));
  }

  @override
  void flush([void Function(String? p1)? print]) {
    final writeln = print ?? info;
    for (final message in _queue) {
      writeln(message);
    }
    _queue.clear();
  }

  @override
  void info(String? message, {mason_logger.LogStyle? style}) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.info(message: message));
  }

  @override
  mason_logger.Progress progress(
    String message, {
    mason_logger.ProgressOptions? options,
  }) {
    return _JsonProgress(message);
  }

  @override
  String prompt(String? message, {Object? defaultValue, bool hidden = false}) {
    if (message == null) {
      throw ArgumentError.notNull('message');
    }
    _writeLog(
      LogMessage.prompt(
        message: message,
        defaultValue: defaultValue?.toString(),
      ),
    );
    final response = hidden ? _readLineHidden() : _readLine();
    if (response == null || response.isEmpty) {
      if (defaultValue != null) {
        return defaultValue.toString();
      }
      throw Exception('Required to provide a response');
    }
    return response;
  }

  @override
  List<String> promptAny(String? message, {String separator = ','}) {
    if (message == null) {
      throw ArgumentError.notNull('message');
    }
    _writeLog(LogMessage.promptAny(message: message));
    final response = _readLine();
    if (response == null || response.isEmpty) {
      throw Exception('Required to provide at least one response');
    }
    final selectedJson = jsonDecode(response);
    if (selectedJson is! List) {
      throw Exception('Expected a JSON-encoded list of responses');
    }
    return selectedJson.cast<String>();
  }

  @override
  void success(String? message, {mason_logger.LogStyle? style}) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.success(message: message));
  }

  @override
  mason_logger.LogTheme get theme => const mason_logger.LogTheme();

  @override
  void warn(
    String? message, {
    String tag = 'WARN',
    mason_logger.LogStyle? style,
  }) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.warn(message: message));
  }

  @override
  void write(String? message) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.info(message: message));
  }

  @override
  void writeln(String? message) {
    if (message == null) {
      return;
    }
    _writeLog(LogMessage.info(message: message));
  }
}

final class _JsonProgress implements mason_logger.Progress {
  _JsonProgress(this.initialMessage) {
    _writeLog(
      LogMessage.progress(
        message: initialMessage,
        progress: ProgressAction.start,
      ),
    );
  }

  final String initialMessage;

  @override
  void cancel() {
    _writeLog(
      LogMessage.progress(
        progress: ProgressAction.cancel,
        message: initialMessage,
      ),
    );
  }

  @override
  void complete([String? update]) {
    _writeLog(
      LogMessage.progress(
        progress: ProgressAction.complete,
        message: update ?? initialMessage,
      ),
    );
  }

  @override
  void fail([String? update]) {
    _writeLog(
      LogMessage.progress(
        progress: ProgressAction.fail,
        message: update ?? initialMessage,
      ),
    );
  }

  @override
  void update(String update) {
    _writeLog(
      LogMessage.progress(progress: ProgressAction.update, message: update),
    );
  }
}

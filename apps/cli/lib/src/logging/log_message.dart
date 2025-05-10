import 'dart:convert';

enum LogType {
  alert,
  chooseAny,
  chooseOne,
  confirm,
  detail,
  err,
  info,
  progress,
  prompt,
  promptAny,
  success,
  warn,
}

enum ProgressAction { start, cancel, complete, fail, update }

final class LogMessageProgress extends LogMessage {
  const LogMessageProgress({required this.progress, required super.message})
    : super._(type: LogType.progress);

  factory LogMessageProgress.fromJson(Map<String, dynamic> json) {
    final progress = ProgressAction.values.byName(
      json.remove('progress') as String,
    );
    return LogMessageProgress(
      progress: progress,
      message: _expectMessage(json),
    );
  }

  final ProgressAction progress;

  @override
  Map<String, Object?> toJson() => {
    ...super.toJson(),
    'progress': progress.name,
  };
}

final class LogMessageAlert extends LogMessage {
  const LogMessageAlert({required super.message})
    : super._(type: LogType.alert);

  factory LogMessageAlert.fromJson(Map<String, dynamic> json) {
    return LogMessageAlert(message: json['message'] as String);
  }
}

final class LogMessageChooseAny extends LogMessage {
  const LogMessageChooseAny({
    required super.message,
    required this.choices,
    this.defaultValues,
  }) : super._(type: LogType.chooseAny);

  factory LogMessageChooseAny.fromJson(Map<String, dynamic> json) {
    final choices = (json.remove('choices') as List).cast<String>();
    final defaultValues = json.remove('defaultValues') as List?;
    return LogMessageChooseAny(
      message: _expectMessage(json),
      choices: choices,
      defaultValues: defaultValues?.cast(),
    );
  }

  final List<String> choices;
  final List<String>? defaultValues;

  @override
  Map<String, Object?> toJson() => {
    ...super.toJson(),
    'choices': choices,
    if (defaultValues case final defaultValues?) 'defaultValues': defaultValues,
  };
}

final class LogMessageChooseOne extends LogMessage {
  const LogMessageChooseOne({
    required super.message,
    required this.choices,
    this.defaultValue,
  }) : super._(type: LogType.chooseOne);

  factory LogMessageChooseOne.fromJson(Map<String, dynamic> json) {
    final choices = (json.remove('choices') as List).cast<String>();
    final defaultValue = json.remove('defaultValue') as String?;
    return LogMessageChooseOne(
      message: _expectMessage(json),
      choices: choices,
      defaultValue: defaultValue,
    );
  }

  final List<String> choices;
  final String? defaultValue;

  @override
  Map<String, Object?> toJson() => {
    ...super.toJson(),
    'choices': choices,
    if (defaultValue case final defaultValue?) 'defaultValue': defaultValue,
  };
}

final class LogMessageConfirm extends LogMessage {
  const LogMessageConfirm({required super.message, required this.defaultValue})
    : super._(type: LogType.confirm);

  factory LogMessageConfirm.fromJson(Map<String, dynamic> json) {
    final defaultValue = json.remove('defaultValue') as bool;
    return LogMessageConfirm(
      message: _expectMessage(json),
      defaultValue: defaultValue,
    );
  }

  final bool defaultValue;

  @override
  Map<String, Object?> toJson() => {
    ...super.toJson(),
    'defaultValue': defaultValue,
  };
}

final class LogMessageDetail extends LogMessage {
  const LogMessageDetail({required super.message})
    : super._(type: LogType.detail);

  factory LogMessageDetail.fromJson(Map<String, dynamic> json) {
    return LogMessageDetail(message: _expectMessage(json));
  }
}

final class LogMessageErr extends LogMessage {
  const LogMessageErr({required super.message}) : super._(type: LogType.err);

  factory LogMessageErr.fromJson(Map<String, dynamic> json) {
    return LogMessageErr(message: _expectMessage(json));
  }
}

final class LogMessageInfo extends LogMessage {
  const LogMessageInfo({required super.message}) : super._(type: LogType.info);

  factory LogMessageInfo.fromJson(Map<String, dynamic> json) {
    return LogMessageInfo(message: _expectMessage(json));
  }
}

final class LogMessagePrompt extends LogMessage {
  const LogMessagePrompt({required super.message, this.defaultValue})
    : super._(type: LogType.prompt);

  factory LogMessagePrompt.fromJson(Map<String, dynamic> json) {
    final defaultValue = json.remove('defaultValue') as String?;
    return LogMessagePrompt(
      message: _expectMessage(json),
      defaultValue: defaultValue,
    );
  }

  final String? defaultValue;

  @override
  Map<String, Object?> toJson() => {
    ...super.toJson(),
    if (defaultValue case final defaultValue?) 'defaultValue': defaultValue,
  };
}

final class LogMessagePromptAny extends LogMessage {
  const LogMessagePromptAny({required super.message})
    : super._(type: LogType.promptAny);

  factory LogMessagePromptAny.fromJson(Map<String, dynamic> json) {
    return LogMessagePromptAny(message: _expectMessage(json));
  }
}

final class LogMessageSuccess extends LogMessage {
  const LogMessageSuccess({required super.message})
    : super._(type: LogType.success);

  factory LogMessageSuccess.fromJson(Map<String, dynamic> json) {
    return LogMessageSuccess(message: _expectMessage(json));
  }
}

final class LogMessageWarn extends LogMessage {
  const LogMessageWarn({required super.message}) : super._(type: LogType.warn);

  factory LogMessageWarn.fromJson(Map<String, dynamic> json) {
    return LogMessageWarn(message: _expectMessage(json));
  }
}

sealed class LogMessage {
  factory LogMessage.fromJson(Map<String, dynamic> json) {
    json = Map.of(json);
    final type = LogType.values.byName(json.remove('type') as String);
    return switch (type) {
      LogType.alert => LogMessageAlert.fromJson(json),
      LogType.chooseAny => LogMessageChooseAny.fromJson(json),
      LogType.chooseOne => LogMessageChooseOne.fromJson(json),
      LogType.confirm => LogMessageConfirm.fromJson(json),
      LogType.detail => LogMessageDetail.fromJson(json),
      LogType.err => LogMessageErr.fromJson(json),
      LogType.info => LogMessageInfo.fromJson(json),
      LogType.prompt => LogMessagePrompt.fromJson(json),
      LogType.promptAny => LogMessagePromptAny.fromJson(json),
      LogType.progress => LogMessageProgress.fromJson(json),
      LogType.success => LogMessageSuccess.fromJson(json),
      LogType.warn => LogMessageWarn.fromJson(json),
    };
  }
  const factory LogMessage.alert({required String message}) = LogMessageAlert;

  const factory LogMessage.chooseAny({
    required String message,
    required List<String> choices,
    List<String>? defaultValues,
  }) = LogMessageChooseAny;

  const factory LogMessage.chooseOne({
    required String message,
    required List<String> choices,
    String? defaultValue,
  }) = LogMessageChooseOne;

  const factory LogMessage.confirm({
    required String message,
    required bool defaultValue,
  }) = LogMessageConfirm;

  const factory LogMessage.detail({required String message}) = LogMessageDetail;

  const factory LogMessage.err({required String message}) = LogMessageErr;

  const factory LogMessage.info({required String message}) = LogMessageInfo;

  const factory LogMessage.progress({
    required ProgressAction progress,
    required String message,
  }) = LogMessageProgress;

  const factory LogMessage.prompt({
    required String message,
    String? defaultValue,
  }) = LogMessagePrompt;

  const factory LogMessage.promptAny({required String message}) =
      LogMessagePromptAny;

  const factory LogMessage.success({required String message}) =
      LogMessageSuccess;

  const factory LogMessage.warn({required String message}) = LogMessageWarn;

  const LogMessage._({required this.type, required this.message});

  final LogType type;
  final String message;

  Map<String, Object?> toJson() => {'type': type.name, 'message': message};

  @override
  String toString() => jsonEncode(toJson());
}

String _expectMessage(Map<String, dynamic> json) {
  final message = json.remove('message') as String;
  if (json.isNotEmpty) {
    throw FormatException(
      'Invalid log message JSON: $json. '
      'Unexpected keys: ${json.keys.join(', ')}',
    );
  }
  return message;
}

import 'package:intl/locale.dart';

typedef VoidCallback = void Function();

/// Represents an error the user could fix, like wrong typed text, or missing
/// internet connection. Methods [dialogTitle] and [dialogContent] return
/// [String]s you can show in an error dialog.
///
/// An [UserException] may have an optional [cause], which is a more specific
/// root cause of the error.
///
/// If the error has a "cause" which is another [UserException] or [String],
/// the dialog-title will be the present exception's [msg], and the
/// dialog-content will be the [cause]. Otherwise, the dialog-title will be
/// an empty string, and the dialog-title will be the present
/// exception's [msg].
///
/// In other words, If the [cause] is an [UserException] or [String], it may
/// be used in the dialog. But if the [cause] is of a different type it's
/// considered just internal information, and won't be shown to the user.
///
/// An [UserException] may also have an optional [code], of type
/// [ExceptionCode]. If there is a non-null [code], the String returned by
/// [ExceptionCode.asText] may be used instead of the [msg]. This facilitates
/// translating error messages, since [ExceptionCode.asText] accepts
/// a [Locale].
///
/// You can define a special Matcher for your UserException, to use in your
/// tests. Create a test lib with this code:
///
/// ```
/// import 'package:matcher/matcher.dart';
/// const Matcher throwsUserException
///    = Throws(const TypeMatcher<UserException>());
/// ```
///
/// Then use it in your tests:
///
/// ```
/// expect(() => someFunction(), throwsUserException);
/// ```
///
/// The [UserException] may be used with the [UserExceptionDialog] to display the
/// exception to the user. In that case, you may also define callbacks [onOk] and
/// [onCancel].
///
class UserException implements Exception {
  const UserException(
    this.msg, {
    this.cause,
    this.code,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  })  : _onOk = onOk,
        _onCancel = onCancel;

  /// Adding `.debug` to the constructor will print the exception to the console.
  /// Use this for debugging purposes only.
  /// This constructor is marked as deprecated so that you don't forget to remove it.
  @deprecated
  UserException.debug(
    this.msg, {
    this.cause,
    this.code,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  })  : _onOk = onOk,
        _onCancel = onCancel {
    print('================================================================\n'
        "UserException${code == null ? "" : " (code: $code)"}:\n"
        'Msg = $msg,\n'
        "${cause == null ? "" : "Cause = $cause,\n"}"
        '================================================================');
  }

  /// Creates a [UserException] from a JSON object.
  ///
  /// Important: The [cause] and the [code] will be represented as Strings,
  /// and [_onOk] and [_onCancel] will be ignored. This means the [fromJson] method
  /// may not be able to reconstruct the original exception.
  ///
  /// ---
  /// Use with Celest (https://celest.dev/):
  ///
  /// Currently you can't import Async Redux in the backend part of Celest, because it uses Flutter.
  /// Once I move this [UserException] class into a separate Dart-only package called
  /// `async_redux_core`, you will be able to use it with Celest, as long as you export it
  /// from `celest/lib/exceptions.dart`:
  ///
  /// ```dart
  /// export 'package:async_redux_core/user_exception.dart;
  /// ```
  factory UserException.fromJson(Map<String, dynamic> json) {
    return UserException(
      json['msg'] as String?,
      cause: json['cause'],
      code: switch (json['code']) {
        final String code => _StringExceptionCode(code),
        _ => null,
      },
    );
  }

  /// Some message shown to the user.
  final String? msg;

  /// The cause of the user-exception. Usually another error.
  final Object? cause;

  /// The error may have some code. This may be used for error message
  /// translations, and also to simplify receiving errors from web-services,
  /// cloud-functions etc.
  final ExceptionCode? code;

  /// Callback to be called after the user views the error and taps OK.
  final VoidCallback? _onOk;

  /// Callback to be called after the user views the error and taps CANCEL.
  final VoidCallback? _onCancel;

  /// "OK" callback. If the exception has a cause, will return a merged callback.
  VoidCallback? get onOk {
    final onOkCause =
        (cause is UserException) ? (cause as UserException).onOk : null;

    if (onOkCause == null) {
      return _onOk;
    } else if (_onOk == null)
      return onOkCause;
    else
      return () {
        _onOk();
        onOkCause();
      };
  }

  /// "Cancel" callback. If the exception has a cause, will return a merged callback.
  VoidCallback? get onCancel {
    final onCancelCause =
        (cause is UserException) ? (cause as UserException).onCancel : null;

    if (onCancelCause == null) {
      return _onCancel;
    } else if (_onCancel == null)
      return onCancelCause;
    else
      return () {
        _onCancel();
        onCancelCause();
      };
  }

  /// Returns the first cause which, recursively, is NOT a UserException.
  /// If not found, returns null.
  Object? hardCause() {
    if (cause is UserException) {
      return (cause as UserException).hardCause();
    } else {
      return cause;
    }
  }

  /// Returns a deep copy of this exception, but stopping at, and not
  /// including, the first [cause] which is not a UserException.
  UserException withoutHardCause() => UserException(
        msg,
        cause: (cause is UserException)
            ? //
            (cause as UserException).withoutHardCause()
            : null,
        code: code,
        onOk: _onOk,
        onCancel: _onCancel,
      );

  String dialogTitle([Locale? locale]) => //
      (cause is UserException || cause is String)
          ? //
          _codeAsTextOrMsg(locale)
          : '';

  String dialogContent([Locale? locale]) {
    if (cause is UserException) {
      return (cause as UserException)._dialogTitleAndContent(locale);
    } else if (cause is String)
      return cause as String;
    else
      return _codeAsTextOrMsg(locale);
  }

  String _dialogTitleAndContent([Locale? locale]) => (cause is UserException)
      ? joinExceptionMainAndCause(
          locale,
          _codeAsTextOrMsg(locale),
          (cause as UserException)._codeAsTextOrMsg(locale),
        )
      : _codeAsTextOrMsg(locale);

  /// Return the string that join the main message and the reason message.
  /// You can change this variable to inject another way to join them.
  static var joinExceptionMainAndCause = (
    Locale? locale,
    String? mainMsg,
    String? causeMsg,
  ) =>
      "$mainMsg\n\n${_getReasonFromLocale(locale) ?? "Reason"}: $causeMsg";

  static String? _getReasonFromLocale(Locale? locale) {
    if (locale == null) {
      return null;
    } else {
      var reason = _reason[locale.toString()];
      reason ??= _reason[locale.languageCode];
      return reason;
    }
  }

  static const Map<String, String> _reason = {
    'en': 'Reason', // English
    'es': 'Razón', // Spanish
    'fr': 'Raison', // French
    'de': 'Grund', // German
    'zh': '原因', // Chinese
    'jp': '理由', // Japanese
    'pt': 'Motivo', // Portuguese
    'it': 'Motivo', // Italian
    'pl': 'Powód', // Polish
    'ko': '이유', // Korean
    'ms': 'Sebab', // Malay
    'ru': 'Причина', // Russian
    'uk': 'Причина', // Ukrainian
    'ar': 'السبب', // Arabic
    'he': 'סיבה', // Hebrew
  };

  /// If there is a [code], and this [code] has a non-empty text returned by
  /// [ExceptionCode.asText] in the given [Locale], return this text.
  /// Otherwise, if the [msg] is a non-empty text, return this [msg].
  /// Otherwise, if there is a [code], return the [code] itself.
  /// Otherwise, return an empty text.
  String _codeAsTextOrMsg(Locale? locale) {
    final codeAsText = code?.asText(locale);
    if (codeAsText != null && codeAsText.isNotEmpty) return codeAsText;
    if (msg != null && msg!.isNotEmpty) return msg!;
    return code?.toString() ?? '';
  }

  @override
  String toString() => _dialogTitleAndContent();

  /// Creates a JSON object from a [UserException].
  ///
  /// Important: The [cause] and the [code] will be represented as Strings,
  /// and [_onOk] and [_onCancel] will be ignored. This means the [fromJson] method
  /// may not be able to reconstruct the original exception.
  ///
  /// ---
  /// Use with Celest (https://celest.dev/):
  ///
  /// Currently you can't import Async Redux in the backend part of Celest, because it uses Flutter.
  /// Once I move this [UserException] class into a separate Dart-only package called
  /// `async_redux_core`, you will be able to use it with Celest, as long as you export it
  /// from `celest/lib/exceptions.dart`:
  ///
  /// ```dart
  /// export 'package:async_redux_core/user_exception.dart;
  /// ```
  Map<String, dynamic> toJson() => {
        'msg': msg,
        if (cause != null) 'cause': cause.toString(),
        if (code != null) 'code': code.toString(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserException &&
          runtimeType == other.runtimeType &&
          msg == other.msg &&
          cause == other.cause &&
          code == other.code &&
          _onOk == other._onOk &&
          _onCancel == other._onCancel;

  @override
  int get hashCode =>
      msg.hashCode ^
      cause.hashCode ^
      code.hashCode ^
      _onOk.hashCode ^
      _onCancel.hashCode;
}

abstract class ExceptionCode {
  const ExceptionCode();

  String? asText([Locale? locale]);
}

/// Used for Bugs.
class AppError extends AssertionError {
  AppError([
    Object? msg,
    this.error,
  ]) : super(msg?.toString());
  //
  final Object? error;

  @override
  String toString() {
    var errorStr = '';

    if (error is Error) {
      final errorObj = error as Error;
      errorStr = '\n\n\n\n$errorObj\n\n\n\n${errorObj.stackTrace}\n\n\n\n';
    } else if (error != null) errorStr = ' Error: $error';

    return 'Assertion failed with message:\n>>> ${message.toString() + errorStr} <<<';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

/// Used when something failed but its is NOT an error, and can be recovered from.
class AppException implements Exception {
  AppException([this.msg, this.error]);
  //
  final Object? error;
  final Object? msg;

  @override
  String toString() => msg.toString();
}

/// Used when something will be implemented in the future.
class NotYetImplementedError extends AssertionError {
  NotYetImplementedError([dynamic msg])
      : msg = (msg == null)
            ? StackTrace.current.toString()
            : '$msg\n\n${StackTrace.current}';
  final String msg;

  @override
  String toString() => 'NOT YET IMPLEMENTED!\n $msg';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotYetImplementedError && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

/// Used to stop the control flow, interrupting a process and breaking out of the current code.
/// This shouldn't be logged nor show any error messages. It also has no stacktrace.
/// Use with care, only if you know what you are doing, because that's generally an anti-pattern.
class InterruptControlFlowException {
  const InterruptControlFlowException();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InterruptControlFlowException &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

/// This should be used when validating input.
class ValidateError extends TypeError {
  ValidateError(this.msg);

  ValidateError.semCrashlytics(this.msg);
  String msg;

  @override
  String toString() => 'ValidateError: $msg';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValidateError &&
          runtimeType == other.runtimeType &&
          msg == other.msg;

  @override
  int get hashCode => msg.hashCode;
}

/// UserException that shows in the console.
/// Used for debugging reasons only, for short periods of time.
/// It is marked as [deprecated] so that you don't forget to remove it.
/// Note: To remove it, just remove the "_ShowInConsole" part.
class UserException_ShowInConsole extends UserException {
  //
  UserException_ShowInConsole(
    String msg, {
    Object? cause,
    ExceptionCode? code,
  }) : super(msg, cause: cause, code: code) {
    print(
      '\nMsg = $msg, '
      '================================================================'
      '\nCause = $cause,'
      '================================================================'
      '\nCode = $code',
    );
  }
}

final class _StringExceptionCode implements ExceptionCode {
  _StringExceptionCode(this.code);

  final String code;

  @override
  String asText([Locale? locale]) => code;
}

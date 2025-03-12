import 'package:_common/marcelo.dart' as core;
import 'package:celest/celest.dart';

@customOverride
extension type AppError(core.AppError _err) implements core.AppError {
  AppError.fromJson(Map<String, Object?> json)
      : _err = core.AppError(json['msg'], json['error']);

  Map<String, Object?> toJson() => {'msg': _err.message, 'error': _err.error};
}

@customOverride
extension type AppException(core.AppException _ex)
    implements core.AppException {
  JsonValue? get error => _ex.error as JsonValue?;
  JsonValue? get msg => _ex.msg as JsonValue?;
}

@customOverride
extension type NotYetImplementedError._(core.NotYetImplementedError _err)
    implements core.NotYetImplementedError {
  NotYetImplementedError([JsonValue? message])
      : _err = core.NotYetImplementedError(message);

  String get msg => _err.msg.split('\n').first.trim();
  JsonValue? get message => _err.message as JsonValue?;
}

@customOverride
extension type UserException_ShowInConsole._(
        core.UserException_ShowInConsole _ex)
    implements core.UserException_ShowInConsole {
  UserException_ShowInConsole({
    required String msg,
    JsonValue? cause,
  }) : this._(core.UserException_ShowInConsole(msg, cause: cause));

  Null get code => null;
  JsonValue? get cause => _ex.cause as JsonValue?;
}

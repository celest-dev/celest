import 'package:_common/marcelo.dart' as core;
import 'package:celest_core/celest_core.dart';

@override
extension type const UserException._(core.UserException _ex)
    implements core.UserException {
  UserException({
    String? msg,
    JsonValue? cause,
  }) : this._(core.UserException(msg, cause: cause));

  Null get code => null;
  JsonValue? get cause => _ex.cause as JsonValue?;
}

@override
extension type const AppError(core.AppError _err) implements core.AppError {
  AppError.fromJson(Map<String, Object?> json)
      : _err = core.AppError(json['msg'], json['error']);

  Map<String, Object?> toJson() => {'msg': _err.message, 'error': _err.error};
}

// @override
// extension type const AppException(core.AppException _) {}

// @override
// extension type const NotYetImplementedError(core.NotYetImplementedError _) {}

// @override
// extension type const InterruptControlFlowException(
//     core.InterruptControlFlowException _) {}

// @override
// extension type const ValidateError(core.ValidateError _) {}

// @override
// extension type const UserException_ShowInConsole(
//     core.UserException_ShowInConsole _) {}

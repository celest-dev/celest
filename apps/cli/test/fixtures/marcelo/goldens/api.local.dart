// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/exceptions/callsThrowsUserException.dart' as _i2;
import 'functions/exceptions/throwsAppError.dart' as _i3;
import 'functions/exceptions/throwsUserException.dart' as _i4;

void main() {
  _i1.serve(targets: {
    '/exceptions/calls-throws-user-exception':
        _i2.CallsThrowsUserExceptionTarget(),
    '/exceptions/throws-app-error': _i3.ThrowsAppErrorTarget(),
    '/exceptions/throws-user-exception': _i4.ThrowsUserExceptionTarget(),
  });
}

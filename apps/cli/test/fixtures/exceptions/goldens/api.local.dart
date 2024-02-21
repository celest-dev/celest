// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/nonthrowing/callsThrowsBaseError.dart' as _i2;
import 'functions/nonthrowing/callsThrowsBaseException.dart' as _i3;
import 'functions/nonthrowing/callsThrowsCustomError.dart' as _i4;
import 'functions/nonthrowing/callsThrowsCustomException.dart' as _i5;
import 'functions/throwing/throwsBaseError.dart' as _i6;
import 'functions/throwing/throwsBaseException.dart' as _i7;
import 'functions/throwing/throwsCustomError.dart' as _i8;
import 'functions/throwing/throwsCustomException.dart' as _i9;

void main() {
  _i1.serve(targets: {
    '/nonthrowing/calls-throws-base-error': _i2.CallsThrowsBaseErrorTarget(),
    '/nonthrowing/calls-throws-base-exception':
        _i3.CallsThrowsBaseExceptionTarget(),
    '/nonthrowing/calls-throws-custom-error':
        _i4.CallsThrowsCustomErrorTarget(),
    '/nonthrowing/calls-throws-custom-exception':
        _i5.CallsThrowsCustomExceptionTarget(),
    '/throwing/throws-base-error': _i6.ThrowsBaseErrorTarget(),
    '/throwing/throws-base-exception': _i7.ThrowsBaseExceptionTarget(),
    '/throwing/throws-custom-error': _i8.ThrowsCustomErrorTarget(),
    '/throwing/throws-custom-exception': _i9.ThrowsCustomExceptionTarget(),
  });
}

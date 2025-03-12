// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/core/context.dart' as _i12;
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/external/callsThrowsCommonException.dart' as _i2;
import 'functions/external/callsThrowsCustomException.dart' as _i3;
import 'functions/nonthrowing/callsThrowsBaseError.dart' as _i4;
import 'functions/nonthrowing/callsThrowsBaseException.dart' as _i5;
import 'functions/nonthrowing/callsThrowsCustomError.dart' as _i6;
import 'functions/nonthrowing/callsThrowsCustomException.dart' as _i7;
import 'functions/throwing/throwsBaseError.dart' as _i8;
import 'functions/throwing/throwsBaseException.dart' as _i9;
import 'functions/throwing/throwsCustomError.dart' as _i10;
import 'functions/throwing/throwsCustomException.dart' as _i11;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {
      '/external/calls-throws-common-exception':
          _i2.CallsThrowsCommonExceptionTarget(),
      '/external/calls-throws-custom-exception':
          _i3.CallsThrowsCustomExceptionTarget(),
      '/nonthrowing/calls-throws-base-error': _i4.CallsThrowsBaseErrorTarget(),
      '/nonthrowing/calls-throws-base-exception':
          _i5.CallsThrowsBaseExceptionTarget(),
      '/nonthrowing/calls-throws-custom-error':
          _i6.CallsThrowsCustomErrorTarget(),
      '/nonthrowing/calls-throws-custom-exception':
          _i7.CallsThrowsCustomExceptionTarget(),
      '/throwing/throws-base-error': _i8.ThrowsBaseErrorTarget(),
      '/throwing/throws-base-exception': _i9.ThrowsBaseExceptionTarget(),
      '/throwing/throws-custom-error': _i10.ThrowsCustomErrorTarget(),
      '/throwing/throws-custom-exception': _i11.ThrowsCustomExceptionTarget(),
    },
    setup: (_i12.Context context) async {},
  );
}

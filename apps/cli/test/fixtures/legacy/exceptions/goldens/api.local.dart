// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i1;
import 'dart:isolate' as _i2;

import 'package:celest/src/runtime/serve.dart' as _i3;

import 'functions/external/callsThrowsCommonException.dart' as _i4;
import 'functions/external/callsThrowsCustomException.dart' as _i5;
import 'functions/nonthrowing/callsThrowsBaseError.dart' as _i6;
import 'functions/nonthrowing/callsThrowsBaseException.dart' as _i7;
import 'functions/nonthrowing/callsThrowsCustomError.dart' as _i8;
import 'functions/nonthrowing/callsThrowsCustomException.dart' as _i9;
import 'functions/throwing/throwsBaseError.dart' as _i10;
import 'functions/throwing/throwsBaseException.dart' as _i11;
import 'functions/throwing/throwsCustomError.dart' as _i12;
import 'functions/throwing/throwsCustomException.dart' as _i13;

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i1.Platform.numberOfProcessors; i++)
      _i2.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i3.serve(targets: {
    '/external/calls-throws-common-exception':
        _i4.CallsThrowsCommonExceptionTarget(),
    '/external/calls-throws-custom-exception':
        _i5.CallsThrowsCustomExceptionTarget(),
    '/nonthrowing/calls-throws-base-error': _i6.CallsThrowsBaseErrorTarget(),
    '/nonthrowing/calls-throws-base-exception':
        _i7.CallsThrowsBaseExceptionTarget(),
    '/nonthrowing/calls-throws-custom-error':
        _i8.CallsThrowsCustomErrorTarget(),
    '/nonthrowing/calls-throws-custom-exception':
        _i9.CallsThrowsCustomExceptionTarget(),
    '/throwing/throws-base-error': _i10.ThrowsBaseErrorTarget(),
    '/throwing/throws-base-exception': _i11.ThrowsBaseExceptionTarget(),
    '/throwing/throws-custom-error': _i12.ThrowsCustomErrorTarget(),
    '/throwing/throws-custom-exception': _i13.ThrowsCustomExceptionTarget(),
  });
}

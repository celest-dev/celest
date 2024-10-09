// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/external/callsThrowsCommonException.dart'
    as _i2;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/external/callsThrowsCustomException.dart'
    as _i3;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/nonthrowing/callsThrowsBaseError.dart'
    as _i4;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/nonthrowing/callsThrowsBaseException.dart'
    as _i5;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/nonthrowing/callsThrowsCustomError.dart'
    as _i6;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/nonthrowing/callsThrowsCustomException.dart'
    as _i7;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/throwing/throwsBaseError.dart'
    as _i8;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/throwing/throwsBaseException.dart'
    as _i9;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/throwing/throwsCustomError.dart'
    as _i10;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/exceptions/goldens/functions/throwing/throwsCustomException.dart'
    as _i11;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {
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
  });
}

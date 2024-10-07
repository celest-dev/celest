// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/http_errors/httpErrors.dart' as _i2;
import 'functions/http_header/headers.dart' as _i3;
import 'functions/http_method/delete.dart' as _i4;
import 'functions/http_method/get.dart' as _i5;
import 'functions/http_method/patch.dart' as _i6;
import 'functions/http_method/post.dart' as _i7;
import 'functions/http_method/put.dart' as _i8;
import 'functions/http_query/query.dart' as _i9;
import 'functions/http_status/accepted.dart' as _i10;
import 'functions/http_status/badRequest.dart' as _i11;
import 'functions/http_status/created.dart' as _i12;
import 'functions/http_status/internalServerError.dart' as _i13;
import 'functions/http_status/ok.dart' as _i14;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {
    '/http-errors/http-errors': _i2.HttpErrorsTarget(),
    '/http-header/headers': _i3.HeadersTarget(),
    '/http-method/delete': _i4.DeleteTarget(),
    '/http-method/get': _i5.GetTarget(),
    '/http-method/patch': _i6.PatchTarget(),
    '/http-method/post': _i7.PostTarget(),
    '/http-method/put': _i8.PutTarget(),
    '/http-query/query': _i9.QueryTarget(),
    '/http-status/accepted': _i10.AcceptedTarget(),
    '/http-status/bad-request': _i11.BadRequestTarget(),
    '/http-status/created': _i12.CreatedTarget(),
    '/http-status/internal-server-error': _i13.InternalServerErrorTarget(),
    '/http-status/ok': _i14.OkTarget(),
  });
}

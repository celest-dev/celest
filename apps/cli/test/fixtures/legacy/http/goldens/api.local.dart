// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i1;
import 'dart:isolate' as _i2;

import 'package:celest/src/runtime/serve.dart' as _i3;

import 'functions/http_errors/httpErrors.dart' as _i4;
import 'functions/http_header/headers.dart' as _i5;
import 'functions/http_method/delete.dart' as _i6;
import 'functions/http_method/get.dart' as _i7;
import 'functions/http_method/patch.dart' as _i8;
import 'functions/http_method/post.dart' as _i9;
import 'functions/http_method/put.dart' as _i10;
import 'functions/http_query/query.dart' as _i11;
import 'functions/http_status/accepted.dart' as _i12;
import 'functions/http_status/badRequest.dart' as _i13;
import 'functions/http_status/created.dart' as _i14;
import 'functions/http_status/internalServerError.dart' as _i15;
import 'functions/http_status/ok.dart' as _i16;

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i1.Platform.numberOfProcessors; i++)
      _i2.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i3.serve(targets: {
    '/http-errors/http-errors': _i4.HttpErrorsTarget(),
    '/http-header/headers': _i5.HeadersTarget(),
    '/http-method/delete': _i6.DeleteTarget(),
    '/http-method/get': _i7.GetTarget(),
    '/http-method/patch': _i8.PatchTarget(),
    '/http-method/post': _i9.PostTarget(),
    '/http-method/put': _i10.PutTarget(),
    '/http-query/query': _i11.QueryTarget(),
    '/http-status/accepted': _i12.AcceptedTarget(),
    '/http-status/bad-request': _i13.BadRequestTarget(),
    '/http-status/created': _i14.CreatedTarget(),
    '/http-status/internal-server-error': _i15.InternalServerErrorTarget(),
    '/http-status/ok': _i16.OkTarget(),
  });
}

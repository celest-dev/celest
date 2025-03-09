import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@http(statusCode: HttpStatus.ok)
Future<void> ok() async {}

@cloud
@http(statusCode: HttpStatus.created)
Future<void> created() async {}

@cloud
@http(statusCode: HttpStatus.accepted)
Future<void> accepted() async {}

@cloud
@http(statusCode: HttpStatus.badRequest)
Future<void> badRequest() async {}

@cloud
@http(statusCode: HttpStatus.internalServerError)
Future<void> internalServerError() async {}

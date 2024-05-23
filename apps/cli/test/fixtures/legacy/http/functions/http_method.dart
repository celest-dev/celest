import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@http(method: HttpMethod.get)
Future<void> get() async {}

@cloud
@http(method: HttpMethod.post)
Future<void> post() async {}

@cloud
@http(method: HttpMethod.put)
Future<void> put() async {}

@cloud
@http(method: HttpMethod.delete)
Future<void> delete() async {}

@cloud
@http(method: HttpMethod.patch)
Future<void> patch() async {}

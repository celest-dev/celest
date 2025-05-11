import 'package:celest/celest.dart';
import 'package:celest/http.dart';

@cloud
@authenticated
@http(method: HttpMethod.get)
Future<User> currentUser({@principal required User user}) async {
  return user;
}

@public
library;

import 'package:celest/celest.dart';

Future<void> sayHello({
  @Context.user User? user,
}) async {
  print('Hello, world!');
}

@authenticated
library;

import 'package:celest/celest.dart';

Future<void> sayHello({
  @Context.user required User user,
}) async {
  print('Hello, world!');
}

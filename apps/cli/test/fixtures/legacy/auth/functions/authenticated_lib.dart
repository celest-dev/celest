@authenticated
library;

import 'package:celest/celest.dart';

@cloud
Future<void> sayHello({
  @principal required User user,
}) async {
  print('Hello, world!');
}

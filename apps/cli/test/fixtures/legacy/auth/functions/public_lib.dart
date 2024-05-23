@public
library;

import 'package:celest/celest.dart';

@cloud
Future<void> sayHello({
  @principal User? user,
}) async {
  print('Hello, world!');
}

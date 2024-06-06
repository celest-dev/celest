/// Tests the ability to use server-side streaming.
library;

import 'package:celest/celest.dart';

@cloud
Stream<String> hello(List<String> names) async* {
  for (final name in names) {
    yield 'Hello, $name!';
  }
}

import 'dart:io';

import 'package:celest_backend/src/functions/flutter.dart';

Future<void> main() async {
  final golden = await paintWidget();
  final output = File.fromUri(
    Directory.current.uri.resolve('test/golden_image.png'),
  );
  await output.writeAsBytes(golden);
}

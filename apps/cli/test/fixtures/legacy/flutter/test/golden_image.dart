import 'dart:io';

import '../functions/flutter.dart';

Future<void> main() async {
  final golden = await paintWidget();
  final output = File.fromUri(
    Directory.current.uri.resolve('test/golden_image.png'),
  );
  await output.writeAsBytes(golden);
}

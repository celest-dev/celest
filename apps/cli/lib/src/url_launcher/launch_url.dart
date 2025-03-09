import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/context.dart';

/// Launches a URL in the user's default browser.
///
/// Returns `true` if the URL was successfully launched, `false` otherwise.
Future<bool> launchUrl(Uri url) async {
  final String command;
  if (Platform.isWindows) {
    command = 'powershell';
  } else if (Platform.isLinux) {
    command = 'xdg-open';
  } else if (Platform.isMacOS) {
    command = 'open';
  } else {
    throw UnsupportedError('Unsupported OS: ${Platform.operatingSystem}');
  }

  final arguments =
      Platform.isWindows ? ['start-process', '"$url"'] : [url.toString()];
  try {
    final res = await processManager.run(
      <String>[command, ...arguments],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    return res.exitCode == 0;
  } on Exception {
    return false;
  }
}

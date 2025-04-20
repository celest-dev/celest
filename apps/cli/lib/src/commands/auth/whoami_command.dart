import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/celest_command.dart';

final class WhoamiCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'whoami';

  @override
  String get description => 'Print the current authenticated user\'s info.';

  @override
  Future<int> run() async {
    await super.run();

    final user = await assertAuthenticated();
    if (jsonOutput) {
      stdout.write(jsonEncode(user.toJson()));
    } else {
      stdout.writeln(user.toString());
    }

    return 0;
  }
}

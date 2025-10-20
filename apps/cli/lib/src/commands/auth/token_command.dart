import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/auth/cli_auth.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/typeid.dart';
import 'package:celest_core/_internal.dart';
import 'package:corks_cedar/corks_cedar.dart';

final class TokenCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'token';

  @override
  String get description => 'Prints the access token for the current user.';

  @override
  Future<int> run() async {
    await super.run();

    await assertAuthenticated();
    final cork = await auth.secureStorage.read('cork');
    if (cork == null) {
      unreachable('No access token found for user.');
    }

    if (jsonOutput) {
      final corkData = CedarCork.parse(cork);
      stdout.write(jsonEncode(corkData._toJson()));
    } else {
      stdout.write(cork);
    }

    return 0;
  }
}

extension on CedarCork {
  Map<String, Object?> _toJson() => {
    'id': TypeId.fromUuid(Uuid(id), 'cork'),
    'issuer': issuer.toString(),
    'bearer': bearer.toString(),
    'audience': audience?.toString(),
    'claims': claims?.toJson(),
    'caveats': caveats.map((c) => c.toJson()).toList(),
  };
}

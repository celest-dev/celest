import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class UpdateCommand extends CelestCommand {
  UpdateCommand();

  @override
  String get description => 'Updates the Celest CLI.';

  @override
  String get name => 'update';

  @override
  String get category => 'Tools';

  @override
  Future<int> run() async {
    await super.run();

    // TODO: Implement proper replacement: https://developer.apple.com/documentation/security/updating_mac_software

    TODO();
  }
}

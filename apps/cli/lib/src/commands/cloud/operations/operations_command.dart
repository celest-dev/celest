import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/cloud/operations/get_operation_command.dart';
import 'package:celest_cli/src/commands/cloud/operations/list_operations_command.dart';

final class OperationsCommand extends CelestCommand {
  OperationsCommand() {
    addSubcommand(GetOperationCommand());
    addSubcommand(ListOperationsCommand());
  }

  @override
  String get description => 'Manage Celest Cloud operations.';

  @override
  String get name => 'operations';

  @override
  String get category => 'Cloud';

  @override
  bool get hidden => true;
}

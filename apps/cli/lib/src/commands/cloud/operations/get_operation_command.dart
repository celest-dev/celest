import 'package:celest_cli/src/commands/cloud/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';

final class GetOperationCommand extends CloudGetCommand<Operation> {
  @override
  String get description => 'Gets an operation.';

  @override
  String get name => 'get';

  @override
  String get resourceType => 'Operation';

  @override
  Operation createEmptyResource() => Operation();

  @override
  Future<Operation?> callService() async {
    return cloud.operations.get(options.resourceId);
  }
}

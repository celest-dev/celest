import 'package:celest_cli/src/commands/cloud/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud_core/celest_cloud_core.dart';

final class ListOperationsCommand extends CloudListCommand<Operation> {
  @override
  String get description => 'Lists operations.';

  @override
  String get name => 'list';

  @override
  String get resourceType => 'Operation';

  @override
  String? get parentResourceType => null;

  @override
  Operation createEmptyResource() => Operation();

  @override
  Future<CloudListResult<Operation>> callService() async {
    var filter = options.filter;
    if (options.maybeResourceId case final resourceId?) {
      final resourceName = ResourceName.parse(resourceId);
      final resourceFilter =
          'resource_type = "${resourceName.uid.type}" AND '
          'resource_id = "${resourceName.uid.id}"';
      if (filter == null || filter.isEmpty) {
        filter = resourceFilter;
      } else {
        filter = '$filter AND $resourceFilter';
      }
    }
    final result = await cloud.operations.list(
      filter: filter,
      pageSize: options.pageSize,
    );
    return (
      items: result.operations,
      nextPageToken: result.hasNextPageToken() ? result.nextPageToken : null,
    );
  }
}

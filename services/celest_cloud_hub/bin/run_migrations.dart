import 'package:celest/celest.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';

Future<void> main() async {
  final celestDb = await CelestDatabase.create(
    Context.current,
    name: 'CloudHubDatabase',
    factory: CloudHubDatabase.new,
    hostnameVariable: const env('CLOUD_HUB_DATABASE_HOST'),
    tokenSecret: const secret('CLOUD_HUB_DATABASE_TOKEN'),
  );
  final cloudHub = await celestDb.connect();
  await cloudHub.ping();
}

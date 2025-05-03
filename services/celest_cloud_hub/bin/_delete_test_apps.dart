import 'package:celest_cloud_hub/src/context.dart';

Future<void> main() async {
  final allApps = await context.fly.listApps();
  final appNames = allApps.apps!.map((app) => app.name!);
  for (final appName in appNames) {
    if (appName.startsWith(kCelestTest)) {
      try {
        await context.fly.deleteApp(appName: appName);
      } on Object catch (e) {
        print('Failed to delete app: $appName, error: $e');
      }
    } else {
      print('Skipping app: $appName');
    }
  }

  final allDatabases = await context.turso.listDatabases();
  for (final database in allDatabases) {
    if (database.name.startsWith(kCelestTest)) {
      try {
        await context.turso.deleteDatabase(databaseName: database.name);
      } on Object catch (e) {
        print('Failed to delete database: ${database.name}, error: $e');
      }
    } else {
      print('Skipping database: ${database.name}');
    }
  }
}

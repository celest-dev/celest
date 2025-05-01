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
}

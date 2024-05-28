import 'package:celest_cli/src/context.dart';
import 'package:test/test.dart';

import '../../common/common.dart';
import '../../common/test_projects.dart';

// Repro: https://github.com/celest-dev/celest/issues/25
final class AddRemoveFieldsTest extends E2ETest with TestDartProject {
  AddRemoveFieldsTest(super.target);

  @override
  String get name => 'add/remove fields in model';

  // TODO(dnys1): Get watcher working on Windows so that SIGUSR1 is not
  // needed.
  @override
  bool get skip => platform.isWindows;

  @override
  Future<void> run() async {
    final celest = celestCommand('start')
        .workingDirectory(projectDir.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine(projectName);
    log('Waiting for initial start');
    await celest
        .expectLater('Starting Celest')
        .expectNext('Celest is running')
        .flush();
    final functionFile = await celestDir
        .childDirectory('functions')
        .childFile('location.dart')
        .create();
    final modelsDir = projectDir
        .childDirectory('celest')
        .childDirectory('lib')
        .childDirectory('models');
    expect(modelsDir.existsSync(), isTrue);

    final locationFile = await modelsDir.childFile('location.dart').create();

    // Create location function
    log('Creating location function');
    await functionFile.writeAsString('''
import 'package:celest_backend/models/location.dart';

Future<Location> getLocation(String name) async {
  return Location(name: name);
}
''');
    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Project has errors')
        .flush();

    log('Creating location model');
    await locationFile.writeAsString('''
class Location {
  Location({required this.name});
  final String name;
}
''');
    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Celest is running')
        .flush();

    // Add GPS field to location
    log('Adding GPS field to location');
    await locationFile.writeAsString('''
typedef GPS = ({double latitude, double longitude});

class Location {
  Location({required this.name, required this.gps});
  final String name;
  GPS gps;
}
''');
    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Project has errors')
        .flush();

    log('Fixing location function');
    await functionFile.writeAsString('''
import 'package:celest_backend/models/location.dart';

Future<Location> getLocation(String name) async {
  return Location(name: name, gps: (latitude: 0.0, longitude: 0.0));
}
''');
    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Celest is running')
        .flush();

    // Remove GPS field
    log('Removing GPS field');
    await locationFile.writeAsString('''
class Location {
  Location({required this.name});
  final String name;
}
''');
    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Project has errors')
        .flush();

    log('Fixing location function');
    await functionFile.writeAsString('''
import 'package:celest_backend/models/location.dart';

Future<Location> getLocation(String name) async {
  return Location(name: name);
}
''');
    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Celest is running')
        .run();
  }
}

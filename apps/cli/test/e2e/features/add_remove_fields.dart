import 'package:test/test.dart';

import '../common/common.dart';

// Repro: https://github.com/celest-dev/celest/issues/25
final class AddRemoveFieldsTest extends Test {
  AddRemoveFieldsTest(super.target);

  @override
  String get name => 'add/remove fields in model';

  @override
  Future<void> run() async {
    final celest = celestCommand('start')
        .workingDirectory(flutterProjectDir.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine('hello');
    print('Waiting for initial start');
    await celest
        .expectLater('Starting Celest')
        .expectNext('Celest is running')
        .flush();
    final functionFile =
        celestDir.childDirectory('functions').childFile('location.dart');
    final modelsFile = flutterProjectDir
        .childDirectory('celest')
        .childDirectory('lib')
        .childFile('models.dart');
    expect(modelsFile.existsSync(), isTrue);

    // Create location function
    print('Creating location function');
    await functionFile.writeAsString('''
import 'package:celest_backend/models.dart';

Future<Location> getLocation(String name) async {
  return Location(name: name);
}
''');
    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Project has errors')
        .flush();

    print('Creating location model');
    await modelsFile.writeAsString('''
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
    print('Adding GPS field to location');
    await modelsFile.writeAsString('''
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

    print('Fixing location function');
    await functionFile.writeAsString('''
import 'package:celest_backend/models.dart';

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
    print('Removing GPS field');
    await modelsFile.writeAsString('''
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

    print('Fixing location function');
    await functionFile.writeAsString('''
import 'package:celest_backend/models.dart';

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

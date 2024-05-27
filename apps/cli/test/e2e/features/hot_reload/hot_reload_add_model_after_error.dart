import '../../common/common.dart';
import '../../common/test_projects.dart';

// Tests that saving a file with an error and then fixing the error correctly
// reloads the project.
final class HotReloadNonExistentModel extends E2ETest with TestFlutterProject {
  HotReloadNonExistentModel(super.target);

  @override
  String get name => 'hot reload (add auth)';

  @override
  Future<void> run() async {
    final celest = celestCommand('start')
        .workingDirectory(flutterProjectDir.path)
        .start()
        .expectNext('Enter a name for your project')
        .writeLine(projectName)
        .expectLater('Celest is running');
    await celest.flush();

    log('Creating API with non-existent model');
    final api = celestDir.childDirectory('functions').childFile('test.dart');
    await api.writeAsString(
      '''
import 'package:celest/celest.dart';

@cloud
Future<Model> createModel() async {
  return Model();
}
''',
    );

    await celest.hotReload().expectLater('Project has errors').flush();

    log('Adding model');
    final model = celestDir
        .childDirectory('lib')
        .childDirectory('models')
        .childFile('model.dart');
    await model.create(recursive: true);
    await model.writeAsString(
      '''
import 'package:celest/celest.dart';

class Model {}
''',
    );
    await api.writeAsString(
      '''
import 'package:celest/celest.dart';
import 'package:celest_backend/models/model.dart';

@cloud
Future<Model> createModel() async {
  return Model();
}
''',
    );

    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectLater('Celest is running')
        .run();
  }
}

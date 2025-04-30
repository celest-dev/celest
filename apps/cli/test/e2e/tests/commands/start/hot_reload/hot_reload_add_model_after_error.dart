import 'package:celest_cli/src/context.dart';

import '../../../../common/common.dart';
import '../../../../common/test_projects.dart';

// Tests that saving a file with an error and then fixing the error correctly
// reloads the project.
final class HotReloadNonExistentModel extends E2ETest with TestDartProject {
  HotReloadNonExistentModel(super.target);

  @override
  String get name => 'hot reload (non-existent model)';

  // TODO(dnys1): Get watcher working on Windows so that SIGUSR1 is not
  // needed.
  // TODO(dnys1): Get reload working on CI Linux
  @override
  bool get skip => platform.isWindows || platform.isLinux;

  @override
  Future<void> run() async {
    final celest = celestCommand('start')
        .workingDirectory(projectDir.path)
        .start()
        .expectLater('Celest is running');
    await celest.flush();

    final sourceDir = celestDir.childDirectory('lib').childDirectory('src');

    log('Creating API with non-existent model');
    final api = sourceDir.childDirectory('functions').childFile('test.dart');
    await api.writeAsString('''
import 'package:celest/celest.dart';

@cloud
Future<Model> createModel() async {
  return Model();
}
''');

    await celest.hotReload().expectLater('Project has errors').flush();

    log('Adding model');
    final model = sourceDir.childDirectory('models').childFile('model.dart');
    await model.create(recursive: true);
    await model.writeAsString('''
import 'package:celest/celest.dart';

class Model {}
''');
    await api.writeAsString('''
import 'package:celest/celest.dart';
import 'package:celest_backend/src/models/model.dart';

@cloud
Future<Model> createModel() async {
  return Model();
}
''');

    await celest
        .hotReload()
        .expectLater('Reloading Celest')
        .expectNext('Reloaded project')
        .run();
  }
}

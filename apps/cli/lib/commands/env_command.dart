import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class EnvCommand extends CelestCommand {
  EnvCommand() {
    addSubcommand(_EnvSetCommand());
    addSubcommand(_EnvGetCommand());
    addSubcommand(_EnvRemoveCommand());
  }

  @override
  String get description =>
      'Manages environment variables in your Celest backend.';

  @override
  String get name => 'env';

  @override
  String get category => 'Project';

  @override
  Future<int> run() async {
    await super.run();

    TODO();
  }
}

final class _EnvSetCommand extends CelestCommand {
  _EnvSetCommand();

  @override
  String get description => '''
Creates/updates an environment variable in your Celest backend.

To create/update a single environment variable, run:

  celest env set <variable>=<value>

To create/update multiple environment variables, run:

  celest env set <variable1>=<value1> <variable2>=<value2> <variable3>=<value3> ...

To create/update all environment variables, run the command with no extra
arguments. This will load the environment variables from the .env file in the
current project (config/.env) and prompt you for the values to update.

  celest env set
''';

  @override
  String get name => 'set';

  @override
  Future<int> run() async {
    await super.run();

    TODO();
  }
}

final class _EnvGetCommand extends CelestCommand {
  _EnvGetCommand() {
    argParser
      ..addOption(
        'format',
        abbr: 'f',
        allowed: ['env', 'json', 'yaml'],
        defaultsTo: 'env',
        help: 'The format to output the environment variables in.',
      )
      ..addOption(
        'output',
        abbr: 'o',
        help:
            'The file to output the environment variables to. Defaults to printing to the console.',
      )
      ..addFlag(
        'values',
        help: 'Whether to output the values of the environment variables.',
        defaultsTo: true,
        negatable: true,
      );
  }

  @override
  String get description => '''
Gets the value of environment variables in your Celest backend.

To get the value of a single environment variable, run:

  celest env get <variable>

To get the values of multiple environment variables, run:
  
  celest env get <variable1> <variable2> <variable3> ...

To get the values of all environment variables, run the command with no extra
arguments:

  celest env get
''';

  @override
  String get name => 'get';

  @override
  Future<int> run() async {
    await super.run();

    TODO();
  }
}

final class _EnvRemoveCommand extends CelestCommand {
  _EnvRemoveCommand();

  @override
  String get description => '''
Removes an environment variable from your Celest backend.

To remove a single environment variable, run:

  celest env remove <variable>

To remove multiple environment variables, run:

  celest env remove <variable1> <variable2> <variable3> ...

There is no option to remove all environment variables at once.
''';

  @override
  String get name => 'remove';

  @override
  Future<int> run() async {
    await super.run();

    TODO();
  }
}

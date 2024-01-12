import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/commands/project_command.dart';
import 'package:celest_cli/env/env_parser.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:yaml/yaml.dart';

final class EnvCommand extends ProjectCommand {
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
}

final class _EnvSetCommand extends ProjectCommand {
  _EnvSetCommand();

  @override
  String get description => '''
Creates/updates an environment variable in your Celest backend.

To create/update a single environment variable, run:

  celest env set <variable>=<value>

To create/update multiple environment variables, run:

  celest env set <variable1>=<value1> <variable2>=<value2> <variable3>=<value3> ...

To be prompted for which values to update, run the command with no extra
arguments. This will load the environment variables from the .env file in the
current project (config/.env) and prompt you for the values to update.

  celest env set
''';

  @override
  String get name => 'set';

  @override
  Future<int> run() async {
    await super.run();

    if (!isExistingProject) {
      logger.severe('Please run this command in a Celest project.');
      return 1;
    }

    final envManager = projectPaths.envManager;

    final envVars = argResults!.rest;
    if (envVars.isEmpty) {
      final allKeys = envManager.env.keys.toList();
      final toUpdate = cliLogger.chooseAny(
        'Which environment variables would you like to update?',
        choices: allKeys,
      );
      for (final envVar in toUpdate) {
        final value = cliLogger.prompt(
          'Enter the new value for $envVar',
          defaultValue: envManager.env[envVar],
          hidden: true,
        );
        envManager.set(envVar, value);
      }
    } else {
      for (final envVar in envVars) {
        final pair = EnvParser.parseOne(envVar);
        if (pair == null) {
          logger.severe('Ignoring invalid key=value pair: $envVar');
          continue;
        }
        final (:key, :value, start: _, end: _) = pair;
        if (key.isEmpty) {
          logger.severe('Ignoring invalid key=value pair: $envVar');
          continue;
        }
        envManager.set(key, value);
      }
    }

    final (:project, errors: _) = await CelestAnalyzer().analyzeProject();
    if (project == null) {
      logger.shout('Please fix project errors before continuing.');
      return 1;
    }
    envManager.writeChanges(
      project,
      onConflict: (key, curr) {
        return cliLogger.confirm(
          'Environment variable $key was modified with value $curr. Overwrite?',
          defaultValue: false,
        );
      },
    );
    return 0;
  }
}

enum _EnvFormat { env, json, yaml }

final class _EnvGetCommand extends ProjectCommand {
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

  late final _EnvFormat format = _EnvFormat.values.byName(
    argResults!['format'] as String,
  );
  late final String? output = argResults!['output'] as String?;
  late final bool values = argResults!['values'] as bool;

  void _writeEnv(Map<String, String> env) {
    final StringSink output;
    if (this.output case final outputPath?) {
      final outputFile = File(outputPath).openWrite();
      output = outputFile;
      defer(outputFile.close);
    } else {
      output = stdout;
    }
    switch (format) {
      case _EnvFormat.env:
        for (final MapEntry(:key, :value) in env.entries) {
          if (values) {
            output.writeln('$key=$value');
          } else {
            output.writeln(key);
          }
        }
      case _EnvFormat.json:
        if (values) {
          output.writeln(prettyPrintJson(env));
        } else {
          output.writeln(prettyPrintJson(env.keys.toList()));
        }
      case _EnvFormat.yaml:
        if (values) {
          output.writeln(YamlMap.wrap(env));
        } else {
          output.writeln(YamlList.wrap(env.keys.toList()));
        }
    }
  }

  @override
  Future<int> run() async {
    await super.run();

    if (!isExistingProject) {
      logger.severe('Please run this command in a Celest project.');
      return 1;
    }

    final envManager = projectPaths.envManager;
    final envVars = argResults!.rest;
    if (envVars.isEmpty) {
      _writeEnv(envManager.env);
    } else {
      final env = <String, String>{};
      for (final envVar in envVars) {
        final value = envManager.get(envVar);
        if (value == null) {
          logger.severe('Environment variable "$envVar" does not exist.');
          return 1;
        }
        env[envVar] = value;
      }
      _writeEnv(env);
    }

    return 0;
  }
}

final class _EnvRemoveCommand extends ProjectCommand {
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

    if (!isExistingProject) {
      logger.severe('Please run this command in a Celest project.');
      return 1;
    }

    final envManager = projectPaths.envManager;
    final envVars = argResults!.rest;
    if (envVars.isEmpty) {
      logger.severe('Please specify at least one environment variable.');
      return 1;
    }
    for (final envVar in envVars) {
      envManager.remove(envVar);
    }

    final (:project, errors: _) = await CelestAnalyzer().analyzeProject();
    if (project == null) {
      logger.shout('Please fix project errors before continuing.');
      return 1;
    }
    envManager.writeChanges(
      project,
      onConflict: (key, curr) => true,
    );

    return 0;
  }
}

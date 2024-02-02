import 'dart:convert';
import 'dart:typed_data';

import 'package:celest_cli/commands/deploy_command.dart';
import 'package:celest_cli/commands/start_command.dart';
import 'package:celest_cli/commands/uninstall_command.dart';
import 'package:celest_cli/commands/upgrade_command.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/src/version.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:sentry/sentry.dart';

final _jsonUtf8 = JsonUtf8Encoder('  ');

void main(List<String> args) async {
  final cli = Cli(
    'celest',
    'A command-line interface for Celest, the Flutter cloud platform.',
    version: packageVersion,
    postHogConfig: (
      apiHost: 'https://eu.posthog.com',
      apiKey: 'phc_IzYKGpBnjbb4GM7JsfaIzIu34EVh4PqgbZLVuihCaSm',
    ),
    sentryConfig: SentryConfig(
      dsn:
          'https://aa63419b83419820da1454809c0025db@o4506345201532928.ingest.sentry.io/4506496721158144',
      beforeSend: (event, {hint}) {
        if (CelestFrontend.instance?.currentProject
            case final currentProject?) {
          hint?.attachments.add(
            SentryAttachment.fromUint8List(
              _jsonUtf8.convert(currentProject.toJson()) as Uint8List,
              'project.json',
              contentType: 'application/json',
            ),
          );
        }
        return event;
      },
    ),
  )..addCommand(StartCommand());
  if (platform.environment.containsKey('CELEST_ENABLE_DEPLOY')) {
    cli.addCommand(DeployCommand());
  }
  cli
    ..addCommand(UpgradeCommand())
    ..addCommand(UninstallCommand());
  await cli.run(args);
}

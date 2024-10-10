import 'dart:convert';
import 'dart:io';

import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/env/config_value_solver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
// ignore: implementation_imports
import 'package:process/src/interface/common.dart';
import 'package:toml/toml.dart';

final class SupabaseConfigValueSolver extends PromptConfigValueSolver {
  SupabaseConfigValueSolver({
    required super.projectName,
    required super.environmentId,
    @visibleForTesting super.projectDb,
  });

  static final Logger _logger = Logger('SupabaseConfigValueSolver');

  Future<Directory?> _findSupabaseDir() async {
    // We search in both the parent project (if there is one) and the Celest
    // project for Supabase configuration files.
    final searchDirs = [
      fileSystem.directory(projectPaths.projectRoot),
      if (celestProject.parentProject?.path case final parentPath?)
        fileSystem.directory(parentPath),
    ];

    for (final searchDir in searchDirs) {
      final supabaseDir = searchDir.childDirectory('supabase');
      if (supabaseDir.existsSync()) {
        _logger.finest('Found Supabase directory: $supabaseDir');
        return supabaseDir;
      }
    }

    _logger.finest('Supabase directory not found in $searchDirs');
    return null;
  }

  Future<Directory?>? _supabaseDir;
  Future<Directory?> get supabaseDir {
    return _supabaseDir ??= _findSupabaseDir();
  }

  Future<String?> findLinkedProjectRef() async {
    final supabaseDir = await this.supabaseDir;
    if (supabaseDir == null) {
      return null;
    }
    // The path used by Supabase CLI to store the linked project ref.
    // https://github.com/supabase/cli/blob/333a2ca5522e493cd35a853f258e9fd9b5098558/internal/utils/misc.go#L133
    final projectRefFile =
        supabaseDir.childDirectory('.temp').childFile('project-ref');
    if (!projectRefFile.existsSync()) {
      _logger.finest('Supabase project ref not found in $supabaseDir');
      return null;
    }
    final projectRef = await projectRefFile.readAsString();
    return projectRef.trim();
  }

  Future<String?> findConfigUrl() async {
    final supabaseDir = await this.supabaseDir;
    if (supabaseDir == null) {
      return null;
    }
    final configTomlFile = supabaseDir.childFile('config.toml');
    if (!configTomlFile.existsSync()) {
      _logger.finest('Supabase config.toml not found in $supabaseDir');
      return null;
    }
    try {
      final configTomlString = await configTomlFile.readAsString();
      final configToml = TomlDocument.parse(configTomlString);
      return switch (configToml.toMap()) {
        {
          'api': {
            'external_url': final String externalUrl,
          }
        } =>
          externalUrl,
        _ => run(() {
            _logger.fine('Supabase config.toml does not specify external_url');
            return null;
          }),
      };
    } on Object catch (e, st) {
      _logger.fine('Failed to parse Supabase config.toml', e, st);
      return null;
    }
  }

  /// Gets the status of the local Supabase server via `supabase status`.
  Future<SupabaseServerStatus?> getLocalServerStatus() async {
    final supabaseDir = await this.supabaseDir;
    if (supabaseDir == null) {
      return null;
    }
    final supabaseCli = getExecutablePath(
      'supabase',
      null,
      fs: fileSystem,
      platform: platform,
      throwOnFailure: false,
    );
    if (supabaseCli == null) {
      _logger.finest('Supabase CLI not found');
      return null;
    }
    try {
      final ProcessResult(
        :exitCode,
        :stdout as String,
        :stderr as String,
      ) = await processManager.run(
        [supabaseCli, 'status', '--output', 'json'],
        workingDirectory: supabaseDir.parent.path,
      );
      if (exitCode != 0) {
        _logger.fine(
          'Supabase CLI failed with code $exitCode',
          '$stdout\n$stderr',
        );
        return null;
      }
      return switch (jsonDecode(stdout.trim())) {
        {
          'API_URL': final String apiUrl,
          'JWT_SECRET': final String jwtSecret,
        } =>
          SupabaseServerStatus(apiUrl: apiUrl, jwtSecret: jwtSecret),
        _ => null,
      };
    } on Object catch (e, st) {
      _logger.fine('Failed to resolve JWT secret from Supabase CLI', e, st);
      return null;
    }
  }

  @override
  Future<String> solve(ConfigurationVariable configVar) async {
    // For the local environment, we use the output of `supabase status` to
    // get the project URL.
    if (environmentId == 'local') {
      final serverStatus = await getLocalServerStatus();
      if (serverStatus != null) {
        _logger.fine('Found local Supabase server: ${serverStatus.apiUrl}');
        return storeVariable(configVar.name, serverStatus.apiUrl);
      }
    }

    // Search for a Supabase config.toml and read the external URL from it.
    final configUrl = await findConfigUrl();
    if (configUrl != null) {
      _logger.fine('Found Supabase config URL: $configUrl');
      return storeVariable(configVar.name, configUrl);
    }

    // Search for a Supabase directory and read the project ref from it.
    final projectRef = await findLinkedProjectRef();
    if (projectRef != null) {
      _logger.fine('Found Supabase project ref: $projectRef');
      return storeVariable(
        configVar.name,
        'https://$projectRef.supabase.co',
      );
    }

    // If we're not in the local environment, we need to find the project ref
    return super.solve(configVar);
  }
}

final class SupabaseServerStatus {
  const SupabaseServerStatus({
    required this.apiUrl,
    required this.jwtSecret,
  });

  final String apiUrl;

  @visibleForTesting
  final String jwtSecret;
}

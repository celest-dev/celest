// Copied from cli_util so that we can support mocking platforms.
// https://github.com/dart-lang/cli_util/blob/e5b38ac76887e6eefaf417f5222c317929eed278/lib/cli_util.dart#L41

import 'package:celest_cli/src/context.dart';

/// Get the user-specific application configuration folder for the current
/// platform.
///
/// This is a location appropriate for storing application specific
/// configuration for the current user. The [productName] should be unique to
/// avoid clashes with other applications on the same machine. This method won't
/// actually create the folder, merely return the recommended location for
/// storing user-specific application configuration.
///
/// The folder location depends on the platform:
///  * `%APPDATA%\<productName>` on **Windows**,
///  * `$HOME/Library/Application Support/<productName>` on **Mac OS**,
///  * `$XDG_CONFIG_HOME/<productName>` on **Linux**
///     (if `$XDG_CONFIG_HOME` is defined), and,
///  * `$HOME/.config/<productName>` otherwise.
///
/// This aims follows best practices for each platform, honoring the
/// [XDG Base Directory Specification][1] on Linux and [File System Basics][2]
/// on Mac OS.
///
/// Throws an [EnvironmentNotFoundException] if `%APPDATA%` or `$HOME` is needed
/// but undefined.
///
/// [1]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
/// [2]: https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html#//apple_ref/doc/uid/TP40010672-CH2-SW1
String applicationConfigHome(String productName) =>
    p.join(_configHome, productName);

String get _configHome {
  if (platform.isWindows) {
    final appdata = _env['APPDATA'];
    if (appdata == null) {
      throw EnvironmentNotFoundException(
        'Environment variable %APPDATA% is not defined!',
      );
    }
    return appdata;
  }

  if (platform.isMacOS) {
    return p.join(_home, 'Library', 'Application Support');
  }

  if (platform.isLinux) {
    final xdgConfigHome = _env['XDG_CONFIG_HOME'];
    if (xdgConfigHome != null) {
      return xdgConfigHome;
    }
    // XDG Base Directory Specification says to use $HOME/.config/ when
    // $XDG_CONFIG_HOME isn't defined.
    return p.join(_home, '.config');
  }

  // We have no guidelines, perhaps we should just do: $HOME/.config/
  // same as XDG specification would specify as fallback.
  return p.join(_home, '.config');
}

String get _home {
  final home = _env['HOME'];
  if (home == null) {
    throw EnvironmentNotFoundException(
      r'Environment variable $HOME is not defined!',
    );
  }
  return home;
}

class EnvironmentNotFoundException implements Exception {
  EnvironmentNotFoundException(this.message);

  final String message;

  @override
  String toString() => message;
}

Map<String, String> get _env => platform.environment;

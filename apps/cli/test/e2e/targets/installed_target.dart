import 'package:celest_cli/src/context.dart';

import '../common/common.dart';

final class InstalledTarget extends TestTarget {
  @override
  String get name => 'Installed';

  @override
  List<String> get tags => const ['e2e-installed'];

  @override
  List<String> get executable => [
        if (platform.isWindows)
          p.join(
            platform.environment['LOCALAPPDATA']!,
            'Microsoft',
            'WindowsApps',
            'celest.exe',
          )
        else
          'celest',
      ];
}

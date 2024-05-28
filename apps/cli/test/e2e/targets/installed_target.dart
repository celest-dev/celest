import '../common/common.dart';

final class InstalledTarget extends TestTarget {
  @override
  String get name => 'Installed';

  @override
  List<String> get tags => const ['e2e-installed'];

  @override
  List<String> get executable => [
        // getExecutablePath('celest', null, throwOnFailure: true)!,
        'celest',
      ];
}

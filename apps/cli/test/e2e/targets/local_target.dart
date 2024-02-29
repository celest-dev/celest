import 'dart:io';

import '../common/common.dart';

final class LocalTarget extends TestTarget {
  @override
  String get name => 'Local';

  @override
  List<String> get tags => const ['e2e-local'];

  @override
  List<String> get executable => [
        Platform.resolvedExecutable,
        '--enable-asserts',
        Directory.current.uri.resolve('bin/celest.dart').toFilePath(),
      ];
}

import 'dart:io';

import 'package:celest_cli_common/celest_cli_common.dart';

import '../common/common.dart';

final class LocalTarget extends TestTarget {
  @override
  String get name => 'Local';

  @override
  List<String> get tags => const ['e2e-local'];

  @override
  List<String> get executable => [
        Sdk.current.dart,
        Directory.current.uri.resolve('bin/celest.dart').toFilePath(),
      ];
}

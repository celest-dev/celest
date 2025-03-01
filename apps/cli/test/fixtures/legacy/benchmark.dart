import 'dart:io';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/src/context.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  final benchmarks = [LargeProjectBenchmark()];

  for (final benchmark in benchmarks) {
    print('Running benchmark: ${benchmark.name}');
    await benchmark.report();
  }

  exit(0);
}

final class LargeProjectBenchmark extends AsyncBenchmarkBase {
  LargeProjectBenchmark() : super('LargeProject');

  static final analyzer = CelestAnalyzer();

  @override
  Future<void> setup() async {
    final projectRoot = p.join(
      Directory.current.path,
      'test',
      'fixtures',
      'legacy',
      'api',
    );
    await init(projectRoot: projectRoot);
    await runPub(action: PubAction.get, workingDirectory: projectRoot);
  }

  @override
  Future<void> run() async {
    await analyzer.analyzeProject(updateResources: false);
  }

  @override
  Future<void> teardown() async {
    await celestProject.close();
  }
}

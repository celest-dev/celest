import 'package:async/async.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/pub/pub_cache.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('PubCache', () {
    setUpAll(initTests);

    test('finds pub cache', () {
      expect(pubCache.findCachePath(), isNotNull);
    });

    test('hydrates packages', timeout: Timeout.none, () async {
      await Result.release(pubCache.hydrate());
    });

    test(
      'fixes cache',
      timeout: Timeout.none,
      skip: !platform.environment.containsKey('CI'),
      () async {
        final result = await pubCache.repair();
        expect(
          result.exitCode,
          0,
          reason: '${result.stdout}\n${result.stderr}',
        );
        final numFixed = await pubCache.fix(throwOnError: true);
        expect(numFixed, greaterThan(PubCache.packagesToFix.length));
      },
    );
  });
}

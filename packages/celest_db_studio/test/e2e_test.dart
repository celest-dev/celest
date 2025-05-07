@TestOn('vm')
library;

import 'dart:convert';
import 'dart:io';

import 'package:docker_process/docker_process.dart';
import 'package:test/test.dart';
import 'package:webdriver/async_io.dart';

import 'start_server.dart';

void main() {
  late int port;

  void withLibsql() {
    late DockerProcess sqld;
    late Process p;

    setUpAll(() async {
      final sqldPort = await selectFreePort();
      sqld = await startSqld(sqldPort);

      port = await selectFreePort();
      p = await Process.start(
        'dart',
        ['run', 'bin/server.dart'],
        environment: {
          'PORT': '$port',
          'DATABASE_URL': 'http://localhost:$sqldPort',
        },
      );
      await Future.any([
        p.stdout
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .firstWhere((line) => line.contains('Server listening')),
        p.stderr
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .first
            .then(fail),
      ]);
    });

    tearDownAll(() async {
      p.kill();
      await p.exitCode;
      await sqld.kill();
    });
  }

  void withFileDb() {
    late Process p;
    late Directory dbDir;

    setUpAll(() async {
      port = await selectFreePort();
      dbDir = await Directory.systemTemp.createTemp('db_studio_test_');
      p = await Process.start(
        'dart',
        ['run', 'bin/server.dart'],
        environment: {
          'PORT': '$port',
          'DATABASE_URL': dbDir.uri.resolve('test.db').toString(),
        },
      );
      await Future.any([
        p.stdout
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .firstWhere((line) => line.contains('Server listening')),
        p.stderr
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .first
            .then(fail),
      ]);
    });

    tearDownAll(() async {
      p.kill();
      await p.exitCode;
      try {
        await dbDir.delete(recursive: true);
      } catch (e) {
        // OK
      }
    });
  }

  void withMemoryDb() {
    late Process p;

    setUpAll(() async {
      port = await selectFreePort();
      p = await Process.start(
        'dart',
        ['run', 'bin/server.dart'],
        environment: {'PORT': '$port', 'DATABASE_URL': 'file::memory:'},
      );
      await Future.any([
        p.stdout
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .firstWhere((line) => line.contains('Server listening')),
        p.stderr
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .first
            .then(fail),
      ]);
    });

    tearDownAll(() async {
      p.kill();
      await p.exitCode;
    });
  }

  for (final (name, setup) in [
    ('libsql', withLibsql),
    ('file', withFileDb),
    ('memory', withMemoryDb),
  ]) {
    group(name, () {
      setup();

      test(
        'E2E',
        skip: hasChromeDriver ? null : 'Chromedriver not installed',
        () async {
          final chromedriver = await Process.start('chromedriver', [
            '--port=4444',
            '--url-base=wd/hub',
          ]);
          addTearDown(() async {
            chromedriver.kill();
            await chromedriver.exitCode;
          });
          await Future.any([
            chromedriver.stdout
                .transform(utf8.decoder)
                .transform(const LineSplitter())
                .firstWhere(
                  (line) =>
                      line.contains('ChromeDriver was started successfully'),
                ),
            chromedriver.stderr
                .transform(utf8.decoder)
                .transform(const LineSplitter())
                .first
                .then(fail),
          ]);

          final driver = await createDriver(
            spec: WebDriverSpec.JsonWire,
            desired: {
              ...Capabilities.chrome,
              Capabilities.chromeOptions: {
                'args': [
                  if (Platform.environment.containsKey('CI')) '--headless',
                ],
              },
            },
          );
          addTearDown(driver.quit);

          await driver.get('http://localhost:$port');
          final iframe = await driver.waitForElement(
            const By.tagName('iframe'),
            timeout: const Duration(seconds: 10),
          );
          final src = await iframe.attributes['src'];
          expect(src, 'https://studio.outerbase.com/embed/sqlite');

          // Ensure that sending `SELECT 1;` works and returns `1` in the result cell.

          await driver.switchTo.frame(iframe);

          final input = await driver.waitForElement(
            const By.className('cm-content'),
          );
          await input.click();
          await input.sendKeys('SELECT 1;');

          final runButton = await driver.findElement(
            const By.cssSelector(
              r'body > div.flex.h-screen.w-screen.flex-col > div > div:nth-child(3) > div.flex.h-full.w-full.flex-col > div.relative.grow > div > div > div:nth-child(1) > div > div.flex.border-b.bg-neutral-50.py-3.pr-1.pl-3.dark\:bg-neutral-950 > div.flex.gap-2 > div > button.inline-flex.items-center.justify-center.whitespace-nowrap.font-medium.transition-colors.focus-visible\:outline-hidden.focus-visible\:ring-1.focus-visible\:ring-ring.disabled\:pointer-events-none.disabled\:opacity-50.bg-primary.text-primary-foreground.shadow-sm.hover\:bg-primary\/90.h-8.rounded-md.px-3.text-sm.rounded-r-none',
            ),
          );
          await runButton.click();

          final resultCell = await driver.waitForElement(
            const By.cssSelector(
              r'body > div.flex.h-screen.w-screen.flex-col > div > div:nth-child(3) > div.flex.h-full.w-full.flex-col > div.relative.grow > div > div > div:nth-child(3) > div.flex.h-full.w-full.flex-col > div.relative.grow > div:nth-child(1) > div > div.grow.overflow-hidden > div > div > table > tbody > tr > td.overflow-hidden.border-r.border-b.box-border.hover\:bg-neutral-100.dark\:hover\:bg-neutral-800.bg-transparent',
            ),
          );
          await expectLater(resultCell.text, completion('1'));
        },
      );
    });
  }
}

bool get hasChromeDriver {
  try {
    Process.runSync('chromedriver', ['--version']);
    return true;
  } catch (e) {
    return false;
  }
}

extension on SearchContext {
  Future<WebElement> waitForElement(
    By by, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final stopwatch = Stopwatch()..start();
    while (stopwatch.elapsed < timeout) {
      try {
        return await findElement(by);
      } catch (e) {
        // Ignore and retry
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
    throw TimeoutException(null, 'Element not found within $timeout');
  }
}

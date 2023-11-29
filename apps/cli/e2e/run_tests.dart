import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:celest_cli/analyzer/analyzer.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

Future<void> main(List<String> args) async {
  final argParser = ArgParser()
    ..addFlag(
      'update-goldens',
      abbr: 'u',
      defaultsTo: false,
      negatable: false,
    );

  final argResults = argParser.parse(args);
  final updateGoldens = argResults['update-goldens'] as bool;

  final testDir = p.dirname(p.fromUri(Platform.script));
  final allTests = Directory(testDir).listSync().whereType<Directory>();
  for (final testDir in allTests) {
    final projectRoot = testDir.path;
    final testName = p.basename(projectRoot);
    group(testName, () {
      late Directory goldensDir;
      late Client client;
      final analyzer = CelestAnalyzer.start(
        projectRoot: projectRoot,
      );

      setUpAll(() {
        final res = Process.runSync(
          Platform.executable,
          ['pub', 'get'],
          workingDirectory: projectRoot,
        );
        expect(res.exitCode, 0, reason: '${res.stderr}');
        goldensDir = Directory('$projectRoot/goldens')
          ..deleteSync(recursive: true)
          ..createSync();
        client = Client();
      });

      tearDownAll(() {
        client.close();
      });

      test('analyzer', () async {
        final (projectAst, errors) = await analyzer.analyzeProject();
        expect(errors, isEmpty);

        final goldenAst = File('${goldensDir.path}/ast.json');
        if (updateGoldens) {
          goldenAst.writeAsStringSync(
            const JsonEncoder.withIndent('  ').convert(projectAst.toJson()),
          );
        } else {
          final expected = jsonDecode(goldenAst.readAsStringSync());
          expect(projectAst.toJson(), expected);
        }
      });

      test('codegen', () async {
        final (projectAst, errors) = await analyzer.analyzeProject();
        expect(errors, isEmpty);
        final codegen = CodeGenerator(projectRoot, outputDir: goldensDir.path);
        projectAst.accept(codegen);
        for (final MapEntry(key: path, value: content)
            in codegen.outputs.entries) {
          final goldenFile = File(path);
          if (updateGoldens) {
            goldenFile
              ..createSync(recursive: true)
              ..writeAsStringSync(content);
          } else {
            final expected = goldenFile.readAsStringSync();
            expect(content, expected);
          }
        }
      });

      final apisDir = Directory(p.join(projectRoot, 'apis'));
      if (!apisDir.existsSync()) {
        return;
      }
      group('apis', skip: true, () {
        final apis = apisDir
            .listSync()
            .whereType<File>()
            .where((f) => p.extension(f.path) == '.dart');
        var port = 8080;

        for (final api in apis) {
          final apiName = p.basenameWithoutExtension(api.path);
          group(apiName, () {
            late Process functionProc;
            late Uri apiUri;

            setUp(() async {
              port++;
              apiUri = Uri.parse('http://localhost:$port');
              final entrypoint =
                  '${goldensDir.path}/apis/$apiName/$testName.dart';
              functionProc = await Process.start(
                Platform.executable,
                [entrypoint],
                mode: ProcessStartMode.inheritStdio,
                environment: {
                  'PORT': '$port',
                },
              );
              await Future<void>.delayed(const Duration(seconds: 5));
            });

            tearDown(() async {
              functionProc.kill();
              await functionProc.exitCode;
            });

            test('can serve', () {
              expect(
                client.get(apiUri),
                completes,
              );
            });

            final apiTests = File('$projectRoot/apis/$apiName.json');
            if (!apiTests.existsSync()) {
              return;
            }
            final apiTestsJson =
                jsonDecode(apiTests.readAsStringSync()) as Map<String, dynamic>;
            for (final MapEntry(key: testName, value: List<Object?> tests)
                in apiTestsJson.entries) {
              test(testName, () async {
                for (final test in tests) {
                  test as Map<String, dynamic>;
                  final input = test['input'] as Object;
                  final output = test['output'];
                  final error = test['error'];
                  try {
                    final resp = await client.post(
                      apiUri,
                      headers: {
                        'Content-Type': 'application/json',
                      },
                      body: jsonEncode(input),
                    );
                    if (resp.statusCode == 200) {
                      if (output == null) {
                        fail('Expected error, got ${resp.body}');
                      }
                      final respJson = jsonDecode(resp.body);
                      expect(respJson, output);
                    } else {
                      if (error == null) {
                        fail('Expected $output, got ${resp.body}');
                      }
                      expect(
                        resp.body,
                        contains(error.toString()),
                      );
                    }
                  } on TestFailure {
                    rethrow;
                  } on Exception catch (e) {
                    if (error == null) {
                      fail('Expected $output, got error: $e');
                    }
                    expect(
                      e.toString(),
                      contains(error.toString()),
                    );
                  }
                }
              });
            }
          });
        }
      });
    });
  }
}

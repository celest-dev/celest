import 'package:celest_cli/src/env/env_parser.dart';
import 'package:test/test.dart';

void main() {
  group('EnvParser', () {
    test('parses assignments and ignores comments', () {
      final parser = EnvParser(
        source: 'FOO=bar\n# comment\nBAZ = qux # trailing comment\n',
        sourceUri: Uri.parse('env://basic'),
      )..parse();

      expect(parser.env, equals({'FOO': 'bar', 'BAZ': 'qux'}));
      expect(parser.errors, isEmpty);
    });

    test('supports export prefix and preserves spans', () {
      final parser = EnvParser(
        source: ' export   FOO = "value"\n',
        sourceUri: Uri.parse('env://export'),
      )..parse();

      expect(parser.env['FOO'], 'value');
      final span = parser.spans['FOO']!;
      expect(span.text, contains('FOO = "value"'));
    });

    test('handles double-quoted escapes', () {
      final parser = EnvParser(
        source: 'GREETING="Hello\\nWorld\\t!"\n',
        sourceUri: Uri.parse('env://escapes'),
      )..parse();

      expect(parser.env['GREETING'], 'Hello\nWorld\t!');
    });

    test('single-quoted values disable interpolation', () {
      final parser = EnvParser(
        source: "SECRET='\${HOME}'\n",
        sourceUri: Uri.parse('env://single'),
        options: const EnvParserOptions(
          interpolate: true,
          interpolationEnvironment: {'HOME': '/tmp'},
        ),
      )..parse();

      expect(parser.env['SECRET'], r'${HOME}');
    });

    test('trims unquoted values and respects escaped hashes', () {
      final parser = EnvParser(
        source: 'URL=https://example.com/\\#section   # comment\n',
        sourceUri: Uri.parse('env://hash'),
      )..parse();

      expect(parser.env['URL'], 'https://example.com/#section');
    });

    test('applies duplicate key behavior: replace (default)', () {
      final parser = EnvParser(
        source: 'FOO=bar\nFOO=baz\n',
        sourceUri: Uri.parse('env://dup'),
      )..parse();

      expect(parser.env, equals({'FOO': 'baz'}));
      expect(parser.errors.single.message, 'Duplicate key: FOO');
    });

    test('applies duplicate key behavior: keepFirst', () {
      final parser = EnvParser(
        source: 'FOO=bar\nFOO=baz\n',
        sourceUri: Uri.parse('env://dup'),
        options: const EnvParserOptions(
          duplicateKeyBehavior: EnvDuplicateKeyBehavior.keepFirst,
        ),
      )..parse();

      expect(parser.env, equals({'FOO': 'bar'}));
      expect(parser.errors.single.message, 'Duplicate key: FOO');
    });

    test('applies duplicate key behavior: error', () {
      final parser = EnvParser(
        source: 'FOO=bar\nFOO=baz\n',
        sourceUri: Uri.parse('env://dup'),
        options: const EnvParserOptions(
          duplicateKeyBehavior: EnvDuplicateKeyBehavior.error,
        ),
      )..parse();

      expect(parser.env, equals({'FOO': 'bar'}));
      expect(parser.errors.single.message, 'Duplicate key: FOO');
    });

    test('reports missing equals delimiter', () {
      final parser = EnvParser(
        source: 'MALFORMED\nFOO=bar\n',
        sourceUri: Uri.parse('env://missing'),
      )..parse();

      expect(parser.env, equals({'FOO': 'bar'}));
      expect(parser.errors.single.message, contains('missing "=" delimiter'));
    });

    test('validates keys against provided pattern', () {
      final parser = EnvParser(
        source: 'invalid-key=value\nVALID=1\n',
        sourceUri: Uri.parse('env://pattern'),
        options: EnvParserOptions(keyPattern: RegExp(r'^[A-Z_]+$')),
      )..parse();

      expect(parser.env, equals({'VALID': '1'}));
      expect(
        parser.errors.single.message,
        contains('Invalid env key "invalid-key"'),
      );
    });

    test('captures unterminated double quotes and continues', () {
      final parser = EnvParser(
        source: 'BROKEN="value\nNEXT=ok\n',
        sourceUri: Uri.parse('env://unterminated'),
      )..parse();

      expect(parser.env, equals({'NEXT': 'ok'}));
      expect(
        parser.errors.single.message,
        contains('Unterminated double-quoted value'),
      );
    });

    test('interpolates using previous entries and environment scope', () {
      final parser = EnvParser(
        source: 'HOST=localhost\nURL=http://\$HOST:8080\nHOME_DIR=\$HOME\n',
        sourceUri: Uri.parse('env://interpolate'),
        options: const EnvParserOptions(
          interpolate: true,
          interpolationEnvironment: {'HOME': '/Users/tester'},
        ),
      )..parse();

      expect(
        parser.env,
        equals({
          'HOST': 'localhost',
          'URL': 'http://localhost:8080',
          'HOME_DIR': '/Users/tester',
        }),
      );
    });

    test('allows escaping interpolation markers', () {
      final buffer = StringBuffer()
        ..writeln('HOST=prod')
        ..writeln(r'VALUE=\$HOST-${HOST}');
      final parser = EnvParser(
        source: buffer.toString(),
        sourceUri: Uri.parse('env://escaped'),
        options: const EnvParserOptions(interpolate: true),
      )..parse();

      expect(parser.env['VALUE'], r'$HOST-prod');
    });
  });

  group('EnvParser.parseOne', () {
    test('returns parsed assignment', () {
      final parsed = EnvParser.parseOne('FOO=bar');

      expect(parsed, isNotNull);
      expect(parsed!.key, 'FOO');
      expect(parsed.value, 'bar');
      expect(parsed.start, 0);
      expect(parsed.end, greaterThan(parsed.start));
    });

    test('returns null for invalid entry', () {
      final parsed = EnvParser.parseOne('INVALID LINE');

      expect(parsed, isNull);
    });
  });
}

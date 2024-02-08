@OnPlatform({
  'windows': Skip('ChrootFileSystem is not working in GH actions'),
})
library;

import 'dart:convert';

import 'package:celest_cli/src/jsettings/jsettings.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/chroot.dart';
import 'package:file/file.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

DateTime unixTime(int msec) => DateTime.fromMillisecondsSinceEpoch(msec);

class MockDirectory extends Mock implements Directory {}

class MockFile extends Mock implements File {}

void main() {
  group('JSettings', () {
    late Directory tempDir;

    setUpAll(() {
      tempDir = fileSystem.systemTempDirectory.createTempSync();
      fileSystem = ChrootFileSystem(fileSystem, tempDir.path);
    });

    tearDownAll(() {
      tempDir.deleteSync(recursive: true);
    });

    test('read non-existent file', () async {
      const filename = 'non-existent.json';
      final settings = JSettings(filename);
      expect(settings.path, filename);

      expect(settings.getKeys(), isEmpty);
      expect(settings.getValues(), isEmpty);
      expect(settings.hasValue('key'), isFalse);
      expect(settings.getValue('key'), isNull);
      expect(settings.getBool('key'), isNull);
      expect(settings.getInt('key'), isNull);
      expect(settings.getDouble('key'), isNull);
      expect(settings.getString('key'), isNull);
      expect(settings.getList('key'), isNull);
      expect(settings.getMap('key'), isNull);
    });

    test('read existent file', () async {
      const filename = 'existing.json';
      final settings = JSettings(filename);
      expect(settings.path, filename);

      const values = {
        'b': true,
        'i': 123,
        'd': 123.456,
        's': 'abc',
        'l': ['a', 'b', 'c'],
        'm': {'a': 1, 'b': 2, 'c': 3},
      };

      tempDir.childFile(filename).writeAsStringSync(jsonEncode(values));

      expect(settings.getKeys(), unorderedEquals(values.keys));
      expect(settings.getValues(), values);
      expect(settings.hasValue('x'), isFalse);
      expect(settings.hasValue('b'), isTrue);
      expect(settings.hasValue('i'), isTrue);
      expect(settings.hasValue('d'), isTrue);
      expect(settings.hasValue('s'), isTrue);
      expect(settings.hasValue('l'), isTrue);
      expect(settings.hasValue('m'), isTrue);
      expect(settings.getValue('x'), isNull);
      expect(settings.getValue('b'), values['b']);
      expect(settings.getValue('i'), values['i']);
      expect(settings.getValue('d'), values['d']);
      expect(settings.getValue('s'), values['s']);
      expect(settings.getValue('l'), values['l']);
      expect(settings.getValue('m'), values['m']);
      expect(
        settings.getBool('b'),
        isA<bool>().having((v) => v, 'bool', values['b']),
      );
      expect(
        settings.getInt('i'),
        isA<int>().having((v) => v, 'int', values['i']),
      );
      expect(
        settings.getDouble('d'),
        isA<double>().having((v) => v, 'double', values['d']),
      );
      expect(
        settings.getString('s'),
        isA<String>().having((v) => v, 'string', values['s']),
      );
      expect(
        settings.getList('l'),
        isA<List<Object?>>().having((v) => v, 'list', values['l']),
      );
      expect(
        settings.getMap('m'),
        isA<Map<String, Object?>>().having((v) => v, 'map', values['m']),
      );
    });

    test('read broken formatting', () async {
      const filename = 'broken.json';
      final settings = JSettings(filename);
      expect(settings.path, filename);

      tempDir.childFile(filename).writeAsStringSync('broken');

      expect(settings.getKeys(), isEmpty);
      expect(settings.getValues(), isEmpty);
      expect(settings.hasValue('x'), isFalse);
      expect(settings.getValue('x'), isNull);
    });

    test('write non-existent file', () async {
      const filename = 'non-existent.json';
      final settings = JSettings(filename);
      expect(settings.path, filename);

      await settings.setValue('key', 'value');

      final contents = await tempDir.childFile(filename).readAsString();
      expect(jsonDecode(contents), {
        'key': 'value',
      });
    });

    test('write existing file', () async {
      const filename = 'existing.json';
      final settings = JSettings(filename);
      expect(settings.path, filename);

      final file = tempDir.childFile(filename);
      file.writeAsStringSync('{"key1":"value1"}');
      await settings.setValue('key2', 'value2');

      final contents = await file.readAsString();
      expect(jsonDecode(contents), {
        'key1': 'value1',
        'key2': 'value2',
      });
    });

    test('create directory', () async {
      final dir = tempDir.childDirectory('test');
      expect(dir.existsSync(), isFalse);
      final settings = JSettings('test/watched.json');
      await settings.init();
      expect(dir.existsSync(), isTrue);
    });

    test('emit explicit changes', () async {
      const filename = 'settings.json';
      final settings = JSettings(filename);

      expect(settings.added, emits('foo'));
      await settings.setValue('foo', 'bar');

      expect(settings.changed, emits('foo'));
      await settings.setValue('foo', 'baz');

      expect(settings.removed, emits('foo'));
      await settings.setValue('foo', null);
    });
  });
}

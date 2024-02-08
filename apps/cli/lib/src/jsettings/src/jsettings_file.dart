import 'dart:async';
import 'dart:convert';
import 'dart:io' show FileSystemEvent;

import 'package:celest_cli/src/context.dart';

class JSettingsFile {
  JSettingsFile(this.path);

  final String path;

  DateTime? _timestamp;
  StreamSubscription<FileSystemEvent>? _watcher;

  Future<void> init() async {
    final dir = fileSystem.directory(p.dirname(path));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  Map<String, Object>? read() {
    final file = fileSystem.file(path);
    try {
      if (file.existsSync()) {
        final str = file.readAsStringSync();
        if (str.isNotEmpty) {
          final dynamic json = jsonDecode(str);
          if (json is Map) {
            _timestamp = file.lastModifiedSync();
            return json.cast<String, Object>();
          }
        }
      }
    } on FormatException {
      return null;
    }
    return {};
  }

  Future<void> write(Map<String, Object> json) {
    final file = fileSystem.file(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    final str = const JsonEncoder.withIndent('  ').convert(json);
    return file.writeAsString(str);
  }

  Future<void> watch(void Function() onChanged) async {
    if (!fileSystem.isWatchSupported) {
      return;
    }
    _watcher ??= fileSystem.directory(p.dirname(path)).watch().listen((event) {
      if (!p.equals(path, event.path)) {
        return;
      }
      switch (event.type) {
        case FileSystemEvent.create:
        case FileSystemEvent.delete:
          onChanged();
        case FileSystemEvent.modify:
          if (_timestamp == null ||
              fileSystem.file(path).lastModifiedSync().isAfter(_timestamp!)) {
            onChanged();
          }
      }
    });
  }

  Future<void> unwatch() async => _watcher?.cancel();
}

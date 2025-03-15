import 'package:file/file.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final class CachedPubspec {
  CachedPubspec(this._file);

  final File _file;

  DateTime? _lastCached;
  DateTime get _lastModified => _file.lastModifiedSync();

  void _recache() {
    _lastCached = DateTime.now();
    _pubspecYaml = _file.readAsStringSync();
    _pubspec = Pubspec.parse(_pubspecYaml, sourceUrl: _file.uri);
  }

  bool get _needsRecache {
    if (_lastCached case final lastCached?) {
      return _lastModified.isAfter(lastCached);
    }
    return true;
  }

  late String _pubspecYaml;
  String get pubspecYaml {
    if (_needsRecache) _recache();
    return _pubspecYaml;
  }

  late Pubspec _pubspec;
  Pubspec get pubspec {
    if (_needsRecache) _recache();
    return _pubspec;
  }
}

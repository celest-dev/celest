import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/edits/source_edit.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';

final class SourceEditApplier {
  SourceEditApplier(this.edits);

  final Map<String, Iterable<SourceEdit>> edits;

  static final Logger _logger = Logger('SourceEditApplier');

  Future<void> _applyEdits(String path, List<SourceEdit> edits) async {
    _logger.finest('Applying migrations to $path: $edits');

    var source = await fileSystem.file(path).readAsString();

    for (final edit in edits) {
      source = source.replaceRange(
        edit.offset,
        edit.offset + edit.length,
        edit.replacement,
      );
    }

    await fileSystem.file(path).writeAsString(source);
  }

  /// Applies all pendings edits to disk.
  Future<void> apply() async {
    if (edits.isEmpty) {
      _logger.fine('No edits to apply');
      return;
    }

    _logger.fine('Applying ${edits.length} migrations');

    final fileChanges = <Future<void>>[];
    for (final entry in edits.entries) {
      final path = entry.key;
      if (entry.value.isEmpty) {
        _logger.fine('No edits to apply to $path');
        continue;
      }

      // Sort edits in reserve order to avoid offset changes.
      final edits = entry.value.sorted((a, b) {
        return -a.offset.compareTo(b.offset);
      });

      fileChanges.add(_applyEdits(path, edits));
    }

    await Future.wait(fileChanges);

    _logger.finest('Applied migrations to disk');

    await celestProject.invalidate(edits.keys);
  }
}

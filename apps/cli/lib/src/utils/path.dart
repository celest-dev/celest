import 'package:celest_cli/src/context.dart';
import 'package:path/path.dart' as path;

extension PathConvert on path.Context {
  String convert(
    String path, {
    required path.Context to,
  }) {
    return to.joinAll(split(path));
  }
}

extension ConvertPath on String {
  String to(path.Context to) => to.joinAll(p.split(this));
}

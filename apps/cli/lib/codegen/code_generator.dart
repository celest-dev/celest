import 'package:celest_cli/codegen/allocator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

abstract final class CodeGenerator {
  static const _ignoredRules = [
    'type=lint',
    'unused_local_variable',
    'unnecessary_cast',
  ];
  static final _header = 'ignore_for_file: ${_ignoredRules.join(', ')}';
  static final _formatter = DartFormatter(
    fixes: StyleFix.all,
  );
  static DartEmitter _emitter({
    required String forFile,
  }) =>
      DartEmitter(
        allocator: CelestAllocator(forFile: forFile),
        useNullSafetySyntax: true,
        orderDirectives: true,
      );

  static String rawEmit(
    Spec spec, {
    required String forFile,
  }) =>
      spec.accept(_emitter(forFile: forFile)).toString();

  static String emit(
    Spec spec, {
    required String forFile,
  }) {
    if (spec is Library) {
      spec = spec.rebuild((lib) => lib.comments.add(_header));
    }
    final code = rawEmit(spec, forFile: forFile);
    try {
      return _formatter.format(code);
    } on Object {
      // TODO(dnys1): Proper error handling
      print(code);
      rethrow;
    }
  }
}

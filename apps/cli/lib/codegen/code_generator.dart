import 'package:celest_cli/codegen/allocator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

abstract final class CodeGenerator {
  static const _ignoredRules = [
    'type=lint',
    'unused_local_variable',
    'unnecessary_cast',
    'unnecessary_import',
    'deprecated_member_use',
    'invalid_use_of_internal_member',
  ];
  static final _header = 'ignore_for_file: ${_ignoredRules.join(', ')}';
  static final _formatter = DartFormatter(fixes: StyleFix.all);
  static DartEmitter _emitter({
    required String forFile,
    PrefixingStrategy prefixingStrategy = PrefixingStrategy.indexed,
    required PathStrategy pathStrategy,
  }) => DartEmitter(
    allocator: CelestAllocator(
      prefixingStrategy: prefixingStrategy,
      pathStrategy: pathStrategy,
      forFile: forFile,
    ),
    useNullSafetySyntax: true,
    orderDirectives: true,
  );

  static String rawEmit(
    Spec spec, {
    required String forFile,
    PrefixingStrategy prefixingStrategy = PrefixingStrategy.indexed,
    required PathStrategy pathStrategy,
  }) =>
      spec
          .accept(
            _emitter(
              forFile: forFile,
              prefixingStrategy: prefixingStrategy,
              pathStrategy: pathStrategy,
            ),
          )
          .toString();

  static String emit(
    Spec spec, {
    required String forFile,
    PrefixingStrategy prefixingStrategy = PrefixingStrategy.indexed,
    required PathStrategy pathStrategy,
  }) {
    if (spec is Library) {
      spec = spec.rebuild((lib) => lib.comments.add(_header));
    }
    final code = rawEmit(
      spec,
      forFile: forFile,
      prefixingStrategy: prefixingStrategy,
      pathStrategy: pathStrategy,
    );
    try {
      return _formatter.format(code);
    } on FormatException {
      rethrow;
    } on Object catch (e) {
      throw FormatException(e.toString(), code);
    }
  }
}

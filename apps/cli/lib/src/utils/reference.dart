import 'package:celest_cli/src/utils/dart_type.dart';
import 'package:code_builder/code_builder.dart';

extension ReferenceHelper on Reference {
  bool get isFunctionContext =>
      symbol == 'FunctionContext' &&
      (url?.startsWith('package:celest') ?? false);

  bool get isDartAsyncFuture => symbol == 'Future' && url == 'dart:async';

  bool get isDartAsyncFutureOr => symbol == 'FutureOr' && url == 'dart:async';

  bool get isDartCoreObject => symbol == 'Object' && url == 'dart:core';

  bool get isDartCoreString => symbol == 'String' && url == 'dart:core';

  bool get isDartCoreInt => symbol == 'int' && url == 'dart:core';

  bool get isDartCoreDouble => symbol == 'double' && url == 'dart:core';

  bool get isDartCoreBool => symbol == 'bool' && url == 'dart:core';

  bool get isDartCoreList => symbol == 'List' && url == 'dart:core';

  bool get isDartCoreMap => symbol == 'Map' && url == 'dart:core';

  bool get isDartCoreSet => symbol == 'Set' && url == 'dart:core';

  bool get isDartCoreIterable => symbol == 'Iterable' && url == 'dart:core';

  bool get isDartCoreNull => symbol == 'Null' && url == 'dart:core';

  bool get isDartCoreEnum => symbol == 'Enum' && url == 'dart:core';

  TypeReference get toTypeReference => switch (this) {
        final TypeReference type => type,
        _ => TypeReference(
            (t) => t
              ..symbol = symbol
              ..url = url,
          ),
      };

  TypeReference get flattened {
    switch (this) {
      case final TypeReference type
          when type.isDartAsyncFuture || type.isDartAsyncFutureOr:
        return type.types.first.toTypeReference;
      default:
        return toTypeReference;
    }
  }

  bool get nullable => toTypeReference.isNullable ?? false;

  bool get isEnum => enumIndex[this] ?? false;
}

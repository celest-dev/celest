import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

// need a way to store field name mappings
// need a way to store field type mappings
final class OpenApiStructOrIdGenerator {
  OpenApiStructOrIdGenerator({
    required this.name,
    required this.baseType,
  });

  static final Logger logger = Logger('OpenApiStructOrIdGenerator');

  final String name;
  final OpenApiTypeReference baseType;
  late final ClassBuilder _class = ClassBuilder()
    ..sealed = true
    ..name = name
    ..docs.addAll([
      '/// A [$name] or its ID.',
    ]);

  Class generate() {
    _class
      ..methods.add(
        Method((b) {
          b
            ..name = 'id'
            ..type = MethodType.getter
            ..returns = DartTypes.core.string
            ..docs.addAll([
              '/// The ID of the [${baseType.typeReference.symbol}].',
            ]);
        }),
      )
      ..constructors.addAll([_fromJsonMethod])
      ..methods.addAll([_toJsonMethod, _encodeMethod]);
    return _class.build();
  }

  Constructor get _fromJsonMethod {
    return Constructor((m) {
      m
        ..factory = true
        ..name = 'fromJson'
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'json'
              ..type = DartTypes.core.object.nullable,
          ),
        )
        ..lambda = false
        ..body = Block((b) {
          final idOnly = refer('StripeResource')
              .newInstance([], {
                'id': refer('json'),
              })
              .returned
              .statement;
          b.statements.add(
            idOnly.wrapWithBlockIf(
              refer('json').isA(DartTypes.core.string),
            ),
          );
          b.addExpression(
            baseType.typeReference
                .newInstanceNamed('fromJson', [refer('json')]).returned,
          );
        });
    });
  }

  Method get _toJsonMethod {
    return Method((m) {
      m
        ..name = 'toJson'
        ..returns = DartTypes.core.map(
          DartTypes.core.string,
          DartTypes.core.object.nullable,
        );
    });
  }

  Method get _encodeMethod {
    return Method((m) {
      m
        ..name = 'encode'
        ..returns = DartTypes.core.void$
        ..annotations.add(DartTypes.meta.internal)
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..type = refer('EncodingContainer', '../encoding/encoder.dart')
              ..name = 'container',
          ),
        );
    });
  }
}

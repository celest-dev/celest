import 'package:celest_cli/openapi/generator/openapi_struct_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

final class OpenApiIdGenerator {
  OpenApiIdGenerator({
    required this.className,
    required this.typeName,
    required this.idIsNullable,
  });

  final String className;
  final String typeName;
  final bool idIsNullable;

  late final wireType = DartTypes.core.string.withNullability(idIsNullable);

  late final ClassBuilder _class = ClassBuilder()
    ..modifier = ClassModifier.final$
    ..name = className
    ..docs.addAll([
      '/// A [$typeName] ID.',
    ]);

  Class generate() {
    _class
      ..fields.add(
        Field((b) {
          b
            ..name = 'id'
            ..modifier = FieldModifier.final$
            ..type = wireType
            ..docs.addAll([
              '/// The ID of the [$typeName].',
            ]);
        }),
      )
      ..constructors.addAll([
        _fromJsonMethod,
        Constructor(
          (ctor) {
            ctor
              ..constant = true
              ..optionalParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'id'
                    ..named = true
                    ..required = true
                    ..toThis = true,
                ),
              );
          },
        ),
      ])
      ..methods.addAll([_toJsonMethod, _encodeMethod, encodeWithMethod]);
    // ..fields.addAll([selfField(className)]);
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
        ..lambda = true
        ..body = refer(className).newInstance([], {
          'id': refer('json').asA(wireType),
        }).code;
    });
  }

  Method get _toJsonMethod {
    return Method(
      (m) => m
        ..returns = wireType
        ..name = 'toJson'
        ..lambda = true
        ..body = refer('id').code,
    );
  }

  Method get _encodeMethod {
    return Method((m) {
      m
        ..static = true
        ..name = 'encode'
        ..types.add(refer('V'))
        ..returns = refer('V')
        ..requiredParameters.addAll([
          Parameter(
            (p) => p
              ..type = refer(className)
              ..name = 'instance',
          ),
          Parameter(
            (p) => p
              ..type = DartTypes.libcoder.encoder(refer('V'))
              ..name = 'encoder',
          ),
        ])
        ..lambda = false
        ..body = Block((b) {
          b.addExpression(
            declareFinal('container').assign(
              refer('encoder').property('singleValueContainer').call([]),
            ),
          );
          final id = refer('instance').property('id');
          if (idIsNullable) {
            b.addExpression(
              id.equalTo(literalNull).conditional(
                    refer('container').property('encodeNull').call([]),
                    refer('container')
                        .property('encodeString')
                        .call([id.nullChecked]),
                  ),
            );
          } else {
            b.addExpression(
              refer('container').property('encodeString').call([id]),
            );
          }
          b.addExpression(
            refer('container').property('value').returned,
          );
        });
    });
  }
}

// need a way to store field name mappings
// need a way to store field type mappings
final class OpenApiStructOrIdGenerator {
  OpenApiStructOrIdGenerator({
    required this.className,
    required this.typeName,
    required this.idOnlyName,
    required this.idIsNullable,
  });

  static final Logger logger = Logger('OpenApiStructOrIdGenerator');

  final String className;
  final String typeName;
  final String idOnlyName;
  final bool idIsNullable;

  late final idType = DartTypes.core.string.withNullability(idIsNullable);

  late final ClassBuilder _class = ClassBuilder()
    ..sealed = true
    ..name = className
    ..docs.addAll([
      '/// A [$typeName] or its ID.',
    ]);

  Class generate() {
    _class
      ..methods.add(
        Method((b) {
          b
            ..name = 'id'
            ..type = MethodType.getter
            ..returns = idType
            ..docs.addAll([
              '/// The ID of the [$typeName].',
            ]);
        }),
      )
      ..constructors.addAll([_fromJsonMethod])
      ..methods.addAll([_toJsonMethod, _encodeMethod, _encodeWithMethod]);
    // ..fields.addAll([selfField(className)]);
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
          final idOnly = refer(idOnlyName)
              .newInstance([], {
                'id': refer('json'),
              })
              .returned
              .statement;
          b.statements.add(
            idOnly.wrapWithBlockIf(
              refer('json').isA(idType),
            ),
          );
          b.addExpression(
            refer(typeName)
                .newInstanceNamed('fromJson', [refer('json')]).returned,
          );
        });
    });
  }

  Method get _toJsonMethod {
    return Method((m) {
      m
        ..name = 'toJson'
        ..returns = DartTypes.core.object.nullable;
    });
  }

  Method get _encodeWithMethod {
    return Method((m) {
      m
        ..name = 'encodeWith'
        ..types.add(refer('V'))
        ..returns = refer('V')
        ..requiredParameters.addAll([
          Parameter(
            (p) => p
              ..type = DartTypes.libcoder.encoder(refer('V'))
              ..name = 'encoder',
          ),
        ]);
    });
  }

  Method get _encodeMethod {
    return Method((m) {
      m
        ..static = true
        ..name = 'encode'
        ..types.add(refer('V'))
        ..returns = refer('V')
        ..requiredParameters.addAll([
          Parameter(
            (p) => p
              ..type = refer(className)
              ..name = 'instance',
          ),
          Parameter(
            (p) => p
              ..type = DartTypes.libcoder.encoder(refer('V'))
              ..name = 'encoder',
          ),
        ])
        ..lambda = false
        ..body = refer('instance')
            .property('encodeWith')
            .call([refer('encoder')])
            .returned
            .statement;
    });
  }
}

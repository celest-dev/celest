import 'package:celest_cli/openapi/generator/openapi_encoder.dart';
import 'package:celest_cli/openapi/generator/openapi_json_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

// need a way to store field name mappings
// need a way to store field type mappings
final class OpenApiStructGenerator {
  OpenApiStructGenerator({
    required this.name,
    required this.type,
    this.mimeType,
  });

  static final Logger logger = Logger('OpenApiSchemaGenerator');
  static final OpenApiJsonGenerator jsonGenerator = OpenApiJsonGenerator();

  // final Map<String, String> _fieldNames = {};
  // String _dartFieldName(v3.NamedSchemaOrReference field) {
  //   if (_fieldNames.containsKey(field.name)) {
  //     return _fieldNames[field.name]!;
  //   }
  //   var candidate = field.name.camelCase;
  //   // if (field.name.startsWith('_')) {
  //   //   candidate = '\$_$candidate';
  //   // }
  //   // if (field.name.endsWith('_')) {
  //   //   candidate = '${candidate}_';
  //   // }
  //   final reserved = _fieldNames.values.toSet();
  //   if (!reserved.add(candidate)) {
  //     var i = 1;
  //     while (!reserved.add('$candidate$i')) {
  //       i++;
  //     }
  //     candidate = '$candidate$i';
  //   }
  //   _fieldNames[field.name] = candidate;
  //   return candidate;
  // }

  final String name;
  final OpenApiStructType type;
  final String? mimeType;
  late final ClassBuilder _class = ClassBuilder()
    ..modifier = ClassModifier.final$
    ..name = name
    ..docs.addAll([if (type.docs case final docs? when docs.isNotEmpty) docs])
    ..implements.addAll(type.implements);

  bool get includeFormData {
    final mimeType = this.mimeType;
    if (mimeType == null) {
      return false;
    }
    return mimeType.startsWith('multipart');
    // ||    mimeType.endsWith('x-www-form-urlencoded');
  }

  Class generate() {
    logger.finest('Generating schema: $name');
    if (type.superType is! OpenApiAnyType) {
      _class.extend = type.superType.typeReference.nonNullable;
    }
    final ctor = ConstructorBuilder()
      ..constant = true
      ..docs.addAll([
        if (type.docs case final docs? when docs.isNotEmpty) docs,
      ]);
    for (final OpenApiField(:dartName, type: fieldType) in type.fields.values) {
      if (fieldType is! OpenApiSingleValueType) {
        ctor.optionalParameters.add(
          Parameter(
            (b) => b
              ..name = dartName
              ..named = true
              ..toThis = true
              ..required = !fieldType.isNullable,
          ),
        );
      }
      _class.fields.add(
        Field((b) {
          b
            ..modifier = FieldModifier.final$
            ..name = dartName
            ..type = fieldType.typeReference
            ..docs.addAll([
              if (fieldType.docs case final docs? when docs.isNotEmpty) docs,
            ]);
          if (fieldType case OpenApiSingleValueType(:final value)) {
            b.assignment = literal(value).code;
          }
        }),
      );
    }
    _class
      ..constructors.addAll([
        ctor.build(),
        if (!includeFormData) _fromJsonMethod,
      ])
      // ..fields.addAll([selfField(name)])
      ..methods.addAll([
        if (!includeFormData) _toJsonMethod,
        _encodeMethod,
        encodeWithMethod,
        _toString,
      ]);
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
          final fields = <String, Expression>{};
          final map = declareFinal('map').assign(
            refer('json')
                .asA(DartTypes.core.map())
                .property('cast')
                .call([], {}, [
              DartTypes.core.string,
              DartTypes.core.object.nullable,
            ]),
          );
          b.addExpression(map);
          for (final field in type.deserializableFields) {
            final ref = refer('map').index(literalString(field.name));
            fields[field.dartName] = jsonGenerator.fromJson(
              field.type,
              ref,
            );
          }
          b.addExpression(
            type.typeReference.newInstance([], fields).returned,
          );
        });
    });
  }

  Method get _toString {
    return Method((m) {
      m
        ..name = 'toString'
        ..returns = DartTypes.core.string
        ..annotations.add(DartTypes.core.override)
        ..lambda = false
        ..body = Block((b) {
          final buf = refer(r'$buf');
          b.addExpression(
            declareFinal(r'$buf').assign(
              DartTypes.core.stringBuffer
                  .newInstance([])
                  .cascade('writeln')
                  .call([
                    literalString('$name(', raw: name.contains(r'$')),
                  ]),
            ),
          );
          for (final field in type.fields.values) {
            final fieldRef = refer(field.dartName);
            final writeField = buf
                .cascade('writeln')
                .call([])
                .cascade('write')
                .call([
                  literalString('  ${field.name}: '),
                ])
                .cascade('write')
                .call([fieldRef])
                .cascade('write')
                .call([literalString(',')]);
            b.statements.add(
              writeField.wrapWithBlockIf(
                refer(field.dartName).notEqualTo(literalNull),
                field.type.isNullable,
              ),
            );
          }
          b.addExpression(buf.property('write').call([literalString(')')]));
          b.addExpression(
            buf.property('toString').call([]).returned,
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
        )
        ..lambda = true
        ..body =
            // TODO: refer('codable', 'models.dart')
            refer('encode')
                .call([
                  refer('this'),
                  DartTypes.libcoder.coder$
                      .property('json')
                      .property('encoder'),
                ])
                .asA(
                  DartTypes.core.map(
                    DartTypes.core.string,
                    DartTypes.core.object.nullable,
                  ),
                )
                .code;
    });
  }

  Method get _encodeMethod {
    return encodeMethod(
      name,
      Block((b) {
        final container = refer('container');
        for (final field in type.serializableFields) {
          var fieldRef = refer('instance').property(field.dartName);
          if (field.type.isNullable) {
            fieldRef = fieldRef.nullChecked;
          }
          final fieldType = field.type;
          final encodeField = openApiEncoder.encode(
            type: fieldType.withNullability(false),
            ref: fieldRef,
            container: container,
            key: literalString(field.name),
          );
          b.statements.add(
            encodeField.wrapWithBlockIf(
              refer('instance')
                  .property(field.dartName)
                  .notEqualTo(literalNull),
              field.type.isNullable,
            ),
          );
        }
      }),
    );
  }
}

Method encodeMethod(String name, Code body) {
  return Method((m) {
    m
      ..static = true
      ..name = 'encode'
      ..types.add(refer('V'))
      ..returns = refer('V')
      ..requiredParameters.addAll([
        Parameter(
          (p) => p
            ..type = refer(name)
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
            refer('encoder').property('container').call(
              [],
              {},
              [DartTypes.core.string],
            ),
          ),
        );
        b.statements.add(body);
        b.addExpression(
          refer('container').property('value').returned,
        );
      });
  });
}

// TODO: Enable when resolved
// https://github.com/dart-lang/sdk/issues/55666

// Field selfField(String className) {
//   return Field((f) {
//     f
//       ..static = true
//       ..modifier = FieldModifier.constant
//       ..name = 'self'
//       ..assignment = DartTypes.codable
//           .typeref(refer(className))
//           .constInstance([], {}).code;
//   });
// }

// Field extensionTypeSelfField(String className) {
//   return Field((f) {
//     f
//       ..static = true
//       ..modifier = FieldModifier.constant
//       ..name = 'self'
//       ..assignment = DartTypes.codable
//           .typeref(refer(className))
//           .constInstanceNamed('extensionType', [], {
//         'typeName': literalString(className),
//       }).code;
//   });
// }

Method get encodeWithMethod {
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
      ])
      ..body = refer('encode').call([refer('this'), refer('encoder')]).code;
  });
}

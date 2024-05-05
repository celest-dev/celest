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
  late final ClassBuilder _class = ClassBuilder()
    ..modifier = ClassModifier.final$
    ..name = name
    ..docs.addAll([if (type.docs case final docs? when docs.isNotEmpty) docs])
    ..implements.addAll(type.implements);

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
      ..constructors.addAll([ctor.build(), _fromJsonMethod])
      ..methods.addAll([_toJsonMethod]);
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
            refer('json').asA(
              DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.object.nullable,
              ),
            ),
          );
          b.addExpression(map);
          for (final field in type.serializableFields) {
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

  Method get _toJsonMethod {
    return Method((m) {
      m
        ..name = 'toJson'
        ..returns = DartTypes.core.map(
          DartTypes.core.string,
          DartTypes.core.object.nullable,
        )
        ..lambda = true;

      final serialized = <Expression, Expression>{};
      for (final field in type.fields.values) {
        serialized[literalString(field.name)] = jsonGenerator.toJson(
          field.type,
          refer(field.dartName),
        );
      }

      m.body = literalMap(serialized).code;
    });
  }
}

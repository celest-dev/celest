// Generates fixtures for the openapi-generator tests.
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:lib_openapi/lib_openapi.dart';
import 'package:lib_openapi/openapi_v2.dart' as v2;
import 'package:lib_openapi/openapi_v3.dart' as v3;
import 'package:path/path.dart' as p;

const skipFixtures = [
  // Causes stack overflow in gnostic.
  'recursion-bug-4650.yaml',
  'issue_12929.yaml',

  // Causes nil pointer dereference in gnostic.
  'produces.yaml',

  // TODO(dnys1): Could not identify OpenAPI version.
  'issue_15933.yaml',
  'objectType.yaml',
  'baseType.yaml',
  'defaultValuesType.yaml',
  'issue_17768.yaml',
  'issue_16223_enum_with_default_empty.yaml',

  // TODO(dnys1): Issues with JsonLiteral
  // 'oneOf_reuseRef.json',

  // TODO(dnys1): Bad JSON output
  'issue_11957.json',
  'issue_constructor-required-values-with-multiple-inheritance.json',
  'ping-array-default.json',
  'issue_12196.json',
  'petstore-with-fake-endpoints-models-for-testing-with-http-signature.json',
  'unsigned-test.json',
  'opendota.json',
  'issue_16223.json',

  // missing required property: responses
  'objectQueryParam.yaml',

  // missing required property: paths
  'dollar-in-names-pull14359.yaml',

  // $root.components.schemas.BigDog contains an invalid SchemaOrReference
  'generic.yaml',

  // $root.info is missing required property: title
  'v1beta3.yaml',

  // $root.paths./giraffes/{refStatus}.get is missing required property: responses
  'issue_6762.yaml',

  // $root.components.schemas.BaseModel contains an invalid SchemaOrReference
  'type_alias.yaml',

  // $root is missing required property: info
  'arrayParameter.yaml',

  // $root is missing required property: paths
  'regression-6734.yaml',

  // $root.paths./fake/multipart-request-with-inline-enum.post is missing required property: responses
  'issue-5676-enums.yaml',

  // $root.paths./elephants.get is missing required property: responses
  'issue_2053.yaml',

  // $root has invalid property: securityDefinitions
  'issue8986.yaml',

  // $root.paths./monkeys.get is missing required property: responses
  'issue_3248.yaml',

  // $root.paths./fake/http-signature-test.get.parameters contains an invalid ParameterOrReference
  'petstore-echo.yaml',

  // $root.paths./set_style.get is missing required property: responses
  'fromParameter.yaml',

  // $root.paths./elephants.get is missing required property: responses
  'issue_5386.yaml',

  // $root.info has unexpected value for version: &{Kind:8 Style:0 Tag:!!float Value:1.0 Anchor: Alias:<nil> Content:[] HeadComment: LineComment: FootComment: Line:4 Column:12} (*yaml.Node)
  'issue_1347.yaml',

  // $root.components.schemas.ArrayWithIneffectiveValidations contains an invalid SchemaOrReference
  'issue6491.yaml',

  // $root.paths./fake/http-signature-test.get.parameters contains an invalid ParameterOrReference
  'petstore-with-fake-endpoints-models-for-testing.yaml',

  // $root is missing required property: info
  'setParameter.yaml',

  // $root is missing required properties: info, paths
  'issue_9282.yaml',

  // $root.info is missing required property: version
  'content-data.yaml',

  // $root is missing required property: info
  'setResponse.yaml',
];

void main() {
  final cliDir = Directory.current;
  final fixturesRoot =
      cliDir.uri.resolve('test/openapi/fixtures/openapi-generator/');
  final outputFile = File.fromUri(fixturesRoot.resolve('fixtures.dart'));
  final output = StringBuffer('''
// ignore_for_file: type=lint

import 'dart:convert';

import 'package:lib_openapi/lib_openapi.dart';
import 'package:lib_openapi/openapi_v2.dart' as v2;
import 'package:lib_openapi/openapi_v3.dart' as v3;
import 'package:lib_openapi/surface.dart' as surface;

''');

  final files = Directory.fromUri(fixturesRoot).listSync(recursive: true);
  final v2Generated = <String, String>{};
  final v3Generated = <String, String>{};
  for (final file in files.whereType<File>()) {
    if (skipFixtures.contains(p.basename(file.path))) {
      print('Skipping ${file.path}');
      continue;
    }
    print('Processing ${file.path}');
    final path = file.path;
    final pbPath = p.join(
      fixturesRoot.path,
      'protos',
      p.setExtension(path, '.pb'),
    );
    final pbFile = File(pbPath);
    final pathSegments = p.split(p.relative(path, from: fixturesRoot.path));
    final nameSegments = [
      for (var i = 0; i < pathSegments.length; i++)
        if (i == pathSegments.length - 1)
          p.basenameWithoutExtension(path).snakeCase
        else
          pathSegments[i].snakeCase,
    ];
    final variableName = ['fixtures', ...nameSegments].join('_');
    final key = nameSegments.join('/');
    try {
      switch (p.extension(file.path)) {
        case '.json' || '.yaml' || '.yml':
          final document = generateOpenApiProto(file.readAsStringSync());
          final (String, Uint8List document) res;
          switch (document) {
            case final v2.Document document:
              if (v2Generated.containsKey(key)) {
                continue;
              }
              v2Generated[key] = variableName;
              res = ('v2', document.writeToBuffer());
            case final v3.Document document:
              if (v3Generated.containsKey(key)) {
                continue;
              }
              v3Generated[key] = variableName;
              res = ('v3', document.writeToBuffer());
            default:
              unreachable();
          }
          final (prefix, docBuffer) = res;
          final type = '$prefix.Document';
          output.writeln('''
/// From: ${p.relative(file.path, from: fixturesRoot.path)}
final $type $variableName = $type.fromBuffer(base64Decode('${base64Encode(docBuffer)}'));
''');
          pbFile
            ..createSync(recursive: true)
            ..writeAsBytesSync(docBuffer);
        case '.pb':
          continue;
        case final unknown:
          print('Skipping unsupported extension: $unknown');
          continue;
      }
    } on Exception catch (e) {
      stderr.writeln('$path $e');
      continue;
    }
  }

  output.writeln('''
/// All V2 fixtures from `openapi-generator`.
final openApiGeneratorFixturesV2 = <String, OpenApiProto<v2.Document>>{
''');
  for (final entry in v2Generated.entries) {
    output.writeln('  \'${entry.key}\': ${entry.value},');
  }
  output.writeln('};');
  output.writeln();

  output.writeln('''
/// All V3 fixtures from `openapi-generator`.
final openApiGeneratorFixturesV3 = <String, OpenApiProto<v3.Document>>{
''');
  for (final entry in v3Generated.entries) {
    output.writeln('  \'${entry.key}\': ${entry.value},');
  }
  output.writeln('};');

  outputFile.writeAsStringSync(output.toString());
}

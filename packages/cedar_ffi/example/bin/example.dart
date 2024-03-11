import 'dart:convert';
import 'dart:io';

import 'package:cedar/cedar.dart';
import 'package:cedar_ffi/cedar_ffi.dart';

Future<void> main() async {
  final root = Platform.script.resolve('cedar/');
  final schemaJson =
      File.fromUri(root.resolve('example.cedarschema.json')).readAsStringSync();
  final policiesCedar =
      File.fromUri(root.resolve('example.cedar')).readAsStringSync();

  final cedar = CedarEngine(
    schema: CedarSchema.fromJson(
      jsonDecode(schemaJson) as Map<String, Object?>,
    ),
    policies: CedarPolicySetFfi.fromCedar(policiesCedar),
  );

  final app = CedarEntity(
    id: CedarEntityId('Application', 'TinyTodo'),
  );
  final user = CedarEntity(
    id: CedarEntityId('User', 'alice'),
    parents: [app.id],
    attributes: {
      'name': CedarValueJson.string('Alice'),
    },
  );
  final canCreateTodo = cedar.isAuthorized(
    CedarAuthorizationRequest(
      principal: user.id,
      action: CedarEntityId('Action', 'CreateList'),
      resource: app.id,
    ),
    entities: [app, user],
  );
  switch (canCreateTodo) {
    case CedarAuthorizationResponse(decision: CedarAuthorizationDecision.allow):
      print('Alice can create the todo list!');
    case CedarAuthorizationResponse(
        :final errorMessages,
        :final reasons,
      ):
      print('Alice cannot create the todo list');
      print('Contributing policies: $reasons');
      print('Error messages: $errorMessages');
  }
}

import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_proto/ast.dart' as ast;
import 'package:code_builder/code_builder.dart';

final class ClientAuthGenerator {
  ClientAuthGenerator({
    required this.auth,
  }) {
    _library = LibraryBuilder()
      ..name = ''
      ..comments.addAll(kClientHeader)
      ..body.add(lazySpec(_client.build));
  }

  final ast.Auth auth;

  late final LibraryBuilder _library;
  final _client = ClassBuilder()
    ..name = ClientTypes.authClass.name
    ..implements.add(refer('Auth', 'package:celest_auth/src/auth.dart'))
    ..constructors.add(
      Constructor(
        (c) => c
          ..optionalParameters.addAll([
            Parameter(
              (p) => p
                ..name = 'baseUri'
                ..type = DartTypes.core.uri
                ..named = true
                ..required = true,
            ),
            Parameter(
              (p) => p
                ..name = 'httpClient'
                ..type = DartTypes.http.client
                ..named = true
                ..required = true,
            ),
          ])
          ..initializers.add(
            refer('_hub')
                .assign(
                  _hubClass.newInstance([], {
                    'baseUri': refer('baseUri'),
                    'httpClient': refer('httpClient'),
                  }),
                )
                .code,
          ),
      ),
    )
    ..fields.addAll([
      Field(
        (f) => f
          ..modifier = FieldModifier.final$
          ..type = _hubClass
          ..name = '_hub',
      ),
    ])
    ..methods.addAll([
      Method(
        (m) => m
          ..returns = DartTypes.core.void$
          ..name = 'init'
          ..annotations.add(DartTypes.core.override)
          ..lambda = true
          ..body = refer('_hub').property('init').call([]).code,
      ),
      Method(
        (m) => m
          ..returns = refer(
            'AuthState',
            'package:celest_auth/src/state/auth_state.dart',
          )
          ..name = 'authState'
          ..type = MethodType.getter
          ..annotations.add(DartTypes.core.override)
          ..lambda = true
          ..body = refer('_hub').property('authState').code,
      ),
      Method(
        (m) => m
          ..returns = DartTypes.core.stream(
            refer('AuthState', 'package:celest_auth/src/state/auth_state.dart'),
          )
          ..name = 'authStateChanges'
          ..type = MethodType.getter
          ..annotations.add(DartTypes.core.override)
          ..lambda = true
          ..body = refer('_hub').property('authStateChanges').code,
      ),
    ]);

  static final _hubClass =
      refer('AuthImpl', 'package:celest_auth/src/auth.dart');

  Library generate() {
    for (final provider in auth.providers) {
      switch (provider.type) {
        case ast.AuthProviderType.email:
          final emailClass = refer(
            'Email',
            'package:celest_auth/src/flows/email_flow.dart',
          );
          _client.fields.add(
            Field(
              (f) => f
                ..late = true
                ..modifier = FieldModifier.final$
                ..type = emailClass
                ..name = 'email'
                ..assignment = emailClass.newInstance([refer('_hub')]).code,
            ),
          );
      }
    }

    return _library.build();
  }
}

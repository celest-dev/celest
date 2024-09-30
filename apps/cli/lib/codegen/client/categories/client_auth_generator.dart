import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/src/types/dart_types.dart';
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
  final _client = ExtensionTypeBuilder()
    ..name = ClientTypes.authClass.name
    ..primaryConstructorName = '_'
    ..representationDeclaration = RepresentationDeclaration(
      (r) => r
        ..declaredRepresentationType = _hubClass
        ..name = '_hub',
    )
    ..implements.add(refer('Auth', 'package:celest_auth/celest_auth.dart'))
    ..constructors.add(
      Constructor(
        (c) => c
          ..requiredParameters.add(
            Parameter(
              (p) => p
                ..name = 'celest'
                ..type = refer(
                  'CelestBase',
                  'package:celest_core/_internal.dart',
                ),
            ),
          )
          ..optionalParameters.add(
            Parameter(
              (p) => p
                ..name = 'storage'
                ..type = DartTypes.nativeStorage.nativeStorage
                ..named = true
                ..required = true,
            ),
          )
          ..initializers.add(
            refer('_hub')
                .assign(
                  _hubClass.newInstance([
                    refer('celest'),
                  ], {
                    'storage': refer('storage'),
                  }),
                )
                .code,
          ),
      ),
    );

  static final _hubClass =
      refer('AuthImpl', 'package:celest_auth/src/auth_impl.dart');

  Library generate() {
    for (final provider in auth.providers) {
      switch (provider.type) {
        case ast.AuthProviderType.email:
          final emailClass = refer(
            'Email',
            'package:celest_auth/src/auth_impl.dart',
          );
          _client.methods.add(
            Method(
              (m) => m
                ..returns = emailClass
                ..type = MethodType.getter
                ..name = 'email'
                ..lambda = true
                ..body = emailClass.newInstance([refer('_hub')]).code,
            ),
          );
      }
    }

    return _library.build();
  }
}

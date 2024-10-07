import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/codegen/client_code_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
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

  static const _externalProviderDocs = <ast.AuthProviderType, List<String>>{
    ast.AuthProviderType.firebase: [
      '/// Creates an instance of [ExternalAuth] for Firebase Auth.',
      '///',
      '/// See the [Firebase docs](https://firebase.google.com/docs/flutter/setup)',
      '/// for more information on how to initialize Firebase.',
      '///',
      '/// ```dart',
      '/// Future<void> main() async {',
      '///   WidgetsFlutterBinding.ensureInitialized();',
      '///   await Firebase.initializeApp();',
      '///   celest.init(',
      '///     externalAuth: ExternalAuth.firebase(FirebaseAuth.instance),',
      '///   );',
      '/// }',
      '/// ```',
    ],
    ast.AuthProviderType.supabase: [
      '/// ### Supabase',
      '///',
      '/// See the [Supabase docs](https://supabase.com/docs/reference/dart/introduction)',
      '/// for more information on how to initialize Supabase.',
      '///',
      '/// ```dart',
      '/// Future<void> main() async {',
      '///   WidgetsFlutterBinding.ensureInitialized();',
      '///   await Supabase.initialize(',
      "///     url: 'https://<your-project-id>.supabase.co',",
      '///     ...',
      '///   );',
      '///   celest.init(',
      '///     externalAuth: ExternalAuth.supabase(supabase.auth),',
      '///   );',
      '/// }',
      '/// ```',
    ],
  };

  Class? get _externalAuthClass {
    if (auth.externalProviders.isEmpty) {
      return null;
    }
    final cls = ClassBuilder()
      ..name = 'ExternalAuth'
      ..extend = DartTypes.celestAuth.tokenSource
      ..docs.addAll([
        '/// External authentication providers which can be used to sign in to Celest.',
        '///',
        '/// This class is passed to `celest.init` to configure the token sources for',
        '/// the external auth providers.',
      ])
      ..constructors.add(
        Constructor(
          (c) => c
            ..name = 'of'
            ..constant = true
            ..docs.add('/// {@macro celest_auth.token_source.of}')
            ..optionalParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'provider'
                  ..toSuper = true
                  ..named = true
                  ..required = true,
              ),
              Parameter(
                (p) => p
                  ..name = 'stream'
                  ..toSuper = true
                  ..named = true
                  ..required = true,
              ),
            ])
            ..initializers.add(
              refer('super').property('of').call([]).code,
            ),
        ),
      );
    for (final provider in auth.externalProviders) {
      switch (provider.type) {
        case ast.AuthProviderType.firebase:
          ClientDependencies.current.add('firebase_auth');
        case ast.AuthProviderType.supabase:
          ClientDependencies.current.add('gotrue');
          ClientDependencies.current.add('stream_transform');
          _library.directives.add(
            // For `.startWith` Stream extension
            Directive.import(
              'package:stream_transform/stream_transform.dart',
              show: const ['Concatenate'],
            ),
          );
        default:
          break;
      }
      cls.constructors.add(
        Constructor(
          (c) => c
            ..name = provider.name
            ..factory = true
            ..docs.addAll(_externalProviderDocs[provider.type]!)
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = provider.type.name
                  ..type = switch (provider.type) {
                    ast.AuthProviderType.firebase => refer(
                        'FirebaseAuth',
                        'package:firebase_auth/firebase_auth.dart',
                      ),
                    ast.AuthProviderType.supabase =>
                      refer('GoTrueClient', 'package:gotrue/gotrue.dart'),
                    _ => unreachable(),
                  },
              ),
            )
            ..body = refer('ExternalAuth')
                .newInstanceNamed('of', [], {
                  'provider': DartTypes.celestAuth.authProviderType
                      .property(provider.type.name),
                  'stream': switch (provider.type) {
                    ast.AuthProviderType.firebase => CodeExpression(
                        Code(
                          '${provider.type.name}.idTokenChanges()'
                          '.asyncMap((user) => user?.getIdToken())',
                        ),
                      ),
                    ast.AuthProviderType.supabase => run(() {
                        final authChangeEvent = refer(
                          'AuthChangeEvent',
                          'package:gotrue/gotrue.dart',
                        );
                        return CodeExpression(
                          Code.scope(
                            (alloc) => '${provider.type.name}.onAuthStateChange'
                                '.where((state) => const ['
                                '  ${alloc(authChangeEvent)}.initialSession, '
                                '  ${alloc(authChangeEvent)}.tokenRefreshed, '
                                '  ${alloc(authChangeEvent)}.signedIn, '
                                '  ${alloc(authChangeEvent)}.signedOut, '
                                '].contains(state.event),)'
                                '.map((state) => state.session?.accessToken)'
                                // From `package:stream_transform`
                                '.startWith(supabase.currentSession?.accessToken)',
                          ),
                        );
                      }),
                    _ => unreachable(),
                  },
                })
                .returned
                .statement,
        ),
      );
    }
    return cls.build();
  }

  Library generate() {
    for (final provider in auth.providers) {
      switch (provider) {
        case ast.EmailAuthProvider():
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
        case ast.SmsAuthProvider():
          final smsClass = refer(
            'Sms',
            'package:celest_auth/src/auth_impl.dart',
          );
          _client.methods.add(
            Method(
              (m) => m
                ..returns = smsClass
                ..type = MethodType.getter
                ..name = 'sms'
                ..lambda = true
                ..body = smsClass.newInstance([refer('_hub')]).code,
            ),
          );
        case ast.AppleAuthProvider():
          final appleClass = refer(
            'Apple',
            'package:celest_auth/src/auth_impl.dart',
          );
          _client.methods.add(
            Method(
              (m) => m
                ..returns = appleClass
                ..type = MethodType.getter
                ..name = 'apple'
                ..lambda = true
                ..body = appleClass.newInstance([refer('_hub')]).code,
            ),
          );
        case ast.GitHubAuthProvider():
          final gitHubClass = refer(
            'GitHub',
            'package:celest_auth/src/auth_impl.dart',
          );
          _client.methods.add(
            Method(
              (m) => m
                ..returns = gitHubClass
                ..type = MethodType.getter
                ..name = 'gitHub'
                ..lambda = true
                ..body = gitHubClass.newInstance([refer('_hub')]).code,
            ),
          );
        case ast.GoogleAuthProvider():
          final googleClass = refer(
            'Google',
            'package:celest_auth/src/auth_impl.dart',
          );
          _client.methods.add(
            Method(
              (m) => m
                ..returns = googleClass
                ..type = MethodType.getter
                ..name = 'google'
                ..lambda = true
                ..body = googleClass.newInstance([refer('_hub')]).code,
            ),
          );
      }
    }

    if (_externalAuthClass case final externalAuth?) {
      _library.body.add(externalAuth);
    }

    return _library.build();
  }
}

import 'dart:io';

import 'package:cedar/cedar.dart';
import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

Future<void> main() async {
  context.setLocal(ContextKey.project, exampleProject);

  final database = CloudAuthDatabase.memory();
  final cloudAuth = await CelestCloudAuth.create(database: database);

  final router =
      Router()
        ..get('/test/hello', () => Response.ok('Hello, world!'))
        ..mount('/v1alpha1/auth', cloudAuth.handler);
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(cloudAuth.middleware.call)
      .addHandler(router.call);

  final server = await serve(handler, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');

  await ProcessSignal.sigint.watch().first;
  await server.close();
  print('Server closed');
}

final exampleProject = ResolvedProject(
  projectId: 'test',
  environmentId: 'production',
  sdkConfig: SdkConfiguration(
    celest: Version(1, 0, 0),
    dart: Sdk(type: SdkType.dart, version: Version(3, 5, 0)),
  ),
  apis: {
    AuthenticationService.api.apiId: AuthenticationService.api,
    UsersService.api.apiId: UsersService.api,
    'test': ResolvedApi(
      apiId: 'test',
      functions: {
        'hello': ResolvedCloudFunction(
          apiId: 'test',
          functionId: 'hello',
          httpConfig: ResolvedHttpConfig(
            route: ResolvedHttpRoute(
              method: HttpMethod.get,
              path: '/test/hello',
            ),
          ),
          policySet: PolicySet(
            templateLinks: const [
              TemplateLink(
                templateId: 'cloud.functions.authenticated',
                newId: 'test/hello',
                values: {
                  SlotId.resource: EntityUid.of(
                    'Celest::Function',
                    'test/hello',
                  ),
                },
              ),
            ],
          ),
        ),
      },
    ),
  },
);

import 'dart:async';

import 'package:cedar/src/model/value.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb;
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/project_environments.pb.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/projects.pb.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/services/project_environments_service.dart';
import 'package:celest_cloud_hub/src/services/projects_service.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

import '../common.dart';

const user = EntityUid.of('Celest::User', 'test');
const kEnvName = 'test-env';

void main() {
  initTesting();

  group('ProjectEnvironmentsService', () {
    late CloudHubDatabase database;
    late ProjectEnvironmentsService service;
    late ProjectsService projectsService;

    late String organizationId;
    late String projectId;

    setUp(() async {
      database = inMemoryDatabase();
      await database.ping();
      await database.cloudAuthUsersDrift.createUser(userId: 'test');

      service = ProjectEnvironmentsService(database, FakeAuthorizer());
      projectsService = ProjectsService(database, FakeAuthorizer());

      // Get the root organization
      final organization =
          await database.organizationsDrift
              .getOrganization(id: kRootOrgId)
              .getSingle();
      organizationId = organization.id;

      // Make `user` owner of the root organization
      await database.userMembershipsDrift.createUserMembership(
        membershipId: typeId('mbr'),
        userId: user.id,
        parentType: 'Celest::Organization',
        parentId: organizationId,
        role: 'owner',
      );

      final projectRequest = CreateProjectRequest(
        parent: 'organizations/$organizationId',
        projectId: kCelestTest,
        project: Project(
          displayName: 'Test Project',
          regions: [pb.Region.NORTH_AMERICA],
        ),
      );
      final projectOp = await projectsService.createProject(
        FakeServiceCall(),
        projectRequest,
      );
      final project = projectOp.response.unpackInto(Project());
      projectId = project.name.split('/').last;
    });

    tearDown(() async {
      await database.close();
    });

    group('createProjectEnvironment', () {
      test('success', () async {
        final request = CreateProjectEnvironmentRequest(
          parent: 'projects/$projectId',
          projectEnvironmentId: kEnvName,
          projectEnvironment: ProjectEnvironment(
            displayName: 'Test Environment',
          ),
        );

        final result = await service.createProjectEnvironment(
          FakeServiceCall(),
          request,
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(ProjectEnvironment());
        expect(
          response.name,
          predicate<String>((name) {
            final [_, projectId, _, environmentId] = name.split('/');
            TypeId.decode(environmentId);
            return true;
          }),
        );
        expect(response.projectEnvironmentId, kEnvName);
        expect(response.displayName, 'Test Environment');
        expect(response.state, pb.LifecycleState.ACTIVE);
      });

      test('project not found', () async {
        final request = CreateProjectEnvironmentRequest(
          parent: 'projects/nonexistent',
          projectEnvironmentId: kEnvName,
          projectEnvironment: ProjectEnvironment(
            displayName: 'Test Environment',
          ),
        );

        await expectLater(
          service.createProjectEnvironment(FakeServiceCall(), request),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.notFound,
            ),
          ),
        );
      });

      test('environment already exists', () async {
        final request = CreateProjectEnvironmentRequest(
          parent: 'projects/$projectId',
          projectEnvironmentId: kEnvName,
          projectEnvironment: ProjectEnvironment(
            displayName: 'Test Environment',
          ),
        );

        await service.createProjectEnvironment(FakeServiceCall(), request);

        await expectLater(
          service.createProjectEnvironment(FakeServiceCall(), request),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.alreadyExists,
            ),
          ),
        );
      });
    });

    group('getProjectEnvironment', () {
      test('success', () async {
        // First create an environment
        final createRequest = CreateProjectEnvironmentRequest(
          parent: 'projects/$projectId',
          projectEnvironmentId: kEnvName,
          projectEnvironment: ProjectEnvironment(
            displayName: 'Test Environment',
          ),
        );
        await service.createProjectEnvironment(
          FakeServiceCall(),
          createRequest,
        );

        final result = await service.getProjectEnvironment(
          FakeServiceCall(),
          GetProjectEnvironmentRequest(
            name: 'projects/$projectId/environments/$kEnvName',
          ),
        );

        expect(result.projectEnvironmentId, kEnvName);
        expect(result.displayName, 'Test Environment');
        expect(result.state, pb.LifecycleState.ACTIVE);
      });

      test('not found', () async {
        await expectLater(
          service.getProjectEnvironment(
            FakeServiceCall(),
            GetProjectEnvironmentRequest(
              name: 'projects/$projectId/environments/nonexistent',
            ),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.notFound,
            ),
          ),
        );
      });

      test('invalid name', () async {
        await expectLater(
          service.getProjectEnvironment(
            FakeServiceCall(),
            GetProjectEnvironmentRequest(name: 'invalid'),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.invalidArgument,
            ),
          ),
        );
      });
    });

    group('listProjectEnvironments', () {
      test('empty', () async {
        final result = await service.listProjectEnvironments(
          FakeServiceCall(),
          ListProjectEnvironmentsRequest(parent: 'projects/$projectId'),
        );

        expect(result.projectEnvironments, isEmpty);
        expect(result.hasNextPageToken(), isFalse);
      });

      test('single page', () async {
        for (var i = 0; i < 9; i++) {
          final envId = 'test$i';
          await service.createProjectEnvironment(
            FakeServiceCall(),
            CreateProjectEnvironmentRequest(
              parent: 'projects/$projectId',
              projectEnvironmentId: envId,
              projectEnvironment: ProjectEnvironment(
                displayName: 'Test Environment $i',
              ),
            ),
          );
        }

        final result = await service.listProjectEnvironments(
          FakeServiceCall(),
          ListProjectEnvironmentsRequest(parent: 'projects/$projectId'),
        );

        expect(result.projectEnvironments, hasLength(9));
        expect(result.hasNextPageToken(), isFalse);
      });

      test('paginated', timeout: Timeout.factor(2), () async {
        const numItems = 25;
        for (var i = 0; i < numItems; i++) {
          final envId = 'test$i';
          await service.createProjectEnvironment(
            FakeServiceCall(),
            CreateProjectEnvironmentRequest(
              parent: 'projects/$projectId',
              projectEnvironmentId: envId,
              projectEnvironment: ProjectEnvironment(
                displayName: 'Test Environment $i',
              ),
            ),
          );
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }

        final allEnvironments = <ProjectEnvironment>[];
        var nextPageToken = '';
        do {
          final result = await service.listProjectEnvironments(
            FakeServiceCall(),
            ListProjectEnvironmentsRequest(
              parent: 'projects/$projectId',
              pageSize: 10,
              pageToken: nextPageToken,
            ),
          );
          allEnvironments.addAll(result.projectEnvironments);
          nextPageToken = result.nextPageToken;
        } while (nextPageToken.isNotEmpty);

        expect(allEnvironments, hasLength(numItems));
        expect(
          allEnvironments.map((e) => e.projectEnvironmentId).toList(),
          [
            for (var i = 0; i < numItems; i++) 'test$i',
          ].reversed, // Most recent first
        );
      });

      test('invalid page token', () async {
        await expectLater(
          service.listProjectEnvironments(
            FakeServiceCall(),
            ListProjectEnvironmentsRequest(
              parent: 'projects/$projectId',
              pageToken: 'invalid',
            ),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.invalidArgument,
            ),
          ),
        );
      });
    });

    group('updateProjectEnvironment', () {
      test('success', () async {
        // First create an environment
        final createRequest = CreateProjectEnvironmentRequest(
          parent: 'projects/$projectId',
          projectEnvironmentId: kEnvName,
          projectEnvironment: ProjectEnvironment(
            displayName: 'Test Environment',
          ),
        );
        final createOp = await service.createProjectEnvironment(
          FakeServiceCall(),
          createRequest,
        );
        final environment = createOp.response.unpackInto(ProjectEnvironment());

        final updateRequest = UpdateProjectEnvironmentRequest(
          projectEnvironment: ProjectEnvironment(
            name: environment.name,
            displayName: 'Updated Environment',
          ),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        final result = await service.updateProjectEnvironment(
          FakeServiceCall(),
          updateRequest,
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(ProjectEnvironment());
        expect(response.name, startsWith('projects/$projectId/environments/'));
        expect(response.displayName, 'Updated Environment');
      });

      test('not found', () async {
        final updateRequest = UpdateProjectEnvironmentRequest(
          projectEnvironment: ProjectEnvironment(
            name: 'projects/$projectId/environments/nonexistent',
            displayName: 'Updated Environment',
          ),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        await expectLater(
          service.updateProjectEnvironment(FakeServiceCall(), updateRequest),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.notFound,
            ),
          ),
        );
      });

      test('invalid name', () async {
        final updateRequest = UpdateProjectEnvironmentRequest(
          projectEnvironment: ProjectEnvironment(
            name: 'invalid',
            displayName: 'Updated Environment',
          ),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        await expectLater(
          service.updateProjectEnvironment(FakeServiceCall(), updateRequest),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.invalidArgument,
            ),
          ),
        );
      });
    });

    group('deleteProjectEnvironment', () {
      test('success', () async {
        // First create an environment
        final createRequest = CreateProjectEnvironmentRequest(
          parent: 'projects/$projectId',
          projectEnvironmentId: kEnvName,
          projectEnvironment: ProjectEnvironment(
            displayName: 'Test Environment',
          ),
        );
        await service.createProjectEnvironment(
          FakeServiceCall(),
          createRequest,
        );

        final result = await service.deleteProjectEnvironment(
          FakeServiceCall(),
          DeleteProjectEnvironmentRequest(
            name: 'projects/$projectId/environments/$kEnvName',
          ),
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(ProjectEnvironment());
        expect(response.state, pb.LifecycleState.DELETED);
      });

      test('not found', () async {
        await expectLater(
          service.deleteProjectEnvironment(
            FakeServiceCall(),
            DeleteProjectEnvironmentRequest(
              name: 'projects/$projectId/environments/nonexistent',
            ),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.notFound,
            ),
          ),
        );
      });

      test('invalid name', () async {
        await expectLater(
          service.deleteProjectEnvironment(
            FakeServiceCall(),
            DeleteProjectEnvironmentRequest(name: 'invalid'),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.invalidArgument,
            ),
          ),
        );
      });
    });

    group('deployProjectEnvironment', () {
      test('not found', () async {
        await expectLater(
          service.deployProjectEnvironment(
            FakeServiceCall(),
            DeployProjectEnvironmentRequest(
              name: 'projects/$projectId/environments/$kEnvName',
            ),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.notFound,
            ),
          ),
        );
      });
    });
  });
}

final class FakeServiceCall extends Fake implements ServiceCall {
  FakeServiceCall({EntityUid? principal = user, this.isCanceled = false}) {
    if (principal != null) {
      this.principal = Entity(uid: principal);
    }
  }

  @override
  final bool isCanceled;
}

final class FakeAuthorizer extends Fake implements Authorizer {
  @override
  Future<void> expectAuthorized({
    Component? principal,
    Component? resource,
    EntityUid? action,
    Map<String, Value>? context,
  }) async {}
}

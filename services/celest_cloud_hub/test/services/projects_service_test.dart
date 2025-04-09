import 'dart:async';

import 'package:cedar/src/model/value.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb;
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/organizations.pb.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/projects.pb.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/services/organizations_service.dart';
import 'package:celest_cloud_hub/src/services/projects_service.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

const user = EntityUid.of('Celest::User', 'test');

void main() {
  group('ProjectsService', () {
    late CloudHubDatabase database;
    late ProjectsService service;

    setUp(() async {
      database = CloudHubDatabase.memory();
      await database.ping();
      await database.cloudAuthUsersDrift.createUser(userId: 'test');

      service = ProjectsService(database, FakeAuthorizer());
    });

    tearDown(() async {
      await database.close();
    });

    group('createProject', () {
      test('success', () async {
        // First create an organization
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        final request = CreateProjectRequest(
          parent: 'organizations/test-org',
          projectId: 'test-project',
          project: Project(
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          ),
        );

        final result = await service.createProject(FakeServiceCall(), request);

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(Project());
        expect(
          response.name,
          predicate<String>((name) {
            final [_, organizationId, _, projectId] = name.split('/');
            TypeId.decode(projectId);
            return true;
          }),
        );
        expect(response.projectId, 'test-project');
        expect(response.displayName, 'Test Project');
        expect(response.regions, [pb.Region.NORTH_AMERICA]);
        expect(response.state, pb.LifecycleState.ACTIVE);
      });

      test('organization not found', () async {
        final request = CreateProjectRequest(
          parent: 'organizations/nonexistent',
          projectId: 'test-project',
          project: Project(
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          ),
        );

        await expectLater(
          service.createProject(FakeServiceCall(), request),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.notFound,
            ),
          ),
        );
      });

      test('project already exists', () async {
        // First create an organization
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        final request = CreateProjectRequest(
          parent: 'organizations/test-org',
          projectId: 'test-project',
          project: Project(
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          ),
        );

        await service.createProject(FakeServiceCall(), request);

        await expectLater(
          service.createProject(FakeServiceCall(), request),
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

    group('getProject', () {
      test('success', () async {
        // First create an organization and project
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        final projectRequest = CreateProjectRequest(
          parent: 'organizations/test-org',
          projectId: 'test-project',
          project: Project(
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          ),
        );
        await service.createProject(FakeServiceCall(), projectRequest);

        final result = await service.getProject(
          FakeServiceCall(),
          GetProjectRequest(
            name: 'organizations/test-org/projects/test-project',
          ),
        );

        expect(result.projectId, 'test-project');
        expect(result.displayName, 'Test Project');
        expect(result.regions, [pb.Region.NORTH_AMERICA]);
        expect(result.state, pb.LifecycleState.ACTIVE);
      });

      test('not found', () async {
        await expectLater(
          service.getProject(
            FakeServiceCall(),
            GetProjectRequest(
              name: 'organizations/test-org/projects/nonexistent',
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
          service.getProject(
            FakeServiceCall(),
            GetProjectRequest(name: 'invalid'),
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

    group('listProjects', () {
      test('empty', () async {
        // First create an organization
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        final result = await service.listProjects(
          FakeServiceCall(),
          ListProjectsRequest(parent: 'organizations/test-org'),
        );

        expect(result.projects, isEmpty);
        expect(result.hasNextPageToken(), isFalse);
      });

      test('single page', () async {
        // First create an organization
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        for (var i = 0; i < 9; i++) {
          await service.createProject(
            FakeServiceCall(),
            CreateProjectRequest(
              parent: 'organizations/test-org',
              projectId: 'test$i',
              project: Project(
                displayName: 'Test Project $i',
                regions: [pb.Region.NORTH_AMERICA],
              ),
            ),
          );
        }

        final result = await service.listProjects(
          FakeServiceCall(),
          ListProjectsRequest(parent: 'organizations/test-org'),
        );

        expect(result.projects, hasLength(9));
        expect(result.hasNextPageToken(), isFalse);
      });

      test('paginated', () async {
        // First create an organization
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        const numItems = 35;
        for (var i = 0; i < numItems; i++) {
          await service.createProject(
            FakeServiceCall(),
            CreateProjectRequest(
              parent: 'organizations/test-org',
              projectId: 'test$i',
              project: Project(
                displayName: 'Test Project $i',
                regions: [pb.Region.NORTH_AMERICA],
              ),
            ),
          );
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }

        final allProjects = <Project>[];
        var nextPageToken = '';
        do {
          final result = await service.listProjects(
            FakeServiceCall(),
            ListProjectsRequest(
              parent: 'organizations/test-org',
              pageSize: 10,
              pageToken: nextPageToken,
            ),
          );
          allProjects.addAll(result.projects);
          nextPageToken = result.nextPageToken;
        } while (nextPageToken.isNotEmpty);

        expect(allProjects, hasLength(numItems));
        expect(
          allProjects.map((e) => e.projectId).toList(),
          [
            for (var i = 0; i < numItems; i++) 'test$i',
          ].reversed, // Most recent first
        );
      });

      test('invalid page token', () async {
        // First create an organization
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        await expectLater(
          service.listProjects(
            FakeServiceCall(),
            ListProjectsRequest(
              parent: 'organizations/test-org',
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

    group('updateProject', () {
      test('success', () async {
        // First create an organization and project
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        final orgOp = await orgService.createOrganization(
          FakeServiceCall(),
          orgRequest,
        );
        final organization = orgOp.response.unpackInto(pb.Organization());

        final createRequest = CreateProjectRequest(
          parent: 'organizations/test-org',
          projectId: 'test-project',
          project: Project(
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          ),
        );

        final operation = await service.createProject(
          FakeServiceCall(),
          createRequest,
        );
        final project = operation.response.unpackInto(Project());

        final updateRequest = UpdateProjectRequest(
          project: Project(name: project.name, displayName: 'Updated Project'),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        final result = await service.updateProject(
          FakeServiceCall(),
          updateRequest,
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(Project());
        expect(response.name, startsWith('${organization.name}/projects/'));
        expect(response.displayName, 'Updated Project');
      });

      test('not found', () async {
        final updateRequest = UpdateProjectRequest(
          project: Project(
            name: 'organizations/test-org/projects/nonexistent',
            displayName: 'Updated Project',
          ),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        await expectLater(
          service.updateProject(FakeServiceCall(), updateRequest),
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
        final updateRequest = UpdateProjectRequest(
          project: Project(name: 'invalid', displayName: 'Updated Project'),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        await expectLater(
          service.updateProject(FakeServiceCall(), updateRequest),
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

    group('deleteProject', () {
      test('success', () async {
        // First create an organization and project
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        final createRequest = CreateProjectRequest(
          parent: 'organizations/test-org',
          projectId: 'test-project',
          project: Project(
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          ),
        );

        await service.createProject(FakeServiceCall(), createRequest);

        final result = await service.deleteProject(
          FakeServiceCall(),
          DeleteProjectRequest(
            name: 'organizations/test-org/projects/test-project',
          ),
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(Project());
        expect(response.state, pb.LifecycleState.DELETED);
      });

      test('not found', () async {
        await expectLater(
          service.deleteProject(
            FakeServiceCall(),
            DeleteProjectRequest(
              name: 'organizations/test-org/projects/nonexistent',
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
          service.deleteProject(
            FakeServiceCall(),
            DeleteProjectRequest(name: 'invalid'),
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

    group('undeleteProject', () {
      test('success', () async {
        // First create an organization and project
        final orgRequest = CreateOrganizationRequest(
          organizationId: 'test-org',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final orgService = OrganizationsService(database, FakeAuthorizer());
        await orgService.createOrganization(FakeServiceCall(), orgRequest);

        final createRequest = CreateProjectRequest(
          parent: 'organizations/test-org',
          projectId: 'test-project',
          project: Project(
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          ),
        );

        await service.createProject(FakeServiceCall(), createRequest);
        await service.deleteProject(
          FakeServiceCall(),
          DeleteProjectRequest(
            name: 'organizations/test-org/projects/test-project',
          ),
        );

        final result = await service.undeleteProject(
          FakeServiceCall(),
          UndeleteProjectRequest(
            name: 'organizations/test-org/projects/test-project',
          ),
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(Project());
        expect(response.state, pb.LifecycleState.ACTIVE);
      });

      test('not found', () async {
        await expectLater(
          service.undeleteProject(
            FakeServiceCall(),
            UndeleteProjectRequest(
              name: 'organizations/test-org/projects/nonexistent',
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
          service.undeleteProject(
            FakeServiceCall(),
            UndeleteProjectRequest(name: 'invalid'),
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

    group('unimplemented methods', () {
      test('renameProject', () async {
        await expectLater(
          service.renameProject(FakeServiceCall(), RenameProjectRequest()),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.unimplemented,
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

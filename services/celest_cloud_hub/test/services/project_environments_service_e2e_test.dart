@Tags(['e2e'])
library;

import 'dart:async';

import 'package:cedar/src/model/value.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb hide OperationState;
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:celest_core/celest_core.dart';
import 'package:test/test.dart';

import '../common.dart';
import '../e2e_tester.dart';

const user = EntityUid.of('Celest::User', 'test');
const kEnvName = 'test-env';

void main() {
  initTesting();

  group('ProjectEnvironmentsService', () {
    late E2ETester tester;
    late CloudHubDatabase database;
    late CelestCloud service;
    late String organizationId;
    late String projectId;

    setUpAll(E2ETester.init);

    setUp(() async {
      tester = E2ETester();
      await tester.start();

      database = tester.database;
      service = tester.service;

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

      // Create project
      final project = await tester.service.projects
          .create(
            parent: 'organizations/$organizationId',
            projectId: kCelestTest,
            displayName: 'Test Project',
            regions: [pb.Region.NORTH_AMERICA],
          )
          .first
          .then((state) => state.response!);
      projectId = project.name.split('/')[3];
    });

    group('permissions', () {
      test('denied when not owner', () async {
        final id = typeId('env');
        await database.projectEnvironmentsDrift.createProjectEnvironment(
          id: id,
          projectEnvironmentId: 'test',
          parentType: 'Celest::Project',
          parentId: projectId,
          state: 'ACTIVE',
          displayName: 'Test Environment',
        );
        expect(
          service.projects.environments.get(
            'projects/$projectId/environments/$id',
          ),
          throwsA(isA<PermissionDeniedException>()),
        );
      });
    });

    group('createProjectEnvironment', () {
      test('success', () async {
        final state =
            await tester.service.projects.environments
                .create(
                  parent: 'projects/$projectId',
                  projectEnvironmentId: kEnvName,
                  displayName: 'Test Environment',
                )
                .first;

        await expectLater(
          state,
          isA<OperationState<OperationMetadata, ProjectEnvironment>>()
              .having((s) => s.done, 'done', isTrue)
              .having(
                (s) => s.response?.projectEnvironmentId,
                'response.projectEnvironmentId',
                kEnvName,
              )
              .having(
                (s) => s.response?.displayName,
                'response.displayName',
                'Test Environment',
              )
              .having(
                (s) => s.response?.state,
                'response.state',
                pb.LifecycleState.ACTIVE,
              ),
        );
      });

      test('already exists', () async {
        await tester.service.projects.environments
            .create(
              parent: 'projects/$projectId',
              projectEnvironmentId: kEnvName,
              displayName: 'Test Environment',
            )
            .drain<void>();

        await expectLater(
          tester.service.projects.environments
              .create(
                parent: 'projects/$projectId',
                projectEnvironmentId: kEnvName,
                displayName: 'Test Environment',
              )
              .first,
          throwsA(isA<AlreadyExistsException>()),
        );
      });
    });

    group('getProjectEnvironment', () {
      test('success', () async {
        final environment = await tester.service.projects.environments
            .create(
              parent: 'projects/$projectId',
              projectEnvironmentId: kEnvName,
              displayName: 'Test Environment',
            )
            .first
            .then((state) => state.response!);

        final result = await tester.service.projects.environments.get(
          environment.name,
        );

        expect(result, isNotNull);
        expect(result!.projectEnvironmentId, kEnvName);
        expect(result.displayName, 'Test Environment');
        expect(result.state, pb.LifecycleState.ACTIVE);
      });

      test('not found', () async {
        await expectLater(
          tester.service.projects.environments.get(
            'projects/$projectId/environments/nonexistent',
          ),
          completion(isNull),
        );
      });

      test('invalid name', () async {
        await expectLater(
          tester.service.projects.environments.get('invalid'),
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('listProjectEnvironments', () {
      test('empty', () async {
        final result = await tester.service.projects.environments.list(
          parent: 'projects/$projectId',
        );

        expect(result.projectEnvironments, isEmpty);
        expect(result.hasNextPageToken(), isFalse);
      });

      test('single page', () async {
        for (var i = 0; i < 9; i++) {
          final envId = 'test$i';
          await tester.service.projects.environments
              .create(
                parent: 'projects/$projectId',
                projectEnvironmentId: envId,
                displayName: 'Test Environment $i',
              )
              .drain<void>();
        }

        final result = await tester.service.projects.environments.list(
          parent: 'projects/$projectId',
          pageSize: 10,
        );

        expect(result.projectEnvironments, hasLength(9));
        expect(result.hasNextPageToken(), isFalse);
      });

      test('paginated', () async {
        const numItems = 25;
        for (var i = 0; i < numItems; i++) {
          final envId = 'test$i';
          await tester.service.projects.environments
              .create(
                parent: 'projects/$projectId',
                projectEnvironmentId: envId,
                displayName: 'Test Environment $i',
              )
              .drain<void>();
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }

        final allEnvironments = <ProjectEnvironment>[];
        var nextPageToken = '';
        do {
          final result = await tester.service.projects.environments.list(
            parent: 'projects/$projectId',
            pageSize: 10,
            pageToken: nextPageToken,
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
          tester.service.projects.environments.list(
            parent: 'projects/$projectId',
            pageToken: 'invalid',
          ),
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('updateProjectEnvironment', () {
      test('success', () async {
        final stream = tester.service.projects.environments.create(
          parent: 'projects/$projectId',
          projectEnvironmentId: kEnvName,
          displayName: 'Test Environment',
        );
        final environment = await stream.last.then((s) => s.response);
        expect(environment, isNotNull);
        expect(environment!.name, isNotNull);

        final updateStream = tester.service.projects.environments.update(
          projectEnvironment: pb.ProjectEnvironment(
            name: environment.name,
            displayName: 'Updated Environment',
          ),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        await expectLater(
          updateStream,
          emits(
            isA<OperationState<OperationMetadata, ProjectEnvironment>>()
                .having((s) => s.done, 'done', isTrue)
                .having(
                  (s) => s.response?.displayName,
                  'response.displayName',
                  'Updated Environment',
                ),
          ),
        );
      });

      test('not found', () async {
        await expectLater(
          tester.service.projects.environments
              .update(
                projectEnvironment: pb.ProjectEnvironment(
                  name: 'projects/$projectId/environments/nonexistent',
                  displayName: 'Updated Environment',
                ),
                updateMask: pb.FieldMask(paths: ['display_name']),
              )
              .first,
          throwsA(isA<NotFoundException>()),
        );
      });

      test('invalid name', () async {
        await expectLater(
          tester.service.projects.environments
              .update(
                projectEnvironment: pb.ProjectEnvironment(
                  name: 'invalid',
                  displayName: 'Updated Environment',
                ),
                updateMask: pb.FieldMask(paths: ['display_name']),
              )
              .first,
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('deleteProjectEnvironment', () {
      test('success', () async {
        final stream = tester.service.projects.environments.create(
          parent: 'projects/$projectId',
          projectEnvironmentId: kEnvName,
          displayName: 'Test Environment',
        );
        final environment = await stream.last.then((s) => s.response);
        expect(environment, isNotNull);
        expect(environment!.name, isNotNull);

        final deleteStream = tester.service.projects.environments.delete(
          environment.name,
        );

        await expectLater(
          deleteStream,
          emits(
            isA<OperationState<OperationMetadata, ProjectEnvironment>>().having(
              (s) => s.done,
              'done',
              isTrue,
            ),
          ),
        );
      });

      test('not found', () async {
        await expectLater(
          tester.service.projects.environments
              .delete('projects/$projectId/environments/nonexistent')
              .first,
          throwsA(isA<NotFoundException>()),
        );
      });

      test('invalid name', () async {
        await expectLater(
          tester.service.projects.environments.delete('invalid').first,
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('deployProjectEnvironment', () {
      test('not found', () async {
        await expectLater(
          tester.service.projects.environments
              .deploy(
                'projects/$projectId/environments/$kEnvName',
                assets: [],
                resolvedProject: ResolvedProject(),
              )
              .first,
          throwsA(isA<NotFoundException>()),
        );
      });
    });
  });
}

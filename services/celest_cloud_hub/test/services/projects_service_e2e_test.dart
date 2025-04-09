import 'dart:async';
import 'dart:convert';

import 'package:cedar/src/model/value.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb hide OperationState;
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

import '../e2e_tester.dart';

const user = EntityUid.of('Celest::User', 'test');

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('[${record.loggerName}] ${record.message}');
  });

  group('ProjectsService', () {
    late E2ETester tester;
    late CloudHubDatabase database;
    late CelestCloud service;
    late String organizationId;

    setUpAll(E2ETester.init);

    setUp(() async {
      tester = E2ETester();
      await tester.start();

      database = tester.database;
      service = tester.service;

      final organization = await tester.service.organizations
          .create(
            organizationId: 'test-org',
            organization: pb.Organization(
              displayName: 'Test Organization',
              primaryRegion: pb.Region.NORTH_AMERICA,
            ),
          )
          .first
          .then((state) => state.response!);
      organizationId = organization.name.split('/')[1];
    });

    group('permissions', () {
      test('denied when not owner', () async {
        final id = typeId('prj');
        await database.projectsDrift.createProject(
          id: id,
          projectId: 'test',
          parentType: 'Celest::Organization',
          parentId: organizationId,
          state: pb.LifecycleState.ACTIVE.name,
          displayName: 'Test Project',
          regions: jsonEncode([pb.Region.NORTH_AMERICA.name]),
        );
        expect(
          service.projects.get('organizations/$organizationId/projects/$id'),
          throwsA(isA<PermissionDeniedException>()),
        );
      });
    });

    group('createProject', () {
      test('success', () async {
        final state =
            await tester.service.projects
                .create(
                  parent: 'organizations/$organizationId',
                  projectId: 'test-project',
                  displayName: 'Test Project',
                  regions: [pb.Region.NORTH_AMERICA],
                )
                .first;

        await expectLater(
          state,
          isA<OperationState<OperationMetadata, Project>>()
              .having((s) => s.done, 'done', isTrue)
              .having(
                (s) => s.response?.projectId,
                'response.projectId',
                'test-project',
              )
              .having(
                (s) => s.response?.displayName,
                'response.displayName',
                'Test Project',
              )
              .having((s) => s.response?.regions, 'response.regions', [
                pb.Region.NORTH_AMERICA,
              ])
              .having(
                (s) => s.response?.state,
                'response.state',
                pb.LifecycleState.ACTIVE,
              ),
        );
      });

      test('already exists', () async {
        await tester.service.projects
            .create(
              parent: 'organizations/$organizationId',
              projectId: 'test-project',
              displayName: 'Test Project',
              regions: [pb.Region.NORTH_AMERICA],
            )
            .drain<void>();

        await expectLater(
          tester.service.projects
              .create(
                parent: 'organizations/$organizationId',
                projectId: 'test-project',
                displayName: 'Test Project',
                regions: [pb.Region.NORTH_AMERICA],
              )
              .first,
          throwsA(isA<AlreadyExistsException>()),
        );
      });
    });

    group('getProject', () {
      test('success', () async {
        final project = await tester.service.projects
            .create(
              parent: 'organizations/$organizationId',
              projectId: 'test-project',
              displayName: 'Test Project',
              regions: [pb.Region.NORTH_AMERICA],
            )
            .first
            .then((state) => state.response!);

        final result = await tester.service.projects.get(project.name);

        expect(result, isNotNull);
        expect(result!.projectId, 'test-project');
        expect(result.displayName, 'Test Project');
        expect(result.regions, [pb.Region.NORTH_AMERICA]);
        expect(result.state, pb.LifecycleState.ACTIVE);
      });

      test('not found', () async {
        await expectLater(
          tester.service.projects.get(
            'organizations/$organizationId/projects/nonexistent',
          ),
          completion(isNull),
        );
      });

      test('invalid name', () async {
        await expectLater(
          tester.service.projects.get('invalid'),
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('listProjects', () {
      test('empty', () async {
        final result = await tester.service.projects.list(
          parent: 'organizations/$organizationId',
        );

        expect(result.projects, isEmpty);
        expect(result.hasNextPageToken(), isFalse);
      });

      test('single page', () async {
        for (var i = 0; i < 9; i++) {
          await tester.service.projects
              .create(
                parent: 'organizations/$organizationId',
                projectId: 'test$i',
                displayName: 'Test Project $i',
                regions: [pb.Region.NORTH_AMERICA],
              )
              .drain<void>();
        }

        final result = await tester.service.projects.list(
          parent: 'organizations/$organizationId',
          pageSize: 10,
        );

        expect(result.projects, hasLength(9));
        expect(result.hasNextPageToken(), isFalse);
      });

      test('paginated', () async {
        const numItems = 35;
        for (var i = 0; i < numItems; i++) {
          await tester.service.projects
              .create(
                parent: 'organizations/$organizationId',
                projectId: 'test$i',
                displayName: 'Test Project $i',
                regions: [pb.Region.NORTH_AMERICA],
              )
              .drain<void>();
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }

        final allProjects = <Project>[];
        var nextPageToken = '';
        do {
          final result = await tester.service.projects.list(
            parent: 'organizations/$organizationId',
            pageSize: 10,
            pageToken: nextPageToken,
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
        await expectLater(
          tester.service.projects.list(
            parent: 'organizations/$organizationId',
            pageToken: 'invalid',
          ),
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('updateProject', () {
      test('success', () async {
        final stream = tester.service.projects.create(
          parent: 'organizations/$organizationId',
          projectId: 'test-project',
          displayName: 'Test Project',
          regions: [pb.Region.NORTH_AMERICA],
        );
        final project = await stream.last.then((s) => s.response);
        expect(project, isNotNull);
        expect(project!.name, isNotNull);

        final updateStream = tester.service.projects.update(
          project: pb.Project(
            name: project.name,
            displayName: 'Updated Project',
          ),
          updateMask: pb.FieldMask(paths: ['display_name']),
        );

        await expectLater(
          updateStream,
          emits(
            isA<OperationState<OperationMetadata, Project>>()
                .having((s) => s.done, 'done', isTrue)
                .having(
                  (s) => s.response?.displayName,
                  'response.displayName',
                  'Updated Project',
                ),
          ),
        );
      });

      test('not found', () async {
        await expectLater(
          tester.service.projects
              .update(
                project: pb.Project(
                  name: 'organizations/$organizationId/projects/nonexistent',
                  displayName: 'Updated Project',
                ),
                updateMask: pb.FieldMask(paths: ['display_name']),
              )
              .first,
          throwsA(isA<NotFoundException>()),
        );
      });

      test('invalid name', () async {
        await expectLater(
          tester.service.projects
              .update(
                project: pb.Project(
                  name: 'invalid',
                  displayName: 'Updated Project',
                ),
                updateMask: pb.FieldMask(paths: ['display_name']),
              )
              .first,
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('deleteProject', () {
      test('success', () async {
        final stream = tester.service.projects.create(
          parent: 'organizations/$organizationId',
          projectId: 'test-project',
          displayName: 'Test Project',
          regions: [pb.Region.NORTH_AMERICA],
        );
        final project = await stream.last.then((s) => s.response);
        expect(project, isNotNull);
        expect(project!.name, isNotNull);

        final deleteStream = tester.service.projects.delete(project.name);

        await expectLater(
          deleteStream,
          emits(
            isA<OperationState<OperationMetadata, Project>>()
                .having((s) => s.done, 'done', isTrue)
                .having(
                  (s) => s.response?.state,
                  'response.state',
                  pb.LifecycleState.DELETED,
                ),
          ),
        );
      });

      test('not found', () async {
        await expectLater(
          tester.service.projects
              .delete('organizations/$organizationId/projects/nonexistent')
              .first,
          throwsA(isA<NotFoundException>()),
        );
      });

      test('invalid name', () async {
        await expectLater(
          tester.service.projects.delete('invalid').first,
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('undeleteProject', () {
      test('success', () async {
        final stream = tester.service.projects.create(
          parent: 'organizations/$organizationId',
          projectId: 'test-project',
          displayName: 'Test Project',
          regions: [pb.Region.NORTH_AMERICA],
        );
        final project = await stream.last.then((s) => s.response);
        expect(project, isNotNull);
        expect(project!.name, isNotNull);

        await tester.service.projects.delete(project.name).drain<void>();

        final undeleteStream = tester.service.projects.undelete(project.name);

        await expectLater(
          undeleteStream,
          emits(
            isA<OperationState<OperationMetadata, Project>>()
                .having((s) => s.done, 'done', isTrue)
                .having(
                  (s) => s.response?.state,
                  'response.state',
                  pb.LifecycleState.ACTIVE,
                ),
          ),
        );
      });

      test('not found', () async {
        await expectLater(
          tester.service.projects
              .undelete('organizations/$organizationId/projects/nonexistent')
              .first,
          throwsA(isA<NotFoundException>()),
        );
      });

      test('invalid name', () async {
        await expectLater(
          tester.service.projects.undelete('invalid').first,
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('unimplemented', () {
      test('renameProject', () async {
        await expectLater(
          tester.service.projects
              .rename(
                name: 'organizations/$organizationId/projects/test-project',
                newAlias: 'test-project-123',
              )
              .first,
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}

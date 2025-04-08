import 'dart:async';

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

  group('OrganizationsService', () {
    late E2ETester tester;
    late CloudHubDatabase database;
    late CelestCloud service;

    setUp(() async {
      tester = E2ETester();
      await tester.start();

      database = tester.database;
      service = tester.service;
    });

    group('permissions', () {
      test('denied when not owner', () async {
        final id = typeId('org');
        await database.organizationsDrift.createOrganization(
          id: id,
          organizationId: 'test',
          state: pb.LifecycleState.ACTIVE.name,
          displayName: 'Test Organization',
          primaryRegion: pb.Region.NORTH_AMERICA.name,
        );
        expect(
          service.organizations.get('organizations/$id'),
          throwsA(isA<PermissionDeniedException>()),
        );
      });
    });

    group('createOrganization', () {
      test('success', () async {
        final state =
            await service.organizations
                .create(
                  organizationId: 'test',
                  organization: Organization(
                    displayName: 'Test Organization',
                    primaryRegion: pb.Region.NORTH_AMERICA,
                  ),
                )
                .first;

        await expectLater(
          state,
          isA<OperationState<OperationMetadata, Organization>>()
              .having((s) => s.done, 'done', isTrue)
              .having(
                (s) => s.response?.organizationId,
                'response.organizationId',
                'test',
              )
              .having(
                (s) => s.response?.displayName,
                'response.displayName',
                'Test Organization',
              )
              .having(
                (s) => s.response?.primaryRegion,
                'response.primaryRegion',
                pb.Region.NORTH_AMERICA,
              )
              .having(
                (s) => s.response?.state,
                'response.state',
                pb.LifecycleState.ACTIVE,
              ),
        );
      });

      test('already exists', () async {
        await service.organizations
            .create(
              organizationId: 'test',
              organization: Organization(
                displayName: 'Test Organization',
                primaryRegion: pb.Region.NORTH_AMERICA,
              ),
            )
            .drain<void>();

        await expectLater(
          service.organizations
              .create(
                organizationId: 'test',
                organization: Organization(
                  displayName: 'Test Organization',
                  primaryRegion: pb.Region.NORTH_AMERICA,
                ),
              )
              .first,
          throwsA(isA<AlreadyExistsException>()),
        );
      });
    });

    group('getOrganization', () {
      test('success', () async {
        final organization = await service.organizations
            .create(
              organizationId: 'test',
              organization: Organization(
                displayName: 'Test Organization',
                primaryRegion: pb.Region.NORTH_AMERICA,
              ),
            )
            .first
            .then((state) => state.response!);

        final result = await service.organizations.get(organization.name);

        expect(result, isNotNull);
        expect(result!.organizationId, 'test');
        expect(result.displayName, 'Test Organization');
        expect(result.primaryRegion, pb.Region.NORTH_AMERICA);
        expect(result.state, pb.LifecycleState.ACTIVE);
      });

      test('not found', () async {
        final id = typeId('org');
        await expectLater(
          service.organizations.get('organizations/$id'),
          completion(isNull),
        );
      });

      test('invalid name', () async {
        await expectLater(
          service.organizations.get('invalid'),
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('listOrganizations', () {
      test('empty', () async {
        final result = await service.organizations.list();

        expect(result.organizations, isEmpty);
        expect(result.hasNextPageToken(), isFalse);
      });

      test('single page', () async {
        for (var i = 0; i < 9; i++) {
          await service.organizations
              .create(
                organizationId: 'test$i',
                organization: Organization(
                  displayName: 'Test Organization $i',
                  primaryRegion: pb.Region.NORTH_AMERICA,
                ),
              )
              .drain<void>();
        }

        final result = await service.organizations.list(pageSize: 10);

        expect(result.organizations, hasLength(9));
        expect(result.hasNextPageToken(), isFalse);
      });

      test('paginated', () async {
        const numItems = 35;
        for (var i = 0; i < numItems; i++) {
          await service.organizations
              .create(
                organizationId: 'test$i',
                organization: Organization(
                  displayName: 'Test Organization $i',
                  primaryRegion: pb.Region.NORTH_AMERICA,
                ),
              )
              .drain<void>();
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }

        final allOrganizations = <Organization>[];
        var nextPageToken = '';
        do {
          final result = await service.organizations.list(
            pageSize: 10,
            pageToken: nextPageToken,
          );
          allOrganizations.addAll(result.organizations);
          nextPageToken = result.nextPageToken;
        } while (nextPageToken.isNotEmpty);

        expect(allOrganizations, hasLength(numItems));
        expect(
          allOrganizations.map((e) => e.organizationId).toList(),
          [
            for (var i = 0; i < numItems; i++) 'test$i',
          ].reversed, // Most recent first
        );
      });

      test('invalid page token', () async {
        await expectLater(
          service.organizations.list(pageToken: 'invalid'),
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('updateOrganization', () {
      test('success', () async {
        final stream = service.organizations.create(
          organizationId: 'test',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );
        final organization = await stream.last.then((s) => s.response);
        expect(organization, isNotNull);
        expect(organization!.name, isNotNull);

        final updateStream = service.organizations.update(
          organization: Organization(
            name: organization.name,
            displayName: 'Updated Organization',
            primaryRegion: pb.Region.EUROPE,
          ),
          updateMask: pb.FieldMask(paths: ['display_name', 'primary_region']),
        );

        await expectLater(
          updateStream,
          emits(
            isA<OperationState<OperationMetadata, Organization>>()
                .having((s) => s.done, 'done', isTrue)
                .having(
                  (s) => s.response?.displayName,
                  'response.displayName',
                  'Updated Organization',
                )
                .having(
                  (s) => s.response?.primaryRegion,
                  'response.primaryRegion',
                  pb.Region.EUROPE,
                ),
          ),
        );
      });

      test('not found', () async {
        await expectLater(
          service.organizations
              .update(
                organization: Organization(
                  name: 'organizations/test',
                  displayName: 'Updated Organization',
                  primaryRegion: pb.Region.EUROPE,
                ),
                updateMask: pb.FieldMask(
                  paths: ['display_name', 'primary_region'],
                ),
              )
              .first,
          throwsA(isA<NotFoundException>()),
        );
      });

      test('invalid name', () async {
        await expectLater(
          service.organizations
              .update(
                organization: Organization(
                  name: 'invalid',
                  displayName: 'Updated Organization',
                  primaryRegion: pb.Region.EUROPE,
                ),
                updateMask: pb.FieldMask(
                  paths: ['display_name', 'primary_region'],
                ),
              )
              .first,
          throwsA(isA<BadRequestException>()),
        );
      });
    });

    group('unimplemented methods', () {
      test('renameOrganization', () async {
        await expectLater(
          service.organizations.rename(
            name: 'organizations/test',
            newAlias: 'new-test',
          ),
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('deleteOrganization', () async {
        await expectLater(
          service.organizations.delete('organizations/test').first,
          throwsA(isA<UnimplementedError>()),
        );
      });
    });
  });
}

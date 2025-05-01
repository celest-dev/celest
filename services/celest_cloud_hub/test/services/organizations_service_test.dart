import 'dart:async';

import 'package:cedar/src/model/value.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb;
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/organizations.pb.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/services/organizations_service.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

import '../common.dart';

const user = EntityUid.of('Celest::User', 'test');

void main() {
  initTesting();

  group('OrganizationsService', () {
    late CloudHubDatabase database;
    late OrganizationsService service;

    setUp(() async {
      database = CloudHubDatabase.memory();
      await database.ping();
      await database.cloudAuthUsersDrift.createUser(userId: 'test');

      service = OrganizationsService(database, FakeAuthorizer());
    });

    tearDown(() async {
      await database.close();
    });

    group('createOrganization', () {
      test('success', () async {
        final request = CreateOrganizationRequest(
          organizationId: 'test',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );

        final result = await service.createOrganization(
          FakeServiceCall(),
          request,
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(Organization());
        expect(
          response.name,
          predicate<String>((name) {
            final [_, organizationId] = name.split('/');
            TypeId.decode(organizationId);
            return true;
          }),
        );
        expect(response.organizationId, 'test');
        expect(response.displayName, 'Test Organization');
        expect(response.primaryRegion, pb.Region.NORTH_AMERICA);
        expect(response.state, pb.LifecycleState.ACTIVE);
      });

      test('already exists', () async {
        final request = CreateOrganizationRequest(
          organizationId: 'test',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );

        await service.createOrganization(FakeServiceCall(), request);

        await expectLater(
          service.createOrganization(FakeServiceCall(), request),
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

    group('getOrganization', () {
      test('success', () async {
        final request = CreateOrganizationRequest(
          organizationId: 'test',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );

        await service.createOrganization(FakeServiceCall(), request);

        final result = await service.getOrganization(
          FakeServiceCall(),
          GetOrganizationRequest(name: 'organizations/test'),
        );

        expect(result.organizationId, 'test');
        expect(result.displayName, 'Test Organization');
        expect(result.primaryRegion, pb.Region.NORTH_AMERICA);
        expect(result.state, pb.LifecycleState.ACTIVE);
      });

      test('not found', () async {
        await expectLater(
          service.getOrganization(
            FakeServiceCall(),
            GetOrganizationRequest(name: 'organizations/test'),
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
          service.getOrganization(
            FakeServiceCall(),
            GetOrganizationRequest(name: 'invalid'),
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

    group('listOrganizations', () {
      test('empty', () async {
        final result = await service.listOrganizations(
          FakeServiceCall(),
          ListOrganizationsRequest(),
        );

        expect(result.organizations, isEmpty);
        expect(result.hasNextPageToken(), isFalse);
      });

      test('single page', () async {
        for (var i = 0; i < 9; i++) {
          await service.createOrganization(
            FakeServiceCall(),
            CreateOrganizationRequest(
              organizationId: 'test$i',
              organization: Organization(
                displayName: 'Test Organization $i',
                primaryRegion: pb.Region.NORTH_AMERICA,
              ),
            ),
          );
        }

        final result = await service.listOrganizations(
          FakeServiceCall(),
          ListOrganizationsRequest(),
        );

        expect(result.organizations, hasLength(9));
        expect(result.hasNextPageToken(), isFalse);
      });

      test('paginated', timeout: Timeout.factor(2), () async {
        const numItems = 25;
        for (var i = 0; i < numItems; i++) {
          await service.createOrganization(
            FakeServiceCall(),
            CreateOrganizationRequest(
              organizationId: 'test$i',
              organization: Organization(
                displayName: 'Test Organization $i',
                primaryRegion: pb.Region.NORTH_AMERICA,
              ),
            ),
          );
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }

        final allOrganizations = <Organization>[];
        var nextPageToken = '';
        do {
          final result = await service.listOrganizations(
            FakeServiceCall(),
            ListOrganizationsRequest(pageSize: 10, pageToken: nextPageToken),
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
          service.listOrganizations(
            FakeServiceCall(),
            ListOrganizationsRequest(pageToken: 'invalid'),
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

    group('updateOrganization', () {
      test('success', () async {
        final createRequest = CreateOrganizationRequest(
          organizationId: 'test',
          organization: Organization(
            displayName: 'Test Organization',
            primaryRegion: pb.Region.NORTH_AMERICA,
          ),
        );

        final operation = await service.createOrganization(
          FakeServiceCall(),
          createRequest,
        );
        final organization = operation.response.unpackInto(Organization());

        final updateRequest = UpdateOrganizationRequest(
          organization: Organization(
            name: organization.name,
            displayName: 'Updated Organization',
            primaryRegion: pb.Region.EUROPE,
          ),
          updateMask: pb.FieldMask(paths: ['display_name', 'primary_region']),
        );

        final result = await service.updateOrganization(
          FakeServiceCall(),
          updateRequest,
        );

        expect(result.name, startsWith('operations/'));
        expect(result.done, isTrue);
        expect(result.hasResponse(), isTrue);

        final response = result.response.unpackInto(Organization());
        expect(response.name, startsWith('organizations/'));
        expect(response.displayName, 'Updated Organization');
        expect(response.primaryRegion, pb.Region.EUROPE);
      });

      test('not found', () async {
        final updateRequest = UpdateOrganizationRequest(
          organization: Organization(
            name: 'organizations/test',
            displayName: 'Updated Organization',
            primaryRegion: pb.Region.EUROPE,
          ),
          updateMask: pb.FieldMask(paths: ['display_name', 'primary_region']),
        );

        await expectLater(
          service.updateOrganization(FakeServiceCall(), updateRequest),
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
        final updateRequest = UpdateOrganizationRequest(
          organization: Organization(
            name: 'invalid',
            displayName: 'Updated Organization',
            primaryRegion: pb.Region.EUROPE,
          ),
          updateMask: pb.FieldMask(paths: ['display_name', 'primary_region']),
        );

        await expectLater(
          service.updateOrganization(FakeServiceCall(), updateRequest),
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
      test('renameOrganization', () async {
        await expectLater(
          service.renameOrganization(
            FakeServiceCall(),
            RenameOrganizationRequest(),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.unimplemented,
            ),
          ),
        );
      });

      test('deleteOrganization', () async {
        await expectLater(
          service.deleteOrganization(
            FakeServiceCall(),
            DeleteOrganizationRequest(),
          ),
          throwsA(
            isA<GrpcError>().having(
              (it) => it.code,
              'code',
              grpc.StatusCode.unimplemented,
            ),
          ),
        );
      });

      test('undeleteOrganization', () async {
        await expectLater(
          service.undeleteOrganization(
            FakeServiceCall(),
            UndeleteOrganizationRequest(),
          ),
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

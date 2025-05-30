@Tags(['e2e'])
library;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cedar/src/model/value.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb hide OperationState;
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/operations.pbenum.dart'
    as pb;
import 'package:celest_cloud/src/proto/google/protobuf/duration.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/struct.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/timestamp.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/protobuf/wrappers.pb.dart' as pb;
import 'package:celest_cloud/src/proto/google/rpc/status.pb.dart' as pb;
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/model/protobuf.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:celest_core/_internal.dart';
import 'package:celest_core/celest_core.dart';
import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';

import '../common.dart';
import '../e2e_tester.dart';

const user = EntityUid.of('Celest::User', 'test');

void main() {
  initTesting();

  group('OperationsService', () {
    late E2ETester tester;
    late CloudHubDatabase database;
    late CelestCloud service;

    setUpAll(E2ETester.init);

    setUp(() async {
      tester = E2ETester();
      await tester.start();

      database = tester.database;
      service = tester.service;
    });

    group('permissions', () {
      test('denied when not owner', () async {
        await database.operationsDrift.createOperation(id: 'test');
        expect(
          service.operations.get('operations/test'),
          throwsA(isA<PermissionDeniedException>()),
        );
      });

      test('allowed when owner', () async {
        await database.operationsDrift.createOperation(
          id: 'test',
          ownerType: user.type,
          ownerId: user.id,
        );
        expect(service.operations.get('operations/test'), completes);
      });
    });

    group('getOperation', () {
      test('not found', () async {
        expect(
          service.operations.get('operations/test'),
          throwsA(isA<NotFoundException>()),
        );
      });

      test('empty', () async {
        await database.operationsDrift.createOperation(
          id: 'test',
          ownerType: user.type,
          ownerId: user.id,
        );
        final result = await service.operations.get('operations/test');
        expect(result.name, 'operations/test');
        expect(result.done, isFalse);
        expect(result.hasMetadata(), isFalse);
        expect(result.hasError(), isFalse);
      });

      test('metadata', () async {
        final requestId = Uuid.v7();
        final createTime = DateTime.timestamp();
        final resource = pb.ProjectEnvironment(
          name: 'projects/test/environments/test',
          createTime: pb.Timestamp.fromDateTime(createTime),
        );
        final anyResource = resource.packIntoAny();

        final metadata = OperationMetadata(
          createTime: pb.Timestamp.fromDateTime(createTime),
          startTime: pb.Timestamp.fromDateTime(createTime),
          endTime: pb.Timestamp.fromDateTime(createTime),
          parent: resource.name,
          progress: 100,
          requestId: requestId.hexValue,
          resource: anyResource,
          state: pb.OperationState.SUCCEEDED,
        );
        final anyMetadata = metadata.packIntoAny();

        await database.operationsDrift.createOperation(
          id: 'test',
          metadata: jsonEncode(
            anyMetadata.toProto3Json(typeRegistry: typeRegistry),
          ),
          ownerType: user.type,
          ownerId: user.id,
        );
        final result = await service.operations.get('operations/test');
        expect(result.name, 'operations/test');
        expect(result.done, isFalse);
        expect(result.hasMetadata(), isTrue);
        expect(
          result.metadata.unpackInto(OperationMetadata()),
          equals(metadata),
        );
        expect(result.hasResponse(), isFalse);
        expect(result.hasError(), isFalse);
      });

      test('response', () async {
        final createTime = DateTime.timestamp();
        final resource = pb.ProjectEnvironment(
          name: 'projects/test/environments/test',
          createTime: pb.Timestamp.fromDateTime(createTime),
        );
        final anyResource = resource.packIntoAny();

        await database.operationsDrift.createOperation(
          id: 'test',
          response: jsonEncode(
            anyResource.toProto3Json(typeRegistry: typeRegistry),
          ),
          ownerType: user.type,
          ownerId: user.id,
        );
        final result = await service.operations.get('operations/test');
        expect(result.name, 'operations/test');
        expect(result.done, isTrue);
        expect(result.hasMetadata(), isFalse);
        expect(result.hasResponse(), isTrue);
        expect(
          result.response.unpackInto(pb.ProjectEnvironment()),
          equals(resource),
        );
        expect(result.hasError(), isFalse);
      });

      test('error', () async {
        final error = pb.Status(
          code: 1,
          message: 'test',
          details: [
            pb.BoolValue(value: true).packIntoAny(),
            pb.StringValue(value: 'test').packIntoAny(),
            pb.Int32Value(value: 1).packIntoAny(),
            pb.Int64Value(value: Int64(1)).packIntoAny(),
            pb.FloatValue(value: 1).packIntoAny(),
            pb.DoubleValue(value: 1).packIntoAny(),
            pb.Timestamp(seconds: Int64(1), nanos: 1).packIntoAny(),
            pb.BytesValue(value: Uint8List.fromList([1, 2, 3])).packIntoAny(),
            pb.Duration(seconds: Int64(1), nanos: 1).packIntoAny(),
            pb.FieldMask(paths: ['test']).packIntoAny(),
            pb.Empty().packIntoAny(),
            pb.Struct(
              fields: [MapEntry('test', pb.Value(stringValue: 'test'))],
            ).packIntoAny(),
            pb.ListValue(values: [pb.Value(stringValue: 'test')]).packIntoAny(),
            pb.Value(stringValue: 'test').packIntoAny(),
          ],
        );

        await database.operationsDrift.createOperation(
          id: 'test',
          error: jsonEncode(error.toProto3Json(typeRegistry: typeRegistry)),
          ownerType: user.type,
          ownerId: user.id,
        );
        final result = await service.operations.get('operations/test');
        expect(result.name, 'operations/test');
        expect(result.done, isTrue);
        expect(result.hasMetadata(), isFalse);
        expect(result.hasResponse(), isFalse);
        expect(result.hasError(), isTrue);
        expect(result.error, equals(error));
      });
    });

    group('listOperations', () {
      test('single page', () async {
        for (var i = 0; i < 9; i++) {
          await database.operationsDrift.createOperation(
            id: 'test$i',
            ownerType: user.type,
            ownerId: user.id,
          );
        }
        final result = await service.operations.list(pageSize: 10);
        expect(result.operations, hasLength(9));
        expect(result.hasNextPageToken(), isFalse);
      });

      test('paginated', timeout: Timeout.factor(2), () async {
        const numItems = 25;
        for (var i = 0; i < numItems; i++) {
          await database.operationsDrift.createOperation(
            id: 'test$i',
            ownerType: user.type,
            ownerId: user.id,
          );
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }
        final allOperations = <pb.Operation>[];
        var nextPageToken = '';
        do {
          final result = await service.operations.list(
            pageSize: 10,
            pageToken: nextPageToken,
          );
          allOperations.addAll(result.operations);
          nextPageToken = result.nextPageToken;
        } while (nextPageToken.isNotEmpty);

        expect(allOperations, hasLength(numItems));
        expect(
          allOperations.map((e) => e.name).toList(),
          [
            for (var i = 0; i < numItems; i++) 'operations/test$i',
          ].reversed, // Most recent first
        );
      });

      test('filtered', () async {
        final resource = EntityUid.of('Celest::Project', 'test');
        await database.cedarDrift.createEntity(
          entityType: resource.type,
          entityId: resource.id,
          attributeJson: {},
        );
        for (var i = 0; i < 9; i++) {
          await database.operationsDrift.createOperation(
            id: 'test$i',
            ownerType: user.type,
            ownerId: user.id,
            resourceType: i == 0 ? resource.type : null,
            resourceId: i == 0 ? resource.id : null,
            response:
                i == 0
                    ? jsonEncode(
                      pb.ProjectEnvironment(
                        name: 'projects/test/environments/test',
                        createTime: pb.Timestamp.fromDateTime(
                          DateTime.timestamp(),
                        ),
                      ).packIntoAny().toProto3Json(typeRegistry: typeRegistry),
                    )
                    : null,
          );
        }
        final unfiltered = await service.operations.list(pageSize: 10);
        expect(unfiltered.operations, hasLength(9));

        final byResource = await service.operations.list(
          pageSize: 10,
          filter: 'resource_type = "Celest::Project" AND resource_id = "test"',
        );
        expect(byResource.operations, hasLength(1));
        expect(byResource.operations.first.name, 'operations/test0');
        expect(byResource.hasNextPageToken(), isFalse);

        final byDone = await service.operations.list(
          pageSize: 10,
          filter: 'done = true',
        );
        expect(byDone.operations, hasLength(1));
        expect(byDone.operations.first.name, 'operations/test0');
        expect(byDone.hasNextPageToken(), isFalse);
      });
    });

    group('waitOperation', () {
      test('success', () async {
        await database.operationsDrift.createOperation(
          id: 'test',
          ownerType: user.type,
          ownerId: user.id,
        );
        final result = service.operations.wait(
          'operations/test',
          timeout: const Duration(seconds: 2),
        );
        unawaited(
          expectLater(
            result.timeout(const Duration(seconds: 2)),
            completion(
              isA<pb.Operation>().having((it) => it.done, 'done', isTrue),
            ),
          ),
        );
        await database.operationsDrift.updateOperation(
          id: 'test',
          response: jsonEncode(
            pb.Empty().packIntoAny().toProto3Json(typeRegistry: typeRegistry),
          ),
        );
      });

      test('timeout', () async {
        await database.operationsDrift.createOperation(
          id: 'test',
          ownerType: user.type,
          ownerId: user.id,
        );
        final result = service.operations.wait(
          'operations/test',
          timeout: const Duration(seconds: 1),
        );
        unawaited(expectLater(result, throwsA(isA<DeadlineExceededError>())));
        await Future<void>.delayed(const Duration(seconds: 2));
      });

      test('not found', () async {
        final result = service.operations.wait(
          'operations/test',
          timeout: const Duration(seconds: 1),
        );
        await expectLater(result, throwsA(isA<NotFoundException>()));
      });
    });
  });
}

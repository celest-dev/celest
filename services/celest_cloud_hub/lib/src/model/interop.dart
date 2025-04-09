import 'dart:convert';

import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud/src/proto/google/rpc/status.pb.dart' as pb;
import 'package:celest_cloud_hub/src/database/schema/operations.drift.dart'
    as dto;
import 'package:celest_cloud_hub/src/database/schema/organizations.drift.dart'
    as dto;
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart'
    as dto;
import 'package:celest_cloud_hub/src/database/schema/projects.drift.dart'
    as dto;
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';

extension OrganizationToProto on dto.Organization {
  pb.Organization toProto() {
    return pb.Organization(
      name: 'organizations/$id',
      parent: switch ((parentType, parentId)) {
        ('Celest::Organization', final organizationId?) =>
          'organizations/$organizationId',
        _ => null,
      },
      uid: TypeId.decode(id).uuid.hexValue,
      displayName: displayName,
      organizationId: organizationId,
      primaryRegion: switch (primaryRegion) {
        final primaryRegion? => pb.Region.values.firstWhere(
          (r) => r.name == primaryRegion,
        ),
        _ => null,
      },
      etag: etag,
      reconciling: reconciling,
      state: pb.LifecycleState.values.firstWhere((s) => s.name == state),
      createTime: createTime.toProto(),
      updateTime: updateTime.toProto(),
      deleteTime: deleteTime?.toProto(),
      purgeTime: purgeTime?.toProto(),
      annotations: switch (annotations) {
        final annotations? =>
          (jsonDecode(annotations) as Map<String, Object?>).cast(),
        _ => null,
      },
    );
  }
}

extension OperationToProto on dto.Operation {
  pb.Operation toProto() {
    return pb.Operation(
      name: 'operations/$id',
      done: done,
      error: switch (error) {
        final error? =>
          pb.Status()..mergeFromProto3Json(
            jsonDecode(error),
            typeRegistry: typeRegistry,
          ),
        _ => null,
      },
      response: switch (response) {
        final response? =>
          pb.Any()..mergeFromProto3Json(
            jsonDecode(response),
            typeRegistry: typeRegistry,
          ),
        _ => null,
      },
      metadata: switch (metadata) {
        final metadata? =>
          pb.Any()..mergeFromProto3Json(
            jsonDecode(metadata),
            typeRegistry: typeRegistry,
          ),
        _ => null,
      },
    );
  }
}

extension ProjectToProto on dto.Project {
  pb.Project toProto() {
    return pb.Project(
      name: 'organizations/$parentId/projects/$id',
      parent: 'organizations/$parentId',
      uid: TypeId.decode(id).uuid.hexValue,
      displayName: displayName,
      projectId: projectId,
      regions: (jsonDecode(regions) as List<Object?>).map((region) {
        return pb.Region.values.firstWhere((r) => r.name == region);
      }),
      etag: etag,
      reconciling: reconciling,
      state: pb.LifecycleState.values.firstWhere((s) => s.name == state),
      createTime: createTime.toProto(),
      updateTime: updateTime.toProto(),
      deleteTime: deleteTime?.toProto(),
      purgeTime: purgeTime?.toProto(),
      annotations: switch (annotations) {
        final annotations? =>
          (jsonDecode(annotations) as Map<String, Object?>).cast(),
        _ => null,
      },
    );
  }
}

extension ProjectEnvironmentToProto on dto.ProjectEnvironment {
  pb.ProjectEnvironment toProto() {
    return pb.ProjectEnvironment(
      name: 'projects/$parentId/environments/$id',
      parent: 'projects/$parentId',
      uid: TypeId.decode(id).uuid.hexValue,
      projectEnvironmentId: projectEnvironmentId,
      displayName: displayName,
      etag: etag,
      reconciling: reconciling,
      state: pb.LifecycleState.values.firstWhere((s) => s.name == state),
      createTime: createTime.toProto(),
      updateTime: updateTime.toProto(),
      deleteTime: deleteTime?.toProto(),
      annotations: switch (annotations) {
        final annotations? =>
          (jsonDecode(annotations) as Map<String, Object?>).cast(),
        _ => null,
      },
    );
  }
}

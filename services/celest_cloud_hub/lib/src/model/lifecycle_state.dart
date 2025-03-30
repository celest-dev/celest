import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/common.pb.dart'
    as pb;

enum LifecycleState {
  unspecified('LIFECYCLE_STATE_UNSPECIFIED'),
  creating('CREATING'),
  creationFailed('CREATION_FAILED'),
  active('ACTIVE'),
  updating('UPDATING'),
  updateFailed('UPDATE_FAILED'),
  deleting('DELETING'),
  deletionFailed('DELETION_FAILED'),
  deleted('DELETED');

  const LifecycleState(this.jsonValue);

  final String jsonValue;

  String toJson() => jsonValue;

  pb.LifecycleState toProto() {
    return pb.LifecycleState.valueOf(index)!;
  }

  @override
  String toString() => jsonValue;
}

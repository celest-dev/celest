import 'package:celest_cloud/src/proto.dart';

abstract interface class OrganizationsProtocol {
  Future<Operation> create(CreateOrganizationRequest request);
  Future<Organization> get(GetOrganizationRequest request);
  Future<ListOrganizationsResponse> list(ListOrganizationsRequest request);
  Future<Operation> update(UpdateOrganizationRequest request);
  Future<Operation> delete(DeleteOrganizationRequest request);
  Future<Operation> rename(RenameOrganizationRequest request);
}

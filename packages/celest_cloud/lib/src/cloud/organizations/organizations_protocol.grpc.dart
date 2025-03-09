import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:grpc/grpc.dart';

final class OrganizationsProtocolGrpc implements OrganizationsProtocol {
  OrganizationsProtocolGrpc(
    ClientChannel channel, {
    List<ClientInterceptor>? interceptors,
  }) : _client = OrganizationsClient(channel, interceptors: interceptors);

  final OrganizationsClient _client;

  @override
  Future<Operation> create(CreateOrganizationRequest request) {
    return _client.createOrganization(request);
  }

  @override
  Future<Operation> delete(DeleteOrganizationRequest request) {
    return _client.deleteOrganization(request);
  }

  @override
  Future<Organization> get(GetOrganizationRequest request) {
    return _client.getOrganization(request);
  }

  @override
  Future<ListOrganizationsResponse> list(ListOrganizationsRequest request) {
    return _client.listOrganizations(request);
  }

  @override
  Future<Operation> update(UpdateOrganizationRequest request) {
    return _client.updateOrganization(request);
  }

  @override
  Future<Operation> rename(RenameOrganizationRequest request) {
    return _client.renameOrganization(request);
  }
}
